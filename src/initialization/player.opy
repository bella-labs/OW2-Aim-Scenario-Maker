rule "Player Joined: Disable GameHUD":
    @Event playerJoined
    @Team 1

    eventPlayer.disableGamemodeHud()


rule "Player Spawned: Setup Host":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition eventPlayer.hasSpawned()

    # Allow player to use inputs
    enable_player_input()
    # Make player unkillable by default.
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 9999)


rule "Player Passive: Disable Healing Passive":
    @Event eachPlayer
    @Condition eventPlayer.getNormalizedHealth() != 1

    wait(2.4, Wait.ABORT_WHEN_FALSE)
    damage(eventPlayer, null, 0.001)
    heal(eventPlayer, null, 0.001)

    if RULE_CONDITION:
        goto RULE_START


