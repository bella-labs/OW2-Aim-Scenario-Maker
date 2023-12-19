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
            menu_act_sel_bot_slot()
            break
        case menu_substart_value + 2:
            menu_act_copy_bot_slot()
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
        