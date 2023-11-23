settings {
    "main": {
        "description": "Aim Scenario Creator\n\nFeatures:\n◆ Create Aim Scenarios\nReport bugs on my discord:discord.gg/YPQ5ETNT45\n",
        "modeName": "Bella's Aim Scenario Creator"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "mapRotation": "paused",
        "team1Slots": 4,
        "team2Slots": 0,
        "returnToLobby": "never"
    },
    "gamemodes": {
        "skirmish": {
            "enabledMaps": [
                "workshopChamber"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "tankPassiveHealthBonus": "alwaysEnabled"
        }
    },
    "heroes": {
        "team2": {
            "pharah": {
                "secondaryFireMaximumTime%": 500,
                "secondaryFireRechargeRate%": 500,
                "ability1Cooldown%": 0,
            }
        },
        "allTeams": {
            "general": {
                "abilityCooldown%": 10,
                "enableSpawningWithUlt": true,
                "ultGen%": 500,
                "combatUltGen%": 500,
                "passiveUltGen%": 500
            }
        }
    }
}

# Global
## Menu 
### General
globalvar menu_visible
globalvar menu_input
globalvar menu_wait
### Index
globalvar menu_index
globalvar submenu_index
globalvar submenu_start_index
globalvar menu_substart_value
globalvar menu_submenu_target
globalvar menu_opt_size
globalvar menu_max_pos
globalvar menu_label_size
globalvar sub_size 
### Visiblity
globalvar menu_label_hidden
globalvar menu_item_hidden
### Text
globalvar menu_label
globalvar menu_off_opt_title
globalvar menu_on_opt_title
globalvar menu_opt_var
globalvar bar_title
globalvar bar_var
### Color
globalvar menu_label_color
globalvar bar_color
globalvar menu_off_opt_color
globalvar menu_on_opt_color
globalvar default_menu_label_color
globalvar default_menu_off_index_color
globalvar default_menu_on_index_color
## Score Tracker
globalvar progress_tracker
globalvar score
## Change Character
globalvar player_hero_list
## UI 
globalvar console_ui
## Import 
globalvar import_script
globalvar data_loaded
# Player
playervar player_spawn
playervar score_type
# Profile
playervar profile_count
playervar profile_data
# Subroutine
subroutine import_script_subroutine
## Hud Generation
subroutine menu_hud
## Player Menu
### Menu Defaults
subroutine default_player_menu
### Menu Navigation Actions
subroutine enable_player_input
subroutine menu_up_check
subroutine menu_down_check
### Menu Labels
subroutine increment_for_menu_label
subroutine new_menu_label_header
subroutine new_menu_label_subtext
### Menu Items
subroutine increment_for_menu_item
subroutine new_menu_item_selection
subroutine new_menu_item_toggle
subroutine new_menu_item_cycle
subroutine new_menu_item_cycle_bar
### Submenu
subroutine increment_for_submenu_item
### Menu Actions
#### Submenu 0
subroutine menu_act_change_submenu
subroutine menu_act_save_profile
subroutine menu_act_cycle_player_x
subroutine menu_act_cycle_player_y
subroutine menu_act_cycle_player_z
subroutine menu_act_cycle_player_speed
subroutine menu_act_cycle_player_gravity
subroutine menu_act_toggle_player_impulse
subroutine menu_act_change_score_type
subroutine menu_act_change_score_limit
subroutine menu_act_cycle_score_kill
subroutine menu_act_cycle_score_body
subroutine menu_act_cycle_score_head
subroutine menu_act_cycle_score_strafe
subroutine menu_act_cycle_score_strafe_min
subroutine menu_act_cycle_score_strafe_max
#### Submenu 1
subroutine menu_act_cycle_bot_slot
subroutine menu_act_bot_hero_pool
subroutine menu_act_cycle_bot_health
subroutine menu_act_cycle_bot_scale
subroutine menu_act_cycle_bot_speed_type
subroutine menu_act_cycle_bot_speed_min
subroutine menu_act_cycle_bot_speed_max
subroutine menu_act_cycle_bot_gravity
subroutine menu_act_cycle_spawn_x
subroutine menu_act_cycle_spawn_y
subroutine menu_act_cycle_spawn_z
subroutine menu_act_cycle_boundary_type
subroutine menu_act_cycle_boundary_lower_x
subroutine menu_act_cycle_boundary_lower_y
subroutine menu_act_cycle_boundary_lower_z
subroutine menu_act_cycle_boundary_upper_x
subroutine menu_act_cycle_boundary_upper_y
subroutine menu_act_cycle_boundary_upper_z
subroutine menu_act_cycle_boundary_dist_min
subroutine menu_act_cycle_boundary_dist_max
subroutine menu_act_cycle_facing_type
subroutine menu_act_cycle_facing_x
subroutine menu_act_cycle_facing_y
subroutine menu_act_cycle_facing_z
subroutine menu_act_cycle_movement_profile
#### Submenu 2
subroutine menu_act_toggle_AD
subroutine menu_act_cycle_AD_min
subroutine menu_act_cycle_AD_max 
subroutine menu_act_toggle_WS
subroutine menu_act_cycle_WS_min
subroutine menu_act_cycle_WS_max 
subroutine menu_act_cycle_jump 
subroutine menu_act_cycle_crouch 
subroutine menu_act_cycle_uncrouch_min 
subroutine menu_act_cycle_uncrouch_max 
subroutine menu_act_toggle_bot_impulse 
subroutine menu_act_cycle_profile_slot 
subroutine menu_act_select_save_profile

#Extensions
#!extension spawnMoreDummyBots

# Workshop Initialization Rules
def import_script_subroutine():
    @Name "----->  Paste Player Variables Here  <-----"

    smallMessage(null, "paste here!")

rule "Initialize: Workshop Settings":

    ## UI Settings

    console_ui = createWorkshopSetting(bool, "0. UI Settings", "Console UI", false, 0)
    import_script = createWorkshopSetting(bool, "1. Import Settings", "Import Existing Settings (Paste Player Variables in the 1st workshop rule)", false, 0)


rule "Player Spawned":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    
    # Turn off menu
    menu_visible = false
    # Allow player to use inputs
    enable_player_input()
    # Make player unkillable by default.
    eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, 9999)

    if import_script == true:
        import_script_subroutine()
    else:
        default_player_menu()

    data_loaded = true


# UI Elements
rule "Menu Creation":
    @Event global

    default_menu_label_color = Color.WHITE
    default_menu_off_index_color = Color.WHITE
    default_menu_on_index_color = Color.TEAM_1

    waitUntil(data_loaded == true, 9999)

    menu_hud()

    hudSubtext(localPlayer, "Position {0}".format(localPlayer.getPosition()), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(localPlayer, "Facing:  {0}  ".format(localPlayer.getFacingDirection()), HudPosition.RIGHT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "Menu Controls: Toggle Menu with Interact":
    @Event eachPlayer
    @Team 1
    # Change this condition to whatever button(s) you want to trigger the main menu. 
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if console_ui == true:
        wait(1)
        if eventPlayer.isHoldingButton(Button.INTERACT) == false:
            return
    # A toggle for the menu_visible flag
    if menu_visible == true:
        menu_visible = false
    else:
        menu_visible = true


rule "Menu Controls: Toggle On Setup":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.setMoveSpeed(0)


rule "Menu Controls: Toggle Off Setup Player":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == false

    enable_player_input()


rule "Menu Controls: Toggle Off Setup Game":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == false

    smallMessage(null, "")


rule "Menu Controls: Up Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    # We use the player's movement keys to navigate the menu.
    # If you'd like to use a button input instead, change this condition.
    @Condition (console_ui == false and eventPlayer.getThrottle() == Vector.FORWARD) or (console_ui == true and eventPlayer.isHoldingButton(Button.ULTIMATE))
    
    menu_up_check()
    while menu_item_hidden[menu_index] == true:
        menu_up_check()


rule "Menu Controls: Down Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    # We use the player's movement keys to navigate the menu.
    # If you'd like to use a button input instead, change this condition.
    @Condition (console_ui == false and eventPlayer.getThrottle() == Vector.BACKWARD) or (console_ui == true and eventPlayer.isHoldingButton(Button.JUMP))
    
    menu_down_check()
    while menu_item_hidden[menu_index] == true:
        menu_down_check()

        
def menu_up_check():
    @Name "SUB: menu_up_check"

    # If the menu index is equal to the start of the submenu start location
    if menu_index - submenu_start_index[submenu_index] <= 0:
        # then loop to the end of the submenu
        menu_index = submenu_start_index[submenu_index+1] - 1
    else:
        # otherwise move up 1 on the menu.
        menu_index -= 1


def menu_down_check():
        @Name "SUB: menu_down_check"    

    # If the menu index is equal to the end of our submenu
    if menu_index >= submenu_start_index[submenu_index+1] - 1:
        # then loop to the start of the submenu
        menu_index = submenu_start_index[submenu_index]
    else:
        # then move down 1 on the menu.
        menu_index += 1


def enable_player_input():
    @Name "SUB: enable_player_input"
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.setMoveSpeed(100)

def increment_for_menu_label():
    @Name "SUB: increment_menu_label"

    menu_label_size += 1
    menu_max_pos += 1


def increment_for_menu_item():
    @Name "SUB: increment_for_menu_item"

    menu_opt_size += 1
    menu_max_pos += 1
    submenu_start_index[sub_size+1] = menu_opt_size+1


def increment_for_submenu_item():
    @Name "SUB: increment_for_new_submenu"

    sub_size += 1
    menu_max_pos = -1


def new_menu_label_header():
    @Name "SUB: new_menu_label_header"

    hudHeader([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(sub_size)
        and menu_label_hidden[evalOnce(menu_label_size)] != true], 
    "{0}".format(menu_label[evalOnce(menu_label_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_label_color[evalOnce(menu_label_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_label_subtext():
    @Name "SUB: new_menu_label_subtext"

    hudSubtext([i for i in localPlayer if menu_visible
        and submenu_index == evalOnce(sub_size)
        and menu_label_hidden[evalOnce(menu_label_size)] != true], 
    "{0}".format(menu_label[evalOnce(menu_label_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_label_color[evalOnce(menu_label_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)
    

def new_menu_item_selection():
    @Name "SUB: new_menu_item_selection"

    # Case: index off
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index != evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_off_opt_color,
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)
    # Case: index on
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index == evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true],
    "■  {0}".format(menu_on_opt_title[evalOnce(menu_opt_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_on_opt_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_item_toggle():
    @Name "SUB: new_menu_item_toggle"

    # Case: index off
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index != evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_off_opt_color,
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)

    # Case: index on, see menu_act_toggle to see how to update the menu_opt_var string.
    hudSubheader([i for i in localPlayer if menu_visible 
        and menu_index == evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true],
    "■  {0}{1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var[evalOnce(menu_opt_size)]), 
    HudPosition.TOP,
    evalOnce(menu_max_pos),
    menu_on_opt_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)


def new_menu_item_cycle():
    @Name "SUB: new_menu_item_cycle"

    # Case: index off
    hudSubheader(
    [i for i in localPlayer if menu_visible
        and menu_index != evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color, 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)

    # Case: index on, see menu_act_cycle to see how to update the menu_opt_var string.
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index == evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "■ {0} ←  {1}  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var[evalOnce(menu_opt_size)]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle_bar():
    @Name "SUB: new_menu_item_cycle_bar"

    # Case: index off
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index != evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color, 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)

    # Case: index on, see menu_act_cycle_bar to see how to update the menu_opt_var string.
    hudSubheader(
    [i for i in localPlayer if menu_visible 
        and menu_index == evalOnce(menu_opt_size) 
        and submenu_index == evalOnce(sub_size)
        and menu_item_hidden[evalOnce(menu_opt_size)] != true], 
    "■  {0}  {1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], menu_opt_var[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)

    # Increment Menu Position
    menu_max_pos += 1

    # Submenu hudheader
    hudHeader(
    [i for i in localPlayer if menu_visible 
    and menu_index == evalOnce(menu_opt_size) 
    and submenu_index == evalOnce(sub_size)], 
    "{0} ←  {1}  →".format(bar_title[menu_index], bar_var[menu_index]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    bar_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)

def default_player_menu():
    @Name "SUB: default_player_menu"

    eventPlayer.player_spawn = vect(1,2,3)
    menu_opt_var[2] = eventPlayer.player_spawn.x
    menu_opt_var[3] = eventPlayer.player_spawn.y
    menu_opt_var[4] = eventPlayer.player_spawn.z
    
    eventPlayer.score_type = "timer"
    menu_opt_var[12] = eventPlayer.score_type


def menu_hud():
    @Name "SUB: menu_hud"

    # Default Menu Variables
    submenu_start_index[0] = 0
    submenu_start_index[1] = 1
    menu_max_pos = -1
    menu_label_size = -1
    menu_opt_size = -1
    sub_size = 0
    menu_off_opt_color = default_menu_off_index_color
    
    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Settings"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Movement"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Player Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player X Spawn"
    menu_on_opt_title[menu_opt_size] = "X Coord: "
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Y Spawn"
    menu_on_opt_title[menu_opt_size] = "Y Coord: "
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Z Spawn"
    menu_on_opt_title[menu_opt_size] = "Z Coord: "
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Use Impluse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Score Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Type"
    menu_on_opt_title[menu_opt_size] = "Type: "
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Time / Kills"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Per Kill"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Per Bodyshot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Per Headshot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Strafe Score"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Min Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Max Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_submenu_item()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Return to Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "General Bot Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Hero Pool"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Health"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Scale"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Speed Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Speed Min"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Speed Max"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Spawn Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "X Spawn Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Y Spawn Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Z Spawn Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Boundary Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Boundary Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "X Lower Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Y Lower Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Z Lower Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "X Upper Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Y Upper Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Z Upper Boundary"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Min Distance"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Max Distance"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Facing Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Facing Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "X Facing"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Y Facing"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Z Facing"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Profile Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Movement Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_submenu_item()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Return to Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Horizontal Movement"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Min Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Max Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Min Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Max Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Vertical Movement"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Jump Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Crouch Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Min Uncrouch Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Max Uncrouch Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Advanced Movement"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Use Impluse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Profile Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Profile Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Save Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_on_index_color
    new_menu_item_selection()



    # Player Menu
rule "Menu Actions: Input Read":
    @Event eachPlayer
    @Condition menu_visible == true
    @Condition (console_ui == false and (eventPlayer.isHoldingButton(Button.ULTIMATE) == true or eventPlayer.isHoldingButton(Button.ABILITY_2) == true or eventPlayer.getThrottle() == Vector.LEFT or eventPlayer.getThrottle() == Vector.RIGHT or eventPlayer.isHoldingButton(Button.CROUCH)) == true) or (console_ui == true and (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.isHoldingButton(Button.ABILITY_2) or eventPlayer.isHoldingButton(Button.CROUCH)))
    
    # We use the player variable menu_input to tell the subroutines we call that the player inputed one of our selection keys.
    if console_ui == false:
        if eventPlayer.isHoldingButton(Button.CROUCH):
            menu_input = 2
        elif eventPlayer.getThrottle() == Vector.RIGHT:
            menu_input = 1
        elif eventPlayer.isHoldingButton(Button.ABILITY_2):
            menu_input = 0
        elif eventPlayer.getThrottle() == Vector.LEFT:
            menu_input = -1
        elif eventPlayer.isHoldingButton(Button.ULTIMATE):
            menu_input = -2
    else:
        if eventPlayer.isHoldingButton(Button.CROUCH):
            menu_input = 2
        elif eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
            menu_input = 1
        elif eventPlayer.isHoldingButton(Button.ABILITY_2):
            menu_input = 0
        elif eventPlayer.isHoldingButton(Button.ABILITY_1):
            menu_input = -1
        elif eventPlayer.isHoldingButton(Button.SECONDARY_FIRE):
            menu_input = -2


    menu_substart_value = submenu_start_index[submenu_index]
    menu_wait = 0.1

    if submenu_index == 0:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 1
            menu_act_change_submenu()
        elif menu_index == 1 + menu_substart_value:
            menu_submenu_target = 2
            menu_act_change_submenu()
        elif menu_index == 2 + menu_substart_value:
            menu_wait = 0.032
            menu_act_cycle_player_x()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_player_y()
        elif menu_index == 4 + menu_substart_value:
            menu_act_cycle_player_z()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_player_speed()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_player_gravity()
        elif menu_index == 7 + menu_substart_value:
            menu_act_toggle_player_impulse()
        elif menu_index == 8 + menu_substart_value:
            menu_act_change_score_type()
        elif menu_index == 9 + menu_substart_value:
            menu_act_change_score_limit()
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_score_kill()
        elif menu_index == 11 + menu_substart_value:
            menu_act_cycle_score_body()
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_score_head()
        elif menu_index == 13 + menu_substart_value:
            menu_act_cycle_score_strafe()
        elif menu_index == 14 + menu_substart_value:
            menu_act_cycle_score_strafe_min()
        elif menu_index == 15 + menu_substart_value:
            menu_act_cycle_score_strafe_max()
    elif submenu_index == 1:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_act_change_submenu()
        elif menu_index == 1 + menu_substart_value:
            menu_act_cycle_bot_slot()
        elif menu_index == 2 + menu_substart_value:
            menu_act_bot_hero_pool()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_bot_health()
        elif menu_index == 4 + menu_substart_value:
            menu_act_cycle_bot_scale()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_bot_speed_type()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_bot_speed_min()
        elif menu_index == 7 + menu_substart_value:
            menu_act_cycle_bot_speed_max()
        elif menu_index == 8 + menu_substart_value:
            menu_act_cycle_bot_gravity()
        elif menu_index == 9 + menu_substart_value:
            menu_act_cycle_spawn_x()
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_spawn_y()
        elif menu_index == 11 + menu_substart_value:
            menu_act_cycle_spawn_z()
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_boundary_type()
        elif menu_index == 13 + menu_substart_value:
            menu_act_cycle_boundary_lower_x()
        elif menu_index == 14 + menu_substart_value:
            menu_act_cycle_boundary_lower_y()
        elif menu_index == 15 + menu_substart_value:
            menu_act_cycle_boundary_lower_z()
        elif menu_index == 16 + menu_substart_value:
            menu_act_cycle_boundary_upper_x()
        elif menu_index == 17 + menu_substart_value:
            menu_act_cycle_boundary_upper_y()
        elif menu_index == 18 + menu_substart_value:
            menu_act_cycle_boundary_upper_z()
        elif menu_index == 19 + menu_substart_value:
            menu_act_cycle_boundary_dist_min()
        elif menu_index == 20 + menu_substart_value:
            menu_act_cycle_boundary_dist_max()
        elif menu_index == 21 + menu_substart_value:
            menu_act_cycle_facing_type()
        elif menu_index == 22 + menu_substart_value:
            menu_act_cycle_facing_x()
        elif menu_index == 23 + menu_substart_value:
            menu_act_cycle_facing_y()
        elif menu_index == 24 + menu_substart_value:
            menu_act_cycle_facing_z()
        elif menu_index == 25 + menu_substart_value:
            menu_act_cycle_movement_profile()
    elif submenu_index == 2:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 1
            menu_act_change_submenu() 
        elif menu_index == 1 + menu_substart_value:
            menu_act_toggle_AD()
        elif menu_index == 2 + menu_substart_value:
            menu_act_cycle_AD_min()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_AD_max() 
        elif menu_index == 4 + menu_substart_value:
            menu_act_toggle_WS()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_WS_min()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_WS_max() 
        elif menu_index == 7 + menu_substart_value:
            menu_act_cycle_jump() 
        elif menu_index == 8 + menu_substart_value:
            menu_act_cycle_crouch() 
        elif menu_index == 9 + menu_substart_value:
            menu_act_cycle_uncrouch_min() 
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_uncrouch_max() 
        elif menu_index == 11 + menu_substart_value:
            menu_act_toggle_bot_impulse() 
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_profile_slot() 
        elif menu_index == 13 + menu_substart_value:
            menu_act_select_save_profile()


    wait(menu_wait)
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

    if submenu_index == 0:
        submenu_index = menu_submenu_target
        menu_index = submenu_start_index[submenu_index]
    else:
        submenu_index = 0
        menu_index = menu_submenu_target + submenu_start_index[submenu_index]

def menu_act_cycle_player_x():
    @Name "SUB: menu_act_cycle_player_x"

    if menu_input == 2:
        eventPlayer.player_spawn = vect(eventPlayer.getPosition().x, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == 1:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x + 1, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == 0:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x + 0.01, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == -1:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x - 1, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == -2:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x - 0.01, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
        
    if eventPlayer.player_spawn.x > 1000:
        eventPlayer.player_spawn = vect(-1000, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    if eventPlayer.player_spawn.x < -1000:
        eventPlayer.player_spawn = vect(1000, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)

    menu_opt_var[2] = eventPlayer.player_spawn.x


def menu_act_save_profile():
    @Name "SUB: menu_act_save_profile"

    eventPlayer.profile_count += 1
    smallMessage(hostPlayer, "Profile Saved as {}".format(eventPlayer.profile_count))

    menu_opt_var[3] = eventPlayer.profile_count
    menu_opt_var[4] = eventPlayer.profile_count








rule "Change Hero":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)
    @Condition eventPlayer.isHoldingButton(Button.MELEE)

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()
    
    
    
    