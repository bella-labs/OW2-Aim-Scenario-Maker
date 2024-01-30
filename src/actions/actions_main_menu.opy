def act_main_open_hero_sel():
    @Name "SUB: act_main_open_hero_sel"

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()
    menu_visible = false


def act_main_display_boundary():
    @Name "SUB: act_main_display_boundary"

    display_boundary = not display_boundary

    action_var = display_boundary
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()


def act_main_test_bot_in_slot():
    @Name "SUB: act_main_test_bot_in_slot"

    switch menu_action:
        # Change bot slot.
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            test_bot_index = menu_item_var_1[menu_index]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            if active_bot_status[test_bot_index]:
                for bot_gen_slot in range(0, 12):
                    destroy_target_bot()
                    active_bot_status[bot_gen_slot] = false
            else:
                for bot_gen_slot in range(0, 12):
                    if databot.bot_slot_status[bot_gen_slot]:
                        create_target_bot()
                        active_bot_status[bot_gen_slot] = true
                    else:
                        destroy_target_bot()
                        active_bot_status[bot_gen_slot] = false
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:

            bot_gen_slot = test_bot_index
            if active_bot_status[bot_gen_slot]:
                destroy_target_bot()
                active_bot_status[bot_gen_slot] = false
            elif databot.bot_slot_status[bot_gen_slot]:
                create_target_bot()
                active_bot_status[bot_gen_slot] = true
            else:
                smallMessage(eventPlayer, strings_prompt[lang_type][8])
            break

    action_var = active_bot_status[test_bot_index]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()


def act_main_test_scenario():
    @Name "SUB: act_main_test_scenario"

    if scenario_status:
        sce_stop_scenario()
    else:
        sce_start_scenario()


def act_main_reset_score():
    @Name "SUB: act_main_reset_score"

    eventPlayer.last_score = 0
    eventPlayer.high_score = 0


def act_main_toggle_export():
    @Name "SUB: act_main_toggle_export"

    display_help[0] = not display_help[0]

    action_var = display_help[0]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    
def act_main_toggle_import():
    @Name "SUB: act_main_toggle_import"

    display_help[1] = not display_help[1]

    action_var = display_help[1]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    
def act_main_create_export():
    @Name "SUB: act_main_create_export"

    createDummy(Hero.WINSTON, Team.1, 2, vect(0,9999,0), vect(0,0,0))

    databuilder[0] = databot.sce_player_spawn
    databuilder[1] = databot.sce_player_facing
    databuilder[2] = databot.sce_player_speed
    databuilder[3] = databot.sce_player_gravity
    databuilder[4] = databot.sce_game_mode
    databuilder[5] = databot.sce_game_limit
    databuilder[6] = databot.sce_spawn_order
    databuilder[7] = databot.sce_respawn_min
    databuilder[8] = databot.sce_respawn_max
    databuilder[9] = databot.sce_bs_points
    databuilder[10] = databot.sce_hs_points
    databuilder[11] = databot.sce_elim_points
    databuilder[12] = databot.sce_strafe_pps
    databuilder[13] = databot.sce_strafe_min
    databuilder[14] = databot.sce_strafe_max
    databuilder[15] = databot.sce_custom_status
    databuilder[16] = databot.bot_slot_status
    databuilder[17] = databot.bot_spawn_type
    databuilder[18] = databot.bot_spawn_vect
    databuilder[19] = databot.bot_facing_type
    databuilder[20] = databot.bot_facing_vect
    databuilder[21] = databot.bot_bound_type
    databuilder[22] = databot.bot_bound_pos
    databuilder[23] = databot.bot_bound_angle
    databuilder[24] = databot.bot_bound_dim
    databuilder[25] = databot.bot_dist_min
    databuilder[26] = databot.bot_dist_max
    databuilder[27] = databot.bot_hero_pool
    databuilder[28] = databot.bot_health
    databuilder[29] = databot.bot_hps
    databuilder[30] = databot.bot_hps_wait
    databuilder[31] = databot.bot_speed_type
    databuilder[32] = databot.bot_speed_min
    databuilder[33] = databot.bot_speed_max
    databuilder[34] = databot.bot_speed_target
    databuilder[35] = databot.bot_scale_type
    databuilder[36] = databot.bot_scale_min
    databuilder[37] = databot.bot_scale_max
    databuilder[38] = databot.bot_scale_target
    databuilder[39] = databot.bot_gravity
    databuilder[40] = databot.bot_profile_weights
    databuilder[41] = databot.bot_profile_max_weight
    databuilder[42] = databot.bot_profile_type
    databuilder[43] = databot.bot_profile_min
    databuilder[44] = databot.bot_profile_max
    databuilder[45] = databot.mvmt_hori_type
    databuilder[46] = databot.mvmt_hori_impulse
    databuilder[47] = databot.mvmt_hori_interval
    databuilder[48] = databot.mvmt_weights
    databuilder[49] = databot.mvmt_max_weight
    databuilder[50] = databot.mvmt_left_min
    databuilder[51] = databot.mvmt_left_max
    databuilder[52] = databot.mvmt_right_min
    databuilder[53] = databot.mvmt_right_max
    databuilder[54] = databot.mvmt_fwd_min
    databuilder[55] = databot.mvmt_fwd_max
    databuilder[56] = databot.mvmt_back_min
    databuilder[57] = databot.mvmt_back_max
    databuilder[58] = databot.mvmt_vert_type
    databuilder[59] = databot.mvmt_vert_impulse
    databuilder[60] = databot.mvmt_vert_interval
    databuilder[61] = databot.mvmt_jump_chance
    databuilder[62] = databot.mvmt_jump_interval
    databuilder[63] = databot.mvmt_jump_min
    databuilder[64] = databot.mvmt_jump_max
    databuilder[65] = databot.mvmt_crouch_chance
    databuilder[66] = databot.mvmt_crouch_interval
    databuilder[67] = databot.mvmt_uncrouch_min
    databuilder[68] = databot.mvmt_uncrouch_max
    databuilder[69] = databot.mvmt_lr_idle_chance
    databuilder[70] = databot.mvmt_lr_idle_interval
    databuilder[71] = databot.mvmt_lr_idle_min
    databuilder[72] = databot.mvmt_lr_idle_max
    databuilder[73] = databot.mvmt_fb_idle_chance
    databuilder[74] = databot.mvmt_fb_idle_interval
    databuilder[75] = databot.mvmt_fb_idle_min
    databuilder[76] = databot.mvmt_fb_idle_max

    getPlayersInSlot(2,Team.1).export_data[0] = databuilder
    wait(1)
    destroyDummy(Team.1, 2)
    smallMessage(hostPlayer, "    Export Data Loaded")