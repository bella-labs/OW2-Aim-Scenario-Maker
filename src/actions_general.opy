def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = chg_submenu_target
        menu_index = submenu_start_indexes[submenu_index] + chg_submenu_item_target
        

def act_general_chg_var_1_num():
    @Name "SUB: act_general_chg_var_1_num"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
            menu_item_var_1[menu_index] -= small_steps[menu_item_small_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            menu_item_var_1[menu_index] += small_steps[menu_item_small_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            menu_item_var_1[menu_index] -= large_steps[menu_item_large_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            menu_item_var_1[menu_index] += large_steps[menu_item_large_step[menu_index]]
            break

    if menu_item_var_1[menu_index] < ranges[menu_item_range[menu_index][0]][0]:
        menu_item_var_1[menu_index] = ranges[menu_item_range[menu_index][0]][1]
    elif menu_item_var_1[menu_index] > ranges[menu_item_range[menu_index][0]][1]:
        menu_item_var_1[menu_index] = ranges[menu_item_range[menu_index][0]][0]
	

def act_general_chg_var_3_num():
    @Name "SUB: act_general_chg_var_3_num"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
            menu_item_var_3[menu_index] -= small_steps[menu_item_small_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            menu_item_var_3[menu_index] += small_steps[menu_item_small_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            menu_item_var_3[menu_index] -= large_steps[menu_item_large_step[menu_index]]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            menu_item_var_3[menu_index] += large_steps[menu_item_large_step[menu_index]]
            break

    if menu_item_var_3[menu_index] < ranges[menu_item_range[menu_index][0]][0]:
        menu_item_var_3[menu_index] = ranges[menu_item_range[menu_index][0]][1]
    elif menu_item_var_3[menu_index] > ranges[menu_item_range[menu_index][0]][1]:
        menu_item_var_3[menu_index] = ranges[menu_item_range[menu_index][0]][0]

        
def act_general_toggle_var_1_bool():
    @Name "SUB: act_general_toggle_var_1_bool" 

    menu_item_var_1[menu_index] = not menu_item_var_1[menu_index] 