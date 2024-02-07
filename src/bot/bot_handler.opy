rule "Boundary Handler - Correct XZ":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition  (
                eventPlayer.getPosition().x < eventPlayer.boundary_limits[0].x + boundary_buffer or
                eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x - boundary_buffer or
                eventPlayer.getPosition().z < eventPlayer.boundary_limits[0].z + boundary_buffer or
                eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z - boundary_buffer or
                eventPlayer.disabled_boundary[0] != -1 or
                eventPlayer.disabled_boundary[1] != -1 or
                eventPlayer.disabled_boundary[2] != -1 or
                eventPlayer.disabled_boundary[3] != -1
                )

    eventPlayer.disabled_calc = 1 + -1 * horizontalAngleOfDirection(eventPlayer.getFacingDirection()) / 45
    eventPlayer.disabled_calc = round((eventPlayer.disabled_calc - (floor(eventPlayer.disabled_calc / 8) * 8))) % 8

    # -X Boundary
    if eventPlayer.getPosition().x < eventPlayer.boundary_limits[0].x + boundary_buffer:
        eventPlayer.boundary_index = 0
        check_boundary()
    elif eventPlayer.disabled_boundary[0] != -1:
        eventPlayer.boundary_index = 0
        enable_boundary()
    # +Z Boundary
    if eventPlayer.getPosition().z > eventPlayer.boundary_limits[1].z - boundary_buffer:
        eventPlayer.boundary_index = 1
        check_boundary()
    elif eventPlayer.disabled_boundary[1] != -1:
        eventPlayer.boundary_index = 1
        enable_boundary()
    # +X Boundary
    if eventPlayer.getPosition().x > eventPlayer.boundary_limits[1].x - boundary_buffer:
        eventPlayer.boundary_index = 2
        check_boundary()
    elif eventPlayer.disabled_boundary[2] != -1:
        eventPlayer.boundary_index = 2
        enable_boundary()
    # -Z Boundary
    if eventPlayer.getPosition().z < eventPlayer.boundary_limits[0].z + boundary_buffer:
        eventPlayer.boundary_index = 3
        check_boundary()
    elif eventPlayer.disabled_boundary[3] != -1:
        eventPlayer.boundary_index = 3
        enable_boundary()

    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START


def check_boundary():
    @Name "SUB: check_boundary"

    if eventPlayer.disabled_boundary[eventPlayer.boundary_index] == -1:
        disable_boundary()
    elif eventPlayer.disabled_boundary[eventPlayer.boundary_index] != eventPlayer.disabled_calc:
        enable_boundary()
        disable_boundary()


rule "Boundary Handler - Correct Y Max (Up)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y > eventPlayer.boundary_limits[1].y

    eventPlayer.disabled_vert[YDIR.UP] = 1
    waitUntil(eventPlayer.getPosition().y < eventPlayer.boundary_limits[1].y, 9999)
    eventPlayer.disabled_vert[YDIR.UP] = 0
    wait(0.1)

    if RULE_CONDITION:
        goto RULE_START


rule "Boundary Handler - Correct Y Min (Down)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getPosition().y < eventPlayer.boundary_limits[0].y

    eventPlayer.disabled_vert[YDIR.DOWN] = 1
    waitUntil(eventPlayer.getPosition().y > eventPlayer.boundary_limits[0].y, 9999)
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

    eventPlayer.setMoveSpeed(max(eventPlayer.bot_speed_max, (eventPlayer.bot_speed_min) + (eventPlayer.owner_player.elims * eventPlayer.bot_speed_target)))


rule "Speed Handler - Loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.bot_speed_type == 3

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (sin(Math.PI*(scenario_timer%eventPlayer.bot_speed_target)/eventPlayer.bot_speed_target)))
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
    eventPlayer.disabled_boundary = [-1, -1, -1, -1]
    eventPlayer.target_vert_dir = 0
    eventPlayer.target_vert_offset = [false, false]

    if eventPlayer.bot_scale_type == 0:
        eventPlayer.startScalingSize(random.uniform(eventPlayer.bot_scale_min, eventPlayer.bot_scale_max), true)
    wait(random.uniform(databot.sce_respawn_min, databot.sce_respawn_max))
    if len(eventPlayer.bot_hero_pool) == 1:
        #eventPlayer.setHealth(eventPlayer.bot_health)
        eventPlayer.resurrect()
        eventPlayer.setHealth(eventPlayer.getMaxHealth())
    else:
        eventPlayer.startForcingHero(random.choice(eventPlayer.bot_hero_pool).exclude(eventPlayer.getCurrentHero()))

    teleport_target()


rule "Adjust health for infinite":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.bot_health == 0

    eventPlayer.setHealth(eventPlayer.getMaxHealth())


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


def disable_boundary():
    @Name "SUB: disable_boundary"

    if eventPlayer.isAlive():
        eventPlayer.disabled_boundary[eventPlayer.boundary_index] = eventPlayer.disabled_calc
        eventPlayer.disabled_target = (eventPlayer.disabled_calc + 2 * eventPlayer.boundary_index) % 8

        eventPlayer.disabled_hori[(eventPlayer.disabled_target) % 8] += 1
        eventPlayer.disabled_hori[(eventPlayer.disabled_target + 1) % 8] += 1
        eventPlayer.disabled_hori[(eventPlayer.disabled_target + 2) % 8] += 1

        async(select_mvmt_dir, AsyncBehavior.RESTART)


def enable_boundary():
    @Name "SUB: enable_boundary"

    if eventPlayer.isAlive():
        eventPlayer.disabled_target = (eventPlayer.disabled_boundary[eventPlayer.boundary_index] + 2 * eventPlayer.boundary_index) % 8

        if eventPlayer.disabled_hori[(eventPlayer.disabled_target) % 8] > 0:
            eventPlayer.disabled_hori[(eventPlayer.disabled_target) % 8] -= 1
        if eventPlayer.disabled_hori[(eventPlayer.disabled_target + 1) % 8] > 0:
            eventPlayer.disabled_hori[(eventPlayer.disabled_target + 1) % 8] -= 1
        if eventPlayer.disabled_hori[(eventPlayer.disabled_target + 2) % 8] > 0:
            eventPlayer.disabled_hori[(eventPlayer.disabled_target + 2) % 8] -= 1

        eventPlayer.disabled_boundary[eventPlayer.boundary_index] = -1


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
