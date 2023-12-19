def menu_helper_change_num_var_1():
    @Name "SUB: menu_helper_change_num_var_1"

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
	