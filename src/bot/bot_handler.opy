rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true

    # Set Owner Player
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)

    # Set Disabled Movements; Indexes Map: 0 = F, 1 = FR, 2 = R, 3 = BR, 4 = B, 5 = BL, 6 = L, 7 = FL
    for eventPlayer.loop_index in range (0, 10, 1):
        eventPlayer.disabled_movements[eventPlayer.loop_index] = false

    # Set Spawn
    eventPlayer.bot_spawn_type = databot.bot_spawn_type[eventPlayer.getSlot()]
    eventPlayer.bot_spawn_vect = databot.bot_spawn_vect[eventPlayer.getSlot()]
    
    # Set Facing
    eventPlayer.bot_facing_type = databot.bot_facing_type[eventPlayer.getSlot()]
    eventPlayer.bot_facing_vect = databot.bot_facing_vect[eventPlayer.getSlot()]
    if eventPlayer.bot_facing_type == 0:
        eventPlayer.startFacing(normalize(eventPlayer.bot_facing_vect), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    else:
        eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.owner_player.getEyePosition()), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    
    # Boundaries
    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = eventPlayer.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_cube()
    
    # Distance
    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_max[eventPlayer.getSlot()]
    
    # Hero Pool
    eventPlayer.bot_hero_pool = databot.bot_hero_pool[eventPlayer.getSlot()]
    
    # Set Health
    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    if eventPlayer.bot_health == 0:
        eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    else:
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

    # Set Profile
    eventPlayer.bot_profile_status = databot.bot_profile_status[eventPlayer.getSlot()]
    eventPlayer.bot_profile_type = databot.bot_profile_type[eventPlayer.getSlot()]
    eventPlayer.bot_profile_min = databot.bot_profile_min[eventPlayer.getSlot()]
    eventPlayer.bot_profile_max = databot.bot_profile_max[eventPlayer.getSlot()]

    for eventPlayer.profile_index in range(0, len(eventPlayer.bot_profile_status))
        if eventPlayer.bot_profile_status[eventPlayer.profile_index] == true:
            if len(eventPlayer.profile_list) > 0:
                eventPlayer.profile_list.append(eventPlayer.profile_index)
            else:
                eventPlayer.profile_list = eventPlayer.profile_index
    if eventPlayer.bot_profile_type == 0:
        profile_index = 0
    else:
        profile_index = random.randint(0, len(eventPlayer.profile_list))
    # Set Script Status
    eventPlayer.bot_script_status = databot.bot_script_status[eventPlayer.getSlot()]


rule "Bot Died: Swap Hero":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isDead() == true

    for eventPlayer.loop_index in range (0, 10, 1):
        eventPlayer.disabled_movements[eventPlayer.loop_index] = false

    wait()
    if len(eventPlayer.bot_hero_pool) == 1:
        eventPlayer.resurrect()
    else:
        eventPlayer.startForcingHero(random.choice(eventPlayer.bot_hero_pool))

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


rule "Profile Handler: In-Order":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_profile_type == 0

    eventPlayer.profile_index += 1
    if eventPlayer.profile_index >= len(eventPlayer.profile_list):
        eventPlayer.profile_index = 0


rule "Profile Handler: Randomized":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bot_profile_type == 1

    eventPlayer.profile_index = random.choice(eventPlayer.profile_list.exclude(eventPlayer.profile_index))
    if eventPlayer.profile_index == null:
        eventPlayer.profile_index = 0
    wait(random.uniform(eventPlayer.bot_profile_min, eventPlayer.bot_profile_max), Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START
        
    
def set_disabled_index_dist():
    @Name "SUB: set_disabled_index_dist"

    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = (-1 * horizontalAngleTowards(eventPlayer, eventPlayer.disabled_indexes[2 + eventPlayer.disabled_target]) / 45 + eventPlayer.disabled_indexes[1 + eventPlayer.disabled_target])
    eventPlayer.disabled_indexes[eventPlayer.disabled_target] = round(eventPlayer.disabled_indexes[eventPlayer.disabled_target] - floor(eventPlayer.disabled_indexes[eventPlayer.disabled_target] / 8) * 8) % 8
