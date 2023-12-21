def menu_act_sel_bot_slot():
    @Name "SUB: menu_act_sel_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            menu_helper_change_num_var_1()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            smallMessage(eventPlayer, "geelo")
            for loop_index in range(0, 11, 1):
                databot.data_bot_slots[loop_index] = not databot.data_bot_slots[menu_opt_var_1[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "dsdsds")
            databot.data_bot_slots[11] = true
            databot.data_bot_slots[menu_opt_var_1[menu_index]] = not databot.data_bot_slots[menu_opt_var_1[menu_index]]
            break
    menu_opt_var_2[menu_index] = strings_options[lang_type][0][1] if databot.data_bot_slots[menu_opt_var_1[menu_index]] == true else strings_options[lang_type][0][0]

    
def menu_act_copy_bot_slot():
    @Name "SUB: menu_act_copy_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            menu_helper_change_num_var_1()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_vector[lang_type][user_controls[8]] if user_controls[8] <= UI_INPUTS.VECT_RIGHT else buttonString(ui_controls[8]), strings_prompt[lang_type][7]))
            menu_on_opt_color[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_controls[8] if user_controls[8] <= UI_INPUTS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_controls[8]), 3)
            if (eventPlayer.getThrottle() == ui_controls[8] if user_controls[8] <= UI_INPUTS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_controls[8])):
            menu_subact_copy_to_bot_slot()
            menu_on_opt_color[menu_index] = Color.GREEN
            wait(0.25)
        
    menu_on_opt_color[menu_index] = menu_color_default_on_index


def menu_act_toggle_export():
    @Name "SUB: menu_act_toggle_export" 

    menu_opt_var_1[menu_index] = not menu_opt_var_1[menu_index] 
    if menu_opt_var_1[menu_index] == true:
        menu_off_opt_title[menu_index] = strings_dynamic_titles[lang_type][0][1]
        menu_on_opt_title[menu_index] = menu_off_opt_title[menu_index]
    else:
        menu_off_opt_title[menu_index] = strings_dynamic_titles[lang_type][0][0]
        menu_on_opt_title[menu_index] = menu_off_opt_title[menu_index]