def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = menu_submenu_target
        menu_index = submenu_start_index[submenu_index] + menu_index_target
        

def act_gen_chg_var_1_num():
    @Name "SUB: act_gen_chg_var_1_num"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
            menu_opt_var_1[menu_index] -= small_steps[menu_opt_small_step[menu_index][0]]
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            menu_opt_var_1[menu_index] += small_steps[menu_opt_small_step[menu_index][0]]
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            menu_opt_var_1[menu_index] -= large_steps[menu_opt_large_step[menu_index][0]]
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            menu_opt_var_1[menu_index] += large_steps[menu_opt_large_step[menu_index][0]]
            break

    if menu_opt_var_1[menu_index] < ranges[menu_opt_range[menu_index][0]][0]:
        menu_opt_var_1[menu_index] = ranges[menu_opt_range[menu_index][0]][1]
    elif menu_opt_var_1[menu_index] > ranges[menu_opt_range[menu_index][0]][1]:
        menu_opt_var_1[menu_index] = ranges[menu_opt_range[menu_index][0]][0]
	

def act_gen_toggle_var_1_bool():
    @Name "SUB: act_gen_toggle_var_1_bool" 

    menu_opt_var_1[menu_index] = not menu_opt_var_1[menu_index] 