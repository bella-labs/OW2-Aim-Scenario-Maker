playervar ammo
playervar shot_hit

rule "End Scenario on Miss":
    @Event eachPlayer
    @Team 1
    @Condition not eventPlayer.isDummy()
    @Condition scenario_status

    eventPlayer.ammo = eventPlayer.getAmmo(0)


rule "End Scenario on Miss":
    @Event playerDealtDamage
    @Team 1
    @Condition not eventPlayer.isDummy()
    @Condition scenario_status

    eventPlayer.shot_hit = true


rule "End Scenario on Miss":
    @Event eachPlayer
    @Team 1
    @Condition not eventPlayer.isDummy()
    @Condition scenario_status
    @Condition eventPlayer.ammo != eventPlayer.getAmmo(0)

    if eventPlayer.getAmmo(0) < eventPlayer.ammo:
        if not eventPlayer.shot_hit:
            sce_stop_scenario()
    eventPlayer.shot_hit = false
    eventPlayer.ammo = eventPlayer.getAmmo(0)


rule "Ball ball form":
    @Event eachPlayer
    @Team 2
    @Hero hammond
    @Condition eventPlayer.isAlive()
    @Condition not eventPlayer.isUsingAbility1()

    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait()

    if RULE_CONDITION:
        goto RULE_START


rule "Player Infinite Ammo":
    @Event eachPlayer
    @Team 1
    @Condition not eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.getMaxAmmo(0) != 100000

    eventPlayer.setAmmo(0, 100000)
    eventPlayer.setMaxAmmo(0, 100000)
    eventPlayer.setAmmo(1, 100000)
    eventPlayer.setMaxAmmo(1, 100000)


rule "Player Infinite Ammo - Ammo Refresh":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getAmmo(0) <= 1

    eventPlayer.setAmmo(0, 100000)
    eventPlayer.setMaxAmmo(0, 100000)
    eventPlayer.setAmmo(1, 100000)
    eventPlayer.setMaxAmmo(1, 100000)