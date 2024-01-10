rule "Target Bot Movement - L/R Randomizer":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 0
    @Condition (eventPlayer.mvmt_left_max > 0 or eventPlayer.mvmt_right_max > 0)

    eventPlayer.mvmt_rand[MVMT_RAND.LR] = random.randint(0, 99)
    if (eventPlayer.mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio and eventPlayer.mvmt_left_max > 0) or eventPlayer.mvmt_right_max <= 0 :
        eventPlayer.mvmt_wait = random.uniform(eventPlayer.mvmt_left_min, eventPlayer.mvmt_left_max)
    else:
        eventPlayer.mvmt_wait = random.uniform(eventPlayer.mvmt_right_min, eventPlayer.mvmt_right_max)

    wait(eventPlayer.mvmt_wait, Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Movement Left Input":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 0
    @Condition eventPlayer.mvmt_left_max > 0
    @Condition eventPlayer.mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.LEFT] == false
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT] == false
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT] == false

    eventPlayer.mvmt_dir = vect(1, eventPlayer.mvmt_dir.y, eventPlayer.mvmt_dir.z)
    smallMessage(hostPlayer, "Go LEFT")
    waitUntil(eventPlayer.mvmt_rand[MVMT_RAND.LR] >= eventPlayer.mvmt_lr_ratio or (eventPlayer.disabled_movements[DISABLED_VECT.LEFT] == true and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT] == true and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT] == true), 9999)
    if eventPlayer.mvmt_right_max <= 0 or (eventPlayer.disabled_movements[DISABLED_VECT.LEFT] == true and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_LEFT] == true and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_LEFT] == true):
        smallMessage(hostPlayer, "STOP LEFT")
        eventPlayer.mvmt_dir = vect(0, eventPlayer.mvmt_dir.y, eventPlayer.mvmt_dir.z)


rule "Target Bot Movement Right Input":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 0
    @Condition eventPlayer.mvmt_right_max > 0
    @Condition eventPlayer.mvmt_rand[MVMT_RAND.LR] >= eventPlayer.mvmt_lr_ratio
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.RIGHT] == false
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT] == false
    @Condition eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT] == false

    eventPlayer.mvmt_dir = vect(-1, eventPlayer.mvmt_dir.y, eventPlayer.mvmt_dir.z)
    smallMessage(hostPlayer, "Go RIGHT")
    waitUntil(eventPlayer.mvmt_rand[MVMT_RAND.LR] < eventPlayer.mvmt_lr_ratio or (eventPlayer.disabled_movements[DISABLED_VECT.RIGHT] == true and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT] == true and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT] == true), 9999)
    if eventPlayer.mvmt_right_max <= 0 or (eventPlayer.disabled_movements[DISABLED_VECT.RIGHT] == true and eventPlayer.disabled_movements[DISABLED_VECT.FORWARD_RIGHT] == true and eventPlayer.disabled_movements[DISABLED_VECT.BACKWARD_RIGHT] == true):
        smallMessage(hostPlayer, "STOP RIGHT")
        eventPlayer.mvmt_dir = vect(0, eventPlayer.mvmt_dir.y, eventPlayer.mvmt_dir.z)


rule "Target Bot Movement - L/R Impulse":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type == 1