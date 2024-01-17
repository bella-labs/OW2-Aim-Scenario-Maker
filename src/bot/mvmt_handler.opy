rule "Target Bot Horizontal Movement":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0 or eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0)

    wait(1)

    if RULE_CONDITION:
        goto RULE_START