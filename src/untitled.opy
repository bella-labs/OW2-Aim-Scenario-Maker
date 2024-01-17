rule "Target Bot Movement":
    @Event eachPlayer
    @Team 2
    @Condition lr_waiting == false or fb_waiting == false or true in eventPlayer.disabled_movements

    if lr_waiting == false:
        eventPlayer.target_PLAYER_RAND[PLAYER_RAND.LR] = random.randint(0, 99)
        if eventPlayer.target_PLAYER_RAND[PLAYER_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]:
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.LEFT
        else:
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(0,1,1) + Vector.RIGHT
        async(async_lr, AsyncBehavior.NOOP)
    if fb_waiting == false:
        eventPlayer.target_PLAYER_RAND[PLAYER_RAND.FB] = random.randint(0, 99)
        if eventPlayer.target_PLAYER_RAND[PLAYER_RAND.LR] < eventPlayer.mvmt_lr_ratio[eventPlayer.profile_index]:
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(1,1,0) + Vector.FORWARD
        else:
            eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_dir * vect(1,1,0) + Vector.BACKWARD
        async(async_fb, AsyncBehavior.NOOP)

    if RULE_CONDITION:
        goto RULE_START

def async_lr():
    @Name "SUB: async_lr"

    eventPlayer.lr_waiting = true
    if (eventPlayer.target_PLAYER_RAND[PLAYER_RAND.LR] < eventPlayer.mvmt_right_max[eventPlayer.profile_index] and eventPlayer.mvmt_left_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_right_max[eventPlayer.profile_index] <= 0 :
        wait(random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index]))
    else:
        wait(random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index]))

    eventPlayer.lr_waiting = false


def async_fb():
    @Name "SUB: async_fb"

    eventPlayer.fb_waiting = true
    if (eventPlayer.target_PLAYER_RAND[PLAYER_RAND.FB] < eventPlayer.mvmt_back_max[eventPlayer.profile_index] and eventPlayer.mvmt_fwd_max[eventPlayer.profile_index] > 0) or eventPlayer.mvmt_back_max[eventPlayer.profile_index] <= 0 :
        wait(random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index]))
    else:
        wait(random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index]))
    eventPlayer.fb_waiting = false