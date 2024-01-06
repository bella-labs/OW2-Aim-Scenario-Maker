rule "Target Bot Listener - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_health != databot.bot_health[eventPlayer.getSlot()]

    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    eventPlayer.setMaxHealth(eventPlayer.bot_health)
    # Cooldown to prevent overflow
    wait(1)
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
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS Wait":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps_wait == databot.bot_hps_wait[eventPlayer.getSlot()]

    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Speed":
    @Event eachPlayer
    @Team 2
    @Condition (
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
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Scale":
    @Event eachPlayer
    @Team 2
    @Condition (
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
    if RULE_CONDITION:
        goto RULE_START

