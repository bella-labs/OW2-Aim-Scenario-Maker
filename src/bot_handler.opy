rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    # Set Owner Player
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)
    # Set Health
    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    eventPlayer.setMaxHealth(eventPlayer.bot_health)
    # Set HPS
    eventPlayer.bot_hps = databot.bot_hps[eventPlayer.getSlot()]
    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    if eventPlayer.bot_hps > 0:
        eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)
    elif eventPlayer.bot_hps < 0:
        eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)
    # Set Speed
    eventPlayer.bot_speed_type = databot.bot_speed_type[eventPlayer.getSlot()]
    eventPlayer.bot_speed_min = databot.bot_speed_min[eventPlayer.getSlot()]
    eventPlayer.bot_speed_max = databot.bot_speed_max[eventPlayer.getSlot()]
    eventPlayer.bot_speed_target = databot.bot_speed_target[eventPlayer.getSlot()]
    # Set Scale
    eventPlayer.bot_scale_type = databot.bot_scale_type[eventPlayer.getSlot()]
    eventPlayer.bot_scale_min = databot.bot_scale_min[eventPlayer.getSlot()]
    eventPlayer.bot_scale_max = databot.bot_scale_max[eventPlayer.getSlot()]
    eventPlayer.bot_scale_target = databot.bot_scale_target[eventPlayer.getSlot()]
    set_target_scale()
    # Set Gravity
    eventPlayer.bot_gravity = databot.bot_gravity[eventPlayer.getSlot()]
    eventPlayer.setGravity(eventPlayer.bot_gravity)
    # Set Facing
    eventPlayer.bot_facing_type = databot.bot_facing_type[eventPlayer.getSlot()]
    eventPlayer.bot_facing_vect = databot.bot_facing_vect[eventPlayer.getSlot()]
    if eventPlayer.bot_facing_type == 0:
        eventPlayer.startFacing(normalize(eventPlayer.bot_facing_vect), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    else:
        eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.owner_player.getEyePosition()), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    # Boundaries

    # 0 = F, 1 = FR, 2 = R, 3 = BR, 4 = B, 5 = BL, 6 = L, 7 = FL
    for eventPlayer.import_status in range (0, 10, 1):
        eventPlayer.disabled_movements[eventPlayer.import_status] = false

    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_cube()
    # Distance
    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_min[eventPlayer.getSlot()]


rule "HPS Handler - Reset HoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_hps > 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllHoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)


rule "HPS Handler - Reset DoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_hps < 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllDoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)


rule "Speed Handler - Random":
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


def set_target_scale():
    @Name "SUB: set_target_scale"

    switch eventPlayer.bot_scale_type:
        case 0: # Static
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min, true)
            break
        case 1: # Random
            eventPlayer.startScalingSize(random.uniform(eventPlayer.bot_scale_min, eventPlayer.bot_scale_max), true)
            break
        case 2: # Health
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * eventPlayer.getNormalizedHealth(), true)
            break
        case 3: #Elims
            eventPlayer.startScalingSize(max(eventPlayer.bot_scale_min, (eventPlayer.bot_scale_max) - (elims * eventPlayer.bot_scale_target)), true)
            break
        case 4: #Time
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)), true)
            break


rule "Boundary Handler - Detect in Bounds XY":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.boundary_limits[0].x < eventPlayer.getPosition().x
    @Condition eventPlayer.getPosition().x < eventPlayer.boundary_limits[1].x
    @Condition eventPlayer.boundary_limits[0].z < eventPlayer.getPosition().z
    @Condition eventPlayer.getPosition().z < eventPlayer.boundary_limits[1].z

    eventPlayer.is_in_bounds = true


rule "Boundary Handler - Detect out of Bounds XY":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.boundary_limits[0].x > eventPlayer.getPosition().x or eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x or eventPlayer.boundary_limits[0].z > eventPlayer.getPosition().z or eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z


    eventPlayer.is_in_bounds = false


rule "Boundary Handler - Correct Out of Bounds XY":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.is_in_bounds == false

    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), eventPlayer.bot_bound_pos), 1, Relativity.TO_WORLD, Throttle.ADD_TO_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    waitUntil(eventPlayer.is_in_bounds == true, 9999)
    eventPlayer.stopThrottleInDirection()


rule "Boundary Handler - Reset when Y in Bounds":
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
    @Condition eventPlayer.bot_dist_min < distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1))
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_max

    eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] = -1


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


rule "Distance Handler - Correct Max Distance":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) > eventPlayer.bot_dist_max



    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_OFFSET] = 3
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_POS] = eventPlayer.owner_player.getPosition()
        set_disabled_index_dist()
    else:
        eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC] = 7


def set_disabled_index_dist():
    @Name "SUB: set_disabled_index_dist"

    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = (-1 * horizontalAngleTowards(eventPlayer, eventPlayer.disabled_indexes[2 + eventPlayer.disabled_target]) / 45 + eventPlayer.disabled_indexes[1 + eventPlayer.disabled_target])
    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = round(eventPlayer.disabled_indexes[eventPlayer.disabled_target] - floor(eventPlayer.disabled_indexes[eventPlayer.disabled_target] / 8) * 8) % 8
