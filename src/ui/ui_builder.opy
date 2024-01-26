rule "Menu Setup: Creation":
    @Event global
    @Condition data_loaded[DATA_TYPE.DATA_STATIC] 

    
    data_loaded[DATA_TYPE.DATA_MENU] = false

    setup_databot()
    waitUntil(data_loaded[DATA_TYPE.DATA_BOT] == true , 9999)

    create_custom_hud()
    create_help_hud()
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

    menu_color_on_index = rgb(100,200,240) 
    menu_color_label_subtext = rgb(255,150,80)

    menu_colors_custom[0] = rgb(255,100,120)
    menu_colors_custom[1] = rgb(100,200,120)
    menu_colors_custom[2] = rgb(240,120,100) 
    menu_colors_custom[3] = rgb(230,190,60) 
    menu_colors_custom[4] = rgb(110,150,250)

    bot_slot = 0
    profile_slot = 0
    display_help[0] = false
    display_help[1] = false
    display_boundary = false

    bot_gen_slot = 0
    for loop_index in range(0, 12, 1):
        active_bot_status[loop_index] = false

    action_var = databot.mvmt_weights[0]
    act_general_unsum_weights()
    movement_weights = action_result


def create_custom_hud():

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
    


def create_submenu_main():
    @Name "SUB: create_submenu_main"

    # (Subtext) Documentation prompt
    increment_for_menu_label()
    menu_label[menu_label_size] = "{0}{1}{2}".format(strings_symbols[0], strings_main_menu[lang_type][menu_max_pos], strings_symbols[0])
    new_menu_label_subheader()

    # (Header) Configure
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_main_menu[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Scenario
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Selection) Bot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Selection) Profiles
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Header) Test
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_main_menu[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Change Hero
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
    new_menu_item_selection()

    # (Selection) Display Boundaries
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
    action_var = false
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()

    # (Selection) Test Bot in Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
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
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[3]
    new_menu_item_selection()

    # (Header) Export
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_main_menu[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Toggle) Export Instruction
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[4]

    action_var = databot.sce_custom_status
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()

    # (Toggle) Import Instruction
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_main_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[4]

    action_var = databot.sce_custom_status
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()


def create_submenu_scenario():
    @Name "SUB: create_submenu_scenario"

    increment_for_submenu_item()

    # (Header) Scenario Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_sce_menu[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Subtext) Player
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Player Spawn

    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VECT]
    menu_item_var_1[menu_item_size] = databot.sce_player_spawn[0].x
    menu_item_var_2[menu_item_size] = databot.sce_player_spawn[0].y
    menu_item_var_3[menu_item_size] = databot.sce_player_spawn[0].z 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_3var()
    menu_effect_index[0] = (menu_item_size)

    # (3 Var) Player Facing

    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.VECT]
    menu_item_var_1[menu_item_size] = databot.sce_player_facing[0].x
    menu_item_var_2[menu_item_size] = databot.sce_player_facing[0].y
    menu_item_var_3[menu_item_size] = databot.sce_player_facing[0].z
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_3var()
    menu_effect_index.append(menu_item_size)

    # (Cycle) Player Speed
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.sce_player_speed
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Cycle) Player Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.sce_player_gravity
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Subtext) Scoring
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_sce_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Scenario Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
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
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
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
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
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

    # (Toggle) Player Custom Script
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_sce_menu[lang_type][menu_max_pos]
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
    menu_label[menu_label_size] = strings_bot_menu[lang_type][menu_max_pos] 
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Subtext) Slot
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_bot_menu[lang_type][menu_max_pos] 
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Toggle List) Select Bot Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos] 
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
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_OVERRIDE]
    new_menu_item_cycle()

    # (Subtext) Bot Spawn and Boundaries
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Spawn Settings

    increment_for_menu_item()

    refresh_start[0] = menu_item_size

    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TYPE_VECT]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][4][databot.bot_spawn_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_spawn_vect[0].x
    menu_item_var_3[menu_item_size] = databot.bot_spawn_vect[0].y
    menu_item_var_4[menu_item_size] = databot.bot_spawn_vect[0].z 
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_ANGLE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_OPT] 
    new_menu_item_4var()
    menu_effect_index.append(menu_item_size)

    # (4 Var) Facing Settings

    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TYPE_VECT]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.FACING][databot.bot_spawn_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_facing_vect[0].x
    menu_item_var_3[menu_item_size] = databot.bot_facing_vect[0].y
    menu_item_var_4[menu_item_size] = databot.bot_facing_vect[0].z
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_OPT] 
    new_menu_item_4var()
    menu_effect_index.append(menu_item_size)

    # (3 Var) Boundary
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TYPE_VECT]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.BOUNDS][databot.bot_bound_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_bound_pos[0].x
    menu_item_var_3[menu_item_size] = databot.bot_bound_pos[0].y
    menu_item_var_4[menu_item_size] = databot.bot_bound_pos[0].z
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_OPT] 
    new_menu_item_4var()
    menu_effect_index.append(menu_item_size)

    # (4 Var) Dimensions
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.ANGLE_DIM]
    menu_item_var_1[menu_item_size] = databot.bot_bound_angle[0]
    menu_item_var_2[menu_item_size] = databot.bot_bound_dim[0].x
    menu_item_var_3[menu_item_size] = databot.bot_bound_dim[0].y
    menu_item_var_4[menu_item_size] = databot.bot_bound_dim[0].z
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_ANGLE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT] 
    new_menu_item_4var()
    menu_effect_index.append(menu_item_size)

    # (2 Var) Distance
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MIN_MAX]
    menu_item_var_1[menu_item_size] = databot.bot_dist_min[0]
    menu_item_var_2[menu_item_size] = databot.bot_dist_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_2var()
    menu_effect_index.append(menu_item_size)

    # (Subtext) Bot Parameters
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Toggle List) Hero Pool
    increment_for_menu_item()

    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
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
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
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
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
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
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.TARGET]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.TARGET][databot.bot_scale_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_scale_min[0]
    menu_item_var_3[menu_item_size] = databot.bot_scale_max[0]
    menu_item_var_4[menu_item_size] = databot.bot_scale_target[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_4var()

    # (Percentage) Gravity
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = "{0} %".format(menu_item_title_off[menu_item_size])
    menu_item_var_1[menu_item_size] = databot.bot_gravity[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SCALAR]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Subtext) Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Toggle List) Select Profile
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos] 
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.PROFILE_STATUS]
    menu_item_var_1[menu_item_size] = 0

    action_var = databot.bot_profile_weights[0]
    act_general_unsum_weights()
    profile_weights = action_result
    
    action_var = profile_weights[0]
    act_general_disable()
    menu_item_var_2[menu_item_size] = action_var

    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT, RANGE_TYPE.RANGE_PERCENTAGE]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_10]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_TOGGLE]
    new_menu_item_2var()

    # (3 Var) Profile Order
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.PROFILE_ORDER]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.PROFILE][databot.bot_profile_type[0]]
    menu_item_var_2[menu_item_size] = databot.bot_profile_min[0]
    menu_item_var_3[menu_item_size] = databot.bot_profile_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_VECT_OPT]
    new_menu_item_3var()

    # (Toggle) Custom Script ID
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_bot_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]

    action_var = databot.bot_script_status[0]
    action_var_2 = menu_item_size
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    new_menu_item_toggle()


def create_submenu_profile():
    @Name "SUB: create_submenu_profile"

    increment_for_submenu_item()

    # (Header) Movement Settings
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_prof_menu[lang_type][menu_max_pos]
    new_menu_label_header()

    # (Selection) Main Menu
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_color_off[menu_item_size] = menu_colors_custom[2]
    new_menu_item_selection()

    # (Subtext) Movement Profiles
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (Cycle) Select Movement Profile Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE]
    new_menu_item_cycle()

    # (Cycle) Override Movement Profile From Slot
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = menu_item_title_off[menu_item_size]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_SLOT]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_1]
    menu_item_var_1[menu_item_size] = 0
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.CYCLE_OVERRIDE]
    new_menu_item_cycle()

    # (Subtext) Horizontal Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (3 Var) Horizontal Type
    increment_for_menu_item()
    
    refresh_start[1] = menu_item_size

    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_TYPE]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_hori_type[0]]
    menu_item_var_2[menu_item_size] = databot.mvmt_hori_impulse[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_hori_impulse[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_3var()



    # (3 Var) Left Movement
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_DIR]
    action_var = movement_weights[XZ_DIR.LEFT]
    act_general_disable()
    menu_item_var_1[menu_item_size] = action_var
    menu_item_var_2[menu_item_size] = databot.mvmt_left_min[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_left_max[0]

    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    ## (3 Var) Right Movement
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_DIR]
    action_var = movement_weights[XZ_DIR.RIGHT]
    act_general_disable()
    menu_item_var_1[menu_item_size] = action_var
    menu_item_var_2[menu_item_size] = databot.mvmt_right_min[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_right_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (3 Var) Forward Movement
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_DIR]
    action_var = movement_weights[XZ_DIR.FORWARD]
    act_general_disable()
    menu_item_var_1[menu_item_size] = action_var
    menu_item_var_2[menu_item_size] = databot.mvmt_fwd_min[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_fwd_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (3 Var) Backward Movement
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_DIR]
    action_var = movement_weights[XZ_DIR.BACKWARD]
    act_general_disable()
    menu_item_var_1[menu_item_size] = action_var
    menu_item_var_2[menu_item_size] = databot.mvmt_back_min[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_back_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_3var()

    # (Subtext) Vertical Movement
    increment_for_menu_label()
    menu_label[menu_label_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (2 Var) Vertical Type
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.MVMT_TYPE]
    menu_item_var_1[menu_item_size] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_vert_type[0]]
    menu_item_var_2[menu_item_size] = databot.mvmt_vert_impulse[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_vert_interval[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.NONE, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.NONE, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.NONE, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_TOGGLE]
    new_menu_item_3var()

    # (2 Var) Jump
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_jump_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_jump_interval[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_jump_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_jump_max[0] 
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (2 Var) Crouch
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.CHANCE]
    menu_item_var_1[menu_item_size] =  databot.mvmt_crouch_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_crouch_interval[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1] 
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_2var()

    # (4 Var) Crouch Time
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
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
    menu_label[menu_label_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    # (4 Var) Left / Right Idle
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_lr_idle_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_lr_idle_interval[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_lr_idle_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_fb_idle_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()

    # (2 Var) Forward / Backward Idle
    increment_for_menu_item()
    menu_item_title_off[menu_item_size] = strings_prof_menu[lang_type][menu_max_pos]
    menu_item_title_on[menu_item_size] = strings_on_titles[lang_type][0]
    menu_item_var_tags[menu_item_size] = strings_tags[lang_type][TAG_TYPE.CHANCE]
    menu_item_var_1[menu_item_size] = databot.mvmt_fb_idle_chance[0]
    menu_item_var_2[menu_item_size] = databot.mvmt_fb_idle_interval[0]
    menu_item_var_3[menu_item_size] = databot.mvmt_fb_idle_min[0]
    menu_item_var_4[menu_item_size] = databot.mvmt_fb_idle_max[0]
    menu_item_range[menu_item_size] = [RANGE_TYPE.RANGE_PERCENTAGE, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME, RANGE_TYPE.RANGE_TIME]
    menu_item_small_step[menu_item_size] = [SMALL_TYPE.SMALL_1, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01, SMALL_TYPE.SMALL_0_01]
    menu_item_large_step[menu_item_size] = [LARGE_TYPE.LARGE_10, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1, LARGE_TYPE.LARGE_1]
    menu_item_help[menu_item_size] = help_configs[HELP_CONFIGS.SUBITEM_CYCLE]
    new_menu_item_4var()
