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
globalvar help_configs
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
globalvar strings_submenu_0
globalvar strings_submenu_1
globalvar strings_submenu_2
globalvar strings_submenu_3
globalvar strings_submenu_2_1
globalvar strings_options
globalvar strings_controls
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
playervar import_mode

playervar scen_player_spawn

playervar bot_slot_status
playervar bot_hero_pool
playervar bot_health
playervar bot_hps
playervar bot_hps_wait
playervar bot_speed_type
playervar bot_speed_min
playervar bot_speed_max
playervar bot_speed_elims
playervar bot_scale_type
playervar bot_scale_min
playervar bot_scale_max
playervar bot_gravity
playervar bot_spawn_type
playervar bot_spawn_vect
playervar bot_facing_type
playervar bot_facing_vect
playervar bot_bound_pos
playervar bot_bound_angle
playervar bot_bound_dim
playervar bot_dist_min
playervar bot_dist_max
playervar bot_profile_status
playervar bot_profile_type
playervar bot_profile_min
playervar bot_profile_max
playervar bot_script_status

playervar prof_weight

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
subroutine create_hud
subroutine setup_menu_custom
subroutine create_submenu_main
subroutine create_submenu_bot
subroutine create_submenu_profile
subroutine create_submenu_scenario
subroutine create_submenu_movement
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
subroutine act_general_num_var_1
subroutine act_general_num_var_2
subroutine act_general_num_var_3
subroutine act_general_num_var_4
subroutine act_general_toggle_status
subroutine act_general_toggle_var_1
subroutine act_general_toggle_var_2
subroutine act_general_change_vect
subroutine act_general_change_list
subroutine act_general_change_list_var_1
subroutine act_general_change_min_max
### Custom Actions
#### Main Menu
subroutine act_main_open_hero_sel
subroutine act_main_toggle_import
subroutine act_main_toggle_export
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
subroutine act_bot_bound_pos
subroutine act_bot_bound_dim
subroutine act_bot_distance
subroutine act_bot_select_profile
subroutine act_bot_rand_profile
subroutine act_bot_script_status
#### Profile Menu
subroutine act_prof_select_prof
subroutine subact_select_prof_refresh
subroutine act_prof_override_prof
subroutine subact_prof_override_slot
subroutine act_prof_change_weight
## Bot Generation
subroutine create_bot
subroutine destroy_bot
## Data Bot
subroutine setup_databot
subroutine import_settings
subroutine default_settings

# ENUMS

enum SUBMENUS:
    SUBMENU_MAIN = 0,
    SUBMENU_SCENARIO,
    SUBMENU_BOT,
    SUBMENU_PROFILE,
    SUBMENU_MOVEMENT

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
    RANGE_NONE = 0,
    RANGE_SLOT,
    RANGE_HERO,
    RANGE_PERCENTAGE,
    RANGE_ANGLE,
    RANGE_DISTANCE,
    RANGE_TIME,
    RANGE_SCALAR,
    RANGE_VECTOR,
    RANGE_SCORE

enum SMALL_TYPE:
    SMALL_NONE = 0,
    SMALL_0_01,
    SMALL_1

enum LARGE_TYPE:
    LARGE_NONE = 0,
    LARGE_1,
    LARGE_10,


enum DATA_TYPE:
    DATA_STATIC = 0,
    DATA_BOT,
    DATA_MENU,
    DATA_CONTROLS

enum HELP_CONFIGS:
    DEFAULT = 0,
    CYCLE,
    CYCLE_TOGGLE,
    CYCLE_OVERRIDE,
    SUBITEM_CYCLE,
    SUBITEM_TOGGLE,
    SUBITEM_VECT,
    SUBITEM_VECT_TOGGLE
    
enum GENERAL_TARGET:
    VECT_X = 0,
    VECT_Y,
    VECT_Z,
    MIN,
    MAX

enum TAG_TYPE:
    HEALTH = 0,
    MIN_MAX,
    TYPE_MIN_MAX_TIME,
    TYPE_MIN_MAX_ELIM,
    VECT,
    TYPE_VECT,
    ANGLE_DIM

enum STORED_ITEMS:
    BOUNDS_1 = 0,
    BOUNDS_2,
    DISTANCE,
    

enum OPTIONS_TYPE:
    TOGGLE = 0,
    VISIBILITY,
    GAME_TYPE,
    SPEED,
    SCALE,
    SPAWN,
    FACING,
    PROFILE


globalvar bot_slot
globalvar profile_slot
globalvar new_hero_array

globalvar action_var
globalvar action_var_2
globalvar action_var_3
globalvar action_result
globalvar general_small
globalvar general_large
globalvar general_range_min
globalvar general_range_max

globalvar general_option_size
globalvar general_target
globalvar refresh_index

globalvar menu_effect_index
globalvar unit_cube
globalvar effect_array
globalvar start_pos
globalvar scalar_length
globalvar scalar_height
globalvar scalar_width
globalvar start_angle
globalvar ring_data
subroutine destroy_effects
subroutine update_bound_effect
subroutine create_bound_effect
subroutine update_distance_effect
subroutine create_distance_effect
globalvar display_help