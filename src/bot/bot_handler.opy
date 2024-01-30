rule "Boundary Handler - Correct XZ":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.getPosition().x - 0.5 < eventPlayer.boundary_limits[0].x or eventPlayer.getPosition().x + 0.5 > eventPlayer.boundary_limits[1].x or eventPlayer.getPosition().z - 0.5 < eventPlayer.boundary_limits[0].z or eventPlayer.getPosition().z + 0.5 > eventPlayer.boundary_limits[1].z

    # a = (theta / 45)
    eventPlayer.disabled_index = horizontalAngleOfDirection(eventPlayer.getFacingDirection()) / 45
    calc1 = eventPlayer.disabled_index
    # x = (a - floor( a / 8) * 8)
    eventPlayer.disabled_index = round((eventPlayer.disabled_index - (floor(eventPlayer.disabled_index / 8) * 8))) % 8
    # Calculate D_(0-7)
    eventPlayer.disabled_dir[XZ_DIR.BACKWARD] =       (eventPlayer.disabled_index + 6) % 8
    eventPlayer.disabled_dir[XZ_DIR.BACKWARD_RIGHT] = (eventPlayer.disabled_index + 7) % 8
    eventPlayer.disabled_dir[XZ_DIR.RIGHT] =          (eventPlayer.disabled_index + 0) % 8
    eventPlayer.disabled_dir[XZ_DIR.FORWARD_RIGHT] =  (eventPlayer.disabled_index + 1) % 8
    eventPlayer.disabled_dir[XZ_DIR.FORWARD] =        (eventPlayer.disabled_index + 2) % 8
    eventPlayer.disabled_dir[XZ_DIR.FORWARD_LEFT] =   (eventPlayer.disabled_index + 3) % 8
    eventPlayer.disabled_dir[XZ_DIR.LEFT] =           (eventPlayer.disabled_index + 4) % 8
    eventPlayer.disabled_dir[XZ_DIR.BACKWARD_LEFT] =  (eventPlayer.disabled_index + 5) % 8

    # Boundary 1
    if eventPlayer.getPosition().x - 0.5 < eventPlayer.boundary_limits[0].x:
        eventPlayer.disabled_bound = 8 - ((eventPlayer.disabled_index + 6) % 8)
    # Boundary 3
    elif eventPlayer.getPosition().x + 0.5 > eventPlayer.boundary_limits[1].x:
        eventPlayer.disabled_bound = 8 - ((eventPlayer.disabled_index + 2) % 8)
    
    # Boundary 2
    if eventPlayer.getPosition().z - 0.5 < eventPlayer.boundary_limits[0].z:
        eventPlayer.disabled_bound = 8 - ((eventPlayer.disabled_index + 0) % 8)
    # Boundary 4
    elif eventPlayer.getPosition().z + 0.5 > eventPlayer.boundary_limits[1].z:
        eventPlayer.disabled_bound = 8 - ((eventPlayer.disabled_index + 4) % 8)

    eventPlayer.disabled_bound = (eventPlayer.disabled_bound + 7) % 8
    disable_movement_boundary()

    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START

rule "Boundary Handler - Correct Y Min (Up)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y > eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_vert[YDIR.UP] = 1

    waitUntil(eventPlayer.getPosition().y <= eventPlayer.boundary_limits[1].y, 9999)

    eventPlayer.disabled_vert[YDIR.UP] = 0

    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START


rule "Boundary Handler - Correct Y Min (Down)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y < eventPlayer.boundary_limits[0].y

    eventPlayer.disabled_vert[YDIR.DOWN] = 1

    waitUntil(eventPlayer.getPosition().y >= eventPlayer.boundary_limits[0].y, 9999)

    eventPlayer.disabled_vert[YDIR.DOWN] = 0

    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START


rule "Distance Handler - Correct Min Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) < eventPlayer.bot_dist_min

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_dist = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 3)
        eventPlayer.disabled_dist = round(eventPlayer.disabled_dist - floor(eventPlayer.disabled_dist / 8) * 8) % 8
    else:
        eventPlayer.disabled_dist = XZ_DIR.FORWARD_RIGHT

    disable_movement_distance()

    if RULE_CONDITION:
        goto RULE_START 


rule "Distance Handler - Correct Max Distance":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition distance(eventPlayer.getPosition() * vect(1,0,1), eventPlayer.owner_player.getPosition() * vect(1,0,1)) > eventPlayer.bot_dist_max

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.disabled_dist = (horizontalAngleTowards(eventPlayer, eventPlayer.owner_player.getPosition()) / 45 + 7)
        eventPlayer.disabled_dist = round(eventPlayer.disabled_dist - floor(eventPlayer.disabled_dist / 8) * 8) % 8
    else:
        eventPlayer.disabled_dist = XZ_DIR.BACKWARD_LEFT

    disable_movement_distance()

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


rule "Speed Handler - Random":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 0

    eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))


rule "Speed Handler - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 1

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (1 - eventPlayer.getNormalizedHealth()))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Speed Handler - Elims":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 2

    eventPlayer.setMoveSpeed(max(eventPlayer.bot_speed_max, (eventPlayer.bot_speed_min) + (elims * eventPlayer.bot_speed_target)))


rule "Speed Handler - Loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (sin(Math.PI*(timer%eventPlayer.bot_speed_target)/eventPlayer.bot_speed_target)))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Profile Handler: In-Order":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_profile_type == 0
    @Condition eventPlayer.profile_index != -1
    @Condition eventPlayer.bot_profile_max > 0

    wait(random.uniform(eventPlayer.bot_profile_min, eventPlayer.bot_profile_max))

    if eventPlayer.bot_profile_weights[eventPlayer.profile_index] == eventPlayer.bot_profile_max_weight:
        eventPlayer.profile_loop_index = 0
    elif eventPlayer.profile_index + 1 == len(eventPlayer.bot_profile_weights):
        eventPlayer.profile_loop_index = 0
    else:
        eventPlayer.profile_loop_index = eventPlayer.profile_index + 1

    while(eventPlayer.profile_loop_index < len(eventPlayer.bot_profile_weights)):
        if (eventPlayer.bot_profile_weights[eventPlayer.profile_loop_index] > -1):
            eventPlayer.profile_index = eventPlayer.profile_loop_index
            eventPlayer.profile_loop_index = len(eventPlayer.bot_profile_weights)
        eventPlayer.profile_loop_index += 1

    if RULE_CONDITION:
        goto RULE_START
    

rule "Profile Handler: Randomized":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() 
    @Condition eventPlayer.bot_profile_type == 1
    @Condition eventPlayer.profile_index != -1
    @Condition eventPlayer.bot_profile_max > 0

    wait(random.uniform(eventPlayer.bot_profile_min, eventPlayer.bot_profile_max))

    eventPlayer.target_rand[PLAYER_RAND.PROFILE] = random.uniform(0, eventPlayer.bot_profile_max_weight)
    eventPlayer.profile_loop_index = 0
    while(eventPlayer.profile_loop_index < len(eventPlayer.bot_profile_weights)):
        if (eventPlayer.target_rand[PLAYER_RAND.PROFILE] <= eventPlayer.bot_profile_weights[eventPlayer.profile_loop_index]):
            eventPlayer.profile_index = eventPlayer.profile_loop_index
        eventPlayer.profile_loop_index += 1

    if RULE_CONDITION:
        goto RULE_START


rule "Death Handler":
    @Event playerDied
    @Team 2

    eventPlayer.disabled_hori = [0,0,0,0,0,0,0,0]
    eventPlayer.disabled_vert = [0,0]

    if eventPlayer.bot_scale_type == 0:
        eventPlayer.startScalingSize(random.uniform(eventPlayer.bot_scale_min, eventPlayer.bot_scale_max), true)
    wait(random.uniform(databot.sce_respawn_min, databot.sce_respawn_max))
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


def disable_movement_boundary():
    @Name "SUB: disable_movement_boundary"

    if eventPlayer.isAlive():
        eventPlayer.disabled_hori[(eventPlayer.disabled_bound) % 8] += 1 
        eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 1) % 8] += 1
        eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)
        waitUntil(eventPlayer.isDead() or (eventPlayer.getPosition().x >= eventPlayer.boundary_limits[0].x and eventPlayer.getPosition().x <= eventPlayer.boundary_limits[1].x and eventPlayer.getPosition().z >= eventPlayer.boundary_limits[0].z and eventPlayer.getPosition().z <= eventPlayer.boundary_limits[1].z), 1)
        #wait(0.1)

        if eventPlayer.isAlive():
            if eventPlayer.disabled_hori[(eventPlayer.disabled_bound) % 8] > 0:
                eventPlayer.disabled_hori[(eventPlayer.disabled_bound) % 8] -= 1
            if eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 1) % 8] > 0:
                eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 1) % 8] -= 1
            if eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 2) % 8] > 0:
                eventPlayer.disabled_hori[(eventPlayer.disabled_bound + 2) % 8] -= 1


def disable_movement_distance():
    @Name "SUB: disable_movement_distance"

    if eventPlayer.isAlive():
        eventPlayer.disabled_hori[eventPlayer.disabled_dist % 8] += 1
        eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 1) % 8] += 1
        eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)
        wait(0.1)

        if eventPlayer.isAlive():
            if eventPlayer.disabled_hori[eventPlayer.disabled_dist % 8] > 0:
                eventPlayer.disabled_hori[eventPlayer.disabled_dist % 8] -= 1
            if eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 1) % 8] > 0:     
                eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 1) % 8] -= 1
            if eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 2) % 8] > 0:  
                eventPlayer.disabled_hori[(eventPlayer.disabled_dist + 2) % 8] -= 1