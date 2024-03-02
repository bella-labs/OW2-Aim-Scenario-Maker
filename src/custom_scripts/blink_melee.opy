rule "Custom Scoring Example":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition databot.sce_custom_status == 1
    @Condition eventAbility == Button.MELEE
    @Condition scenario_status
    @Hero tracer

    eventPlayer.player_score += 10

