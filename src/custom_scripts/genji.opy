rule "Custom Bot Script Example":
    @Event eachPlayer
    @Team 2
    @Hero genji
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.isOnGround()

    wait(random.uniform(1, 3))
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(random.uniform(0.25, 0.5))
    if not eventPlayer.isOnGround():
        eventPlayer.forceButtonPress(Button.JUMP)

    if RULE_CONDITION:
        goto RULE_START