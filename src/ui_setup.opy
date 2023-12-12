rule "Menu Setup: Creation":
    @Event global


    menu_enabled = false
    waitUntil(static_data_loaded == true, 9999)

    setup_databot()

    create_hud()
    setup_menu()
    
    create_submenu_0()
    create_submenu_1()
    create_submenu_2()
    create_submenu_3()

    create_submenu_2_1()

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
            "{8}\nMenu Controls    \n{8}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\n{8}\n*Use left/right Controls to Select*".format(buttonString(ui_inputs[1]), buttonString(ui_inputs[2]), buttonString(ui_inputs[3]), buttonString(ui_inputs[4]), buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), "——————————————————————") if menu_visible else ""), 
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
            "{8}\nMenu Controls    \n{8}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\n{8}\n*Use left/right Controls to Select*".format("Forward", "Backward", "Left", "Right", buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), "——————————————————————") if menu_visible else ""), 
            HudPosition.LEFT, 
            -1, 
            Color.WHITE, 
            HudReeval.VISIBILITY_AND_STRING, 
            SpecVisibility.DEFAULT)


def create_submenu_0():
    @Name "SUB: create_submenu_0"

    # (Header) Configure
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Selection) Select Bot Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Selection) Override from Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Header) Play
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Test Bot in Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    # (Selection) Test Scenario
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()


def create_submenu_1():
    @Name "SUB: create_submenu_1"

    increment_for_submenu_item()

    # (Header) Slot
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos] 
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Subtext) Slot
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Select Bot Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_range[menu_opt_size] = [RANGE_INDEXES.RANGE_SLOT]
    menu_opt_small_step[menu_opt_size] = [SMALL_INDEXES.SMALL_INT]
    menu_opt_large_step[menu_opt_size] = [LARGE_INDEXES.LARGE_INT]
    menu_opt_var_1[menu_opt_size] = 0
    new_menu_item_cycle()

    # (Cycle) Override from Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_range[menu_opt_size] = [RANGE_INDEXES.RANGE_SLOT]
    menu_opt_small_step[menu_opt_size] = [SMALL_INDEXES.SMALL_INT]
    menu_opt_large_step[menu_opt_size] = [LARGE_INDEXES.LARGE_INT]
    menu_opt_var_1[menu_opt_size] = 0
    new_menu_item_cycle()

    # (Subtext) Bot Parameters
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle Bar) Hero Pool
    increment_for_menu_item()
    menu_opt_str_index[menu_opt_size] = 0
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = hero_array[menu_opt_str_index[menu_opt_size]]
    menu_opt_var_tags[menu_opt_size] = ["Health", "HPS", "Duration Until Heal"]
    menu_opt_var_1[menu_opt_size] = 0
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = ""
    bar_color[menu_opt_size] = Color.RED
    new_menu_item_cycle_bar()

    # (3 Var) Health
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ""
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = ""
    new_menu_item_3var()

    # (4 Var) Scale
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ""
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = ""
    menu_opt_var_4[menu_opt_size] = ""    
    new_menu_item_4var()

    # (Percentage) Gravity
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    # (Subtext) Bot Spawn and Boundaries
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Spawn Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ""
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = ""
    menu_opt_var_4[menu_opt_size] = ""   
    new_menu_item_4var()

    # (4 Var) Facing Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ""
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = ""
    menu_opt_var_4[menu_opt_size] = ""   
    new_menu_item_3var()

    # (3 Var) Lower Bound
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_3var()

    # (3 Var) Upper Bound
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_3var()

    # (2 Var) Distance
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Min: 0"
    menu_opt_var_2[menu_opt_size] = "Max: 0"
    new_menu_item_2var()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (1 Var) Profile Status
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = strings_on_titles[lang_type][0]
    menu_opt_var_tags[menu_opt_size] = [0]
    menu_opt_var_1[menu_opt_size] = strings_options[lang_type][menu_max_pos][0]
    new_menu_item_1var()

    # (3 Var) Randomize Profiles
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_3var()

    # (Toggle) Use Custom Scripts (Requires Workshop Scripting)
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()


def create_submenu_2():
    @Name "SUB: create_submenu_2"

    increment_for_submenu_item()

    # (Header) Profile Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Select Profile Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    # (Cycle) Override Profile From Slot
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    # (Subtext) Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Selection) Movement Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Subtext) Reactions
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) React to Collisions
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (4 Var) Swap Strafe Direction When Damage
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) "Swap Strafe Wait Timer"
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()


def create_submenu_2_1():
    @Name "SUB: create_submenu_2_1"

    increment_for_submenu_item()

    # (Header) Movement Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Profile Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Subtext) Left / Right Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Sync Left / Right Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) Left Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) Right Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Swap Left / Right Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Left Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Right Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Swap Left / Right Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Subtext) Forward / Backward Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Sync Forward / Backward Settings
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) Forward Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) Backward Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Swap Forward / Backward Strafe Time
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Forward Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Backward Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Swap Forward / Backward Strafe Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Subtext) Idle Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Idle Type
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (4 Var) Left / Right Idle
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (4 Var) Forward / Backward Idle
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Subtext) Vertical Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Jump Frequency
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (4 Var) Crouch Frequency
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (2 Var) Uncrouch Frequency
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()


def create_submenu_3():
    @Name "SUB: create_submenu_3"

    increment_for_submenu_item()

    # (Header) Scenario Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    # (Subtext) Scoring
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Scenario Type
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Points
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Strafe Scoring
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Subtext) Player
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Player Spawn
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (3 Var) Player Facing
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Percentage) Player Speed
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()

    # (Percentage) Player Gravity
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()



