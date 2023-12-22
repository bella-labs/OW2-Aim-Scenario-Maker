def act_cust_sel_bot_slot():
    @Name "SUB: act_cust_sel_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_gen_chg_var_1_num()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            smallMessage(eventPlayer, "geelo")
            for loop_index in range(0, 12, 1):
                databot.data_bot_slots[loop_index] = not databot.data_bot_slots[menu_item_var_1[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "dsdsds")
            databot.data_bot_slots[11] = true
            databot.data_bot_slots[menu_item_var_1[menu_index]] = not databot.data_bot_slots[menu_item_var_1[menu_index]]
            break
    menu_item_var_2[menu_index] = strings_options[lang_type][0][1] if databot.data_bot_slots[menu_item_var_1[menu_index]] == true else strings_options[lang_type][0][0]

    
def act_cust_copy_bot_slot():
    @Name "SUB: act_cust_copy_bot_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_gen_chg_var_1_num()
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


def subact_copy_to_bot_slot():
	@Name "SUB: subact_copy_to_bot_slot"

	databot.data_bot_slots[menu_item_var_1[menu_index]] = databot.data_bot_slots[menu_item_var_1[menu_index-1]]
	

def act_cust_open_hero_sel():
    @Name "SUB: act_cust_open_hero_sel"

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()