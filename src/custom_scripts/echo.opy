playervar ttk

rule "Set TTK":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.isAlive()
    @Disabled

    stopChasingVariable(eventPlayer.ttk)
    eventPlayer.ttk = -1



rule "Start TTK Timer":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.ttk == -1
    @Disabled

    eventPlayer.ttk = distance(attacker.getPosition(), victim.getPosition())
    chase(eventPlayer.ttk, 0, duration=sqrt(eventPlayer.ttk) * 2, ChaseReeval.DESTINATION_AND_DURATION)


rule "Reset Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.ttk == 0
    @Disabled

    stopChasingVariable(eventPlayer.ttk)
    heal(eventPlayer, null, 9999)
    eventPlayer.ttk = -1


rule "Custom Scoring Example":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition scenario_status
    @Hero echo
    @Disabled

    eventPlayer.player_score += victim.ttk
    stopChasingVariable(eventPlayer.ttk)
    victim.ttk = -1


rule "Custom Scoring Example":
    @Event eachPlayer
    @Team 1
    @Condition scenario_status
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    @Condition eventPlayer.isReloading() == false
    @Hero echo

    eventPlayer.player_score -= 0.1
    wait(0.28)

    if RULE_CONDITION:
        goto RULE_START


rule "Custom Scoring Example":
    @Event eachPlayer
    @Team 1
    @Condition scenario_status
    @Condition eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) == 0
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    @Hero echo

    eventPlayer.player_score -= 0.5
    wait(6)

    if RULE_CONDITION:
        goto RULE_START


rule "Custom Scoring Example":
    @Event eachPlayer
    @Team 1
    @Condition scenario_status
    @Condition eventPlayer.isUsingAbility2()
    @Hero echo

    eventPlayer.player_score -= 1
    waitUntil(eventPlayer.isUsingAbility2() == false, 9999)

    if RULE_CONDITION:
        goto RULE_START


rule "Distance Text":
    @Event eachPlayer
    @Team 2

    createInWorldText(eventPlayer.owner_player, "x: {0}".format(eventPlayer.profile_index) if eventPlayer.ttk != -1 else distance(eventPlayer.getPosition(), eventPlayer.owner_player.getPosition()), updateEveryTick(vect(eventPlayer.getEyePosition().x, eventPlayer.getEyePosition().y + 1.4, eventPlayer.getEyePosition().z)), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, Color.WHITE if eventPlayer.ttk != -1 else Color.SKY_BLUE, SpecVisibility.DEFAULT)


rule "Custom Scoring Example":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition scenario_status
    @Hero echo
    @Disabled

    eventPlayer.player_score += distance(eventPlayer.getPosition(), victim.getPosition())


rule "Distance Text":
    @Event eachPlayer
    @Team 2
    @Disabled

    createInWorldText(eventPlayer.owner_player, round(distance(eventPlayer.getPosition(), eventPlayer.owner_player.getPosition())), updateEveryTick(vect(eventPlayer.getEyePosition().x, eventPlayer.getEyePosition().y + 1.4, eventPlayer.getEyePosition().z)), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


playervar flight_timer
playervar flight_rand

rule "Custom Bot Script Example":
    @Event eachPlayer
    @Team 2
    @Hero echo
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.isAlive()

    eventPlayer.startFacing(vect(random.uniform(0, 0.5), 1, random.uniform(0, 0.5)), 5000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.1)
    eventPlayer.startForcingButton(Button.JUMP)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.75)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.owner_player.getEyePosition()), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.flight_timer = 3
    chase(eventPlayer.flight_timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)
    while(eventPlayer.flight_timer > 0 and eventPlayer.isAlive()):
        eventPlayer.flight_rand = random.randint(0,3)
        switch eventPlayer.flight_rand:
            case 0:
            case 1:
                eventPlayer.startForcingButton(Button.JUMP)
                break
            case 2:
                eventPlayer.startForcingButton(Button.CROUCH)
                break
            case 3:
                break
        wait(random.uniform(0.1, 0.5))
        eventPlayer.stopForcingButton(Button.JUMP)
        eventPlayer.stopForcingButton(Button.CROUCH)
    eventPlayer.startForcingButton(Button.JUMP)
    wait(random.uniform(2,6), Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Custom Bot Script Example":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.isAlive()

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(random.uniform(1,5), Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Custom Bot Script Example":
    @Event eachPlayer
    @Team 2
    @Hero sojourn
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.isAlive()

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(random.uniform(0.1, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(random.uniform(5,10), Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START