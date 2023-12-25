def act_bot_select_slot():
    @Name "SUB: act_bot_select_slot"

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
            action_var = not databot.bot_slots[bot_slot]
            # Loop through all slots and set the flag to the new value.
            for loop_index in range(0, 12, 1):
                databot.bot_slots[loop_index] = action_var
            break
        # Toggle current slot.
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            databot.bot_slots[bot_slot] = not databot.bot_slots[bot_slot]
            break
    # Update the enabled / disabled text.
    menu_item_var_2[menu_index] = strings_options[lang_type][0][1] if databot.bot_slots[bot_slot] == true else strings_options[lang_type][0][0]

    
def act_bot_override_slot():
    @Name "SUB: act_bot_override_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[7]] if user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[7]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_inputs[7] if user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[7]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[7] if user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[7])):
                subact_bot_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_bot_override_slot():
    @Name "SUB: subact_bot_override_slot"

    databot.bot_slots[menu_item_var_1[menu_index]] = databot.bot_slots[bot_slot]

    databot.bot_hero_pool[menu_item_var_1[menu_index]] = databot.bot_hero_pool[bot_slot]

    databot.bot_health[menu_item_var_1[menu_index]] = databot.bot_health[bot_slot]
    databot.bot_hps[menu_item_var_1[menu_index]] = databot.bot_hps[bot_slot]
    databot.bot_hps_wait[menu_item_var_1[menu_index]] = databot.bot_hps_wait[bot_slot]

    databot.bot_scale_type[menu_item_var_1[menu_index]] = databot.bot_scale_type[bot_slot]
    databot.bot_scale_min[menu_item_var_1[menu_index]] = databot.bot_scale_min[bot_slot]
    databot.bot_scale_max[menu_item_var_1[menu_index]] = databot.bot_scale_max[bot_slot]


def act_bot_hero_pool():
	@Name "SUB: act_bot_hero_pool"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_3_num()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
                new_hero_array = []
            else:
                new_hero_array = hero_array
            databot.bot_hero_pool[bot_slot] = new_hero_array
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
                new_hero_array.remove(hero_array[menu_item_var_3[menu_index]])
            else:
                if len(new_hero_array) > 0:
                    new_hero_array.append(hero_array[menu_item_var_3[menu_index]])
                else: 
                    new_hero_array[0] = hero_array[menu_item_var_3[menu_index]]
            databot.bot_hero_pool[bot_slot] = new_hero_array
            break

    menu_item_title_on[menu_index] = heroIcon(hero_array[menu_item_var_3[menu_index]])
    menu_item_var_1[menu_index] = hero_array[menu_item_var_3[menu_index]]

    if hero_array[menu_item_var_3[menu_index]] in databot.bot_hero_pool[bot_slot] == true:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][0]
        menu_item_color_on[menu_index] = Color.GREEN
    else:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][1]
        menu_item_color_on[menu_index] = Color.RED
	

def act_bot_health():
    @Name "SUB: act_bot_health"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            switch subitem_index[menu_index]:
                case 0:
                    act_general_chg_var_1_num()
                    databot.bot_health[bot_slot] = menu_item_var_1[menu_index]
                    break
                case 1:
                    act_general_chg_var_2_num()
                    databot.bot_hps[bot_slot] = menu_item_var_2[menu_index]
                    break
                case 2:
                    act_general_chg_var_3_num()
                    databot.bot_hps_wait[bot_slot] = menu_item_var_3[menu_index]
                    break

                    
def act_bot_scale():
    @Name "SUB: act_bot_scale"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            switch subitem_index[menu_index]:
                case 0:
                    databot.bot_scale_type[bot_slot] += 1
                    if databot.bot_scale_type[bot_slot] >= len(strings_options[lang_type][3]):
                        databot.bot_scale_type[bot_slot] = 0
                    menu_item_var_1[menu_index] = strings_options[lang_type][3][databot.bot_scale_type[bot_slot]]
                    break
                case 1:
                    act_general_chg_var_2_num()
                    databot.bot_scale_min[bot_slot] = menu_item_var_2[menu_index]
                    break

                case 2:
                    act_general_chg_var_3_num()
                    databot.bot_scale_max[bot_slot] = menu_item_var_3[menu_index]
                    break