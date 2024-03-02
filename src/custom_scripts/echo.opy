rule "Custom Scoring Example":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition distance(eventPlayer.getPosition(), victim.getPosition()) > 10
    @Condition scenario_status
    @Hero echo

    eventPlayer.player_score += 10


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




