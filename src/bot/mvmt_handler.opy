rule "Target Bot Horizontal Movement":
    @Event eachPlayer
    @Team 2

    async(select_mvmt_dir, AsyncBehavior.RESTART)
    wait(eventPlayer.target_mvmt_wait)

    if RULE_CONDITION:
        goto RULE_START

        
def select_mvmt_dir():
    @Name "SUB: select_mvmt_dir"

    eventPlayer.target_rand[PLAYER_RAND.XZ] = random.uniform(0, eventPlayer.mvmt_max_weight[eventPlayer.profile_index])
    switch true:
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD
            eventPlayer.target_mvmt_vect = Vector.BACKWARD
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_br_min[eventPlayer.profile_index], eventPlayer.mvmt_br_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_RIGHT
            eventPlayer.target_mvmt_vect = Vector.BACKWARD + Vector.RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.RIGHT
            eventPlayer.target_mvmt_vect = Vector.RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fr_min[eventPlayer.profile_index], eventPlayer.mvmt_fr_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_RIGHT
            eventPlayer.target_mvmt_vect = Vector.FORWARD + Vector.RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD
            eventPlayer.target_mvmt_vect = Vector.FORWARD
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fl_min[eventPlayer.profile_index], eventPlayer.mvmt_fl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_LEFT
            eventPlayer.target_mvmt_vect = Vector.FORWARD + Vector.LEFT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.LEFT
            eventPlayer.target_mvmt_vect = Vector.LEFT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_bl_min[eventPlayer.profile_index], eventPlayer.mvmt_bl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_LEFT
            eventPlayer.target_mvmt_vect = Vector.BACKWARD + Vector.LEFT
            break
        default:
            eventPlayer.target_mvmt_wait = 0.01
            eventPlayer.target_mvmt_vect = vect(0,0,0)
            break

    if eventPlayer.disabled_movements[eventPlayer.target_mvmt_index] > 0:
        switch eventPlayer.bot_bound_type:
            case 0:
                eventPlayer.target_mvmt_vect = eventPlayer.target_mvmt_vect * vect(-1, 1, -1)
                break
            case 1:
                eventPlayer.target_mvmt_vect = vect(0,0,0)
                break
            case 2:
                teleport_target()
                break

    eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_vect
    

rule "Target Bot LR Idle Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_lr_idle_chance[eventPlayer.profile_index] < 0
    @Condition eventPlayer.mvmt_lr_idle_interval[eventPlayer.profile_index] < 0
    @Condition eventPlayer.mvmt_lr_idle_max[eventPlayer.profile_index] < 0

    wait(eventPlayer.mvmt_lr_idle_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)
    eventPlayer.target_rand[PLAYER_RAND.LR_IDLE] = random.uniform(0,100)
    if eventPlayer.target_rand[PLAYER_RAND.LR_IDLE] >= eventPlayer.mvmt_lr_idle_chance[eventPlayer.profile_index] and eventPlayer.isAlive():
        eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] += 1
        eventPlayer.disabled_movements[XZ_DIR.RIGHT] += 1
        eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] += 1
        eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] += 1
        eventPlayer.disabled_movements[XZ_DIR.LEFT] += 1
        eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] += 1

        wait(random.uniform(eventPlayer.mvmt_lr_idle_min, eventPlayer.mvmt_lr_idle_max))

        if eventPlayer.isAlive():
            if eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.RIGHT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.RIGHT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.LEFT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.LEFT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] -= 1

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot FB Idle Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_fb_idle_chance[eventPlayer.profile_index] < 0
    @Condition eventPlayer.mvmt_fb_idle_interval[eventPlayer.profile_index] < 0
    @Condition eventPlayer.mvmt_fb_idle_max[eventPlayer.profile_index] < 0

    wait(eventPlayer.mvmt_fb_idle_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)
    eventPlayer.target_rand[PLAYER_RAND.FB_IDLE] = random.uniform(0,100)
    if eventPlayer.target_rand[PLAYER_RAND.FB_IDLE] >= eventPlayer.mvmt_fb_idle_chance[eventPlayer.profile_index] and eventPlayer.isAlive():
        eventPlayer.disabled_movements[XZ_DIR.BACKWARD] += 1
        eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] += 1
        eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] += 1
        eventPlayer.disabled_movements[XZ_DIR.FORWARD] += 1
        eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] += 1
        eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] += 1

        wait(random.uniform(eventPlayer.mvmt_fb_idle_min[eventPlayer.profile_index], eventPlayer.mvmt_fb_idle_max[eventPlayer.profile_index]))

        if eventPlayer.isAlive():
            if eventPlayer.disabled_movements[XZ_DIR.BACKWARD] > 0:
                eventPlayer.disabled_movements[XZ_DIR.BACKWARD] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.BACKWARD_RIGHT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.FORWARD_RIGHT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.FORWARD] > 0:
                eventPlayer.disabled_movements[XZ_DIR.FORWARD] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.FORWARD_LEFT] -= 1
            if eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] > 0:
                eventPlayer.disabled_movements[XZ_DIR.BACKWARD_LEFT] -= 1

    if RULE_CONDITION:
        goto RULE_START