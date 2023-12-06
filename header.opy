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
globalvar menu_opt_var
globalvar bar_title
globalvar bar_var
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
globalvar default_menu_return_color
globalvar default_menu_cycle_color
globalvar default_menu_vector_color

## Menu HUD
globalvar hud_text_id
## UI
globalvar controller_mode
globalvar ui_inputs
## Import 
globalvar use_import_data

# Player Variables
## Player
playervar player_spawn
playervar score_type
## Profile
playervar profile_count

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
subroutine new_menu_item_cycle_bar
## Menu Submenu
subroutine increment_for_submenu_item
## Menu Creation
subroutine create_menu
subroutine menu_defaults
subroutine create_submenu_0
subroutine create_submenu_1
subroutine create_submenu_2
subroutine create_submenu_3
subroutine create_submenu_4
## Submenu All
subroutine menu_act_change_submenu
## Submenu 0
## Submenu 1
## UIs
subroutine set_ui_data
## Data Population
subroutine import_player_menu
subroutine default_player_menu