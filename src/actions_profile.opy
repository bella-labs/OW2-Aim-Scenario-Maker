def act_prof_select_prof():
    @Name "SUB: act_prof_select_prof"

    act_general_chg_var_1_num()
    profile_slot = menu_item_var_1[menu_index]


def subact_select_prof_refresh():
    @Name "SUB: subact_select_prof_refresh"


def act_bot_override_prof():
    @Name "SUB: act_bot_override_prof"

    switch menu_action:
        # Change target slot
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            break
        # Override all slots? not sure if good / needed
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        # Override target slot
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_bot_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index