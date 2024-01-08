rule "Target Bot Listener - Hero Pool":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hero_pool != databot.bot_hero_pool[eventPlayer.getSlot()]

    eventPlayer.bot_hero_pool = databot.bot_hero_pool[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "0")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_health != databot.bot_health[eventPlayer.getSlot()]

    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    if eventPlayer.bot_health == 0:
        eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    else:
        eventPlayer.setMaxHealth(eventPlayer.bot_health)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "1")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps != databot.bot_hps[eventPlayer.getSlot()]

    eventPlayer.bot_hps = databot.bot_hps[eventPlayer.getSlot()]
    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    eventPlayer.stopAllHoT()
    eventPlayer.stopAllDoT()
    if eventPlayer.bot_hps > 0:
        eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)
    elif eventPlayer.bot_hps < 0:
        eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "2")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS Wait":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps_wait != databot.bot_hps_wait[eventPlayer.getSlot()]

    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "3")
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
    smallMessage(hostPlayer, "4")
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
        set_target_scale()
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "5")
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
    smallMessage(hostPlayer, "6")
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
    smallMessage(hostPlayer, "7")
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
    smallMessage(hostPlayer, "8")
    if RULE_CONDITION:
        goto RULE_START

rule "Target Bot Listener - Boundary":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_dist_min != databot.bot_dist_min[eventPlayer.getSlot()] or
                eventPlayer.bot_dist_max != databot.bot_dist_max[eventPlayer.getSlot()]
                )

    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_max[eventPlayer.getSlot()]
    wait(1)
    smallMessage(hostPlayer, "9")
    if RULE_CONDITION:
        goto RULE_START