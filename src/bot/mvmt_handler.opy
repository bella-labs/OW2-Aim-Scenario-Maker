rule "Target Bot Disable Throttle":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_hori_type[eventPlayer.profile_index] == 1 or 
                eventPlayer.mvmt_max_weight[eventPlayer.profile_index] == 0
                )   

        eventPlayer.stopThrottleInDirection()


rule "Target Bot Horizontal Input Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type[eventPlayer.profile_index] == 0
    @Condition eventPlayer.mvmt_max_weight[eventPlayer.profile_index] > 0

        eventPlayer.startThrottleInDirection(eventPlayer.target_mvmt_dir, 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)


rule "Target Bot Horizontal Movement Handler":
    @Event eachPlayer
    @Team 2

    async(select_mvmt_dir, AsyncBehavior.RESTART)
    wait(eventPlayer.target_hori_wait)

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Jump Input Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 0
    @Condition eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.disabled_vert[YDIR.UP] == 0

    eventPlayer.target_rand[PLAYER_RAND.JUMP] = random.uniform(0, 100)
    if eventPlayer.target_rand[PLAYER_RAND.JUMP] <= eventPlayer.mvmt_jump_chance[eventPlayer.profile_index]:
        eventPlayer.startForcingButton(Button.JUMP)
        waitUntil(eventPlayer.isDead(), random.uniform(eventPlayer.mvmt_uncrouch_min[eventPlayer.profile_index], eventPlayer.mvmt_uncrouch_max[eventPlayer.profile_index]))
        eventPlayer.stopForcingButton(Button.JUMP)
    wait(eventPlayer.mvmt_jump_interval[eventPlayer.profile_index])

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Crouch Input Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 0
    @Condition eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.disabled_vert[YDIR.UP] == 0
    
    eventPlayer.target_rand[PLAYER_RAND.CROUCH] = random.uniform(0, eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index])
    if eventPlayer.target_rand[PLAYER_RAND.CROUCH] <= random.uniform(0, eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index]):
        eventPlayer.startForcingButton(Button.CROUCH)
        waitUntil(eventPlayer.isDead(), random.uniform(eventPlayer.mvmt_uncrouch_min[eventPlayer.profile_index], eventPlayer.mvmt_uncrouch_max[eventPlayer.profile_index]))
        eventPlayer.stopForcingButton(Button.CROUCH)
    wait(eventPlayer.mvmt_crouch_interval[eventPlayer.profile_index])

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Horizontal Impulse Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_hori_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_hori_impulse[eventPlayer.profile_index] > 0

    eventPlayer.applyImpulse(eventPlayer.target_mvmt_dir, eventPlayer.mvmt_hori_impulse[eventPlayer.profile_index], Relativity.TO_PLAYER, Impulse.CANCEL_CONTRARY_MOTION)
    wait(eventPlayer.mvmt_hori_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Vertical Impulse Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    
    eventPlayer.target_rand[PLAYER_RAND.JUMP] = random.uniform(0, 100)
    eventPlayer.target_rand[PLAYER_RAND.CROUCH] = random.uniform(0, 100)
    if eventPlayer.target_rand[PLAYER_RAND.JUMP] <= eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] and eventPlayer.disabled_vert[YDIR.UP] == 0 and eventPlayer.target_rand[PLAYER_RAND.CROUCH] <= eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] and eventPlayer.disabled_vert[YDIR.DOWN] == 0:
        if random.randint(0,1) == 0:
            eventPlayer.target_vert_dir = 1
            async(target_up_impulse, AsyncBehavior.NOOP)
            waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.UP] != 0, random.uniform(eventPlayer.mvmt_jump_min[eventPlayer.profile_index], eventPlayer.mvmt_jump_max[eventPlayer.profile_index]))
        else:
            eventPlayer.target_vert_dir = -1
            async(target_down_impulse, AsyncBehavior.NOOP)
            waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.DOWN] != 0, random.uniform(eventPlayer.mvmt_uncrouch_min[eventPlayer.profile_index], eventPlayer.mvmt_uncrouch_max[eventPlayer.profile_index]))
    elif eventPlayer.target_rand[PLAYER_RAND.JUMP] <= eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] and eventPlayer.disabled_vert[YDIR.UP] == 0:
        eventPlayer.target_vert_dir = 1
        async(target_up_impulse, AsyncBehavior.NOOP)
        waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.UP] != 0, random.uniform(eventPlayer.mvmt_jump_min[eventPlayer.profile_index], eventPlayer.mvmt_jump_max[eventPlayer.profile_index]))
    elif eventPlayer.target_rand[PLAYER_RAND.CROUCH] <= eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] and not eventPlayer.disabled_vert[YDIR.DOWN] == 0:
        eventPlayer.target_vert_dir = -1
        async(target_down_impulse, AsyncBehavior.NOOP)
        waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.DOWN] != 0, random.uniform(eventPlayer.mvmt_uncrouch_min[eventPlayer.profile_index], eventPlayer.mvmt_uncrouch_max[eventPlayer.profile_index]))
    
    eventPlayer.target_vert_dir = 0
    wait(eventPlayer.mvmt_vert_interval[eventPlayer.profile_index])  
    
    if RULE_CONDITION:
        goto RULE_START
    

rule "Target Bot LR Idle Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_lr_idle_chance[eventPlayer.profile_index] > 0

    wait(eventPlayer.mvmt_lr_idle_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)
    eventPlayer.target_rand[PLAYER_RAND.LR_IDLE] = random.uniform(0,100)
    if eventPlayer.target_rand[PLAYER_RAND.LR_IDLE] < eventPlayer.mvmt_lr_idle_chance[eventPlayer.profile_index] and eventPlayer.isAlive():
        eventPlayer.target_lr_idle = true
        wait(random.uniform(eventPlayer.mvmt_lr_idle_min[eventPlayer.profile_index], eventPlayer.mvmt_lr_idle_max[eventPlayer.profile_index]))
        eventPlayer.target_lr_idle = false

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot FB Idle Movement":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_fb_idle_chance[eventPlayer.profile_index] > 0

    wait(eventPlayer.mvmt_fb_idle_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)
    eventPlayer.target_rand[PLAYER_RAND.FB_IDLE] = random.uniform(0,100)
    if eventPlayer.target_rand[PLAYER_RAND.FB_IDLE] < eventPlayer.mvmt_fb_idle_chance[eventPlayer.profile_index] and eventPlayer.isAlive():
        eventPlayer.target_fb_idle = true
        wait(random.uniform(eventPlayer.mvmt_fb_idle_min[eventPlayer.profile_index], eventPlayer.mvmt_fb_idle_max[eventPlayer.profile_index]))
        eventPlayer.target_fb_idle = false

    if RULE_CONDITION:
        goto RULE_START


def select_mvmt_dir():
    @Name "SUB: select_mvmt_dir"

    eventPlayer.target_rand[PLAYER_RAND.XZ] = random.uniform(0, eventPlayer.mvmt_max_weight[eventPlayer.profile_index])
    switch true:
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_RIGHT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_br_min[eventPlayer.profile_index], eventPlayer.mvmt_br_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.RIGHT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_RIGHT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_fr_min[eventPlayer.profile_index], eventPlayer.mvmt_fr_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_RIGHT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_LEFT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_fl_min[eventPlayer.profile_index], eventPlayer.mvmt_fl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_LEFT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.LEFT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.LEFT
            break
        case eventPlayer.target_rand[PLAYER_RAND.XZ] <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_LEFT]:
            eventPlayer.target_hori_wait = random.uniform(eventPlayer.mvmt_bl_min[eventPlayer.profile_index], eventPlayer.mvmt_bl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_LEFT
            break
        default:
            eventPlayer.target_hori_wait = 0.01
            eventPlayer.target_mvmt_index = XZ_DIR.NONE
            break

    if eventPlayer.disabled_hori[eventPlayer.target_mvmt_index] > 0:
        boundary_collision_handler()
    else:
        eventPlayer.target_mvmt_vect = movement_options[eventPlayer.target_mvmt_index]

    if eventPlayer.target_lr_idle:
        eventPlayer.target_mvmt_vect *= vect(0,1,1)
    if eventPlayer.target_fb_idle:
        eventPlayer.target_mvmt_vect *= vect(1,1,0)

    eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_vect


def boundary_collision_handler():
    @Name "SUB: boundary_collision_handler"


    switch eventPlayer.bot_bound_type:
        case 0:
            eventPlayer.disabled_rev_index = -1
            eventPlayer.disabled_rev_choices = null

            for eventPlayer.disabled_index in range(0, 8):
                if eventPlayer.disabled_hori[eventPlayer.disabled_index] == 0 and eventPlayer.mvmt_weights[eventPlayer.profile_index][eventPlayer.disabled_index] > 0:
                    eventPlayer.disabled_rev_index += 1
                    eventPlayer.disabled_rev_choices[eventPlayer.disabled_rev_index] = eventPlayer.disabled_index
  
            if eventPlayer.disabled_rev_index == -1:
                eventPlayer.target_mvmt_vect = movement_options[XZ_DIR.NONE]
            else:
                eventPlayer.target_mvmt_vect = movement_options[random.choice(eventPlayer.disabled_rev_choices)]
            break
        case 1:
            eventPlayer.target_mvmt_vect = movement_options[XZ_DIR.NONE]
            break
        case 2:
            eventPlayer.target_mvmt_vect = movement_options[eventPlayer.target_mvmt_index]
            teleport_target()
            break




def target_up_impulse():
    @Name "SUB: target_up_impulse"
    while(eventPlayer.target_vert_dir == 1):
        eventPlayer.applyImpulse(Vector.UP, eventPlayer.mvmt_vert_impulse[eventPlayer.profile_index], Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(eventPlayer.mvmt_vert_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)


def target_down_impulse():
    @Name "SUB: target_down_impulse"
    while(eventPlayer.target_vert_dir == -1):
        eventPlayer.applyImpulse(Vector.DOWN, eventPlayer.mvmt_vert_impulse[eventPlayer.profile_index], Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(eventPlayer.mvmt_vert_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)