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

    
    data_loaded[DATA_TYPE.DATA_MENU] = false
    waitUntil(data_loaded[DATA_TYPE.DATA_STATIC] == true, 9999)

    setup_databot()
    waitUntil(data_loaded[DATA_TYPE.DATA_BOT] == true, 9999)

    create_hud()
    setup_menu()
    setup_menu_custom()
    
    create_submenu_main()
    create_submenu_scenario()
    create_submenu_bot()
    create_submenu_profile()

    data_loaded[DATA_TYPE.DATA_MENU] = true
    menu_visible = false


def setup_menu_custom():
    @Name "SUB: setup_menu_custom"

    menu_color_on_index = rgb(128,154,213) 
    menu_color_label_subtext = rgb(255,148,82)

    menu_colors_custom[0] = rgb(218,80,121)
    menu_colors_custom[1] = rgb(236,202,107)
    menu_colors_custom[2] = rgb(28,204,125)
    menu_colors_custom[3] = rgb(24,208,195)

    bot_slot = 0
    profile_slot = 0
    display_help[0] = false
    display_help[1] = false

    bot_gen_slot = 0
    for loop_index in range(0, 12, 1):
        active_bot_status[loop_index] = false


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

    # Displays the left HUD menu help.
    menu_help_index = help_configs[HELP_CONFIGS.DEFAULT]
    menu_help_display = [strings_help[lang_type][0][menu_help_index[0]], strings_help[lang_type][1][menu_help_index[1]], strings_help[lang_type][2][menu_help_index[2]], strings_help[lang_type][3][menu_help_index[3]], strings_help[lang_type][4][menu_help_index[4]], strings_help[lang_type][5][menu_help_index[5]], strings_help[lang_type][6][menu_help_index[6]], strings_help[lang_type][7][menu_help_index[7]]]
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
        strings_symbols[0] if menu_visible else "",
        "{0}{1}".format(strings_instructions[lang_type][0], strings_symbols[0]) if display_help[0] == true else "",
        "{0}{1}{2}{3}".format(strings_instructions[lang_type][1], strings_symbols[0], strings_instructions[lang_type][2], strings_symbols[0]) if display_help[1] else ""),
        HudPosition.LEFT,
        -1,
        Color.WHITE,
        HudReeval.VISIBILITY_AND_STRING,
        SpecVisibility.DEFAULT)

    # Stats Display Top
    hudSubheader([i for i in localPlayer if stat_tracking_status == true],
    "Timer: {0}\nElims: {1}".format(timer, elims), 
    HudPosition.TOP, 
    -9999, 
    Color.WHITE, 
    HudReeval.VISIBILITY_AND_STRING, 
    SpecVisibility.DEFAULT)


def create_submenu_main():
    @Name "SUB: create_submenu_main"

    # (Subtext) Documentation prompt
    increment_for_menu_label()
    menu_label[menu_label_size] = "{0}{1}{2}".format(strings_symbols[0], strings_submenu_0[lang_type][menu_max_pos], strings_symbols[0])
    new_menu_label_subheader()

    # (Header) Configure
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_0[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Scenario
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Selection) Bot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[0]
    new_menu_item_selection()

    # (Selection) Profiles
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
    new_menu_item_selection()

    # (Selection) Test Bot in Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_color_off[menu_item_size] = menu_colors_custom[1]
    menu_item_var_1[menu_item_size] = 0

    action_var = active_bot_status[0]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()

    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_TOGGLE]
    new_menu_item_toggle_list()

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
    menu_item_var_1[menu_item_size] = strings_options[lang_type][1][0]
    new_menu_item_toggle()

    # (Toggle) Import Instruction
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_0[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][1][0]
    new_menu_item_toggle()


def create_submenu_scenario():
    @Name "SUB: create_submenu_scenario"

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
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.SCE_MODE][databot.sce_game_mode]
    menu_item_var_2[menu_item_size] = databot.sce_game_limit
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_10]
    
    action_var = menu_item_size
    subact_sce_set_limit_type()
    
    new_menu_item_2var()

    # (3 Var) Points
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.SCE_POINTS]
    menu_item_var_1[menu_item_size] = databot.sce_bs_points
    menu_item_var_2[menu_item_size] = databot.sce_hs_points
    menu_item_var_2[menu_item_size] = databot.sce_elim_points
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (3 Var) Strafe Scoring
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.SCE_STRAFE]
    menu_item_var_1[menu_item_size] = databot.sce_strafe_pps
    menu_item_var_2[menu_item_size] = databot.sce_strafe_min
    menu_item_var_2[menu_item_size] = databot.sce_strafe_max
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (Subtext) Player
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Player Spawn
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VECT]
    menu_item_var_1[menu_item_size] = databot.sce_player_spawn[0].x
    menu_item_var_2[menu_item_size] = databot.sce_player_spawn[0].y
    menu_item_var_3[menu_item_size] = databot.sce_player_spawn[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_3var()

    # (3 Var) Player Facing
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VECT]
    menu_item_var_1[menu_item_size] = databot.sce_player_facing[0].x
    menu_item_var_2[menu_item_size] = databot.sce_player_facing[0].y
    menu_item_var_3[menu_item_size] = databot.sce_player_facing[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_3var()

    # (Cycle) Player Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.sce_player_speed
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Cycle) Player Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_3[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.sce_player_gravity
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Toggle) Player Custom Script
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]

    action_var = databot.sce_custom_status
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()


def create_submenu_bot():
    @Name "SUB: create_submenu_bot"

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

    # (Toggle List) Select Bot Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    
    menu_item_var_1[menu_item_size] = 0

    action_var = databot.bot_slot_status[0]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()

    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_TOGGLE]
    new_menu_item_toggle_list()

    # (Cycle) Override from Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_OVERRIDE]
    new_menu_item_cycle()

    # (Subtext) Bot Parameters
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Toggle List) Hero Pool
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = heroIcon(Hero.TRACER)
    menu_item_var_1[menu_item_size] = Hero.TRACER
    
    action_var = Hero.TRACER in databot.bot_hero_pool[bot_slot]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()
    
    menu_item_var_3[menu_item_size] = 0
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.NONE, RANGE_TYPE.RANGE_HERO]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.NONE, SMALL_TYPE.SMALL_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_TOGGLE]
    new_menu_item_toggle_list()

    # (3 Var) Health
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.HEALTH]
    menu_item_var_1[menu_item_size] = databot.bot_health[0]
    menu_item_var_2[menu_item_size] = databot.bot_hps[0]
    menu_item_var_3[menu_item_size] = databot.bot_hps_wait[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (4 Var) Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TARGET]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.TARGET][databot.bot_speed_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_speed_min[0]
    menu_item_var_3[menu_item_size] = databot.bot_speed_max[0]
    menu_item_var_4[menu_item_size] = databot.bot_speed_target[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_4var()

    # (4 Var) Scale
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TARGET]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.TARGET][databot.bot_scale_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_scale_min[0]
    menu_item_var_3[menu_item_size] = databot.bot_scale_max[0]
    menu_item_var_4[menu_item_size] = databot.bot_scale_target[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_4var()

    # (Percentage) Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.bot_gravity[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Subtext) Bot Spawn and Boundaries
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Spawn Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TYPE_VECT]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][4][databot.bot_spawn_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_spawn_vect[0].x
    menu_item_var_3[menu_item_size] = databot.bot_spawn_vect[0].y
    menu_item_var_4[menu_item_size] = databot.bot_spawn_vect[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR]
    menu_item_small_step[menu_item_size] = [RANGE_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [RANGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_TOGGLE] 
    new_menu_item_4var()

    # (4 Var) Facing Settings
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TYPE_VECT]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][5][databot.bot_spawn_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_facing_vect[0].x
    menu_item_var_3[menu_item_size] = databot.bot_facing_vect[0].y
    menu_item_var_4[menu_item_size] = databot.bot_facing_vect[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_NORMAL, RANGE_TYPE.RANGE_NORMAL, RANGE_TYPE.RANGE_NORMAL]
    menu_item_small_step[menu_item_size] = [RANGE_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [RANGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_TOGGLE] 
    new_menu_item_4var()

    # (3 Var) Boundary Position
    increment_for_menu_item()

    menu_effect_index[STORED_ITEMS.BOUNDS_1] = menu_item_size

    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VECT]
    menu_item_var_1[menu_item_size] = databot.bot_bound_pos[0].x
    menu_item_var_2[menu_item_size] = databot.bot_bound_pos[0].y
    menu_item_var_3[menu_item_size] = databot.bot_bound_pos[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_3var()

    # (4 Var) Boundary Dimensions
    increment_for_menu_item()

    menu_effect_index[STORED_ITEMS.BOUNDS_2] = menu_item_size

    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.ANGLE_DIM]
    menu_item_var_1[menu_item_size] = databot.bot_bound_angle[0]
    menu_item_var_2[menu_item_size] = databot.bot_bound_dim[0].x
    menu_item_var_3[menu_item_size] = databot.bot_bound_dim[0].y
    menu_item_var_4[menu_item_size] = databot.bot_bound_dim[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_ANGLE, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR, RANGE_TYPE.RANGE_VECTOR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_4var()

    # (2 Var) Distance
    increment_for_menu_item()

    menu_effect_index[STORED_ITEMS.DISTANCE] = menu_item_size

    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MIN_MAX]
    menu_item_var_1[menu_item_size] = databot.bot_dist_min[0]
    menu_item_var_2[menu_item_size] = databot.bot_dist_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_DISTANCE, RANGE_TYPE.RANGE_DISTANCE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_2var()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Toggle List) Select Profiles for Bot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_1[menu_item_size] = 0

    action_var = databot.bot_profile_status[0][0]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()

    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_TOGGLE]
    new_menu_item_toggle_list()

    # (3 Var) Profile Order
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.PROFILE]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][6][databot.bot_profile_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_profile_min[0]
    menu_item_var_3[menu_item_size] = databot.bot_profile_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_TOGGLE]
    new_menu_item_3var()

    # (Toggle) Custom Script ID
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_1[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]

    action_var = databot.bot_script_status[0]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()


def create_submenu_profile():
    @Name "SUB: create_submenu_profile"

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
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Cycle) Override Profile From Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_OVERRIDE]
    new_menu_item_cycle()

    # (Cycle) Profile Weight
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Subtext) Horizontal Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Horizontal Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_TYPE]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_hori_type[0]]
    menu_item_var_2[menu_item_size] = databot.mvmt_hori_impulse[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_hori_impulse[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_3var()

    # (2 Var) Horizontal Probability
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.HORI_CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_lr_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_fb_chance[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_2var()

    # (2 Var) Left / Right Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.LR_TIME]
    menu_item_var_1[menu_item_size] = databot.mvmt_left_min[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_left_max[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_right_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_right_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (2 Var) Forward /Backward Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.FB_TIME]
    menu_item_var_1[menu_item_size] = databot.mvmt_fwd_min[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_fwd_max[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_back_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_back_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (Subtext) Vertical Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Vertical Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_TYPE]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_vert_type[0]]
    menu_item_var_2[menu_item_size] = databot.mvmt_vert_impulse[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_vert_interval[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_SCALAR, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_3var()

    # (2 Var) Verical Probability
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VERT_CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_jump_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_jump_interval[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_crouch_chance[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_crouch_interval[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (2 Var) Jump Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MIN_MAX]
    menu_item_var_1[menu_item_size] = databot.mvmt_jump_min[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_jump_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_2var()

    # (4 Var) Crouch Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.CROUCH_TIME]
    menu_item_var_1[menu_item_size] = databot.mvmt_crouch_min[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_crouch_max[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_uncrouch_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_uncrouch_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (Subtext) Idle Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Idle Probability 
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.IDLE_CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_lr_idle_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_lr_idle_interval[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_fb_idle_chance[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_fb_idle_interval[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (2 Var) Idle Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_submenu_2[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.IDLE_TIME]
    menu_item_var_1[menu_item_size] = databot.mvmt_lr_idle_min[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_lr_idle_max[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_fb_idle_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_fb_idle_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()
