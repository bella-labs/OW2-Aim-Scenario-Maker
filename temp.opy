rule "Target Bot Vertical Impulse Handler":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.target_vert_dir != 0
    @Condition eventPlayer.isAlive()

    while(eventPlayer.target_vert_dir != 0):
        eventPlayer.applyImpulse(vect(0, eventPlayer.target_vert_dir, 0), eventPlayer.mvmt_vert_impulse[eventPlayer.profile_index], Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(eventPlayer.mvmt_vert_interval[eventPlayer.profile_index], Wait.ABORT_WHEN_FALSE)

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Vertical Up Impulse Offset":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_vert_offset[YDIR.UP] == false
    @Condition eventPlayer.isAlive()

    # Adds an offset to the up impulse to allow for cases where up and down have the same timing with 100% occurance.
    wait(random.uniform(eventPlayer.mvmt_jump_max[eventPlayer.profile_index])/4, eventPlayer.mvmt_jump_max[eventPlayer.profile_index]))
    eventPlayer.target_vert_offset[YDIR.UP] = true

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Vertical Down Impulse Offset":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_vert_offset[YDIR.DOWN] == false
    @Condition eventPlayer.isAlive()

    # Adds an offset to the down impulse to allow for cases where up and down have the same timing with 100% occurance.
    wait(random.uniform(eventPlayer.mvmt_crouch_max[eventPlayer.profile_index])/4, eventPlayer.mvmt_crouch_max[eventPlayer.profile_index]))
    eventPlayer.target_vert_offset[YDIR.DOWN] = true

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Vertical Up Impulse Trigger":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_vert_offset[YDIR.UP] == true
    @Condition eventPlayer.disabled_vert[YDIR.OVERRIDE] == 0
    @Condition eventPlayer.isAlive()

    eventPlayer.target_rand[PLAYER_RAND.JUMP] = random.uniform(0, 100)
    if eventPlayer.target_rand[PLAYER_RAND.JUMP] <= eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] and eventPlayer.disabled_vert[YDIR.UP] == 0:
        if eventPlayer.disabled_vert[YDIR.UP] == 0:
            eventPlayer.target_vert_dir += 1
        waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.OVERRIDE] != 0, random.uniform(eventPlayer.mvmt_jump_min[eventPlayer.profile_index], eventPlayer.mvmt_jump_max[eventPlayer.profile_index]))
        if eventPlayer.disabled_vert[YDIR.UP] != 0:
            eventPlayer.disabled_vert[YDIR.UP_FLAG] = 1
            eventPlayer.target_vert_dir -= 2
        else:
            eventPlayer.target_vert_dir -= 1
    wait(eventPlayer.mvmt_jump_interval[eventPlayer.profile_index])
    if eventPlayer.disabled_vert[YDIR.UP_FLAG] == 1:
        eventPlayer.disabled_vert[YDIR.UP_FLAG] = 0
        eventPlayer.target_vert_dir +=1

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Vertical Disable Up Impulse On Y Axis":
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_jump_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.disabled_vert[YDIR.DOWN] == 0

    # Set overrride to +1
    # wait()
    # Set vert_dir to -1
    # Wait until disabled_vert[up] == 0
    # Make Trigger test and if override > 0 wait until override == 0, else -1 to vect dir




rule "Target Bot Vertical Down Impulse Trigger":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.mvmt_vert_type[eventPlayer.profile_index] == 1
    @Condition eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] > 0
    @Condition eventPlayer.target_vert_offset[YDIR.DOWN] == true
    @Condition eventPlayer.isAlive()

    eventPlayer.target_rand[PLAYER_RAND.CROUCH] = random.uniform(0, 100)
    if eventPlayer.target_rand[PLAYER_RAND.CROUCH] <= eventPlayer.mvmt_crouch_chance[eventPlayer.profile_index] and eventPlayer.disabled_vert[YDIR.DOWN] == 0:
        if eventPlayer.disabled_vert[YDIR.UP] != 0:
        eventPlayer.target_vert_dir -= 1
        waitUntil(eventPlayer.isDead() or eventPlayer.disabled_vert[YDIR.UP] != 0, random.uniform(eventPlayer.mvmt_crouch_min[eventPlayer.profile_index], eventPlayer.mvmt_crouch_max[eventPlayer.profile_index]))
        if eventPlayer.disabled_vert[YDIR.DOWN_FLAG] != 0:
            eventPlayer.disabled_vert[YDIR.DOWN_FLAG] = 1
            eventPlayer.target_vert_dir += 2
        else:
            eventPlayer.target_vert_dir += 1
    wait(eventPlayer.mvmt_crouch_interval[eventPlayer.profile_index])
    if eventPlayer.disabled_vert[YDIR.DOWN_FLAG] == 1:
        eventPlayer.disabled_vert[YDIR.DOWN_FLAG] = 0
        eventPlayer.target_vert_dir -=1

    if RULE_CONDITION:
        goto RULE_START