rule "Databot Populate Settings":
    @Event eachPlayer
    @Team 1
    @Slot 1
    @Condition eventPlayer.isDummy() 
    @Condition eventPlayer.hasSpawned() 

    data_loaded[DATA_TYPE.BOT] = false
    waitUntil(data_loaded[DATA_TYPE.CONTROLS] == true, 9999)
    
    eventPlayer.import_status = false
    import_settings()
    if eventPlayer.import_status == false:
        default_settings()
    for loop_index in range(0, 12):


    data_loaded[DATA_TYPE.BOT] = true
        

def setup_databot():
    @Name "SUB: setup_databot"

    bot_gen_hero = Hero.ECHO
    bot_gen_team = Team.1
    bot_gen_slot = 1
    bot_gen_position = vect(0,9999,0)
    bot_gen_facing = vect(0,0,0)
    createDummy(bot_gen_hero, bot_gen_team, bot_gen_slot, bot_gen_position, bot_gen_facing)

    databot = getPlayersInSlot(bot_gen_slot,bot_gen_team)
    databot.setGravity(0)
    databot.startForcingName(strings_misc[lang_type][0])
    databot.setStatusEffect(null, Status.PHASED_OUT, 9999)

    #eventPlayer.setInvisibility(Invis.ALL)
    #eventPlayer.startFacing(directionTowards( eventPlayer.getEyePosition(), (getPlayersInSlot(eventPlayer.getSlot() - 6, Team.1)).getEyePosition()), default_turn_rate, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #eventPlayer.attachTo(getPlayersInSlot(eventPlayer.getSlot() - 6, Team.1), vect(0, 0, -2))


def default_settings():
    @Name "SUB: default_settings"
    
    eventPlayer.title = "Aim Scenario"
    eventPlayer.author = getPlayersInSlot(0, Team.1)

    eventPlayer.import_status = true
    
    eventPlayer.sce_player_spawn = vect(15,0,0)
    eventPlayer.sce_player_facing = vect(-1,0,0)
    eventPlayer.sce_player_speed = 100
    eventPlayer.sce_player_gravity = 100
    eventPlayer.sce_game_mode = 0
    eventPlayer.sce_game_limit = 60
    eventPlayer.sce_bs_points = 0
    eventPlayer.sce_hs_points = 0
    eventPlayer.sce_elim_points = 0
    eventPlayer.sce_strafe_pps = 0
    eventPlayer.sce_strafe_min = 0
    eventPlayer.sce_strafe_max = 0
    eventPlayer.sce_custom_status = false

    for loop_index in range(0, 12):
        
        eventPlayer.bot_slot_status[loop_index] = false

        eventPlayer.bot_spawn_type[loop_index] = 0
        eventPlayer.bot_spawn_vect[loop_index] = vect(0,0,0)

        eventPlayer.bot_facing_type[loop_index] = 0
        eventPlayer.bot_facing_vect[loop_index] = vect(1,0,0)

        eventPlayer.bot_bound_type[loop_index] = 0
        eventPlayer.bot_bound_pos[loop_index] = vect(0,10,0)

        eventPlayer.bot_bound_angle[loop_index] = 0
        eventPlayer.bot_bound_dim[loop_index] = vect(10,10,10)

        eventPlayer.bot_dist_min[loop_index] = 0
        eventPlayer.bot_dist_max[loop_index] = 50

        eventPlayer.bot_hero_pool[loop_index] = [Hero.TRACER]

        eventPlayer.bot_health[loop_index] = 100
        eventPlayer.bot_hps[loop_index] = 0
        eventPlayer.bot_hps_wait[loop_index] = 0
        
        eventPlayer.bot_speed_type[loop_index] = 0
        eventPlayer.bot_speed_min[loop_index] = 100
        eventPlayer.bot_speed_max[loop_index] = 100
        eventPlayer.bot_speed_target[loop_index] = 0

        eventPlayer.bot_scale_type[loop_index] = 0
        eventPlayer.bot_scale_min[loop_index] = 1
        eventPlayer.bot_scale_max[loop_index] = 1
        eventPlayer.bot_scale_target[loop_index] = 0

        eventPlayer.bot_gravity[loop_index] = 100

        eventPlayer.bot_profile_weights[loop_index] = [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
        eventPlayer.bot_profile_max_weight[loop_index] = 1

        eventPlayer.bot_profile_type[loop_index] = 0
        eventPlayer.bot_profile_min[loop_index] = 0
        eventPlayer.bot_profile_max[loop_index] = 0

        eventPlayer.bot_script_status[loop_index] = false

    eventPlayer.bot_slot_status[0] = true
    
    for loop_index in range(0, 12):

        eventPlayer.mvmt_hori_type[loop_index] = 0
        eventPlayer.mvmt_hori_impulse[loop_index] = 0
        eventPlayer.mvmt_hori_interval[loop_index] = 0

        eventPlayer.mvmt_weights[loop_index] = [1, 2, 3, 4, 5, 6, 7, 8]
        eventPlayer.mvmt_max_weight[loop_index] = 8

        eventPlayer.mvmt_left_min[loop_index] = 0
        eventPlayer.mvmt_left_max[loop_index] = 0
        eventPlayer.mvmt_right_min[loop_index] = 0
        eventPlayer.mvmt_right_max[loop_index] = 0

        eventPlayer.mvmt_fwd_min[loop_index] = 0
        eventPlayer.mvmt_fwd_max[loop_index] = 0
        eventPlayer.mvmt_back_min[loop_index] = 0
        eventPlayer.mvmt_back_max[loop_index] = 0

        eventPlayer.mvmt_vert_type[loop_index] = 0
        eventPlayer.mvmt_vert_impulse[loop_index] = 0
        eventPlayer.mvmt_vert_interval[loop_index] = 0

        eventPlayer.mvmt_jump_chance[loop_index] = 0
        eventPlayer.mvmt_jump_interval[loop_index] = 0
        eventPlayer.mvmt_jump_min[loop_index] = 0
        eventPlayer.mvmt_jump_max[loop_index] = 0

        eventPlayer.mvmt_crouch_chance[loop_index] = 0
        eventPlayer.mvmt_crouch_interval[loop_index] = 0
        eventPlayer.mvmt_uncrouch_min[loop_index] = 0
        eventPlayer.mvmt_uncrouch_max[loop_index] = 0

        eventPlayer.mvmt_lr_idle_chance[loop_index] = 0
        eventPlayer.mvmt_lr_idle_interval[loop_index] = 0
        eventPlayer.mvmt_lr_idle_min[loop_index] = 0
        eventPlayer.mvmt_lr_idle_max[loop_index] = 0

        eventPlayer.mvmt_fb_idle_chance[loop_index] = 0
        eventPlayer.mvmt_fb_idle_interval[loop_index] = 0
        eventPlayer.mvmt_fb_idle_min[loop_index] = 0
        eventPlayer.mvmt_fb_idle_max[loop_index] = 0


