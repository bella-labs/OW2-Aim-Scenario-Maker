rule "Target Bot Listener - Spawn":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_spawn_type != databot.bot_spawn_type[eventPlayer.getSlot()] or 
                eventPlayer.bot_spawn_vect != databot.bot_spawn_vect[eventPlayer.getSlot()]
                )

    eventPlayer.bot_spawn_type = databot.bot_spawn_type[eventPlayer.getSlot()]
    eventPlayer.bot_spawn_vect = databot.bot_spawn_vect[eventPlayer.getSlot()]
    wait(1)
    smallMessage(hostPlayer, "Spawn")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Facing Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_facing_type != databot.bot_facing_type[eventPlayer.getSlot()] or 
                eventPlayer.bot_facing_vect != databot.bot_facing_vect[eventPlayer.getSlot()]
                )

    eventPlayer.bot_facing_type = databot.bot_facing_type[eventPlayer.getSlot()]
    eventPlayer.bot_facing_vect = databot.bot_facing_vect[eventPlayer.getSlot()]

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.startFacing(normalize(databot.bot_facing_vect[eventPlayer.getSlot()]), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    else:
        eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.owner_player.getEyePosition()), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(1)
    smallMessage(hostPlayer, "Facing")

    if RULE_CONDITION:
        goto RULE_START

    
rule "Target Bot Listener - Boundary":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_bound_pos != databot.bot_bound_pos[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_dim != databot.bot_bound_dim[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_angle != databot.bot_bound_angle[eventPlayer.getSlot()]
                )

    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_cube()
    wait(1)
    smallMessage(hostPlayer, "Boundary")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Distance":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_dist_min != databot.bot_dist_min[eventPlayer.getSlot()] or
                eventPlayer.bot_dist_max != databot.bot_dist_max[eventPlayer.getSlot()]
                )

    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_max[eventPlayer.getSlot()]
    wait(1)
    smallMessage(hostPlayer, "Distance")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Hero Pool":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hero_pool != databot.bot_hero_pool[eventPlayer.getSlot()]

    eventPlayer.bot_hero_pool = databot.bot_hero_pool[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Hero Pool")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_health != databot.bot_health[eventPlayer.getSlot()]

    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    if eventPlayer.bot_health == 0:
        eventPlayer.setMaxHealth(100)
        eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    else:
        eventPlayer.setMaxHealth(eventPlayer.bot_health)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Health")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps != databot.bot_hps[eventPlayer.getSlot()]

    eventPlayer.bot_hps = databot.bot_hps[eventPlayer.getSlot()]
    eventPlayer.stopAllHoT()
    eventPlayer.stopAllDoT()
    if eventPlayer.bot_hps > 0:
        eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)
    elif eventPlayer.bot_hps < 0:
        eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "HPS")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS Wait":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps_wait != databot.bot_hps_wait[eventPlayer.getSlot()]

    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "HPS Wait")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Speed":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_speed_type != databot.bot_speed_type[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_min != databot.bot_speed_min[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_max != databot.bot_speed_max[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_target != databot.bot_speed_target[eventPlayer.getSlot()]
                )

    eventPlayer.bot_speed_type = databot.bot_speed_type[eventPlayer.getSlot()]
    eventPlayer.bot_speed_min = databot.bot_speed_min[eventPlayer.getSlot()]
    eventPlayer.bot_speed_max = databot.bot_speed_max[eventPlayer.getSlot()]
    eventPlayer.bot_speed_target = databot.bot_speed_target[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Speed")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Scale":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_scale_type != databot.bot_scale_type[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_min != databot.bot_scale_min[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_max != databot.bot_scale_max[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_target != databot.bot_scale_target[eventPlayer.getSlot()]
                )

    eventPlayer.bot_scale_type = databot.bot_scale_type[eventPlayer.getSlot()]
    eventPlayer.bot_scale_min = databot.bot_scale_min[eventPlayer.getSlot()]
    eventPlayer.bot_scale_max = databot.bot_scale_max[eventPlayer.getSlot()]
    eventPlayer.bot_scale_target = databot.bot_scale_target[eventPlayer.getSlot()]

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

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Scale")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Gravity":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_gravity != databot.bot_gravity[eventPlayer.getSlot()]

    eventPlayer.bot_gravity = databot.bot_gravity[eventPlayer.getSlot()]
    eventPlayer.setGravity(eventPlayer.bot_gravity)

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Gravity")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Profile":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_profile_status != databot.bot_profile_status[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_type != databot.bot_profile_type[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_min != databot.bot_profile_min[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_max != databot.bot_profile_max[eventPlayer.getSlot()]
                )

    eventPlayer.profiles_loaded = false
    eventPlayer.bot_profile_type = databot.bot_profile_type[eventPlayer.getSlot()]
    eventPlayer.bot_profile_min = databot.bot_profile_min[eventPlayer.getSlot()]
    eventPlayer.bot_profile_max = databot.bot_profile_max[eventPlayer.getSlot()]
    eventPlayer.bot_profile_status = databot.bot_profile_status[eventPlayer.getSlot()]

    eventPlayer.current_profile = 0
    for eventPlayer.loop_index in range(0, len(eventPlayer.bot_profile_status)):
        if eventPlayer.bot_profile_status[eventPlayer.loop_index] == true:
                eventPlayer.profile_list[eventPlayer.current_profile] = eventPlayer.loop_index
                eventPlayer.current_profile += 1
    eventPlayer.current_profile = 0
    eventPlayer.profiles_loaded = true

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Profile")

    if RULE_CONDITION:
        goto RULE_START

rule "Target Bot Listener - Bot Script Status":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_script_status != databot.bot_script_status[eventPlayer.getSlot()]

    eventPlayer.bot_script_status = databot.bot_script_status[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Script")

    if RULE_CONDITION:
        goto RULE_START
