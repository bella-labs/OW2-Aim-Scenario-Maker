rule "Menu Setup: Creation":
    @Event global

    menu_enabled = false

    setup_databot()

    create_hud()
    setup_menu()
    
    create_submenu_0()
    create_submenu_1()
    create_submenu_2()
    create_submenu_3()
    create_submenu_4()

    create_submenu_2_1()
    create_submenu_2_2()
    create_submenu_2_3()

    menu_enabled = true


def create_hud():

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


def create_submenu_0():
    @Name "SUB: create_submenu_0"

    increment_for_menu_label()
    menu_label[menu_label_size] = "Configure"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot       ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Movement ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Scenario  ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player    ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Play"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Test Bot in Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Test Scenario"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()


def create_submenu_1():
    @Name "SUB: create_submenu_1"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Slot"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Current Bot Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Copy From Bot Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Parameters"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Hero Pool"
    menu_on_opt_title[menu_opt_size] = "Ana"
    menu_opt_var_1[menu_opt_size] = "Disabled"
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = heroIcon(Hero.ANA)
    bar_color[menu_opt_size] = Color.RED
    new_menu_item_cycle_bar()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot health"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Scale"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Spawn and Boundaries"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Default"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Facing Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Player"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Facing Offset"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Lower Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Upper Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Distance"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Min: 0"
    menu_opt_var_2[menu_opt_size] = "Max: 0"
    new_menu_item_cycle_2var()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Movement Profile"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Toggle Profiles"
    menu_on_opt_title[menu_opt_size] = "Profile"
    menu_opt_var_1[menu_opt_size] = "0: Off"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Randomize Profile Order"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()


def create_submenu_2():
    @Name "SUB: create_submenu_2"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Movement Profiles"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Profile Data"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Current Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Override Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Horizontal Movement ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Vertical Movement    ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Reactions             ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Advanced Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Use Impulse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Maximize Crosshair Movement"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()
    

def create_submenu_2_1():
    @Name "SUB: create_submenu_2_1"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Horizontal Movement"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Movement Profiles"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Left / Right Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Left Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Right Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Left/Right Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Left Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Right Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Left/Right Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_cycle_3var()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Forward / Backward Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Forward Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Backward Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Forward / Backward Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Forward Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Backward Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Forward / Backward Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_cycle_3var()

def create_submenu_2_2():
    @Name "SUB: create_submenu_2_2"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Vertical Movement"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Movement Profiles"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Jump Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Crouch Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Uncrouch Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Min: 0"
    menu_opt_var_2[menu_opt_size] = "Max: 0"
    new_menu_item_cycle_2var()


def create_submenu_2_3():
    @Name "SUB: create_submenu_2_3"    

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Reactions"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Movement Profiles"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Collisions"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "React to Collisions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Threshold"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Reaction Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Damage"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "React to Damage"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Left/Right Directions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Left/Right Wait Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Forward/Backward Directions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap Forward/Backward Wait Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

def create_submenu_3():
    @Name "SUB: create_submenu_3"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Scenario Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Timed"
    menu_opt_var_2[menu_opt_size] = "60s"
    new_menu_item_cycle_2var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Elimination"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Normal Hit"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Critical Hit"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Second for Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Max Time Per Strafe"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()


def create_submenu_4():
    @Name "SUB: create_submenu_4"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Player Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Facing"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Lower Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Upper Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Impulse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ": off"
    new_menu_item_toggle()

