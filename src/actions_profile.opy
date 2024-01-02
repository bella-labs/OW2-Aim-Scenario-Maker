def act_prof_select_prof():
    @Name "SUB: act_prof_select_prof"

    act_general_num_var_1()
    profile_slot = menu_item_var_1[menu_index]
    smallMessage(hostPlayer, "HI")
    subact_select_prof_refresh()


def subact_select_prof_refresh():
    @Name "SUB: subact_select_prof_refresh"

    # Weight
    refresh_index = menu_index + 2
    menu_item_var_1[refresh_index] = databot.prof_weight[profile_slot]


def act_prof_override_prof():
    @Name "SUB: act_prof_override_prof"

    switch menu_action:
        # Change target slot
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            break
        # Override all slots? not sure if good / needed
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        # Override target slot
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_prof_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_prof_override_slot():
    @Name "SUB: subact_prof_override_slot"

    action_var = menu_item_var_1[menu_index]

    databot.prof_weight[action_var] = databot.prof_weight[profile_slot]


def act_prof_change_weight():
    @Name "SUB: act_prof_change_weight"

    act_general_num_var_1()
    databot.prof_weight[profile_slot] = menu_item_var_1[menu_index]