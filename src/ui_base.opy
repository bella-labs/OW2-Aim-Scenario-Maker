rule "Menu Input Listener: Toggle Menu":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition data_loaded[2] == true
    @Condition (user_controls[0] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[0]) or (user_controls[0] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[0]))

    wait(ui_delay, Wait.ABORT_WHEN_FALSE)
    if menu_visible == true:
        menu_visible = false
    else:
        menu_visible = true


rule "Menu Input Listener: Menu Up": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[1] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[1]) or (user_controls[1] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[1]))

    menu_up_check()
    while menu_item_hidden[menu_index] == true:
        menu_up_check()

    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Menu Input Listener: Menu Down":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[2] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[2]) or (user_controls[2] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[2]))

    menu_down_check()
    while menu_item_hidden[menu_index] == true:
        menu_down_check()

    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Menu Input Listener: Step Left": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[3] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[3]) or (user_controls[3] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[3]))

    menu_action = MENU_ACTIONS.MENU_STEP_LEFT
    perform_action()


rule "Menu Input Listener: Step Right": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[4] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[4]) or (user_controls[4] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[4]))

    menu_action = MENU_ACTIONS.MENU_STEP_RIGHT
    perform_action()


rule "Menu Input Listener: Jump Left": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[5] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[5]) or (user_controls[5] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[5]))

    menu_action = MENU_ACTIONS.MENU_JUMP_LEFT
    perform_action()


rule "Menu Input Listener: Jump Right": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[6] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[6]) or (user_controls[6] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[6]))

    menu_action = MENU_ACTIONS.MENU_JUMP_RIGHT
    perform_action()

rule "Menu Input Listener: Next Subitem": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[7] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[7]) or (user_controls[7] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[7]))

    if menu_subitem[menu_index] < menu_subitem_size[menu_index]:
        menu_subitem[menu_index] += 1
    else:
        menu_subitem[menu_index] = 0


rule "Menu Input Listener: Set Vector": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true
    @Condition (user_controls[8] <= UI_INPUTS.VECT_RIGHT and eventPlayer.getThrottle() == ui_controls[8]) or (user_controls[8] > UI_INPUTS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_controls[8]))

    menu_action = MENU_ACTIONS.MENU_SET_VECTOR
    perform_action()


rule "Menu Controls: Toggle On Setup":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == true

    disable_player_input()

    
rule "Menu Controls: Toggle Off Setup Player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == false

    enable_player_input()


def menu_up_check():
    @Name "SUB: menu_up_check"

    # If the menu index is equal to the start of the submenu start location
    if menu_index - submenu_start_index[submenu_index] <= 0:
        # then loop to the end of the submenu
        menu_index = submenu_start_index[submenu_index+1] - 1
    else:
        # otherwise move up 1 on the menu.
        menu_index -= 1


def menu_down_check():
        @Name "SUB: menu_down_check"    

    # If the menu index is equal to the end of our submenu
    if menu_index >= submenu_start_index[submenu_index+1] - 1:
        # then loop to the start of the submenu
        menu_index = submenu_start_index[submenu_index]
    else:
        # then move down 1 on the menu.
        menu_index += 1


def setup_menu():
    @Name "SUB: setup_menu"

    # Default Menu Variables
    submenu_start_index[0] = 0
    submenu_start_index[1] = 1
    menu_max_pos = -1
    menu_label_size = -1
    menu_opt_size = -1
    sub_size = 0

    # Menu Colors
    menu_color_label_header = Color.WHITE
    menu_color_label_subtext = Color.ORANGE

    menu_color_default_off_index = Color.WHITE
    menu_color_default_on_index = Color.SKY_BLUE
    
    menu_color_submenu = rgb(204,102,102) 	


def enable_player_input():
    @Name "SUB: enable_player_input"

    eventPlayer.allowButton(Button.INTERACT)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.RELOAD)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.setMoveSpeed(100)


def disable_player_input():
    @Name "SUB: disable_player_input"

    eventPlayer.disallowButton(Button.INTERACT)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.MELEE)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.setMoveSpeed(0)


def increment_for_menu_label():
    @Name "SUB: increment_menu_label"

    menu_max_pos += 1
    menu_label_size += 1
    menu_label_color[menu_label_size] = menu_color_label_header

    
def increment_for_menu_item():
    @Name "SUB: increment_for_menu_item"

    menu_max_pos += 1
    menu_opt_size += 1
    submenu_start_index[sub_size+1] = menu_opt_size+1
    menu_off_opt_color[menu_opt_size] = menu_color_default_off_index
    menu_on_opt_color[menu_opt_size] = menu_color_default_on_index
    menu_subitem[menu_opt_size] = 0
    menu_subitem_size[menu_opt_size] = 0


def increment_for_submenu_item():
    @Name "SUB: increment_for_new_submenu"

    menu_max_pos = -1
    sub_size += 1


def new_menu_label_header():
    @Name "SUB: new_menu_label_header"

    hudHeader([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(sub_size)
        and menu_label_hidden[evalOnce(menu_label_size)] != true], 
    "{0}".format(menu_label[evalOnce(menu_label_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_label_color[evalOnce(menu_label_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_label_subtext():
    @Name "SUB: new_menu_label_subtext"

    hudSubtext([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(sub_size)
        and menu_label_hidden[evalOnce(menu_label_size)] != true], 
    "{0}".format(menu_label[evalOnce(menu_label_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_label_color[evalOnce(menu_label_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)
    

def new_menu_item_selection():
    @Name "SUB: new_menu_item_selection"

    hudSubheader(
    localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}".format(menu_on_opt_title[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos),
     menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_toggle():
    @Name "SUB: new_menu_item_toggle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}: {1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], 
    menu_opt_var_1[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle():
    @Name "SUB: new_menu_item_cycle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var_1[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle_bar():
    @Name "SUB: new_menu_item_cycle_bar"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}  {1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], 
    menu_opt_var_1[evalOnce(menu_opt_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)

    menu_max_pos += 1

    hudHeader(localPlayer if menu_visible and menu_index == evalOnce(menu_opt_size) and submenu_index == evalOnce(sub_size) else [],
    "{0} ←  {1}  →".format(menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    bar_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_item_percentage():
    @Name "SUB: new_menu_item_percentage"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}%  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var_1[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_1var():
    @Name "SUB: new_menu_item_1var"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}: {2}  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var_tags[evalOnce(menu_opt_size)][0], menu_opt_var_1[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_2var():
    @Name "SUB: new_menu_item_2var"

    menu_subitem_size[menu_opt_size] = 1

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}  →  {2}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 0
    else "■ {0} {1}  ←  {2}  →".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_3var():
    @Name "SUB: new_menu_item_3var"

    menu_subitem_size[menu_opt_size] = 2

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}  →  {2}  {3}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 0
    else "■ {0} {1}  ←  {2}  →  {3}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 1
    else "■ {0} {1}  {2}  ←  {3}  →".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_4var():
    @Name "SUB: new_menu_item_3var"

    menu_subitem_size[menu_opt_size] = 3

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}  →  {2}  {3}  {4}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)], menu_opt_var_4[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 0
    else "■ {0} {1}  ←  {2}  →  {3}  {4}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)], menu_opt_var_4[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 1
    else "■ {0} {1}  {2}  ←  {3}  →  {4}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)], menu_opt_var_4[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 2
    else "■ {0} {1}  {2}  {3}  ←  {4}  →".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)], menu_opt_var_3[evalOnce(menu_opt_size)], menu_opt_var_4[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)