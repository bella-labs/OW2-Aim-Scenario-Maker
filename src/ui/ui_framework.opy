rule "Menu Input Listener: Toggle Menu":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition data_loaded[2] 
    @Condition (user_controls[0] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[0]) or (user_controls[0] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[0]))

    wait(ui_delay, Wait.ABORT_WHEN_FALSE)
    if menu_visible :
        menu_visible = false
    else:
        menu_visible = true


rule "Menu Input Listener: Menu Up": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[1] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[1]) or (user_controls[1] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[1]))

    menu_up_check()
    while menu_item_hidden[menu_index] :
        menu_up_check()

    update_help_data()
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Menu Input Listener: Menu Down":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[2] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[2]) or (user_controls[2] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[2]))

    menu_down_check()
    while menu_item_hidden[menu_index] :
        menu_down_check()

    update_help_data()
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Menu Input Listener: Step Left": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[3] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[3]) or (user_controls[3] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[3]))

    menu_action = MENU_ACTIONS.MENU_STEP_LEFT
    perform_action()


rule "Menu Input Listener: Step Right": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[4] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[4]) or (user_controls[4] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[4]))

    menu_action = MENU_ACTIONS.MENU_STEP_RIGHT
    perform_action()


rule "Menu Input Listener: Jump Left": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[5] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[5]) or (user_controls[5] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[5]))

    menu_action = MENU_ACTIONS.MENU_JUMP_LEFT
    perform_action()


rule "Menu Input Listener: Jump Right": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[6] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[6]) or (user_controls[6] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[6]))

    menu_action = MENU_ACTIONS.MENU_JUMP_RIGHT
    perform_action()


rule "Menu Input Listener: Previous Subitem": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[7]) or (user_controls[7] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[7]))

    if subitem_index[menu_index] > 0:
        subitem_index[menu_index] -= 1
    else:
        subitem_index[menu_index] = subitem_size[menu_index]

    update_help_data()


rule "Menu Input Listener: Next Subitem": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[8]) or (user_controls[8] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[8]))

    if subitem_index[menu_index] < subitem_size[menu_index]:
        subitem_index[menu_index] += 1
    else:
        subitem_index[menu_index] = 0

    update_help_data()


rule "Menu Input Listener: Set Vector": 
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 
    @Condition (user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT and eventPlayer.getThrottle() == ui_inputs[9]) or (user_controls[9] > INPUT_OPTIONS.VECT_RIGHT and eventPlayer.isHoldingButton(ui_inputs[9]))

    menu_action = MENU_ACTIONS.MENU_SET_VECTOR
    perform_action()


rule "Menu Controls: Toggle On Setup":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible 

    disable_player_input()

    
rule "Menu Controls: Toggle Off Setup Player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition menu_visible == false

    eventPlayer.player_speed = 100
    enable_player_input()


def menu_up_check():
    @Name "SUB: menu_up_check"

    # If the menu index is equal to the start of the submenu start location
    if menu_index - submenu_start_indexes[submenu_index] <= 0:
        # then loop to the end of the submenu
        menu_index = submenu_start_indexes[submenu_index+1] - 1
    else:
        # otherwise move up 1 on the menu.
        menu_index -= 1


def menu_down_check():
        @Name "SUB: menu_down_check"    

    # If the menu index is equal to the end of our submenu
    if menu_index >= submenu_start_indexes[submenu_index+1] - 1:
        # then loop to the start of the submenu
        menu_index = submenu_start_indexes[submenu_index]
    else:
        # then move down 1 on the menu.
        menu_index += 1


def create_help_hud():
    @Name "SUB: create_help_hud"
    # Displays the left HUD menu help.
    menu_help_index = help_data[HELP_TYPE.DEFAULT]
    
    menu_help_display = [   
                            strings_help[lang_type][0][menu_help_index[0]], 
                            strings_help[lang_type][1][menu_help_index[1]], 
                            strings_help[lang_type][2][menu_help_index[2]], 
                            strings_help[lang_type][3][menu_help_index[3]], 
                            strings_help[lang_type][4][menu_help_index[4]], 
                            strings_help[lang_type][5][menu_help_index[5]], 
                            strings_help[lang_type][6][menu_help_index[6]], 
                            strings_help[lang_type][7][menu_help_index[7]], 
                            strings_help[lang_type][8][menu_help_index[8]],
                            strings_help[lang_type][9][menu_help_index[9]],
                        ]

    hudSubheader([i for i in localPlayer], 
    "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}".format("{0} {1} {2} {3} {4}\n".format(strings_prompt[lang_type][0] if ui_delay > 0 else strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[0]] if user_controls[0] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[0]), strings_prompt[lang_type][2], strings_prompt[lang_type][3] if menu_visible else strings_prompt[lang_type][4], strings_prompt[lang_type][5]), 
        strings_symbols[0], 
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[1]] if user_controls[1] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[1]), menu_help_display[0]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[2]] if user_controls[2] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[2]), menu_help_display[1]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[3]] if user_controls[3] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[3]), menu_help_display[2]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[4]] if user_controls[4] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[4]), menu_help_display[3]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[5]] if user_controls[5] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[5]), menu_help_display[4]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[6]] if user_controls[6] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[6]), menu_help_display[5]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[7]] if user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[7]), menu_help_display[6]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), menu_help_display[7]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[9]] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[9]), menu_help_display[8]) if menu_visible else "",
        "{0} : {1}\n".format(strings_inputs[lang_type][user_controls[10]] if user_controls[10] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[10]), menu_help_display[9]) if menu_visible else "",
        strings_symbols[0] if menu_visible else ""),
        HudPosition.LEFT,
        -1,
        Color.WHITE,
        HudReeval.VISIBILITY_AND_STRING,
        SpecVisibility.DEFAULT)


def update_help_data():
    @Name "SUB: update_help_data"

    menu_help_index = menu_item_help[menu_index]
    for loop_index in range(0, len(strings_help[lang_type]), 1):
        if (loop_index == 2 or loop_index == 3) and (menu_help_index[loop_index] == 1 or menu_help_index[loop_index] == 2):
            menu_help_display[loop_index] = "{0}{1}".format(strings_help[lang_type][loop_index][menu_help_index[loop_index]], small_steps[menu_item_small_step[menu_index][subitem_index[menu_index]]])
        elif (loop_index == 4 or loop_index == 5) and (menu_help_index[loop_index] == 1 or menu_help_index[loop_index] == 2):
            menu_help_display[loop_index] = "{0}{1}".format(strings_help[lang_type][loop_index][menu_help_index[loop_index]], large_steps[menu_item_large_step[menu_index][subitem_index[menu_index]]])
        else:
            menu_help_display[loop_index] = strings_help[lang_type][loop_index][menu_help_index[loop_index]]


def setup_menu():
    @Name "SUB: setup_menu"

    # Default Menu Variables
    submenu_index = 0
    submenu_start_indexes[0] = 0
    submenu_start_indexes[1] = 1
    menu_max_pos = -1
    menu_label_size = -1
    menu_item_size = -1
    submenu_size = 0

    # Menu Colors
    menu_color_label_header = Color.WHITE
    menu_color_label_subtext = Color.ORANGE

    menu_color_off_index = Color.WHITE
    menu_color_on_index = Color.SKY_BLUE


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
    eventPlayer.setMoveSpeed(eventPlayer.player_speed)


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
    menu_item_size += 1
    submenu_start_indexes[submenu_size+1] = menu_item_size+1
    menu_item_color_off[menu_item_size] = menu_color_off_index
    menu_item_color_on[menu_item_size] = menu_color_on_index
    subitem_index[menu_item_size] = 0
    subitem_size[menu_item_size] = 0

    menu_item_var_tags[menu_item_size] = ["", "", "", ""]
    menu_item_var_1[menu_item_size] = ""
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    menu_item_var_4[menu_item_size] = ""
    menu_item_help[menu_item_size] = help_data[HELP_TYPE.DEFAULT]


def increment_for_submenu_item():
    @Name "SUB: increment_for_new_submenu"

    menu_max_pos = -1
    submenu_size += 1


def new_menu_label_header():
    @Name "SUB: new_menu_label_header"

    hudHeader([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(submenu_size)
        and menu_label_hidden[evalOnce(menu_label_size)] != true], 
    "{0}".format(menu_label[evalOnce(menu_label_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_label_color[evalOnce(menu_label_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_label_subheader():
    @Name "SUB: new_menu_label_subheader"

    hudSubheader([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(submenu_size)
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
        and submenu_index == evalOnce(submenu_size)
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
    localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) else "■  {0}".format(menu_item_title_on[evalOnce(menu_item_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos),
     menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_toggle():
    @Name "SUB: new_menu_item_toggle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) else "■  {0}: {1}".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_1[evalOnce(menu_item_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle():
    @Name "SUB: new_menu_item_cycle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0} ←  {1}  → ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_1[evalOnce(menu_item_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)
    

def new_menu_item_percentage():
    @Name "SUB: new_menu_item_percentage"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0} ←  {1}%  → ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_1[evalOnce(menu_item_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_toggle_list():
    @Name "SUB: new_menu_item_toggle_list"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0}    ←  {1}  →    {2}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_2[evalOnce(menu_item_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_2var():
    @Name "SUB: new_menu_item_2var"

    subitem_size[menu_item_size] = 1

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0}    ←  {1}{2}  →    {3}{4}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 0
    else "■ {0}    {1}{2}  ←    {3}{4}  →    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_3var():
    @Name "SUB: new_menu_item_3var"

    subitem_size[menu_item_size] = 2

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0}    ←  {1}{2}  →    {3}{4}    {5}{6}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 0
    else "■ {0}    {1}{2}    ←  {3}{4}  →    {5}{6}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 1
    else "■ {0}    {1}{2}    {3}{4}    ←  {5}{6}  →    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_4var():
    @Name "SUB: new_menu_item_3var"

    subitem_size[menu_item_size] = 3

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(submenu_size) and menu_item_hidden[evalOnce(menu_item_size)] != true else [],
    "{0}".format(menu_item_title_off[evalOnce(menu_item_size)]) if menu_index != evalOnce(menu_item_size) 
    else "■ {0}     ←  {1}{2}  →    {3}{4}    {5}{6}    {7}{8}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][3], menu_item_var_4[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 0
    else "■ {0}     {1}{2}    ←  {3}{4}  →    {5}{6}    {7}{8}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][3], menu_item_var_4[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 1
    else "■ {0}     {1}{2}    {3}{4}    ←  {5}{6}  →    {7}{8}    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][3], menu_item_var_4[evalOnce(menu_item_size)])  if subitem_index[evalOnce(menu_item_size)] == 2
    else "■ {0}     {1}{2}    {3}{4}    {5}{6}    ←  {7}{8}  →    ".format(menu_item_title_on[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][0], menu_item_var_1[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][1], menu_item_var_2[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][2], menu_item_var_3[evalOnce(menu_item_size)], menu_item_var_tags[evalOnce(menu_item_size)][3], menu_item_var_4[evalOnce(menu_item_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_item_color_off[evalOnce(menu_item_size)] if menu_index != evalOnce(menu_item_size) else menu_item_color_on[evalOnce(menu_item_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)