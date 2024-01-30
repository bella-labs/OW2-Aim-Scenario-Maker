# Global Variables
## Control Flow
globalvar loop_index
globalvar data_loaded
## Menu Characteristics
globalvar menu_visible
globalvar menu_action
globalvar menu_wait
globalvar menu_wait_index
## Menu Indexes
globalvar menu_index
globalvar submenu_index
globalvar submenu_start_indexes
globalvar subitem_index
## Menu Size
globalvar menu_max_pos
globalvar menu_item_size
globalvar menu_label_size
globalvar subitem_size
globalvar submenu_size 
## Menu Visiblity
globalvar menu_label_hidden
globalvar menu_item_hidden
## Menu Text
globalvar menu_label
globalvar menu_item_title_off
globalvar menu_item_title_on
globalvar menu_item_var_1
globalvar menu_item_var_2
globalvar menu_item_var_3
globalvar menu_item_var_4
globalvar menu_item_help
globalvar menu_item_var_tags
globalvar menu_item_range
globalvar menu_item_small_step
globalvar menu_item_large_step
## Menu Color Arrays
globalvar menu_label_color
globalvar menu_item_color_off
globalvar menu_item_color_on
## Static Menu Colors
globalvar menu_color_label_subtext
globalvar menu_color_label_header
globalvar menu_color_off_index
globalvar menu_color_on_index
globalvar menu_colors_custom
## Menu HUD
globalvar hud_text_id
globalvar menu_help_index
globalvar menu_help_display
globalvar help_data
## Menu Actions
globalvar submenu_curr_start
globalvar chg_submenu_target
globalvar chg_submenu_item_target
## UI
globalvar user_controls
globalvar ui_delay
globalvar ui_inputs
## Bot Generation
globalvar bot_gen_hero
globalvar bot_gen_team
globalvar bot_gen_slot
globalvar bot_gen_position
globalvar bot_gen_facing
## Strings
globalvar strings_help
globalvar strings_prompt
globalvar strings_inputs
globalvar strings_misc
globalvar strings_on_titles
globalvar strings_labels
globalvar strings_main_menu
globalvar strings_bot_menu
globalvar strings_prof_menu
globalvar strings_sce_menu
globalvar strings_options
globalvar strings_instructions
globalvar strings_tags
globalvar strings_symbols
## Menu Limits and Steps
globalvar ranges
globalvar small_steps
globalvar large_steps
## Databot
globalvar databot
## Lanaguage
globalvar lang_type
## Action
globalvar confirm_timer
globalvar hero_array

# Player Variables
## Data Storage
### Bot Settings
#### Import Status
#### Game Mode
playervar sce_game_mode
playervar sce_game_limit
#### Bot Respawn
playervar sce_spawn_order
playervar sce_respawn_min
playervar sce_respawn_max
#### Points
playervar sce_bs_points
playervar sce_hs_points
playervar sce_elim_points
#### Strafe Score
playervar sce_strafe_pps
playervar sce_strafe_min
playervar sce_strafe_max
#### Spawn
playervar sce_player_spawn
#### Facing
playervar sce_player_facing
#### Speed
playervar sce_player_speed
#### Gravity
playervar sce_player_gravity
#### Custom Script
playervar sce_custom_status
#### Slot
playervar bot_slot_status
#### Spawn
playervar bot_spawn_type
playervar bot_spawn_vect
#### Facing
playervar bot_facing_type
playervar bot_facing_vect
#### Bounds
playervar bot_bound_type
playervar bot_bound_pos
playervar bot_bound_angle
playervar bot_bound_dim
#### Distance
playervar bot_dist_min
playervar bot_dist_max
#### Hero Pool
playervar bot_hero_pool
#### Health
playervar bot_health
playervar bot_hps
playervar bot_hps_wait
#### Speed
playervar bot_speed_type
playervar bot_speed_min
playervar bot_speed_max
playervar bot_speed_target
#### Scale
playervar bot_scale_type
playervar bot_scale_min
playervar bot_scale_max
playervar bot_scale_target
#### Gravity
playervar bot_gravity
#### Profile
playervar bot_profile_weights
playervar bot_profile_max_weight
#### Profile Order
playervar bot_profile_type
playervar bot_profile_min
playervar bot_profile_max
#### Custom Script
playervar bot_script_status

#### Horizontal Type
playervar mvmt_hori_type
playervar mvmt_hori_impulse
playervar mvmt_hori_interval
#### Horizontal Weights
playervar mvmt_weights
playervar mvmt_max_weight
#### Left / Right Time
playervar mvmt_left_min
playervar mvmt_left_max
playervar mvmt_right_min
playervar mvmt_right_max
#### Forward / Back Time
playervar mvmt_fwd_min
playervar mvmt_fwd_max
playervar mvmt_back_min
playervar mvmt_back_max
#### Diagonals Time
playervar mvmt_fl_min
playervar mvmt_fl_max
playervar mvmt_fr_min
playervar mvmt_fr_max
playervar mvmt_bl_min
playervar mvmt_bl_max
playervar mvmt_br_min
playervar mvmt_br_max
#### Vertical Type
playervar mvmt_vert_type
playervar mvmt_vert_impulse
playervar mvmt_vert_interval
#### Jump
playervar mvmt_jump_chance
playervar mvmt_jump_interval
playervar mvmt_jump_min
playervar mvmt_jump_max
#### Crouch
playervar mvmt_crouch_chance
playervar mvmt_crouch_interval
playervar mvmt_uncrouch_min
playervar mvmt_uncrouch_max
#### Idle Probability 
playervar mvmt_lr_idle_chance
playervar mvmt_lr_idle_interval
playervar mvmt_fb_idle_chance
playervar mvmt_fb_idle_interval
#### Idle Time
playervar mvmt_lr_idle_min
playervar mvmt_lr_idle_max
playervar mvmt_fb_idle_min
playervar mvmt_fb_idle_max


### Scenario Settings

# Subroutines
## UI Framework
### Menu Navigation
subroutine enable_player_input
subroutine disable_player_input
subroutine menu_up_check
subroutine menu_down_check
subroutine update_help_data
### Menu Labels
subroutine increment_for_menu_label
subroutine new_menu_label_header
subroutine new_menu_label_subheader
subroutine new_menu_label_subtext
### Menu Items
subroutine increment_for_menu_item
subroutine new_menu_item_selection
subroutine new_menu_item_toggle
subroutine new_menu_item_cycle
subroutine new_menu_item_2var
subroutine new_menu_item_3var
subroutine new_menu_item_4var
### Menu Submenu
subroutine increment_for_submenu_item
### Menu Setup
subroutine setup_menu
## UI Builder
subroutine create_custom_hud
subroutine create_help_hud
subroutine setup_menu_custom
subroutine create_submenu_main
subroutine create_submenu_scenario
subroutine create_submenu_bot
subroutine create_submenu_profile

## Menu Actions
### Control Flow
subroutine perform_action
subroutine menu_act_submenu_main
subroutine menu_act_submenu_scenario
subroutine menu_act_submenu_bot
subroutine menu_act_submenu_profile
subroutine menu_act_submenu_movement
### Generalized Actions
subroutine menu_act_change_submenu
subroutine act_general_chg_num
subroutine act_general_num_temp
subroutine act_general_num_var_1
subroutine act_general_num_var_2
subroutine act_general_num_var_3
subroutine act_general_num_var_4
subroutine act_general_toggle_status
subroutine act_general_toggle_var_1
subroutine act_general_toggle_var_2
subroutine act_general_toggle_var_3
subroutine act_general_toggle_var_4
subroutine act_general_change_vect
subroutine act_general_change_list
subroutine act_general_change_list_var_1
subroutine act_general_change_min_max
subroutine act_general_calc_weights
subroutine act_general_unsum_weights
### Custom Actions
#### Main Menu
subroutine act_main_open_hero_sel
subroutine act_main_display_boundary
subroutine act_main_test_bot_in_slot
subroutine act_main_test_scenario
subroutine act_main_reset_score
subroutine act_main_toggle_import
subroutine act_main_toggle_export
subroutine act_main_create_export
#### Scenario Submenu
subroutine act_sce_player_spawn
subroutine act_sce_player_facing
subroutine act_sce_player_speed
subroutine act_sce_player_gravity
subroutine act_sce_mode
subroutine act_sce_bot_spawn
subroutine act_sce_points
subroutine act_sce_strafe
subroutine act_sce_script_status
#### Bot Submenu
subroutine act_bot_select_slot
subroutine subact_select_slot_refresh
subroutine act_bot_override_slot
subroutine subact_bot_override_slot
subroutine act_bot_hero_pool
subroutine act_bot_health
subroutine act_bot_speed
subroutine act_bot_scale
subroutine act_bot_gravity
subroutine act_bot_spawn
subroutine act_bot_facing
subroutine act_bot_bound
subroutine act_bot_bound_dimentions
subroutine act_bot_distance
subroutine act_bot_select_profile
subroutine act_bot_profile_order
subroutine act_bot_script_status
#### Profile Submenu
subroutine act_mvmt_select_prof
subroutine subact_mvmt_select_refresh
subroutine act_mvmt_override_prof
subroutine subact_mvmt_override_slot
subroutine act_prof_change_weight
#### Movement Submenu
subroutine act_mvmt_hori_type
subroutine act_mvmt_left
subroutine act_mvmt_right
subroutine act_mvmt_forward
subroutine act_mvmt_backward
subroutine act_mvmt_vert_type
subroutine act_mvmt_jump
subroutine act_mvmt_crouch
subroutine act_mvmt_lr_idle
subroutine act_mvmt_fb_idle
## Bot Generation
subroutine create_target_bot
subroutine destroy_target_bot
## Data Bot
subroutine setup_databot
subroutine import_settings
subroutine default_settings











globalvar bot_slot
globalvar profile_slot
globalvar new_hero_array

globalvar action_var
globalvar action_var_2
globalvar action_var_3
globalvar action_result
globalvar action_temp
globalvar general_small
globalvar general_large
globalvar general_range_min
globalvar general_range_max

globalvar general_option_size
globalvar general_target
globalvar refresh_index
globalvar refresh_start

globalvar menu_effect_index
globalvar effect_array

globalvar ring_data
subroutine update_bound_effect
subroutine set_cube
globalvar display_help
globalvar active_bot_status

globalvar elims
globalvar timer
globalvar scenario_status

playervar boundary_limits

playervar cube

playervar calc_var

playervar is_in_bounds

playervar disabled_target

playervar disabled_hori
playervar disabled_vert
playervar owner_player
playervar profile_list
playervar profile_index
playervar profile_loop_index


subroutine sce_start_scenario
subroutine sce_stop_scenario


globalvar angle
subroutine set_disabled_index_dist




playervar target_mvmt_dir
playervar target_vert_dir
playervar target_rand
playervar target_mvmt_vect
playervar target_mvmt_index
playervar target_hori_wait
playervar target_vert_wait



subroutine act_general_clear
subroutine act_general_disable

globalvar profile_weights
globalvar movement_weights

subroutine teleport_target
subroutine select_mvmt_dir
playervar mvmt_interrupt

playervar xz_disabled

playervar disabled_index
playervar disabled_dir
playervar disabled_bound
playervar disabled_dist

globalvar calc1
globalvar calc2
globalvar calc3

subroutine disable_movement_boundary
subroutine disable_movement_distance

globalvar display_boundary

globalvar item_data

subroutine set_item_data

playervar target_impulse_wait

subroutine target_up_impulse
subroutine target_down_impulse

playervar target_lr_idle
playervar target_fb_idle

subroutine setup_player_in_scenario
playervar player_score
playervar last_score
playervar high_score
subroutine reset_player
globalvar sce_player

playervar player_speed

playervar strafe_dir
playervar strafe_timer

globalvar exportbot_status
globalvar databuilder
playervar export_data
globalvar exportbot

globalvar scenario_bot_index
globalvar scenario_bot
globalvar test_bot_index
subroutine show_next_bot

subroutine unload_settings


enum SUBMENUS:
    SUBMENU_MAIN = 0,
    SUBMENU_SCENARIO,
    SUBMENU_BOT,
    SUBMENU_PROFILE

enum INPUT_OPTIONS:
    VECT_FORWARD = 0,
    VECT_BACKWARD,
    VECT_LEFT,
    VECT_RIGHT,
    BUTTON_INTERACT,
    BUTTON_JUMP,
    BUTTON_CROUCH,
    BUTTON_MELEE,
    BUTTON_PRIMARY,
    BUTTON_SECONDARY,
    BUTTON_RELOAD,
    BUTTON_ABILITY_1,
    BUTTON_ABILITY_2,
    BUTTON_ULTIMATE

enum MENU_ACTIONS:
    MENU_TOGGLE = 0,
    MENU_UP,
    MENU_DOWN,
    MENU_STEP_LEFT,
    MENU_STEP_RIGHT,
    MENU_JUMP_LEFT,
    MENU_JUMP_RIGHT,
    MENU_NEXT_SUBITEM,
    MENU_SET_VECTOR

enum RANGE_TYPE:
    NONE = 0,
    SLOT,
    HERO,
    PERCENT,
    ANGLE,
    TIME,
    SCALAR,
    VECTOR,
    POINTS,

enum HELP_TYPE:
    DEFAULT = 0,
    CYCLE,
    CYCLE_TOGGLE,
    CYCLE_OVERRIDE,
    SUBITEM_CYCLE,
    SUBITEM_TOGGLE,
    SUBITEM_VECT,
    SUBITEM_VECT_OPT

enum ITEM_TYPE:
    NONE = 0,
    SLOT,
    TOGGLE_SLOT,
    OVERRIDE_SLOT,
    VECTOR,
    SCALAR,
    SCORE_TIME,
    SCORE_POINTS,
    POINTS,
    STRAFE,
    TYPE_VECT,
    BOUNDARY,
    DISTANCE,
    HERO,
    HEALTH,
    SPEED,
    SCALE,
    PROF_STATUS,
    ORDER,
    MVMT_TYPE,
    MVMT_DIR,
    CHANCE


enum SMALL_TYPE:
    NONE = 0,
    SM_0_01,
    SM_1

enum LARGE_TYPE:
    NONE = 0,
    LG_1,
    LG_10,

enum DATA_TYPE:
    STATIC = 0,
    BOT,
    MENU,
    CONTROLS
    
enum GENERAL_TARGET:
    VECT_X = 0,
    VECT_Y,
    VECT_Z,
    MIN,
    MAX

enum TAG_TYPE:
    NONE = 0,
    HEALTH,
    MIN_MAX,
    TARGET,
    PROFILE_STATUS,
    PROFILE_ORDER,
    VECT,
    TYPE_VECT,
    ANGLE_DIM,
    MVMT_TYPE,
    MVMT_DIR,
    CHANCE,
    SCE_TIMED,
    SCE_POINTS,
    POINTS,
    STRAFE
    

enum OPTIONS_TYPE:
    TOGGLE = 0,
    GAME_TYPE,
    TARGET,
    SPAWN,
    FACING,
    BOUNDS,
    PROFILE,
    MVMT_TYPE,
    SCE_MODE,
    SCE_ORDER

enum PLAYER_INDEXES:
    PROFILE = 0

enum PLAYER_RAND:
    XZ = 0,
    LR_IDLE,
    FB_IDLE,
    JUMP,
    CROUCH,
    PROFILE

enum XZ_DIR:
    BACKWARD = 0,
    BACKWARD_RIGHT,
    RIGHT,
    FORWARD_RIGHT,
    FORWARD,
    FORWARD_LEFT,
    LEFT,
    BACKWARD_LEFT,

enum YDIR:
    UP = 0,
    DOWN