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

    if submenu_index == 0:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 1
            menu_index_target = 0
            menu_act_change_submenu()
        elif menu_index == 1 + menu_substart_value:
            menu_submenu_target = 2
            menu_index_target = 0
            menu_act_change_submenu()
        elif menu_index == 2 + menu_substart_value:
            menu_submenu_target = 3
            menu_index_target = 0
            menu_act_change_submenu()
        elif menu_index == 3 + menu_substart_value:
            menu_submenu_target = 4
            menu_index_target = 0
            menu_act_change_submenu()
    elif submenu_index == 1:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_index_target = 0
            menu_act_change_submenu()
    elif submenu_index == 2:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_index_target = 1
            menu_act_change_submenu()
        elif menu_index == 3 + menu_substart_value:
            menu_submenu_target = 5
            menu_index_target = 0
            menu_act_change_submenu()
        elif menu_index == 4 + menu_substart_value:
            menu_submenu_target = 6
            menu_index_target = 0
            menu_act_change_submenu()
        elif menu_index == 5 + menu_substart_value:
            menu_submenu_target = 7
            menu_index_target = 0
            menu_act_change_submenu()
    elif submenu_index == 3:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_index_target = 2
            menu_act_change_submenu()
    elif submenu_index == 4:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_index_target = 3
            menu_act_change_submenu()
    elif submenu_index == 5:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 2
            menu_index_target = 3
            menu_act_change_submenu()
    elif submenu_index == 6:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 2
            menu_index_target = 4
            menu_act_change_submenu()
    elif submenu_index == 7:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 2
            menu_index_target = 5
            menu_act_change_submenu()

    wait(menu_wait)
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = menu_submenu_target
        menu_index = submenu_start_index[submenu_index] + menu_index_target