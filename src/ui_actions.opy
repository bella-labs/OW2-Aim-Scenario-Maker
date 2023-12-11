rule "Menu Actions: Input Read":
    @Event eachPlayer
    @Condition menu_visible == true
    @Condition (eventPlayer.isHoldingButton(ui_inputs[3])
            or eventPlayer.isHoldingButton(ui_inputs[4])
            or eventPlayer.isHoldingButton(ui_inputs[5])
            or eventPlayer.isHoldingButton(ui_inputs[6])
            or eventPlayer.isHoldingButton(ui_inputs[7])
            or eventPlayer.isHoldingButton(ui_inputs[8])
            or eventPlayer.isHoldingButton(ui_inputs[9]))
    
    if eventPlayer.isHoldingButton(ui_inputs[3]):
        menu_input = 0
    elif eventPlayer.isHoldingButton(ui_inputs[4]):
        menu_input = 1
    elif eventPlayer.isHoldingButton(ui_inputs[5]):
        menu_input = 2
    elif eventPlayer.isHoldingButton(ui_inputs[6]):
        menu_input = 3
    elif eventPlayer.isHoldingButton(ui_inputs[7]):
        menu_input = 4
    elif eventPlayer.isHoldingButton(ui_inputs[8]):
        menu_input = 5
    elif eventPlayer.isHoldingButton(ui_inputs[9]):
        menu_input = 6

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
        case menu_substart_value + 3:
            menu_submenu_target = 4
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


def menu_act_toggle_var_1():
    @Name "SUB: menu_act_change_number_var_1"

    switch menu_input:
        case ui_inputs[3]:
        case ui_inputs[4]:
        case ui_inputs[5]:
        case ui_inputs[6]:
            menu_opt_var_1[menu_index] = not menu_opt_var_1[menu_index]
            break

def menu_act_cycle_var_1():
    @Name "SUB: menu_act_change_number_var_1"

    switch menu_input:
        case ui_inputs[3]:
        case ui_inputs[4]:
        case ui_inputs[5]:
        case ui_inputs[6]:
            menu_opt_var_1[menu_index] = not menu_opt_var_1[menu_index]
            break


    
def menu_act_change_number_var_1():
    @Name "SUB: menu_act_change_number_var_1"

    switch menu_input:
        case ui_inputs[3]:
            menu_opt_var_1[menu_index] -= menu_opt_small_step[menu_index][0]
            break
        case ui_inputs[4]:
            menu_opt_var_1[menu_index] += menu_opt_small_step[menu_index][0]
            break
        case ui_inputs[5]:
            menu_opt_var_1[menu_index] -= menu_opt_large_step[menu_index][0]
            break
        case ui_inputs[6]:
            menu_opt_var_1[menu_index] += menu_opt_large_step[menu_index][0]
            break

    if menu_opt_var_1[menu_index] < menu_opt_range_min[menu_index][0]:
        menu_opt_var_1[menu_index] = menu_opt_range_max[menu_index][0]
    elif menu_opt_var_1[menu_index] > menu_opt_range_max[menu_index][0]:
        menu_opt_var_1[menu_index] = menu_opt_range_min[menu_index][0]


def menu_act_change_number_var_2():
    @Name "SUB: menu_act_change_number_var_2"

    switch menu_input:
        case ui_inputs[3]:
            menu_opt_var_2[menu_index] -= menu_opt_small_step[menu_index][1]
            break
        case ui_inputs[4]:
            menu_opt_var_2[menu_index] += menu_opt_small_step[menu_index][1]
            break
        case ui_inputs[5]:
            menu_opt_var_2[menu_index] -= menu_opt_large_step[menu_index][1]
            break
        case ui_inputs[6]:
            menu_opt_var_2[menu_index] += menu_opt_large_step[menu_index][1]
            break

    if menu_opt_var_2[menu_index] < menu_opt_range_min[menu_index][1]:
        menu_opt_var_2[menu_index] = menu_opt_range_max[menu_index][1]
    elif menu_opt_var_2[menu_index] > menu_opt_range_max[menu_index][1]:
        menu_opt_var_2[menu_index] = menu_opt_range_min[menu_index][1]


def menu_act_change_number_var_3():
    @Name "SUB: menu_act_change_number_var_3"

    switch menu_input:
        case ui_inputs[3]:
            menu_opt_var_3[menu_index] -= menu_opt_small_step[menu_index][2]
            break
        case ui_inputs[4]:
            menu_opt_var_3[menu_index] += menu_opt_small_step[menu_index][2]
            break
        case ui_inputs[5]:
            menu_opt_var_3[menu_index] -= menu_opt_large_step[menu_index][2]
            break
        case ui_inputs[6]:
            menu_opt_var_3[menu_index] += menu_opt_large_step[menu_index][2]
            break

    if menu_opt_var_3[menu_index] < menu_opt_range_min[menu_index][2]:
        menu_opt_var_3[menu_index] = menu_opt_range_max[menu_index][2]
    elif menu_opt_var_3[menu_index] > menu_opt_range_max[menu_index][2]:
        menu_opt_var_3[menu_index] = menu_opt_range_min[menu_index][2]


def menu_act_change_number_var_4():
    @Name "SUB: menu_act_change_number_var_4"

    switch menu_input:
        case ui_inputs[3]:
            menu_opt_var_4[menu_index] -= menu_opt_small_step[menu_index][3]
            break
        case ui_inputs[4]:
            menu_opt_var_4[menu_index] += menu_opt_small_step[menu_index][3]
            break
        case ui_inputs[5]:
            menu_opt_var_4[menu_index] -= menu_opt_large_step[menu_index][3]
            break
        case ui_inputs[6]:
            menu_opt_var_4[menu_index] += menu_opt_large_step[menu_index][3]
            break

    if menu_opt_var_3[menu_index] < menu_opt_range_min[menu_index][3]:
        menu_opt_var_3[menu_index] = menu_opt_range_max[menu_index][3]
    elif menu_opt_var_3[menu_index] > menu_opt_range_max[menu_index][3]:
        menu_opt_var_3[menu_index] = menu_opt_range_min[menu_index][3]