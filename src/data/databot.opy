rule "Databot Populate Settings":
    @Event eachPlayer
    @Team 1
    @Slot 1
    @Condition eventPlayer.isDummy() 
    @Condition eventPlayer.hasSpawned() 

    data_loaded[DATA_TYPE.BOT] = false
    waitUntil(data_loaded[DATA_TYPE.CONTROLS] == true, 9999)
    
    databot.export_data[0] = null
    import_settings()
    if databot.export_data[0] == null:
        default_settings()
    else:
        unload_settings()
        databot.export_data[0] = null
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
    databot.startForcingName(strings_misc[lang_type][0])
    databot.setGravity(0)
    databot.setStatusEffect(null, Status.PHASED_OUT, 9999)


def default_settings():
    @Name "SUB: default_settings"
    
    databot.sce_player_spawn = vect(15,0,0)
    databot.sce_player_facing = vect(-1,0,0)
    databot.sce_player_speed = 100
    databot.sce_player_gravity = 100
    databot.sce_game_mode = 0
    databot.sce_game_limit = 60
    databot.sce_spawn_order = 0
    databot.sce_respawn_min = 0
    databot.sce_respawn_max = 0
    databot.sce_bs_points = 0
    databot.sce_hs_points = 0
    databot.sce_elim_points = 10
    databot.sce_strafe_pps = 0
    databot.sce_strafe_min = 0
    databot.sce_strafe_max = 0
    databot.sce_custom_status = false


    for loop_index in range(0, 12):
        
        databot.bot_slot_status[loop_index] = false

        databot.bot_spawn_type[loop_index] = 0
        databot.bot_spawn_vect[loop_index] = vect(0,0,0)

        databot.bot_facing_type[loop_index] = 0
        databot.bot_facing_vect[loop_index] = vect(1,0,0)

        databot.bot_bound_type[loop_index] = 0
        databot.bot_bound_pos[loop_index] = vect(0,10,0)

        databot.bot_bound_angle[loop_index] = 0
        databot.bot_bound_dim[loop_index] = vect(10,10,10)

        databot.bot_dist_min[loop_index] = 0
        databot.bot_dist_max[loop_index] = 50

        databot.bot_hero_pool[loop_index] = [Hero.TRACER]

        databot.bot_health[loop_index] = 100
        databot.bot_hps[loop_index] = 0
        databot.bot_hps_wait[loop_index] = 0
        
        databot.bot_speed_type[loop_index] = 0
        databot.bot_speed_min[loop_index] = 100
        databot.bot_speed_max[loop_index] = 100
        databot.bot_speed_target[loop_index] = 0

        databot.bot_scale_type[loop_index] = 0
        databot.bot_scale_min[loop_index] = 1
        databot.bot_scale_max[loop_index] = 1
        databot.bot_scale_target[loop_index] = 0

        databot.bot_gravity[loop_index] = 100

        databot.bot_profile_weights[loop_index] = [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
        databot.bot_profile_max_weight[loop_index] = 1

        databot.bot_profile_type[loop_index] = 0
        databot.bot_profile_min[loop_index] = 0
        databot.bot_profile_max[loop_index] = 0

        databot.bot_script_status[loop_index] = false

    databot.bot_slot_status[0] = true
    
    for loop_index in range(0, 12):

        databot.mvmt_hori_type[loop_index] = 0
        databot.mvmt_hori_impulse[loop_index] = 0
        databot.mvmt_hori_interval[loop_index] = 0

        databot.mvmt_weights[loop_index] = [1, 2, 3, 4, 5, 6, 7, 8]
        databot.mvmt_max_weight[loop_index] = 8

        databot.mvmt_left_min[loop_index] = 0
        databot.mvmt_left_max[loop_index] = 0
        databot.mvmt_right_min[loop_index] = 0
        databot.mvmt_right_max[loop_index] = 0

        databot.mvmt_fwd_min[loop_index] = 0
        databot.mvmt_fwd_max[loop_index] = 0
        databot.mvmt_back_min[loop_index] = 0
        databot.mvmt_back_max[loop_index] = 0

        databot.mvmt_vert_type[loop_index] = 0
        databot.mvmt_vert_impulse[loop_index] = 0
        databot.mvmt_vert_interval[loop_index] = 0

        databot.mvmt_jump_chance[loop_index] = 0
        databot.mvmt_jump_interval[loop_index] = 0
        databot.mvmt_jump_min[loop_index] = 0
        databot.mvmt_jump_max[loop_index] = 0

        databot.mvmt_crouch_chance[loop_index] = 0
        databot.mvmt_crouch_interval[loop_index] = 0
        databot.mvmt_uncrouch_min[loop_index] = 0
        databot.mvmt_uncrouch_max[loop_index] = 0

        databot.mvmt_lr_idle_chance[loop_index] = 0
        databot.mvmt_lr_idle_interval[loop_index] = 0
        databot.mvmt_lr_idle_min[loop_index] = 0
        databot.mvmt_lr_idle_max[loop_index] = 0

        databot.mvmt_fb_idle_chance[loop_index] = 0
        databot.mvmt_fb_idle_interval[loop_index] = 0
        databot.mvmt_fb_idle_min[loop_index] = 0
        databot.mvmt_fb_idle_max[loop_index] = 0


def unload_settings():
    @Name "SUB: unload_settings"

    databuilder = databot.export_data[0]

    databot.sce_player_spawn =       databuilder[0]
    databot.sce_player_facing =      databuilder[1]
    databot.sce_player_speed =       databuilder[2]
    databot.sce_player_gravity =     databuilder[3]
    databot.sce_game_mode =          databuilder[4]
    databot.sce_game_limit =         databuilder[5]
    databot.sce_respawn_min =        databuilder[6]
    databot.sce_respawn_max =        databuilder[7]
    databot.sce_spawn_order =        databuilder[8]
    databot.sce_bs_points =          databuilder[9]
    databot.sce_hs_points =          databuilder[10]
    databot.sce_elim_points =        databuilder[11]
    databot.sce_strafe_pps =         databuilder[12]
    databot.sce_strafe_min =         databuilder[13]
    databot.sce_strafe_max =         databuilder[14]
    databot.sce_custom_status =      databuilder[15]
    databot.bot_slot_status =        databuilder[16]
    databot.bot_spawn_type =         databuilder[17]
    databot.bot_spawn_vect =         databuilder[18]
    databot.bot_facing_type =        databuilder[19]
    databot.bot_facing_vect =        databuilder[20]
    databot.bot_bound_type =         databuilder[21]
    databot.bot_bound_pos =          databuilder[22]
    databot.bot_bound_angle =        databuilder[23]
    databot.bot_bound_dim =          databuilder[24]
    databot.bot_dist_min =           databuilder[25]
    databot.bot_dist_max =           databuilder[26]
    databot.bot_hero_pool =          databuilder[27]
    databot.bot_health =             databuilder[28]
    databot.bot_hps =                databuilder[29]
    databot.bot_hps_wait =           databuilder[30]
    databot.bot_speed_type =         databuilder[31]
    databot.bot_speed_min =          databuilder[32]
    databot.bot_speed_max =          databuilder[33]
    databot.bot_speed_target =       databuilder[34]
    databot.bot_scale_type =         databuilder[35]
    databot.bot_scale_min =          databuilder[36]
    databot.bot_scale_max =          databuilder[37]
    databot.bot_scale_target =       databuilder[38]
    databot.bot_gravity =            databuilder[39]
    databot.bot_profile_weights =    databuilder[40]
    databot.bot_profile_max_weight = databuilder[41]
    databot.bot_profile_type =       databuilder[42]
    databot.bot_profile_min =        databuilder[43]
    databot.bot_profile_max =        databuilder[44]
    databot.mvmt_hori_type =         databuilder[45]
    databot.mvmt_hori_impulse =      databuilder[46]
    databot.mvmt_hori_interval =     databuilder[47]
    databot.mvmt_weights =           databuilder[48]
    databot.mvmt_max_weight =        databuilder[49]
    databot.mvmt_left_min =          databuilder[50]
    databot.mvmt_left_max =          databuilder[51]
    databot.mvmt_right_min =         databuilder[52]
    databot.mvmt_right_max =         databuilder[53]
    databot.mvmt_fwd_min =           databuilder[54]
    databot.mvmt_fwd_max =           databuilder[55]
    databot.mvmt_back_min =          databuilder[56]
    databot.mvmt_back_max =          databuilder[57]
    databot.mvmt_vert_type =         databuilder[58]
    databot.mvmt_vert_impulse =      databuilder[59]
    databot.mvmt_vert_interval =     databuilder[60]
    databot.mvmt_jump_chance =       databuilder[61]
    databot.mvmt_jump_interval =     databuilder[62]
    databot.mvmt_jump_min =          databuilder[63]
    databot.mvmt_jump_max =          databuilder[64]
    databot.mvmt_crouch_chance =     databuilder[65]
    databot.mvmt_crouch_interval =   databuilder[66]
    databot.mvmt_uncrouch_min =      databuilder[67]
    databot.mvmt_uncrouch_max =      databuilder[68]
    databot.mvmt_lr_idle_chance =    databuilder[69]
    databot.mvmt_lr_idle_interval =  databuilder[70]
    databot.mvmt_lr_idle_min =       databuilder[71]
    databot.mvmt_lr_idle_max =       databuilder[72]
    databot.mvmt_fb_idle_chance =    databuilder[73]
    databot.mvmt_fb_idle_interval =  databuilder[74]
    databot.mvmt_fb_idle_min =       databuilder[75]
    databot.mvmt_fb_idle_max =       databuilder[76]

    databuilder = null
