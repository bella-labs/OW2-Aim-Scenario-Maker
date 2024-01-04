rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true

    # Set Health
    eventPlayer.setMaxHealth(databot.bot_health[eventPlayer.getSlot()])
    # Set HPS / DOT
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
    
    if eventPlayer.bot_speed_type == 1:
        eventPlayer.setMoveSpeed(random.uniform(eventPlayer.bot_speed_min, eventPlayer.bot_speed_max))
    else:
        eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min)
    # Set Scale
    eventPlayer.bot_scale_type = databot.bot_scale_type[eventPlayer.getSlot()]
    eventPlayer.bot_scale_min = databot.bot_scale_min[eventPlayer.getSlot()]
    eventPlayer.bot_scale_max = databot.bot_scale_max[eventPlayer.getSlot()]
    eventPlayer.bot_scale_target = databot.bot_scale_target[eventPlayer.getSlot()]
    # 

    

rule "Reset HoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.bot_hps > 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllHoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)


rule "Reset DoT":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.bot_hps < 0
    @Condition eventPlayer.bot_hps_wait > 0

    eventPlayer.stopAllDoT()
    wait(databot.bot_hps_wait[eventPlayer.getSlot()], Wait.RESTART_WHEN_TRUE)
    eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)


rule "Speed Handler - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_speed_type == 2

    eventPlayer.setMoveSpeed(eventPlayer.bot_speed_min + (eventPlayer.bot_speed_max - eventPlayer.bot_speed_min) * (1 - eventPlayer.getNormalizedHealth()))
    wait(0.25)

    if RULE_CONDITION:
        goto RULE_START


rule "Scale Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned()

    smallMessage(hostPlayer, "test")
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
            smallMessage(hostPlayer, "Hi")
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)), true)
            break

rule "text":
    @Event eachPlayer
    @Team 1
    @Slot 1
    hudSubheader(hostPlayer, "{0}".format(""), HudPosition.RIGHT, 9999, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)