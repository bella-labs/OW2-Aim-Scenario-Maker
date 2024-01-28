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
            bot_gen_slot = menu_item_var_1[menu_index]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            if active_bot_status[bot_gen_slot]:
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
            bot_gen_slot = menu_item_var_1[menu_index]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:

            if active_bot_status[bot_gen_slot]:
                destroy_target_bot()
                active_bot_status[bot_gen_slot] = false
            elif databot.bot_slot_status[bot_gen_slot]:
                create_target_bot()
                active_bot_status[bot_gen_slot] = true
            else:
                smallMessage(eventPlayer, strings_prompt[lang_type][8])
            break

    action_var = active_bot_status[bot_gen_slot]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()


def act_main_test_scenario():
    @Name "SUB: act_main_test_scenario"

    if scenario_status:
        sce_stop_scenario()
    else:
        sce_start_scenario()


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

    