rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true

    # Set Health
    eventPlayer.setMaxHealth(databot.bot_health[eventPlayer.getSlot()])
    # Set HPS
    eventPlayer.bot_hps = databot.bot_hps[eventPlayer.getSlot()]
    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Start Bot HPS/DOT
    if eventPlayer.bot_hps > 0:
        eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)
    elif eventPlayer.bot_hps < 0:
        eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)
    # Set Speed
    eventPlayer.bot_speed_type = databot.bot_speed_type[eventPlayer.getSlot()]
    eventPlayer.bot_speed_min = databot.bot_speed_min[eventPlayer.getSlot()]
    eventPlayer.bot_speed_max = databot.bot_speed_max[eventPlayer.getSlot()]
    eventPlayer.bot_speed_target = databot.bot_speed_target[eventPlayer.getSlot()]
    # Modify Bot Speed
    if eventPlayer.bot_speed_type == 1:
        eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))
    else:
        eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min)
    # Set Scale
    eventPlayer.bot_scale_type = databot.bot_scale_type[eventPlayer.getSlot()]
    eventPlayer.bot_scale_min = databot.bot_scale_min[eventPlayer.getSlot()]
    eventPlayer.bot_scale_max = databot.bot_scale_max[eventPlayer.getSlot()]
    eventPlayer.bot_scale_target = databot.bot_scale_target[eventPlayer.getSlot()]
    # Modify Bot Scale
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
    # Set Gravity
    eventPlayer.bot_gravity = databot.bot_gravity[eventPlayer.getSlot()]
    # Modify Bot Gravity
    eventPlayer.setGravity(eventPlayer.bot_gravity)
    # Facing
    eventPlayer.bot_facing_type = databot.bot_facing_type[eventPlayer.getSlot()]
    #eventPlayer.mvmt_relativity = Relativity.TO_WORLD if eventPlayer.bot_facing_type == 0 else Relativity.TO_PLAYER
    # Boundaries
    # 0 = FL, 1 = F, 2 = FR, 3 = R, 4 = RB, 5 = B, 6 = BL, 7 = L, 8 = U, 9 = D
    for eventPlayer.calc_var_1 in range (0, 10, 1):
        eventPlayer.disabled_movements[eventPlayer.calc_var_1] = false
    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_unit_cube()

    eventPlayer.boundary_limits[0] = vect(
    min(eventPlayer.unit_cube[0].x, min(eventPlayer.unit_cube[1].x, min(eventPlayer.unit_cube[2].x, min(eventPlayer.unit_cube[3].x, min(eventPlayer.unit_cube[4].x, min(eventPlayer.unit_cube[5].x, min(eventPlayer.unit_cube[6].x, eventPlayer.unit_cube[7].x))))))),
    min(eventPlayer.unit_cube[0].y, min(eventPlayer.unit_cube[1].y, min(eventPlayer.unit_cube[2].y, min(eventPlayer.unit_cube[3].y, min(eventPlayer.unit_cube[4].y, min(eventPlayer.unit_cube[5].y, min(eventPlayer.unit_cube[6].y, eventPlayer.unit_cube[7].y))))))),
    min(eventPlayer.unit_cube[0].z, min(eventPlayer.unit_cube[1].z, min(eventPlayer.unit_cube[2].z, min(eventPlayer.unit_cube[3].z, min(eventPlayer.unit_cube[4].z, min(eventPlayer.unit_cube[5].z, min(eventPlayer.unit_cube[6].z, eventPlayer.unit_cube[7].z)))))))
    )
    eventPlayer.boundary_limits[1] = vect(
    max(eventPlayer.unit_cube[0].x, max(eventPlayer.unit_cube[1].x, max(eventPlayer.unit_cube[2].x, max(eventPlayer.unit_cube[3].x, max(eventPlayer.unit_cube[4].x, max(eventPlayer.unit_cube[5].x, max(eventPlayer.unit_cube[6].x, eventPlayer.unit_cube[7].x))))))),
    max(eventPlayer.unit_cube[0].y, max(eventPlayer.unit_cube[1].y, max(eventPlayer.unit_cube[2].y, max(eventPlayer.unit_cube[3].y, max(eventPlayer.unit_cube[4].y, max(eventPlayer.unit_cube[5].y, max(eventPlayer.unit_cube[6].y, eventPlayer.unit_cube[7].y))))))),
    max(eventPlayer.unit_cube[0].z, max(eventPlayer.unit_cube[1].z, max(eventPlayer.unit_cube[2].z, max(eventPlayer.unit_cube[3].z, max(eventPlayer.unit_cube[4].z, max(eventPlayer.unit_cube[5].z, max(eventPlayer.unit_cube[6].z, eventPlayer.unit_cube[7].z)))))))
    )
    # Distance
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)
    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_min[eventPlayer.getSlot()]

    

rule "HPS Handler - Reset HoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.bot_hps > 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllHoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)


rule "HPS Handler - Reset DoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.bot_hps < 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllDoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)


rule "Speed Handler - Random":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.bot_speed_type == 1

    eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))


rule "Speed Handler - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_speed_type == 2

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (1 - eventPlayer.getNormalizedHealth()))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Speed Handler - Elims":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(max(eventPlayer.bot_speed_max, (eventPlayer.bot_speed_min) + (elims * eventPlayer.bot_scale_target)))


rule "Speed Handler - Loop":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START

    
rule "Facing Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_facing_type == 1

    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getClosestPlayer(eventPlayer.getPosition(), Team.1).getEyePosition()), 200, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)


rule "Boundary Handler - Detect in Bounds XY":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.boundary_limits[0].x < eventPlayer.getPosition().x
    @Condition eventPlayer.getPosition().x < eventPlayer.boundary_limits[1].x
    @Condition eventPlayer.boundary_limits[0].z < eventPlayer.getPosition().z
    @Condition eventPlayer.getPosition().z < eventPlayer.boundary_limits[1].z

    eventPlayer.is_in_bounds = true


rule "Boundary Handler - Detect out of Bounds XY":
    @Event eachPlayer
    @Team 2
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

    eventPlayer.disabled_movements[0] = false
    eventPlayer.disabled_movements[1] = false
    eventPlayer.disabled_movements[2] = false
    eventPlayer.disabled_movements[3] = false
    eventPlayer.disabled_movements[4] = false
    eventPlayer.disabled_movements[5] = false


rule "Distance Handler - Correct Min Distance":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min

    eventPlayer.disabled_movements[0] = true
    eventPlayer.disabled_movements[1] = true
    eventPlayer.disabled_movements[2] = true


rule "Distance Handler - Correct Max Distance":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) > eventPlayer.bot_dist_max

    eventPlayer.disabled_movements[3] = true
    eventPlayer.disabled_movements[4] = true
    eventPlayer.disabled_movements[5] = true


rule "text":
    @Event eachPlayer
    @Team 1
    @Slot 1
    hudSubheader(hostPlayer, "{0}".format(""), HudPosition.RIGHT, 9999, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    

