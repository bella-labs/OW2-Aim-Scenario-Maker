rule "Target Bot Movement - L/R Randomizer":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0 or eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0)

    eventPlayer.target_mvmt_rand[MVMT_RAND.LR] = random.randint(0, 99)
    if (eventPlayer.target_mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_right_max[eventPlayer.profile_index] and eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_right_max[eventPlayer.profile_index] <= 0 :
        eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index])
    else:
        eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index])

    wait(eventPlayer.target_mvmt_wait, Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Movement - Left Input":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type[eventPlayer.profile_index] == 0
    @Condition eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.LEFT]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT]

    eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.LEFT
    smallMessage(hostPlayer, "Go LEFT")
    waitUntil(eventPlayer.target_mvmt_rand[MVMT_RAND.LR] >= eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index] or (eventPlayer.disabled_movements[DISABLED_VECT.LEFT] and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT] and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT]), 9999)
    if (eventPlayer.disabled_movements[DISABLED_VECT.LEFT] and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT] and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT]) or eventPlayer.mvmt_right_max[eventPlayer.profile_index] <= 0:
        if eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0:
            eventPlayer.target_mvmt_rand[MVMT_RAND.LR] = 100
            smallMessage(hostPlayer, "REV LEFT")
        else:
            smallMessage(hostPlayer, "STOP LEFT")
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1)
        

rule "Target Bot Movement - Right Input":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type[eventPlayer.profile_index] == 0
    @Condition eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.LR] >= eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.RIGHT]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT]
    @Condition not eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT]

    eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.RIGHT
    smallMessage(hostPlayer, "Go RIGHT")
    waitUntil(eventPlayer.target_mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index] or (eventPlayer.disabled_movements[DISABLED_VECT.RIGHT] and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT] and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT]), 9999)
    if (eventPlayer.disabled_movements[DISABLED_VECT.RIGHT] and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT] and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT]) or eventPlayer.mvmt_left_max[eventPlayer.profile_index] <= 0:
        if eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0:
            eventPlayer.target_mvmt_rand[MVMT_RAND.LR] = 0
            smallMessage(hostPlayer, "REV RIGHT")
        else:
            smallMessage(hostPlayer, "STOP RIGHT")
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1)


rule "Target Bot Movement - F/B Randomizer":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0 or eventPlayer.mvmt_back_max[eventPlayer.profile_index] > 0)

    eventPlayer.target_mvmt_rand[MVMT_RAND.FB] = random.randint(0, 99)
    if (eventPlayer.target_mvmt_rand[MVMT_RAND.FB] < eventPlayer.mvmt_back_max[eventPlayer.profile_index] and eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_back_max[eventPlayer.profile_index] <= 0 :
        eventPlayer.target_mvmt_wait[MVMT_RAND.FB] = random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index])
    else:
        eventPlayer.target_mvmt_wait[MVMT_RAND.FB] = random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index])

    wait(eventPlayer.target_mvmt_wait[MVMT_RAND.FB], Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START