rule "Player Joined":
    @Event playerJoined
    @Team 1

    eventPlayer.disableGamemodeHud()


rule "Player Spawned":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true

    
    # Turn off menu
    menu_visible = false
    # Allow player to use inputs
    enable_player_input()
    # Make player unkillable by default.
    eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, 9999)

    if use_import_data == true:
        import_player_menu()
    else:
        default_player_menu()

    hudHeader(eventPlayer, "Open The Menu to Begin Editing. For Export Instuctions See The Description of this code or Workshop.Codes/CODE", HudPosition.TOP, -2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hud_text_id = getLastCreatedText()
    wait(16)
    destroyHudText(hud_text_id)

        
# UI Elements
rule ">>>  Section: Menu Setup  <<<":

    smallMessage(null, "")


rule "Menu Setup: Creation":
    @Event global

    menu_enabled = false

    # Small server load on right
    hudSubheader([i for i in localPlayer],
    "Server Load (Curr/Avg/Peak): {0}/{1}/{2}\n".format(getServerLoad(), getAverageServerLoad(), getPeakServerLoad()), 
    HudPosition.RIGHT, 
    -9999, 
    Color.WHITE, 
    HudReeval.VISIBILITY_AND_STRING, 
    SpecVisibility.DEFAULT)

    # Large vector data for reference on right
    hudSubtext([i for i in localPlayer],
    "Position: {0}\nFacing: {1}".format(localPlayer.getPosition(), localPlayer.getFacingDirection()),
    HudPosition.RIGHT, 
    -1, 
    Color.WHITE, 
    HudReeval.VISIBILITY_AND_STRING, 
    SpecVisibility.DEFAULT)

    # Displays the left HUD menu help. Note: Can embed ui_input[0] check into single hudtext, but too much server load
    if controller_mode:
        hudSubheader([i for i in localPlayer], 
        "{0}\n{1}".format("Hold {0} to {1} Menu".format(buttonString(ui_inputs[0]), "close" if menu_visible else "open"), 
            "{8}\nMenu Controls    \n{8}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\nHelp for Current Menu Item : {8}\n{9}\n*Use left/right Controls to Select*".format(buttonString(ui_inputs[1]), buttonString(ui_inputs[2]), buttonString(ui_inputs[3]), buttonString(ui_inputs[4]), buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), buttonString(ui_inputs[9]), "——————————————————————") if menu_visible else ""), 
            HudPosition.LEFT, 
            -1, 
            Color.WHITE, 
            HudReeval.VISIBILITY_AND_STRING, 
            SpecVisibility.DEFAULT)
    else:
        # Not sure how to avoid hard coding up/down/left/right strings
        hudSubheader([i for i in localPlayer], 
        "{0}\n{1}".format("{0} {1} to {2} Menu".format(
            "Hold" if controller_mode else "Press", buttonString(ui_inputs[0]), "close" if menu_visible else "open"), 
            "{9}\nMenu Controls    \n{9}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\nHelp for Current Menu Item : {8}\n{9}\n*Use left/right Controls to Select*".format("Forward", "Backward", "Left", "Right", buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), buttonString(ui_inputs[9]), "——————————————————————") if menu_visible else ""), 
            HudPosition.LEFT, 
            -1, 
            Color.WHITE, 
            HudReeval.VISIBILITY_AND_STRING, 
            SpecVisibility.DEFAULT)
    # Create HUD
    create_menu()

    menu_enabled = true


rule ">>>  Section: Menu Controls  <<<":

    smallMessage(null, "")


rule "Menu Controls: Toggle Menu with Interact":
    @Event eachPlayer
    @Team 1
    # Change this condition to whatever button(s) you want to trigger the main menu. 
    @Condition eventPlayer.isHoldingButton(ui_inputs[0]) == true
    @Condition menu_enabled
    
    # Stalls toggle while menu is being created.
    if controller_mode == true:
        wait(1, Wait.ABORT_WHEN_FALSE)
    # A toggle for the menu_visible flag
    if menu_visible == true:
        menu_visible = false
    else:
        menu_visible = true


rule "Menu Controls: Toggle On Setup":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.MELEE)
    eventPlayer.setMoveSpeed(0)

    
rule "Menu Controls: Toggle Off Setup Player":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == false

    enable_player_input()


rule "Menu Controls: Up Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    @Condition (controller_mode == true and eventPlayer.isHoldingButton(ui_inputs[1])) or (controller_mode == false and eventPlayer.getThrottle() == ui_inputs[1])
    
    menu_up_check()
    while menu_item_hidden[menu_index] == true:
        menu_up_check()


rule "Menu Controls: Down Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    @Condition (controller_mode == true and eventPlayer.isHoldingButton(ui_inputs[2])) or (controller_mode == false and eventPlayer.getThrottle() == ui_inputs[2])
    
    menu_down_check()
    while menu_item_hidden[menu_index] == true:
        menu_down_check()


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


def menu_defaults():
    @Name "SUB: menu_defaults"

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
        
        menu_color_submenu = menu_color_default_off_index#rgb(204,102,102)
        menu_color_sel = menu_color_default_off_index#rgb(153,204,51)
        menu_color_toggle = menu_color_default_off_index#rgb(153,102,204)
        menu_color_cycle = menu_color_default_off_index#rgb(255,153,0)
        menu_color_2cycle = menu_color_default_off_index#rgb(255,204,0)
        menu_color_3cycle = menu_color_default_off_index#rgb(255,255,0) 	


def enable_player_input():
    @Name "SUB: enable_player_input"
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.allowButton(Button.RELOAD)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.setMoveSpeed(100)


def increment_for_menu_label():
    @Name "SUB: increment_menu_label"

    menu_label_size += 1
    menu_max_pos += 1
    menu_label_color[menu_label_size] = menu_color_label_header
    

def increment_for_menu_item():
    @Name "SUB: increment_for_menu_item"

    menu_opt_size += 1
    menu_max_pos += 1
    submenu_start_index[sub_size+1] = menu_opt_size+1
    menu_off_opt_color[menu_opt_size] = menu_color_default_off_index
    menu_on_opt_color[menu_opt_size] = menu_color_default_on_index
    menu_subitem[menu_opt_size] = 0

def increment_for_submenu_item():
    @Name "SUB: increment_for_new_submenu"

    sub_size += 1
    menu_max_pos = -1


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

    menu_off_opt_color[menu_opt_size] = menu_color_toggle

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
    
    menu_off_opt_color[menu_opt_size] = menu_color_cycle

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■ {0} ←  {1}  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)],
    menu_opt_var_1[evalOnce(menu_opt_size)]), HudPosition.TOP, evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle_2var():
    @Name "SUB: new_menu_item_cycle_2var"

    menu_off_opt_color[menu_opt_size] = menu_color_2cycle

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) 
    else "■ {0} ←  {1}  →  {2}".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)])  if menu_subitem[evalOnce(menu_opt_size)] == 0
    else "■ {0} {1}  ←  {2}  →".format(menu_on_opt_title[evalOnce(menu_opt_size)],menu_opt_var_1[evalOnce(menu_opt_size)], menu_opt_var_2[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color[evalOnce(menu_opt_size)] if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle_3var():
    @Name "SUB: new_menu_item_cycle_3var"

    menu_off_opt_color[menu_opt_size] = menu_color_3cycle

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