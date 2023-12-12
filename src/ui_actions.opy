rule "Menu Actions: Input Read":
    
    @Event eachPlayer
    @Condition menu_visible == true
    @Condition (controller_mode == true and (eventPlayer.isHoldingButton(ui_inputs[3]) or eventPlayer.isHoldingButton(ui_inputs[4]))
            or (controller_mode == false and (eventPlayer.getThrottle() == ui_inputs[3] or eventPlayer.getThrottle() == ui_inputs[4]))
            or eventPlayer.isHoldingButton(ui_inputs[5])
            or eventPlayer.isHoldingButton(ui_inputs[6])
            or eventPlayer.isHoldingButton(ui_inputs[7])
            or eventPlayer.isHoldingButton(ui_inputs[8]))
    
    if (controller_mode == true and (eventPlayer.isHoldingButton(ui_inputs[3]))) or (controller_mode == false and (eventPlayer.getThrottle() == ui_inputs[3])):
        menu_input = MENU_INPUTS.MENU_SMALL_LEFT
    elif (controller_mode == true and (eventPlayer.isHoldingButton(ui_inputs[4]))) or (controller_mode == false and (eventPlayer.getThrottle() == ui_inputs[4])):
        menu_input = MENU_INPUTS.MENU_SMALL_RIGHT
    elif eventPlayer.isHoldingButton(ui_inputs[5]):
        menu_input = MENU_INPUTS.MENU_LARGE_LEFT
    elif eventPlayer.isHoldingButton(ui_inputs[6]):
        menu_input = MENU_INPUTS.MENU_LARGE_RIGHT
    elif eventPlayer.isHoldingButton(ui_inputs[7]):
        menu_input = MENU_INPUTS.MENU_NEXT_SUBITEM
    elif eventPlayer.isHoldingButton(ui_inputs[8]):
        menu_input = MENU_INPUTS.MENU_SET_VECTOR

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
            if menu_input != MENU_INPUTS.MENU_NEXT_SUBITEM and menu_input != MENU_INPUTS.MENU_SET_VECTOR:
                menu_act_change_number_var_1()
            break
        case menu_substart_value + 2:
            if menu_input != MENU_INPUTS.MENU_NEXT_SUBITEM and menu_input != MENU_INPUTS.MENU_SET_VECTOR:
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

    switch menu_input:
        case MENU_INPUTS.MENU_SMALL_LEFT:
            menu_opt_var_1[menu_index] -= small_steps[menu_opt_small_step[menu_index][0]]
            break
        case MENU_INPUTS.MENU_SMALL_RIGHT:
            menu_opt_var_1[menu_index] += small_steps[menu_opt_small_step[menu_index][0]]
            break
        case MENU_INPUTS.MENU_LARGE_LEFT:
            menu_opt_var_1[menu_index] -= large_steps[menu_opt_large_step[menu_index][0]]
            break
        case MENU_INPUTS.MENU_LARGE_RIGHT:
            menu_opt_var_1[menu_index] += large_steps[menu_opt_large_step[menu_index][0]]
            break

    if menu_opt_var_1[menu_index] < ranges[menu_opt_range[menu_index][0]][0]:
        menu_opt_var_1[menu_index] = ranges[menu_opt_range[menu_index][0]][1]
    elif menu_opt_var_1[menu_index] > ranges[menu_opt_range[menu_index][0]][1]:
        menu_opt_var_1[menu_index] = ranges[menu_opt_range[menu_index][0]][0]