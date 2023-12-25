def act_sub1_sel_bot_slot():
    @Name "SUB: act_sub1_sel_bot_slot"

    switch menu_action:
        # Change bot slot.
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            bot_slot = menu_item_var_1[menu_index]
            break
        # Toggle all slots.
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            # Set the action var to the opposite of the current selection boolean.
            action_var = not databot.data_bot_slots[bot_slot]
            # Loop through all slots and set the flag to the new value.
            for loop_index in range(0, 12, 1):
                databot.data_bot_slots[loop_index] = action_var
            break
        # Toggle current slot.
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            databot.data_bot_slots[bot_slot] = not databot.data_bot_slots[bot_slot]
            break
    # Update the enabled / disabled text.
    menu_item_var_2[menu_index] = strings_options[lang_type][0][1] if databot.data_bot_slots[bot_slot] == true else strings_options[lang_type][0][0]

    
def act_sub1_override_bot_slot():
    @Name "SUB: act_sub1_override_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_copy_to_bot_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def act_sub1_hero_pool():
	@Name "SUB: subact_copy_to_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_3_num()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            new_hero_array = databot.data_bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
                new_hero_array = []
            else:
                new_hero_array = hero_array
            databot.data_bot_hero_pool[bot_slot] = new_hero_array
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            new_hero_array = databot.data_bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
                new_hero_array.remove(hero_array[menu_item_var_3[menu_index]])
            else:
                if len(new_hero_array) > 0:
                    new_hero_array.append(hero_array[menu_item_var_3[menu_index]])
                else: 
                    new_hero_array[0] = hero_array[menu_item_var_3[menu_index]]
            databot.data_bot_hero_pool[bot_slot] = new_hero_array
            break

    menu_item_title_on[menu_index] = heroIcon(hero_array[menu_item_var_3[menu_index]])
    menu_item_var_1[menu_index] = hero_array[menu_item_var_3[menu_index]]

    if hero_array[menu_item_var_3[menu_index]] in databot.data_bot_hero_pool[bot_slot] == true:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][0]
        menu_item_color_on[menu_index] = Color.GREEN
    else:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][1]
        menu_item_color_on[menu_index] = Color.RED
	

