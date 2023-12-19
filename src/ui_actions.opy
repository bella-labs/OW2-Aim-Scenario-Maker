def perform_action():
    @Name "SUB: perform_action"

    menu_substart_value = submenu_start_index[submenu_index]
    menu_wait = 0.1

    switch submenu_index:
        case 0:
            menu_act_submenu_0()
            break
        case 1:
            menu_act_submenu_1()
            break
        case 2:
            menu_act_submenu_2()
            break
        case 3:
            menu_act_submenu_3()
            break
        case 4:
            menu_act_submenu_2_1()
            break

    wait(menu_wait)
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_submenu_0():
    @Name "SUB: menu_act_submenu_0"

    switch menu_index:
        case menu_substart_value + 0:
            menu_submenu_target = 1
            menu_index_target = 0
            menu_act_change_submenu()
            break
        case menu_substart_value + 1:
            menu_submenu_target = 2
            menu_index_target = 0
            menu_act_change_submenu()
            break
        case menu_substart_value + 2:
            menu_submenu_target = 3
            menu_index_target = 0
            menu_act_change_submenu()
            break


def menu_act_submenu_1():
    @Name "SUB: menu_act_submenu_1"

    switch menu_index:
        case menu_substart_value + 0:
            menu_submenu_target = 0
            menu_index_target = 0
            menu_act_change_submenu()
            break
        case menu_substart_value + 1:
            if menu_action != MENU_ACTIONS.MENU_NEXT_SUBITEM and menu_action != MENU_ACTIONS.MENU_SET_VECTOR:
                menu_act_change_number_var_1()
            break
        case menu_substart_value + 2:
            if menu_action != MENU_ACTIONS.MENU_NEXT_SUBITEM and menu_action != MENU_ACTIONS.MENU_SET_VECTOR:
                menu_act_change_number_var_1()
            break


def menu_act_submenu_2():
    @Name "SUB: menu_act_submenu_2"

    switch menu_index:
        case menu_substart_value + 0:
            menu_submenu_target = 0
            menu_index_target = 1
            menu_act_change_submenu()
            break
        case menu_substart_value + 3:
            menu_submenu_target = 4
            menu_index_target = 0
            menu_act_change_submenu()
            break


def menu_act_submenu_3():
    @Name "SUB: menu_act_submenu_3"

    switch menu_index:
        case menu_substart_value + 0:
            menu_submenu_target = 0
            menu_index_target = 2
            menu_act_change_submenu()
            break


def menu_act_submenu_2_1():
    @Name "SUB: menu_act_submenu_2_1"

    switch menu_index:
        case menu_substart_value + 0:
            menu_submenu_target = 2
            menu_index_target = 3
            menu_act_change_submenu()
            break


def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = menu_submenu_target
        menu_index = submenu_start_index[submenu_index] + menu_index_target


def menu_act_change_number_var_1():
    @Name "SUB: menu_act_change_number_var_1"

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