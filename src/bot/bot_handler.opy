rule "Boundary Handler - Reset in Bounds XZ":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.boundary_limits[0].x < eventPlayer.getPosition().x
    @Condition eventPlayer.getPosition().x < eventPlayer.boundary_limits[1].x
    @Condition eventPlayer.boundary_limits[0].z < eventPlayer.getPosition().z
    @Condition eventPlayer.getPosition().z < eventPlayer.boundary_limits[1].z

    eventPlayer.disabled_movements[eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] % 8] = false
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 1) % 8] = false
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 2) % 8] = false


rule "Boundary Handler - Correct out of Bounds XZ":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.boundary_limits[0].x > eventPlayer.getPosition().x or eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x or eventPlayer.boundary_limits[0].z > eventPlayer.getPosition().z or eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z


    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_target = DISABLED_VARS.BOUNDS_CALC
        eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_OFFSET] = -1
        eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_POS] = eventPlayer.bot_bound_pos
        set_disabled_index_dist()
    
    eventPlayer.disabled_movements[eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 1) % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 2) % 8] = true

    eventPlayer.calc_var[3] = "A"



rule "Boundary Handler - Reset in Bounds Y":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.boundary_limits[0].y < eventPlayer.getPosition().y 
    @Condition eventPlayer.getPosition().y < eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_movements [8] = false
    eventPlayer.disabled_movements [9] = false
    

rule "Boundary Handler - Correct Out of Bounds Y Lower":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.boundary_limits[0].y > eventPlayer.getPosition().y 

    eventPlayer.disabled_movements [9] = true

    
rule "Boundary Handler - Correct Out of Bounds Y Upper":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y > eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_movements [8] = true


rule "Distance Handler - Reset within Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_dist_min < distance(eventPlayer.getPosition(), eventPlayer.owner_player.getPosition())
    @Condition distance(eventPlayer.getPosition(), eventPlayer.owner_player.getPosition()) < eventPlayer.bot_dist_max

    eventPlayer.disabled_movements[eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] % 8] = false
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 1) % 8] = false
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.BOUNDS_CALC] + 2) % 8] = false


rule "Distance Handler - Correct Min Distance":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_target = DISABLED_VARS.DIST_CALC
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_OFFSET] = -1
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_POS] = eventPlayer.owner_player.getPosition()
        set_disabled_index_dist()
    else:
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] = 7
    eventPlayer.disabled_movements[eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] + 1) % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] + 2) % 8] = true

    eventPlayer.calc_var[4] = "B"


rule "Distance Handler - Correct Max Distance":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer.getPosition(), eventPlayer.owner_player.getPosition()) > eventPlayer.bot_dist_max

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_OFFSET] = 3
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_POS] = eventPlayer.owner_player.getPosition()
        set_disabled_index_dist()
    else:
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] = 7
    eventPlayer.disabled_movements[eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] + 1) % 8] = true
    eventPlayer.disabled_movements[(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] + 2) % 8] = true

    eventPlayer.calc_var[5] = "C"


rule "HPS Handler - Reset HoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_hps > 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllHoT()
    wait(eventPlayer.bot_hps_wait, Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)


rule "HPS Handler - Reset DoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_hps < 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllDoT()
    wait(eventPlayer.bot_hps_wait, Wait.RESTART_WHEN_TRUE)
    eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)


rule "Speed Handler - Static":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_speed_type == 0

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min)


rule "Speed Handler - Random":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_speed_type == 1

    eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))


rule "Speed Handler - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_speed_type == 2

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (1 - eventPlayer.getNormalizedHealth()))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Speed Handler - Elims":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(max(eventPlayer.bot_speed_max, (eventPlayer.bot_speed_min) + (elims * eventPlayer.bot_scale_target)))


rule "Speed Handler - Loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_speed_type == 4

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Profile Handler: In-Order":
    @Event playerDied
    @Condition eventPlayer.bot_profile_type == 0
    @Condition eventPlayer.profile_index != -1

    
    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] += 1
    if eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] >= len(eventPlayer.profile_list):
        eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] = 0
    
    eventPlayer.profile_index = eventPlayer.profile_list[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3]]


rule "Profile Handler: Randomized":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_profile_type == 1
    @Condition eventPlayer.profile_index != -1

    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_4] = random.uniform(0, eventPlayer.profile_weights[len(eventPlayer.profile_weights-1)])
    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] = 0
    while(eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] < len(eventPlayer.profile_weights) and eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_4] > eventPlayer.profile_weights[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3]] ):
        eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] += 1
    eventPlayer.profile_index = eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3]
    wait(random.uniform(eventPlayer.bot_profile_min, eventPlayer.bot_profile_max), Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Death Handler":
    @Event playerDied
    @Team 2

    eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] = 0
    while(eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] < 10):
        eventPlayer.disabled_movements[eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT]] = false
        eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] += 1

    wait()
    if len(eventPlayer.bot_hero_pool) == 1:
        eventPlayer.resurrect()
    else:
        eventPlayer.startForcingHero(random.choice(eventPlayer.bot_hero_pool).exclude(eventPlayer.getCurrentHero()))

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


def set_disabled_index_dist():
    @Name "SUB: set_disabled_index_dist"

    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = (horizontalAngleTowards(eventPlayer, eventPlayer.disabled_indexes[2 + eventPlayer.disabled_target]) / 45 + eventPlayer.disabled_indexes[1 + eventPlayer.disabled_target])
    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = round(eventPlayer.disabled_indexes[eventPlayer.disabled_target] - floor(eventPlayer.disabled_indexes[eventPlayer.disabled_target] / 8) * 8) % 8
