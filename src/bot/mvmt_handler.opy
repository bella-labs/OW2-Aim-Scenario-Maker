rule "Target Bot Movement - L/R Randomizer":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0 or eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0)

    eventPlayer.movement_interrupt = false
    eventPlayer.target_mvmt_rand[MVMT_RAND.LR] = random.randint(0, 99)

    if (eventPlayer.target_mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index] and eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_right_max[eventPlayer.profile_index] <= 0 :
        eventPlayer.target_mvmt_wait[MVMT_RAND.LR] = random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index])
    else:
        eventPlayer.target_mvmt_wait[MVMT_RAND.LR] = random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index])

    
    wait(eventPlayer.target_mvmt_wait[MVMT_RAND.LR], Wait.RESTART_WHEN_TRUE)
    eventPlayer.movement_interrupt = true

    if RULE_CONDITION:
        goto RULE_START


rule "Left Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]

        eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.LEFT
        waitUntil(eventPlayer.movement_interrupt == true, 9999)



rule "Right Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_right_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.LR] >= eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]

        eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.RIGHT
        waitUntil(eventPlayer.movement_interrupt == true, 9999)


rule "Target Bot Movement - F/B Randomizer":
    @Event eachPlayer
    @Team 2
    @Condition (eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0 or eventPlayer.mvmt_back_max[eventPlayer.profile_index] > 0)

    eventPlayer.target_mvmt_rand[MVMT_RAND.FB] = random.randint(0, 99)

    if (eventPlayer.target_mvmt_rand[MVMT_RAND.FB] < eventPlayer.mvmt_fb_ratio[eventPlayer.profile_index] and eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_back_max[eventPlayer.profile_index] <= 0:
        eventPlayer.target_mvmt_wait[MVMT_RAND.FB] = random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index])
    else:
        eventPlayer.target_mvmt_wait[MVMT_RAND.FB] = random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index])

    wait(eventPlayer.target_mvmt_wait[MVMT_RAND.FB], Wait.RESTART_WHEN_TRUE)

    if RULE_CONDITION:
        goto RULE_START


rule "Forward Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.FB] < eventPlayer.mvmt_fb_ratio[eventPlayer.profile_index]
        eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(1,1,0) + Vector.FORWARD
        waitUntil(eventPlayer.movement_interrupt == true, 9999)


rule "Backward Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_back_max[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_mvmt_rand[MVMT_RAND.FB] >= eventPlayer.mvmt_fb_ratio[eventPlayer.profile_index]

        eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(1,1,0) + Vector.BACKWARD
        waitUntil(eventPlayer.movement_interrupt == true, 9999)
