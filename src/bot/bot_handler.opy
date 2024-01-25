rule "Boundary Handler - Correct X Min (Backwards)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 

    eventPlayer.disabled_movements = [0,0,0,0,0,0,0,0]
    if eventPlayer.getPosition().x < eventPlayer.boundary_limits[0].x:
        eventPlayer.disabled_index = 0
        calc_disabled_direction()
        eventPlayer.disabled_dir[0] += XZ_DIR.BACKWARD
        disable_movement_direction()

    elif eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x:
        eventPlayer.disabled_index = 1
        calc_disabled_direction()
        eventPlayer.disabled_dir[1] += XZ_DIR.FORWARD
        disable_movement_direction()

    if eventPlayer.getPosition().z < eventPlayer.boundary_limits[0].z:
        eventPlayer.disabled_index = 2
        calc_disabled_direction()
        eventPlayer.disabled_dir[2] += XZ_DIR.LEFT
        disable_movement_direction()
    elif eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z:
        eventPlayer.disabled_index = 3
        calc_disabled_direction()
        eventPlayer.disabled_dir[3] += XZ_DIR.RIGHT
        disable_movement_direction()

    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START


rule "Boundary Handler - Correct Y Min (Down)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y < eventPlayer.boundary_limits[0].y

    eventPlayer.disabled_movements[9] = true

    waitUntil(eventPlayer.boundary_limits[0].y <= eventPlayer.getPosition().y, 9999)

    eventPlayer.disabled_movements[9] = false

    
rule "Boundary Handler - Correct Y Min (Up)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y > eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_movements [8] = true

    waitUntil( eventPlayer.getPosition().y <= eventPlayer.boundary_limits[1].y, 9999)

    eventPlayer.disabled_movements [8] = false


rule "Distance Handler - Correct Min Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min

    eventPlayer.disabled_index = 4
    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_dir[4] = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 3)
        eventPlayer.disabled_dir[4] = round(eventPlayer.disabled_dir[4] - floor(eventPlayer.disabled_dir[4] / 8) * 8) % 8
    else:
        eventPlayer.disabled_dir[4] = XZ_DIR.FORWARD_RIGHT

    disable_movement_direction()

    if RULE_CONDITION:
        goto RULE_START 


rule "Distance Handler - Correct Max Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) > eventPlayer.bot_dist_max

    eventPlayer.disabled_index = 5
    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_dir[5] = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 7)
        eventPlayer.disabled_dir[5] = round(eventPlayer.disabled_dir[5] - floor(eventPlayer.disabled_dir[5] / 8) * 8) % 8
    else:
        eventPlayer.disabled_dir[5] = XZ_DIR.BACKWARD_LEFT

    disable_movement_direction()

    if RULE_CONDITION:
        goto RULE_START


rule "HPS Handler - Reset HoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_hps > 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllHoT()
    wait(eventPlayer.bot_hps_wait, Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)


rule "HPS Handler - Reset DoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_hps < 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllDoT()
    wait(eventPlayer.bot_hps_wait, Wait.RESTART_WHEN_TRUE)
    eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)


rule "Speed Handler - Static":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 0

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min)


rule "Speed Handler - Random":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 1

    eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))


rule "Speed Handler - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 2

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (1 - eventPlayer.getNormalizedHealth()))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Speed Handler - Elims":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(max(eventPlayer.bot_speed_max, (eventPlayer.bot_speed_min) + (elims * eventPlayer.bot_scale_target)))


rule "Speed Handler - Loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 4

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Profile Handler: In-Order":
    @Event playerDied
    @Condition eventPlayer.bot_profile_type == 0

    eventPlayer.profile_index = 0
    #@Condition eventPlayer.prof_weight_list == databot.prof_weight_list
    #@Condition eventPlayer.prof_weight_status == databot.prof_weight_status


    #eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE] += 1
    #if eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE] < len(eventPlayer.prof_weight_list):
    #    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE] += 0

rule "Profile Handler: Randomized":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_profile_type == 1

    eventPlayer.profile_index = 0
    #@Condition eventPlayer.prof_weight_list == eventPlayer.prof_weight_list
    #@Condition eventPlayer.prof_weight_status == eventPlayer.prof_weight_status
#
    #eventPlayer.target_rand[PLAYER_RAND.PROFILE] = random.uniform(0, eventPlayer.profile_weights_list[len(eventPlayer.profile_weights-1)])
   # eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_4] = random.uniform(0, eventPlayer.profile_weights[len(eventPlayer.profile_weights-1)])
    #eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] = 0
   # while(eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] < len(eventPlayer.profile_weights) and eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_4] > eventPlayer.profile_weights[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3]] ):
   #     eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] += 1
    
   # wait(random.uniform(eventPlayer.bot_profile_min, eventPlayer.bot_profile_max), Wait.ABORT_WHEN_FALSE)

  #  if RULE_CONDITION:
   #     goto RULE_START


rule "Death Handler":
    @Event playerDied
    @Team 2

    eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] = 0
    while(eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] < 10):
        eventPlayer.disabled_movements[eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT]] = 0
        eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] += 1

    wait()
    if len(eventPlayer.bot_hero_pool) == 1:
        eventPlayer.setHealth(eventPlayer.bot_health)
        eventPlayer.resurrect()
    else:
        eventPlayer.startForcingHero(random.choice(eventPlayer.bot_hero_pool).exclude(eventPlayer.getCurrentHero()))

    teleport_target()


def teleport_target():
    @Name "SUB: teleport_target"

    switch eventPlayer.bot_spawn_type:
        case 0:
            eventPlayer.teleport(eventPlayer.bot_spawn_vect)
            break
        case 1:
            eventPlayer.teleport(eventPlayer.bot_bound_pos + vect(random.uniform(-1 * eventPlayer.bot_bound_dim.x, eventPlayer.bot_bound_dim.x)/2, random.uniform(-eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.y)/2, random.uniform(-eventPlayer.bot_bound_dim.z, eventPlayer.bot_bound_dim.z)/2))
            break
        case 2:
            eventPlayer.teleport(nearestWalkablePosition(eventPlayer.bot_bound_pos + vect(random.uniform(-eventPlayer.bot_bound_dim.x, eventPlayer.bot_bound_dim.x)/2, random.uniform(-eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.y)/2, random.uniform(-eventPlayer.bot_bound_dim.z, eventPlayer.bot_bound_dim.z)/2)))
            break 


def calc_disabled_direction():
    @Name "SUB: calc_disabled_direction"

    eventPlayer.disabled_dir[eventPlayer.disabled_index] = (horizontalAngleOfDirection(eventPlayer.getFacingDirection()) / 45) + 5
    eventPlayer.disabled_dir[eventPlayer.disabled_index] = round(eventPlayer.disabled_dir[eventPlayer.disabled_index] - floor(eventPlayer.disabled_dir[eventPlayer.disabled_index] / 8) * 8) % 8


def disable_movement_direction():
    @Name "SUB: disable_movement_direction"

    if eventPlayer.isAlive():
        eventPlayer.disabled_movements[eventPlayer.disabled_dir[eventPlayer.disabled_index] % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_dir[eventPlayer.disabled_index] + 1) % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_dir[eventPlayer.disabled_index] + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)