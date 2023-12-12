# Global Variables
## Menu Characteristics
globalvar menu_enabled
globalvar menu_visible
globalvar menu_input
globalvar menu_wait
## Menu Index and Size
globalvar menu_index
globalvar submenu_index
globalvar submenu_start_index
globalvar menu_substart_value
globalvar menu_submenu_target
globalvar menu_index_target
globalvar menu_opt_size
globalvar menu_max_pos
globalvar menu_label_size
globalvar sub_size 
## Menu Visiblity
globalvar menu_label_hidden
globalvar menu_item_hidden
## Menu Text
globalvar menu_label
globalvar menu_off_opt_title
globalvar menu_on_opt_title
globalvar menu_opt_var_1
globalvar menu_opt_var_2
globalvar menu_opt_var_3
globalvar menu_opt_var_4
globalvar menu_opt_str_index
globalvar menu_opt_range_min
globalvar menu_opt_range_max
globalvar menu_opt_small_step
globalvar menu_opt_large_step

globalvar menu_subitem
globalvar menu_subitem_size
## Menu Color
globalvar menu_label_color
globalvar bar_color
globalvar menu_off_opt_color
globalvar menu_on_opt_color

globalvar menu_color_label_subtext
globalvar menu_color_label_header

globalvar menu_color_default_off_index
globalvar menu_color_default_on_index

globalvar menu_color_submenu

## Menu HUD
globalvar hud_text_id
## UI
globalvar controller_mode
globalvar ui_inputs
## Import 
globalvar use_import_data

# Player Variables
## Data Storage
### Bot Settings
playervar data_bot_hero_pool
playervar data_bot_health
playervar data_bot_scale
playervar data_bot_spawn_type
playervar data_bot_position
playervar data_bot_facing_type
playervar data_bot_facing_vector
playervar data_bot_lower_bound
playervar data_bot_upper_bound
playervar data_bot_distance
playervar data_bot_movement_profile
playervar data_bot_randomize_profile
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
## Menu Navigation
subroutine enable_player_input
subroutine menu_up_check
subroutine menu_down_check
## Menu Labels
subroutine increment_for_menu_label
subroutine new_menu_label_header
subroutine new_menu_label_subtext
## Menu Items
subroutine increment_for_menu_item
subroutine new_menu_item_selection
subroutine new_menu_item_toggle
subroutine new_menu_item_cycle
subroutine new_menu_item_2var
subroutine new_menu_item_3var
subroutine new_menu_item_4var
subroutine new_menu_item_cycle_bar
## Menu Submenu
subroutine increment_for_submenu_item
## Menu Creation
subroutine create_hud
subroutine setup_menu
subroutine create_submenu_0
subroutine create_submenu_1
subroutine create_submenu_2
subroutine create_submenu_3
subroutine create_submenu_4
subroutine create_submenu_2_1
## Submenu All
subroutine menu_act_submenu_0
subroutine menu_act_submenu_1
subroutine menu_act_submenu_2
subroutine menu_act_submenu_3
subroutine menu_act_submenu_2_1
subroutine menu_act_change_submenu
subroutine menu_act_change_number_var_1
subroutine menu_act_change_number_var_2
subroutine menu_act_change_number_var_3
subroutine menu_act_change_number_var_4
## Submenu 0
## Submenu 1
## UIs
subroutine set_ui_data
## Data Population
## Data Bot
subroutine setup_databot
subroutine import_settings
subroutine default_settings


# Bot Generation
## Global Variables
globalvar bot_gen_hero
globalvar bot_gen_team
globalvar bot_gen_slot
globalvar bot_gen_position
globalvar bot_gen_facing
globalvar databot
globalvar databot_loaded
globalvar entity_pos
## Subroutines
subroutine create_bot
subroutine destroy_bot

globalvar hero_array

globalvar strings_controls
globalvar strings_hero_status
globalvar strings_labels
globalvar strings_submenu_0
globalvar strings_submenu_1
globalvar strings_submenu_2
globalvar strings_submenu_3
globalvar strings_submenu_2_1
globalvar strings_options