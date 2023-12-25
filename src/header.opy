# Global Variables
## Control Flow
globalvar loop_index
globalvar data_loaded
## Menu Characteristics
globalvar menu_visible
globalvar menu_action
globalvar menu_wait
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
playervar bot_slots
playervar bot_hero_pool
playervar bot_health
playervar bot_hps
playervar bot_hps_wait
playervar bot_scale
playervar bot_spawn_type
playervar bot_position
playervar bot_facing_type
playervar bot_facing_vector
playervar bot_lower_bound
playervar bot_upper_bound
playervar bot_distance
playervar bot_movement_profile
playervar bot_randomize_profile
### Movement Settings
playervar data_mvmt_lr
playervar data_mvmt_lr_time
playervar data_mvmt_lr_speed
playervar data_mvmt_lr_random
playervar data_mvmt_fb
playervar data_mvmt_fb_time
playervar data_mvmt_fb_speed
playervar data_mvmt_fb_random
playervar data_mvmt_gravity
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
subroutine act_general_chg_var_1_num
subroutine act_general_chg_var_2_num
subroutine act_general_chg_var_3_num
subroutine act_general_toggle_var_1_bool
### Custom Actions
#### Main Menu
subroutine act_sub0_open_hero_sel
#### Bot Submenu
subroutine act_bot_select_slot
subroutine act_bot_override_slot
subroutine act_bot_hero_pool
subroutine act_bot_health
subroutine subact_bot_override_slot
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

enum RANGE_INDEXES:
    RANGE_SLOT = 0,
    RANGE_HERO,
    RANGE_PERCENTAGE,
    RANGE_DISTANCE,
    RANGE_TIME,
    RANGE_SCALAR,
    RANGE_VECTOR,
    RANGE_SCORE

enum SMALL_INDEXES:
    SMALL_0_01 = 0,
    SMALL_1

enum LARGE_INDEXES:
    LARGE_1 = 0,
    LARGE_10,


enum DATA_INDEXES:
    DATA_STATIC = 0,
    DATA_BOT,
    DATA_MENU,
    DATA_CONTROLS

enum HELP_CONFIGS:
    DEFAULT = 0,
    CYCLE,
    CYCLE_LIST,
    OVERRIDE_LIST
    

globalvar action_var
globalvar bot_slot
globalvar new_hero_array