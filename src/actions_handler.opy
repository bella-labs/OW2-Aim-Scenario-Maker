def perform_action():
    @Name "SUB: perform_action"

    submenu_curr_start = submenu_start_indexes[submenu_index]
    menu_wait = 0.1

    switch submenu_index:
        case SUBMENUS.SUBMENU_MAIN:
            menu_act_submenu_main()
            break
        case SUBMENUS.SUBMENU_SCENARIO:
            menu_act_submenu_scenario()
            break
        case SUBMENUS.SUBMENU_BOT:
            menu_act_submenu_bot()
            break
        case SUBMENUS.SUBMENU_PROFILE:
            menu_act_submenu_profile()
            break
        case SUBMENUS.SUBMENU_MOVEMENT:
            menu_act_submenu_movement()
            break

    wait(menu_wait)
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_submenu_main():
    @Name "SUB: menu_act_submenu_main"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_SCENARIO
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            chg_submenu_target = SUBMENUS.SUBMENU_BOT
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 2:
            chg_submenu_target = SUBMENUS.SUBMENU_PROFILE
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break
        case submenu_curr_start + 3:
            act_sub0_open_hero_sel()
            break
        case submenu_curr_start + 4:
            break
        case submenu_curr_start + 5:
            break
        case submenu_curr_start + 6:
        case submenu_curr_start + 7:
            act_general_toggle_var_1_bool()
            break
        

def menu_act_submenu_scenario():
    @Name "SUB: menu_act_submenu_scenario"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break


def menu_act_submenu_bot():
    @Name "SUB: menu_act_submenu_bot"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 1
            menu_act_change_submenu()
            break
        case submenu_curr_start + 1:
            act_bot_select_slot()
            break
        case submenu_curr_start + 2:
            act_bot_ovverride_slot()
            break
        case submenu_curr_start + 3:
            act_sub1_hero_pool()
            break


def menu_act_submenu_profile():
    @Name "SUB: menu_act_submenu_profile"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_MAIN
            chg_submenu_item_target = 2
            menu_act_change_submenu()
            break
        case submenu_curr_start + 3:
            chg_submenu_target = SUBMENUS.SUBMENU_MOVEMENT
            chg_submenu_item_target = 0
            menu_act_change_submenu()
            break


def menu_act_submenu_movement():
    @Name "SUB: menu_act_submenu_movement"

    switch menu_index:
        case submenu_curr_start + 0:
            chg_submenu_target = SUBMENUS.SUBMENU_PROFILE
            chg_submenu_item_target = 3
            menu_act_change_submenu()
            break
