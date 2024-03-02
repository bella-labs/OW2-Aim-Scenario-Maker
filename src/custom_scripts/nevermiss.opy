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

    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)