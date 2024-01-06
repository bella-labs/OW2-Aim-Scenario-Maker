def act_main_open_hero_sel():
    @Name "SUB: act_main_open_hero_sel"

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()


def act_main_test_bot_in_slot():
    @Name "SUB: act_main_test_bot_in_slot"

    switch menu_action:
        # Change bot slot.
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            bot_gen_slot = menu_item_var_1[menu_index]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            if stat_tracking_status == true:
                stats_stop_stat_tracking()
            else:
                stats_start_stat_tracking()
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            if active_bot_status[bot_gen_slot] == true:
                destroy_target_bot()
                active_bot_status[bot_gen_slot] = false
            else:
                create_target_bot()
                active_bot_status[bot_gen_slot] = true
            break

    action_var = active_bot_status[bot_gen_slot]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()


def act_main_toggle_import():
    @Name "SUB: act_main_toggle_import"

    display_help[0] = not display_help[0]

    action_var = display_help[0]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    
def act_main_toggle_export():
    @Name "SUB: act_main_toggle_export"

    display_help[1] = not display_help[1]

    action_var = display_help[1]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    