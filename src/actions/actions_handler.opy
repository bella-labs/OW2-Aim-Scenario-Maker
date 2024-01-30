def perform_action():
    @Name "SUB: perform_action"

    submenu_curr_start = submenu_start_indexes[submenu_index]
    menu_wait_index = 0

    switch submenu_index:
        case SUBMENUS.SUBMENU_MAIN:
            menu_act_submenu_main()
            break
        case SUBMENUS.SUBMENU_SCENARIO:
            menu_act_submenu_scenario()
            break
        case SUBMENUS.SUBMENU_BOT:
            menu_act_submenu_bot()
            break
        case SUBMENUS.SUBMENU_PROFILE:
            menu_act_submenu_profile()
            break

    if (user_controls[10] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[10]) or (user_controls[10] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[10])):
        menu_wait_index = 2
    wait(menu_wait[menu_wait_index])
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_submenu_main():
    @Name "SUB: menu_act_submenu_main"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_SCENARIO
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            chg_submenu_target = SUBMENUS.SUBMENU_BOT
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 2:
            chg_submenu_target = SUBMENUS.SUBMENU_PROFILE
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 3:
            act_main_open_hero_sel()
            break
        case submenu_curr_start + 4:
            act_main_display_boundary()
            break
        case submenu_curr_start + 5:
            act_main_test_bot_in_slot()
            break
        case submenu_curr_start + 6:
            act_main_test_scenario()
            break
        case submenu_curr_start + 7:
            act_main_reset_score()
            break
        case submenu_curr_start + 8:
            act_main_toggle_export()
            break
        case submenu_curr_start + 9:
            act_main_toggle_import()
            break
        case submenu_curr_start + 10:
            act_main_create_export()
            break
        

def menu_act_submenu_scenario():
    @Name "SUB: menu_act_submenu_scenario"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            act_sce_player_spawn()
            break
        case submenu_curr_start + 2:
            act_sce_player_facing()
            break
        case submenu_curr_start + 3:
            act_sce_player_speed()
            break
        case submenu_curr_start + 4:
            act_sce_player_gravity()
            break
        case submenu_curr_start + 5:
            act_sce_mode()
            break
        case submenu_curr_start + 6:
            act_sce_bot_spawn()
            break
        case submenu_curr_start + 7:
            act_sce_points()
            break
        case submenu_curr_start + 8:
            act_sce_strafe()
            break
        case submenu_curr_start + 9:
            act_sce_script_status()
            break


def menu_act_submenu_bot():
    @Name "SUB: menu_act_submenu_bot"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 1
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            act_bot_select_slot()
            break
        case submenu_curr_start + 2:
            act_bot_override_slot()
            break
        case submenu_curr_start + 3:
            act_bot_spawn()
            break
        case submenu_curr_start + 4:
            act_bot_facing()
            break
        case submenu_curr_start + 5:
            act_bot_bound()
            break
        case submenu_curr_start + 6:
            act_bot_bound_dimentions()
            break
        case submenu_curr_start + 7:
            act_bot_distance()
            break
        case submenu_curr_start + 8:
            act_bot_hero_pool()
            break
        case submenu_curr_start + 9:
            act_bot_health()
            break
        case submenu_curr_start + 10:
            act_bot_speed()
            break
        case submenu_curr_start + 11:
            act_bot_scale()
            break
        case submenu_curr_start + 12:
            act_bot_gravity()
            break
        case submenu_curr_start + 13:
            act_bot_select_profile()
            break
        case submenu_curr_start + 14:
            act_bot_profile_order()
            break
        case submenu_curr_start + 15:
            act_bot_script_status()
            break


def menu_act_submenu_profile():
    @Name "SUB: menu_act_submenu_profile"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 2
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            act_mvmt_select_prof()
            break
        case submenu_curr_start + 2:
            act_mvmt_override_prof()
            break
        case submenu_curr_start + 3:
            act_mvmt_hori_type()
            break
        case submenu_curr_start + 4:
            act_mvmt_left()
            break
        case submenu_curr_start + 5:
            act_mvmt_right()
            break
        case submenu_curr_start + 6:
            act_mvmt_forward()
            break
        case submenu_curr_start + 7:
            act_mvmt_backward()
            break
        case submenu_curr_start + 8:
            act_mvmt_vert_type()
            break
        case submenu_curr_start + 9:
            act_mvmt_jump()
            break
        case submenu_curr_start + 10:
            act_mvmt_crouch()
            break
        case submenu_curr_start + 11:
            act_mvmt_lr_idle()
            break   
        case submenu_curr_start + 12:
            act_mvmt_fb_idle()
            break                                                                       
