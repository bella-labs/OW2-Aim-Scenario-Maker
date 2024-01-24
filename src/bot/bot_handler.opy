rule "Boundary Handler - Correct out of Bounds XZ":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.boundary_limits[0].x > eventPlayer.getPosition().x or eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x or eventPlayer.boundary_limits[0].z > eventPlayer.getPosition().z or eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z


    eventPlayer.disabled_bound = (horizontalAngleTowards(eventPlayer, eventPlayer.bot_bound_pos) / 90)
    eventPlayer.disabled_bound = round(eventPlayer.disabled_bound - floor(eventPlayer.disabled_bound / 4) * 4) % 4
    # Rotate relative to facing angle
    calc1 = horizontalAngleOfDirection(eventPlayer.getFacingDirection())
    calc2 = horizontalAngleTowards(eventPlayer, eventPlayer.bot_bound_pos)

    calc3 = eventPlayer.disabled_bound

    switch eventPlayer.disabled_bound:
        # Backward
        case 0:
            eventPlayer.disabled_bound = XZ_DIR.BACKWARD_LEFT
            break
        # Right
        case 1:
            eventPlayer.disabled_bound = XZ_DIR.BACKWARD_RIGHT
            break
        # Forward
        case 2:
            eventPlayer.disabled_bound = XZ_DIR.FORWARD_RIGHT
            break
        # Left
        case 3:
            eventPlayer.disabled_bound = XZ_DIR.FORWARD_LEFT
            break




    if eventPlayer.isAlive():
        eventPlayer.disabled_movements[(eventPlayer.disabled_bound) % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 1) % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)
        wait(eventPlayer.mvmt_collision_wait)

        if eventPlayer.isAlive():
            if eventPlayer.disabled_movements[(eventPlayer.disabled_bound) % 8] > 0:
                eventPlayer.disabled_movements[(eventPlayer.disabled_bound) % 8] -= 1
            if eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 1) % 8] > 0:
                eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 1) % 8] -= 1
            if eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 2) % 8] > 0:
                eventPlayer.disabled_movements[(eventPlayer.disabled_bound + 2) % 8] -= 1
            
    if RULE_CONDITION:
        goto RULE_START 


rule "Boundary Handler - Correct Out of Bounds Y Lower":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.boundary_limits[0].y > eventPlayer.getPosition().y 

    eventPlayer.disabled_movements[9] = true

    waitUntil(eventPlayer.boundary_limits[0].y <= eventPlayer.getPosition().y, 9999)

    eventPlayer.disabled_movements[9] = false

    
rule "Boundary Handler - Correct Out of Bounds Y Upper":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y > eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_movements [8] = true

    waitUntil( eventPlayer.getPosition().y <= eventPlayer.boundary_limits[1].y, 9999)

    eventPlayer.disabled_movements [8] = false


rule "Distance Handler - Correct Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition  (
                    distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min or
                    distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) > eventPlayer.bot_dist_max
                )

    if eventPlayer.bot_facing_type == 0:
        if distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min:
            eventPlayer.disabled_dist = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 3)
        else:
            eventPlayer.disabled_dist = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 7)
        eventPlayer.disabled_dist = round(eventPlayer.disabled_dist - floor(eventPlayer.disabled_dist / 8) * 8) % 8
    else:
        if distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min:
            eventPlayer.disabled_dist = XZ_DIR.FORWARD_RIGHT
        else:
            eventPlayer.disabled_dist = XZ_DIR.BACKWARD_LEFT

    if eventPlayer.isAlive():
        eventPlayer.disabled_movements[eventPlayer.disabled_dist % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 1) % 8] += 1
        eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)
        wait(eventPlayer.mvmt_collision_wait)

        if eventPlayer.isAlive():
            if eventPlayer.disabled_movements[eventPlayer.disabled_dist % 8] > 0:
                eventPlayer.disabled_movements[eventPlayer.disabled_dist % 8] -= 1
            if eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 1) % 8] > 0:    
                eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 1) % 8] -= 1
            if eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 2) % 8] > 0:    
                eventPlayer.disabled_movements[(eventPlayer.disabled_dist + 2) % 8] -= 1

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