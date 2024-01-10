rule "Target Bot Movement - L/R Input"
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 0


rule "Target Bot Movement - L/R Impulse"
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 1