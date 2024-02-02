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
    