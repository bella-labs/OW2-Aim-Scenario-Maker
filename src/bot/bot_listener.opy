rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2

    # Set Owner Player
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)
    # Set Movement Direction
    eventPlayer.target_mvmt_dir = vect(0,0,0)
    # Set Disabled Movements
    eventPlayer.disabled_hori = [0,0,0,0,0,0,0,0]
    eventPlayer.disabled_vert = [0,0]
    # Set Gravity and Speed to -1 to force listener rule trigger when set to 0
    eventPlayer.bot_speed_min = -1
    eventPlayer.bot_gravity = -1

        
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
    
    if RULE_CONDITION:
        goto RULE_START

    
rule "Target Bot Listener - Boundary":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_bound_type != databot.bot_bound_type[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_pos != databot.bot_bound_pos[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_dim != databot.bot_bound_dim[eventPlayer.getSlot()] or
                eventPlayer.bot_bound_angle != databot.bot_bound_angle[eventPlayer.getSlot()]
                )

    eventPlayer.bot_bound_type = databot.bot_bound_type[eventPlayer.getSlot()]
    eventPlayer.bot_bound_pos = databot.bot_bound_pos[eventPlayer.getSlot()]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[eventPlayer.getSlot()]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[eventPlayer.getSlot()]
    set_cube()
    wait(1)
    
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
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Hero Pool":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hero_pool != databot.bot_hero_pool[eventPlayer.getSlot()]

    eventPlayer.bot_hero_pool = databot.bot_hero_pool[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)

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
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - HPS Wait":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_hps_wait != databot.bot_hps_wait[eventPlayer.getSlot()]

    eventPlayer.bot_hps_wait = databot.bot_hps_wait[eventPlayer.getSlot()]
    # Cooldown to prevent overflow
    wait(1)
    
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
        case 0: # Random
            eventPlayer.startScalingSize(random.uniform(eventPlayer.bot_scale_min, eventPlayer.bot_scale_max), true)
            break
        case 1: # Health
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * eventPlayer.getNormalizedHealth(), true)
            break
        case 2: #Elims
            eventPlayer.startScalingSize(max(eventPlayer.bot_scale_min, (eventPlayer.bot_scale_max) - (elims * eventPlayer.bot_scale_target)), true)
            break
        case 3: #Time
            eventPlayer.startScalingSize(eventPlayer.bot_scale_min + (eventPlayer.bot_scale_max - eventPlayer.bot_scale_min) * (sin(Math.PI*(timer%eventPlayer.bot_scale_target)/eventPlayer.bot_scale_target)), true)
            break

    # Cooldown to prevent overflow
    wait(1)
    
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
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Bot Profile":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.bot_profile_weights != databot.bot_profile_weights[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_max_weight != databot.bot_profile_max_weight[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_type != databot.bot_profile_type[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_min != databot.bot_profile_min[eventPlayer.getSlot()] or
                eventPlayer.bot_profile_max != databot.bot_profile_max[eventPlayer.getSlot()]
                )

    eventPlayer.profile_index = -1
    eventPlayer.bot_profile_weights = databot.bot_profile_weights[eventPlayer.getSlot()]
    eventPlayer.bot_profile_max_weight = databot.bot_profile_max_weight[eventPlayer.getSlot()]
    eventPlayer.bot_profile_type = databot.bot_profile_type[eventPlayer.getSlot()]
    eventPlayer.bot_profile_min = databot.bot_profile_min[eventPlayer.getSlot()]
    eventPlayer.bot_profile_max = databot.bot_profile_max[eventPlayer.getSlot()]

    eventPlayer.profile_index = 0
    # Cooldown to prevent overflow
    wait(1)

    if RULE_CONDITION:
        goto RULE_START

rule "Target Bot Listener - Bot Script Status":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.bot_script_status != databot.bot_script_status[eventPlayer.getSlot()]

    eventPlayer.bot_script_status = databot.bot_script_status[eventPlayer.getSlot()]

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Horizontal Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_hori_type != databot.mvmt_hori_type or 
                eventPlayer.mvmt_hori_impulse != databot.mvmt_hori_impulse or 
                eventPlayer.mvmt_hori_interval != databot.mvmt_hori_interval
                )

    eventPlayer.mvmt_hori_type = databot.mvmt_hori_type
    eventPlayer.mvmt_hori_impulse = databot.mvmt_hori_impulse
    eventPlayer.mvmt_hori_interval = databot.mvmt_hori_interval

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Weights":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_weights != databot.mvmt_weights or 
                eventPlayer.mvmt_max_weight != databot.mvmt_max_weight
                )

    eventPlayer.mvmt_weights = databot.mvmt_weights
    eventPlayer.mvmt_max_weight = databot.mvmt_max_weight
    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_left_min != databot.mvmt_left_min or 
                eventPlayer.mvmt_left_max != databot.mvmt_left_max or 
                eventPlayer.mvmt_right_min != databot.mvmt_right_min or
                eventPlayer.mvmt_right_max != databot.mvmt_right_max or
                eventPlayer.mvmt_fwd_min != databot.mvmt_fwd_min or 
                eventPlayer.mvmt_fwd_max != databot.mvmt_fwd_max or 
                eventPlayer.mvmt_back_min != databot.mvmt_back_min or
                eventPlayer.mvmt_back_max != databot.mvmt_back_max
                )

    eventPlayer.mvmt_left_min = databot.mvmt_left_min
    eventPlayer.mvmt_left_max = databot.mvmt_left_max
    eventPlayer.mvmt_right_min = databot.mvmt_right_min
    eventPlayer.mvmt_right_max = databot.mvmt_right_max
    eventPlayer.mvmt_fwd_min = databot.mvmt_fwd_min
    eventPlayer.mvmt_fwd_max = databot.mvmt_fwd_max
    eventPlayer.mvmt_back_min = databot.mvmt_back_min
    eventPlayer.mvmt_back_max = databot.mvmt_back_max

    eventPlayer.mvmt_fl_min = (databot.mvmt_fwd_min + eventPlayer.mvmt_left_min) / 2
    eventPlayer.mvmt_fl_max = (databot.mvmt_fwd_max + eventPlayer.mvmt_left_max) / 2
    eventPlayer.mvmt_fr_min = (databot.mvmt_fwd_min + eventPlayer.mvmt_right_min) / 2
    eventPlayer.mvmt_fr_max = (databot.mvmt_fwd_max + eventPlayer.mvmt_right_max) / 2
    eventPlayer.mvmt_bl_min = (databot.mvmt_back_min + eventPlayer.mvmt_left_min) / 2
    eventPlayer.mvmt_bl_max = (databot.mvmt_back_max + eventPlayer.mvmt_left_max) / 2
    eventPlayer.mvmt_br_min = (databot.mvmt_back_min + eventPlayer.mvmt_right_min) / 2
    eventPlayer.mvmt_br_max = (databot.mvmt_back_max + eventPlayer.mvmt_right_max) / 2
    

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Vertical Type":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_vert_type != databot.mvmt_vert_type or 
                eventPlayer.mvmt_vert_impulse != databot.mvmt_vert_impulse or 
                eventPlayer.mvmt_vert_interval != databot.mvmt_vert_interval
                )

    eventPlayer.mvmt_vert_type = databot.mvmt_vert_type
    eventPlayer.mvmt_vert_impulse = databot.mvmt_vert_impulse
    eventPlayer.mvmt_vert_interval = databot.mvmt_vert_interval

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement e":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_jump_chance != databot.mvmt_jump_chance or 
                eventPlayer.mvmt_jump_interval != databot.mvmt_jump_interval or 
                eventPlayer.mvmt_jump_min != databot.mvmt_jump_min or 
                eventPlayer.mvmt_jump_max != databot.mvmt_jump_max
                )

    eventPlayer.mvmt_jump_chance = databot.mvmt_jump_chance
    eventPlayer.mvmt_jump_interval = databot.mvmt_jump_interval
    eventPlayer.mvmt_jump_min = databot.mvmt_jump_min
    eventPlayer.mvmt_jump_max = databot.mvmt_jump_max

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Crouch Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_crouch_chance != databot.mvmt_crouch_chance or
                eventPlayer.mvmt_crouch_interval != databot.mvmt_crouch_interval or
                eventPlayer.mvmt_uncrouch_min != databot.mvmt_uncrouch_min or
                eventPlayer.mvmt_uncrouch_max != databot.mvmt_uncrouch_max
                )

    eventPlayer.mvmt_crouch_chance = databot.mvmt_crouch_chance
    eventPlayer.mvmt_crouch_interval = databot.mvmt_crouch_interval
    eventPlayer.mvmt_uncrouch_min = databot.mvmt_uncrouch_min
    eventPlayer.mvmt_uncrouch_max = databot.mvmt_uncrouch_max

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Idle Chance":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_lr_idle_chance != databot.mvmt_lr_idle_chance or 
                eventPlayer.mvmt_lr_idle_interval != databot.mvmt_lr_idle_interval or 
                eventPlayer.mvmt_fb_idle_chance != databot.mvmt_fb_idle_chance or
                eventPlayer.mvmt_fb_idle_interval != databot.mvmt_fb_idle_interval
                )

    eventPlayer.mvmt_lr_idle_chance = databot.mvmt_lr_idle_chance
    eventPlayer.mvmt_lr_idle_interval = databot.mvmt_lr_idle_interval
    eventPlayer.mvmt_fb_idle_chance = databot.mvmt_fb_idle_chance
    eventPlayer.mvmt_fb_idle_interval = databot.mvmt_fb_idle_interval

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START


rule "Target Bot Listener - Movement Idle Time":
    @Event eachPlayer
    @Team 2
    @Condition  (
                eventPlayer.mvmt_lr_idle_min != databot.mvmt_lr_idle_min or 
                eventPlayer.mvmt_lr_idle_max != databot.mvmt_lr_idle_max or 
                eventPlayer.mvmt_fb_idle_min != databot.mvmt_fb_idle_min or
                eventPlayer.mvmt_fb_idle_max != databot.mvmt_fb_idle_max
                )

    eventPlayer.mvmt_lr_idle_min = databot.mvmt_lr_idle_min
    eventPlayer.mvmt_lr_idle_max = databot.mvmt_lr_idle_max
    eventPlayer.mvmt_fb_idle_min = databot.mvmt_fb_idle_min
    eventPlayer.mvmt_fb_idle_max = databot.mvmt_fb_idle_max

    # Cooldown to prevent overflow
    wait(1)
    
    if RULE_CONDITION:
        goto RULE_START
