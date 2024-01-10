rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2

    # Set Owner Player
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)
    # Set Movement Direction
    eventPlayer.mvmt_dir = vect(0,0,0)
    eventPlayer.startThrottleInDirection(eventPlayer.mvmt_dir, 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    # Set Disabled Movements; Indexes Map: 0 = F, 1 = FR, 2 = R, 3 = BR, 4 = B, 5 = BL, 6 = L, 7 = FL
    eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] = 0
    while(eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] < 10):
        eventPlayer.disabled_movements[eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT]] = false
        eventPlayer.loop_indexes[PLAYER_INDEXES.DISABLE_MVMT] += 1

        
rule "Target Bot Listener - Spawn":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_spawn_type != databot.bot_spawn_type[eventPlayer.getSlot()] or 
                eventPlayer.bot_spawn_vect != databot.bot_spawn_vect[eventPlayer.getSlot()]
                )

    eventPlayer.bot_spawn_type = databot.bot_spawn_type[eventPlayer.getSlot()]
    eventPlayer.bot_spawn_vect = databot.bot_spawn_vect[eventPlayer.getSlot()]
    wait(1)
    smallMessage(hostPlayer, "Spawn")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Facing Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_facing_type != databot.bot_facing_type[eventPlayer.getSlot()] or 
                eventPlayer.bot_facing_vect != databot.bot_facing_vect[eventPlayer.getSlot()]
                )

    eventPlayer.bot_facing_type = databot.bot_facing_type[eventPlayer.getSlot()]
    eventPlayer.bot_facing_vect = databot.bot_facing_vect[eventPlayer.getSlot()]

    if eventPlayer.bot_facing_type == 0:
        eventPlayer.startFacing(normalize(databot.bot_facing_vect[eventPlayer.getSlot()]), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    else:
        eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.owner_player.getEyePosition()), 9999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(1)
    smallMessage(hostPlayer, "Facing")

    if RULE_CONDITION:
        goto RULE_START

    
rule "Target Bot Listener - Boundary":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_bound_pos != databot.bot_bound_pos[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_dim != databot.bot_bound_dim[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_angle != databot.bot_bound_angle[eventPlayer.getSlot()]
                )

    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_cube()
    wait(1)
    smallMessage(hostPlayer, "Boundary")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Distance":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_dist_min != databot.bot_dist_min[eventPlayer.getSlot()] or
                eventPlayer.bot_dist_max != databot.bot_dist_max[eventPlayer.getSlot()]
                )

    eventPlayer.bot_dist_min = databot.bot_dist_min[eventPlayer.getSlot()]
    eventPlayer.bot_dist_max = databot.bot_dist_max[eventPlayer.getSlot()]
    wait(1)
    smallMessage(hostPlayer, "Distance")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Hero Pool":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hero_pool != databot.bot_hero_pool[eventPlayer.getSlot()]

    eventPlayer.bot_hero_pool = databot.bot_hero_pool[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Hero Pool")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_health != databot.bot_health[eventPlayer.getSlot()]

    eventPlayer.bot_health = databot.bot_health[eventPlayer.getSlot()]
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    if eventPlayer.bot_health == 0:
        eventPlayer.setMaxHealth(100)
        eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    else:
        eventPlayer.setMaxHealth(eventPlayer.bot_health)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Health")
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps != databot.bot_hps[eventPlayer.getSlot()]

    eventPlayer.bot_hps = databot.bot_hps[eventPlayer.getSlot()]
    eventPlayer.stopAllHoT()
    eventPlayer.stopAllDoT()
    if eventPlayer.bot_hps > 0:
        eventPlayer.startHoT(null, 9999, eventPlayer.bot_hps)
    elif eventPlayer.bot_hps < 0:
        eventPlayer.startDoT(null, 9999, -1 * eventPlayer.bot_hps)
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "HPS")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS Wait":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps_wait != databot.bot_hps_wait[eventPlayer.getSlot()]

    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "HPS Wait")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Speed":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_speed_type != databot.bot_speed_type[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_min != databot.bot_speed_min[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_max != databot.bot_speed_max[eventPlayer.getSlot()] or
                eventPlayer.bot_speed_target != databot.bot_speed_target[eventPlayer.getSlot()]
                )

    eventPlayer.bot_speed_type = databot.bot_speed_type[eventPlayer.getSlot()]
    eventPlayer.bot_speed_min = databot.bot_speed_min[eventPlayer.getSlot()]
    eventPlayer.bot_speed_max = databot.bot_speed_max[eventPlayer.getSlot()]
    eventPlayer.bot_speed_target = databot.bot_speed_target[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Speed")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Scale":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_scale_type != databot.bot_scale_type[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_min != databot.bot_scale_min[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_max != databot.bot_scale_max[eventPlayer.getSlot()] or
                eventPlayer.bot_scale_target != databot.bot_scale_target[eventPlayer.getSlot()]
                )

    eventPlayer.bot_scale_type = databot.bot_scale_type[eventPlayer.getSlot()]
    eventPlayer.bot_scale_min = databot.bot_scale_min[eventPlayer.getSlot()]
    eventPlayer.bot_scale_max = databot.bot_scale_max[eventPlayer.getSlot()]
    eventPlayer.bot_scale_target = databot.bot_scale_target[eventPlayer.getSlot()]

    switch eventPlayer.bot_scale_type:
        case 0: # Static
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min, true)
            break
        case 1: # Random
            eventPlayer.startScalingSize(random.uniform(eventPlayer.bot_scale_min, eventPlayer.bot_scale_max), true)
            break
        case 2: # Health
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * eventPlayer.getNormalizedHealth(), true)
            break
        case 3: #Elims
            eventPlayer.startScalingSize(max(eventPlayer.bot_scale_min, (eventPlayer.bot_scale_max) - (elims * eventPlayer.bot_scale_target)), true)
            break
        case 4: #Time
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)), true)
            break

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Scale")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Gravity":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_gravity != databot.bot_gravity[eventPlayer.getSlot()]

    eventPlayer.bot_gravity = databot.bot_gravity[eventPlayer.getSlot()]
    eventPlayer.setGravity(eventPlayer.bot_gravity)

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Gravity")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Profile":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_profile_status != databot.bot_profile_status[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_type != databot.bot_profile_type[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_min != databot.bot_profile_min[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_max != databot.bot_profile_max[eventPlayer.getSlot()] or
                eventPlayer.prof_weight != databot.prof_weight[eventPlayer.getSlot()]
                )

    # Set current_profile to -1 to prevent profile handler rules from updating current_profile
    eventPlayer.current_profile = -1
    eventPlayer.bot_profile_type = databot.bot_profile_type[eventPlayer.getSlot()]
    eventPlayer.bot_profile_min = databot.bot_profile_min[eventPlayer.getSlot()]
    eventPlayer.bot_profile_max = databot.bot_profile_max[eventPlayer.getSlot()]
    eventPlayer.bot_profile_status = databot.bot_profile_status[eventPlayer.getSlot()]
    eventPlayer.prof_weight = databot.prof_weight[eventPlayer.getSlot()]

    # Indexes 1 and 2 of loop_indexes are used to loop through and copy over the indexes of bot_profile_status that are set to true
    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_1] = 0
    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2] = 0
    while(eventPlayer.loop_indexes[1] < len(eventPlayer.bot_profile_status)):
        if eventPlayer.bot_profile_status[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_1]] == true:
                eventPlayer.profile_list[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2]] = eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_1]
                if eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2] == 0:
                    eventPlayer.profile_weights[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2]] = eventPlayer.prof_weight
                else:
                    eventPlayer.profile_weights[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2]] = eventPlayer.prof_weight + eventPlayer.profile_weights[eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2]-1]
                eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_2] += 1
        eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_1] += 1

    # Set index 3 of loop_indexes to 9999 so that if the type is set to in-order the profile handler rule will loop over to the 0th index of profile_list
    eventPlayer.loop_indexes[PLAYER_INDEXES.PROFILE_3] = 9999
    # Set current_profile to 0 so the profile handler rules can process
    eventPlayer.current_profile = 0

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Profile")

    if RULE_CONDITION:
        goto RULE_START

rule "Target Bot Listener - Bot Script Status":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_script_status != databot.bot_script_status[eventPlayer.getSlot()]

    eventPlayer.bot_script_status = databot.bot_script_status[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Script")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Horizontal Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_hori_type != databot.mvmt_hori_type[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_hori_impulse != databot.mvmt_hori_impulse[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_hori_interval != databot.mvmt_hori_interval[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_hori_type = databot.mvmt_hori_type[eventPlayer.getSlot()]
    eventPlayer.mvmt_hori_impulse = databot.mvmt_hori_impulse[eventPlayer.getSlot()]
    eventPlayer.mvmt_hori_interval = databot.mvmt_hori_interval[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Horizontal Type")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Horizontal Ratio":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_lr_ratio != databot.mvmt_lr_ratio[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_fb_ratio != databot.mvmt_fb_ratio[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_lr_ratio = databot.mvmt_lr_ratio[eventPlayer.getSlot()]
    eventPlayer.mvmt_fb_ratio = databot.mvmt_fb_ratio[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Horizontal Ratio")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Left Right Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_left_min != databot.mvmt_left_min[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_left_max != databot.mvmt_left_max[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_right_min != databot.mvmt_right_min[eventPlayer.getSlot()] or
                eventPlayer.mvmt_right_max != databot.mvmt_right_max[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_left_min = databot.mvmt_left_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_left_max = databot.mvmt_left_max[eventPlayer.getSlot()]
    eventPlayer.mvmt_right_min = databot.mvmt_right_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_right_max = databot.mvmt_right_max[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "LR Time")

    if RULE_CONDITION:
        goto RULE_START
    

rule "Target Bot Listener - Movement Forward Back Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_fwd_min != databot.mvmt_fwd_min[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_fwd_max != databot.mvmt_fwd_max[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_back_min != databot.mvmt_back_min[eventPlayer.getSlot()] or
                eventPlayer.mvmt_back_max != databot.mvmt_back_max[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_fwd_min = databot.mvmt_fwd_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_fwd_max = databot.mvmt_fwd_max[eventPlayer.getSlot()]
    eventPlayer.mvmt_back_min = databot.mvmt_back_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_back_max = databot.mvmt_back_max[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "FB Time")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Vertical Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_vert_type != databot.mvmt_vert_type[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_vert_impulse != databot.mvmt_vert_impulse[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_vert_interval != databot.mvmt_vert_interval[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_vert_type = databot.mvmt_vert_type[eventPlayer.getSlot()]
    eventPlayer.mvmt_vert_impulse = databot.mvmt_vert_impulse[eventPlayer.getSlot()]
    eventPlayer.mvmt_vert_interval = databot.mvmt_vert_interval[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Vertical Type")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Vertical Chance":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_jump_chance != databot.mvmt_jump_chance[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_jump_interval != databot.mvmt_jump_interval[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_crouch_chance != databot.mvmt_crouch_chance[eventPlayer.getSlot()] or
                eventPlayer.mvmt_crouch_interval != databot.mvmt_crouch_interval[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_jump_chance = databot.mvmt_jump_chance[eventPlayer.getSlot()]
    eventPlayer.mvmt_jump_interval = databot.mvmt_jump_interval[eventPlayer.getSlot()]
    eventPlayer.mvmt_crouch_chance = databot.mvmt_crouch_chance[eventPlayer.getSlot()]
    eventPlayer.mvmt_crouch_interval = databot.mvmt_crouch_interval[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Vertical Chance")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Jump Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_jump_min != databot.mvmt_jump_min[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_jump_max != databot.mvmt_jump_max[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_jump_min = databot.mvmt_jump_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_jump_max = databot.mvmt_jump_max[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Jump Time")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Crouch Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_crouch_min != databot.mvmt_crouch_min[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_crouch_max != databot.mvmt_crouch_max[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_uncrouch_min != databot.mvmt_uncrouch_min[eventPlayer.getSlot()] or
                eventPlayer.mvmt_uncrouch_max != databot.mvmt_uncrouch_max[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_crouch_min = databot.mvmt_crouch_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_crouch_max = databot.mvmt_crouch_max[eventPlayer.getSlot()]
    eventPlayer.mvmt_uncrouch_min = databot.mvmt_uncrouch_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_uncrouch_max = databot.mvmt_uncrouch_max[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Crouch Time")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Idle Chance":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_lr_idle_chance != databot.mvmt_lr_idle_chance[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_lr_idle_interval != databot.mvmt_lr_idle_interval[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_fb_idle_chance != databot.mvmt_fb_idle_chance[eventPlayer.getSlot()] or
                eventPlayer.mvmt_fb_idle_interval != databot.mvmt_fb_idle_interval[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_lr_idle_chance = databot.mvmt_lr_idle_chance[eventPlayer.getSlot()]
    eventPlayer.mvmt_lr_idle_interval = databot.mvmt_lr_idle_interval[eventPlayer.getSlot()]
    eventPlayer.mvmt_fb_idle_chance = databot.mvmt_fb_idle_chance[eventPlayer.getSlot()]
    eventPlayer.mvmt_fb_idle_interval = databot.mvmt_fb_idle_interval[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Idle Chance")

    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Idle Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_lr_idle_min != databot.mvmt_lr_idle_min[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_lr_idle_max != databot.mvmt_lr_idle_max[eventPlayer.getSlot()] or 
                eventPlayer.mvmt_fb_idle_min != databot.mvmt_fb_idle_min[eventPlayer.getSlot()] or
                eventPlayer.mvmt_fb_idle_max != databot.mvmt_fb_idle_max[eventPlayer.getSlot()]
                )

    eventPlayer.mvmt_lr_idle_min = databot.mvmt_lr_idle_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_lr_idle_max = databot.mvmt_lr_idle_max[eventPlayer.getSlot()]
    eventPlayer.mvmt_fb_idle_min = databot.mvmt_fb_idle_min[eventPlayer.getSlot()]
    eventPlayer.mvmt_fb_idle_max = databot.mvmt_fb_idle_max[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    smallMessage(hostPlayer, "Idle Time")

    if RULE_CONDITION:
        goto RULE_START
