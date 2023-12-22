rule "Player Joined: Disable GameHUD":
    @Event playerJoined
    @Team 1

    eventPlayer.disableGamemodeHud()


rule "Player Spawned: Display notice banner":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition eventPlayer.hasSpawned() == true

    # Allow player to use inputs
    enable_player_input()
    # Make player unkillable by default.
    eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, 9999)

    #hudHeader(eventPlayer, strings_misc[0][1], HudPosition.TOP, -9999, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    #hud_text_id = getLastCreatedText()
    #wait(5)
    #destroyHudText(hud_text_id)
    

rule "Menu Setup: Creation":
    @Event global

    
    data_loaded[DATA_INDEXES.DATA_MENU] = false
    waitUntil(data_loaded[DATA_INDEXES.DATA_STATIC] == true, 9999)

    setup_databot()
    waitUntil(data_loaded[DATA_INDEXES.DATA_BOT] == true, 9999)

    create_hud()
    setup_menu()
    setup_menu_custom()
    
    create_submenu_0()
    create_submenu_1()
    create_submenu_2()
    create_submenu_3()

    create_submenu_2_1()

    data_loaded[DATA_INDEXES.DATA_MENU] = true
    menu_visible = false


def setup_menu_custom():
    @Name "SUB: setup_menu_custom"

    menu_color_on_index = rgb(128,154,213) 
    menu_color_label_subtext = rgb(255,148,82)

    menu_colors_custom[0] = rgb(218,80,121)
    menu_colors_custom[1] = rgb(236,202,107)
    menu_colors_custom[2] = rgb(28,204,125)
    menu_colors_custom[3] = rgb(24,208,195)


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
    
    menu_prompt_index = 0
    hudSubheader([i for i in localPlayer], 
    "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}".format("{0} {1} {2} {3} {4}\n".format(strings_prompt[lang_type][0] if ui_delay > 0 else strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[0]] if user_controls[0] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[0]), strings_prompt[lang_type][2], strings_prompt[lang_type][3] if menu_visible else strings_prompt[lang_type][4], strings_prompt[lang_type][5]), 
        strings_symbols[0], 
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][0], strings_inputs[lang_type][user_controls[1]] if user_controls[1] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[1])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][1], strings_inputs[lang_type][user_controls[2]] if user_controls[2] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[2])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][2], strings_inputs[lang_type][user_controls[3]] if user_controls[3] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[3])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][3], strings_inputs[lang_type][user_controls[4]] if user_controls[4] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[4])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][4], strings_inputs[lang_type][user_controls[5]] if user_controls[5] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[5])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][5], strings_inputs[lang_type][user_controls[6]] if user_controls[6] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[6])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][6], strings_inputs[lang_type][user_controls[7]] if user_controls[7] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[7])) if menu_visible else "",
        "{1} - {0}\n".format(strings_controls[lang_type][menu_prompt_index][7], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8])) if menu_visible else "",
        strings_symbols[0] if menu_visible else "",
        "{0}{1}".format(strings_instructions[lang_type][0], strings_symbols[0]) if menu_item_var_1[6] == true else "",
        "{0}{1}{2}{3}".format(strings_instructions[lang_type][1], strings_symbols[0], strings_instructions[lang_type][2], strings_symbols[0]) if menu_item_var_1[7] == true else ""),
        HudPosition.LEFT,
        -1,
        Color.WHITE,
        HudReeval.VISIBILITY_AND_STRING,
        SpecVisibility.DEFAULT)

def create_submenu_0():
    @Name "SUB: create_submenu_0"

    # (Subtext) Documentation prompt
    increment_for_menu_label()
    menu_label[menu_label_size] = "{0}{1}{2}".format(strings_symbols[0], strings_submenu_0[lang_type][menu_max_pos], strings_symbols[0])
    new_menu_label_subheader()

    # (Header) Configure
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Selection) Select Bot Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Selection) Override from Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Header) Test
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Change Hero
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[1]
    new_menu_item_cycle()

    # (Selection) Test Bot in Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[1]
    new_menu_item_cycle()

    # (Selection) Test Scenario
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[1]
    new_menu_item_selection()

    # (Header) Export
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Toggle) Export Instruction
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    menu_item_var_1[menu_item_size] = false
    menu_item_var_2[menu_item_size] = strings_options[lang_type][1]
    new_menu_item_toggle()

    # (Toggle) Import Instruction
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    menu_item_var_1[menu_item_size] = false
    menu_item_var_2[menu_item_size] = strings_options[lang_type][1]
    new_menu_item_toggle()


def create_submenu_1():
    @Name "SUB: create_submenu_1"

    increment_for_submenu_item()

    # (Header) Slot
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos] 
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Subtext) Slot
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Select Bot Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_range[menu_item_size] = [RANGE_INDEXES.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_INDEXES.SMALL_INT]
    menu_item_large_step[menu_item_size] = [LARGE_INDEXES.LARGE_INT_SAME_AS_SMALL]
    menu_item_var_1[menu_item_size] = 0
    menu_item_var_2[menu_item_size] = strings_options[lang_type][0][1] if databot.data_bot_slots[0] == true else strings_options[lang_type][0][0]
    new_menu_item_toggle_list()

    # (Cycle) Override from Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_INDEXES.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_INDEXES.SMALL_INT]
    menu_item_large_step[menu_item_size] = [LARGE_INDEXES.LARGE_INT_SAME_AS_SMALL]
    menu_item_var_1[menu_item_size] = 0
    new_menu_item_cycle()

    # (Subtext) Bot Parameters
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle Bar) Hero Pool
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][0]
    menu_item_var_1[menu_item_size] = 0
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    menu_item_header_color[menu_item_size] = Color.RED
    new_menu_item_cycle()
    ext_menu_item_cycle_header()

    # (3 Var) Health
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = ""
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    new_menu_item_3var()

    # (4 Var) Scale
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = ""
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    menu_item_var_4[menu_item_size] = ""    
    new_menu_item_4var()

    # (Percentage) Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_cycle()

    # (Subtext) Bot Spawn and Boundaries
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Spawn Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = ""
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    menu_item_var_4[menu_item_size] = ""   
    new_menu_item_4var()

    # (4 Var) Facing Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = ""
    menu_item_var_2[menu_item_size] = ""
    menu_item_var_3[menu_item_size] = ""
    menu_item_var_4[menu_item_size] = ""   
    new_menu_item_3var()

    # (3 Var) Lower Bound
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = "X: 0"
    menu_item_var_2[menu_item_size] = "Y: 0"
    menu_item_var_3[menu_item_size] = "Z: 0"
    new_menu_item_3var()

    # (3 Var) Upper Bound
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = "X: 0"
    menu_item_var_2[menu_item_size] = "Y: 0"
    menu_item_var_3[menu_item_size] = "Z: 0"
    new_menu_item_3var()

    # (2 Var) Distance
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][0]
    menu_item_var_1[menu_item_size] = 0
    menu_item_var_2[menu_item_size] = 0
    new_menu_item_2var()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (1 Var) Profile Status
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = [0]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][menu_max_pos][0]
    new_menu_item_toggle_list()

    # (3 Var) Randomize Profiles
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = "Off"
    new_menu_item_3var()

    # (Toggle) Use Custom Scripts (Requires Workshop Scripting)
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_var_1[menu_item_size] = "Off"
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
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Select Profile Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_cycle()

    # (Cycle) Override Profile From Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_cycle()

    # (Subtext) Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Selection) Movement Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
    new_menu_item_selection()

    # (Subtext) Reactions
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) React to Collisions
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (4 Var) Swap Strafe Direction When Damage
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) "Swap Strafe Wait Timer"
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()


def create_submenu_2_1():
    @Name "SUB: create_submenu_2_1"

    increment_for_submenu_item()

    # (Header) Movement Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Return to Profile Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
    new_menu_item_selection()

    # (Subtext) Left / Right Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Sync Left / Right Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) Left Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) Right Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Swap Left / Right Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Left Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Right Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Swap Left / Right Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Subtext) Forward / Backward Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Sync Forward / Backward Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) Forward Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) Backward Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Swap Forward / Backward Strafe Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Forward Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Backward Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Swap Forward / Backward Strafe Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Subtext) Idle Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Idle Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (4 Var) Left / Right Idle
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (4 Var) Forward / Backward Idle
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Subtext) Vertical Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Jump Frequency
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (4 Var) Crouch Frequency
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (2 Var) Uncrouch Frequency
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
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
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Subtext) Scoring
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Scenario Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Points
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Strafe Scoring
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Subtext) Player
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Player Spawn
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (3 Var) Player Facing
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Percentage) Player Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()

    # (Percentage) Player Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    new_menu_item_selection()



