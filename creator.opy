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
globalvar default_menu_submenu_color
globalvar default_menu_cycle_color
globalvar default_menu_vector_color
globalvar default_menu_off_index_color
globalvar default_menu_on_index_color
## Score Tracker
globalvar progress_tracker
globalvar score
## Change Character
globalvar player_hero_list
## UI 
globalvar controller_mode
globalvar ui_inputs
## Import 
globalvar import_script
globalvar menu_enabled


# Player
playervar player_spawn
playervar score_type
# Profile
playervar profile_count
playervar profile_data
# Subroutine
subroutine import_player_menu
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
subroutine menu_act_save_profile2
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

subroutine set_ui_data
globalvar top_hud_text
globalvar hud_text_id


#Extensions
#!extension spawnMoreDummyBots

# Workshop Initialization Rules
def import_player_menu():
    @Name "----->  Paste Player Variables Here  <-----"

    smallMessage(null, "paste here!")

rule ">>>  Section: Initalization  <<<":

    smallMessage(null, "")


rule "Initialize: Workshop Settings":

    ## UI Settings
    controller_mode = createWorkshopSetting(bool, "0. UI Settings", "Controller UI", false, 0)
    set_ui_data()
    import_script = createWorkshopSetting(bool, "1. Import Settings", "Import Existing Settings (Paste Player Variables in the 1st workshop rule)", false, 0)


# Defines the Input for UI, making it easy to change menu inputs.
def set_ui_data():
    @Name "SUB: set_ui_data"
    # Open Menu
    ui_inputs[0] = Button.INTERACT
    # Controller UI
    if controller_mode == true:
        # Menu Up
        ui_inputs[1] = Button.ULTIMATE
        # Menu Down
        ui_inputs[2] = Button.JUMP
        # Step Left
        ui_inputs[3] = Button.ABILITY_1
        # Step Right
        ui_inputs[4] = Button.ABILITY_2
        # Jump Left
        ui_inputs[5] = Button.SECONDARY_FIRE
        # Jump Right
        ui_inputs[6] = Button.PRIMARY_FIRE
    # M&K UI. To update Up/Down/Left/Right you'll also have to change the condition in the menu control rules.
    else:
        # Menu Up
        ui_inputs[1] = Vector.FORWARD
        # Menu Down
        ui_inputs[2] = Vector.DOWN
        # Step Left
        ui_inputs[3] = Vector.LEFT
        # Step Right / Select
        ui_inputs[4] = Vector.RIGHT
        # Jump Left
        ui_inputs[5] = Button.ULTIMATE
        # Jump Right
        ui_inputs[6] = Button.ABILITY_2
    # Select Next Value
    ui_inputs[7] = Button.RELOAD
    # Set Value to Vector
    ui_inputs[8] = Button.CROUCH
    # Help
    ui_inputs[9] = Button.MELEE
    ## Script Settings

rule "Player Joined":
    @Event playerJoined
    @Team 1

    eventPlayer.disableGamemodeHud()


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
        import_player_menu()
    else:
        default_player_menu()

    hudHeader(eventPlayer, "Open The Menu to Begin Editing. For Export Instuctions See The Description of this code or Workshop.Codes/CODE", HudPosition.TOP, -2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hud_text_id = getLastCreatedText()
    wait(16)
    destroyHudText(hud_text_id)

        
# UI Elements
rule ">>>  Section: Menu Setup  <<<":

    smallMessage(null, "")


rule "Menu Setup: Creation":
    @Event global

    menu_enabled = false

    default_menu_label_color = Color.WHITE
    default_menu_off_index_color = Color.WHITE
    default_menu_submenu_color = Color.BLUE
    default_menu_cycle_color = Color.AQUA
    default_menu_vector_color = Color.YELLOW
    default_menu_on_index_color = Color.TEAM_1

    
    top_hud_text = "Menu Loading..."
    # Top text to display messages
    hudSubtext([i for i in localPlayer], 
    "{0}".format(top_hud_text), 
    HudPosition.TOP, 
    -9999, 
    Color.WHITE, 
    HudReeval.VISIBILITY_AND_STRING, 
    SpecVisibility.DEFAULT)

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
            "{8}\nMenu Controls    \n{8}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\nHelp for Current Menu Item : {8}\n{9}\n*Use left/right Controls to Select*".format(buttonString(ui_inputs[1]), buttonString(ui_inputs[2]), buttonString(ui_inputs[3]), buttonString(ui_inputs[4]), buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), buttonString(ui_inputs[9]), "——————————————————————") if menu_visible else ""), 
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
            "{8}\nMenu Controls    \n{8}\nUp :  {0}\nDown :  {1}\nStep Left :  {2}\nStep Right / Select :  {3}\nJump Left :  {4}\nJump Right :  {5}\nCycle to Next Value :  {6}\nSet Item to Vector :  {7}\n{8}\n*Use left/right Controls to Select*".format("Forward", "Backwards", "Left", "Right", buttonString(ui_inputs[5]), buttonString(ui_inputs[6]), buttonString(ui_inputs[7]), buttonString(ui_inputs[8]), buttonString(ui_inputs[9]), "——————————————————————") if menu_visible else ""), 
            HudPosition.LEFT, 
            -1, 
            Color.WHITE, 
            HudReeval.VISIBILITY_AND_STRING, 
            SpecVisibility.DEFAULT)
    # Create HUD
    menu_hud()

    menu_enabled = true
    top_hud_text = ""


rule ">>>  Section: Menu Controls  <<<":

    smallMessage(null, "")


rule "Menu Controls: Toggle Menu with Interact":
    @Event eachPlayer
    @Team 1
    # Change this condition to whatever button(s) you want to trigger the main menu. 
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition menu_enabled
    
    # Stalls toggle while menu is being created.
    if controller_mode == true:
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
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.MELEE)
    eventPlayer.setMoveSpeed(0)

    
rule "Menu Controls: Toggle Off Setup Player":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == false

    enable_player_input()


rule "Menu Controls: Up Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    @Condition (controller_mode == true and eventPlayer.isHoldingButton(ui_inputs[2])) or (controller_mode == false and eventPlayer.getThrottle() == ui_inputs[2])
    
    menu_up_check()
    while menu_item_hidden[menu_index] == true:
        menu_up_check()


rule "Menu Controls: Down Scroll":
    @Event eachPlayer
    @Team 1
    @Condition menu_visible == true
    @Condition (controller_mode == true and eventPlayer.isHoldingButton(ui_inputs[3])) or (controller_mode == false and eventPlayer.getThrottle() == ui_inputs[3])
    
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
    eventPlayer.allowButton(Button.RELOAD)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.allowButton(Button.MELEE)
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

    hudSubheader(
    localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}".format(menu_on_opt_title[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), menu_off_opt_color if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_toggle():
    @Name "SUB: new_menu_item_toggle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}{1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], 
    menu_opt_var[evalOnce(menu_opt_size)]), 
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    menu_off_opt_color if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle():
    @Name "SUB: new_menu_item_cycle"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [],
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■ {0} ←  {1}  → ".format(menu_on_opt_title[evalOnce(menu_opt_size)],
    menu_opt_var[evalOnce(menu_opt_size)]), HudPosition.TOP, evalOnce(menu_max_pos), 
    menu_off_opt_color if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)], 
    HudReeval.VISIBILITY_STRING_AND_COLOR, 
    SpecVisibility.DEFAULT)


def new_menu_item_cycle_bar():
    @Name "SUB: new_menu_item_cycle_bar"

    hudSubheader(localPlayer if menu_visible and submenu_index == evalOnce(sub_size) and menu_item_hidden[evalOnce(menu_opt_size)] != true else [], 
    "{0}".format(menu_off_opt_title[evalOnce(menu_opt_size)]) if menu_index != evalOnce(menu_opt_size) else "■  {0}  {1}".format(menu_on_opt_title[evalOnce(menu_opt_size)], 
    menu_opt_var[evalOnce(menu_opt_size)]),
    HudPosition.TOP,
    evalOnce(menu_max_pos), 
    menu_off_opt_color if menu_index != evalOnce(menu_opt_size) else menu_on_opt_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)

    menu_max_pos += 1

    hudHeader(localPlayer if menu_visible and menu_index == evalOnce(menu_opt_size) and submenu_index == evalOnce(sub_size) else [],
    "{0} ←  {1}  →".format(bar_title[menu_index], bar_var[menu_index]),
    HudPosition.TOP, 
    evalOnce(menu_max_pos), 
    bar_color[evalOnce(menu_opt_size)],
    HudReeval.VISIBILITY_STRING_AND_COLOR,
    SpecVisibility.DEFAULT)

rule "Section: Menu Data":
    smallMessage(null, "")


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
    menu_on_opt_color[menu_opt_size] = default_menu_submenu_color
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Movement"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_on_opt_color[menu_opt_size] = default_menu_cycle_color
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Player Settings"
    menu_label_color[menu_label_size] = default_menu_label_color
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player X Spawn"
    menu_on_opt_title[menu_opt_size] = "X Coord: "
    menu_on_opt_color[menu_opt_size] = default_menu_vector_color
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
    new_menu_item_cycle()  

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


def default_player_menu():
    @Name "SUB: default_player_menu"

    

rule ">>>  Section: Menu Actions  <<<":
    smallMessage(null, "")


rule "Menu Actions: Input Read":
    @Event eachPlayer
    @Condition menu_visible == true
    @Condition (controller_mode == false and (eventPlayer.isHoldingButton(Button.ULTIMATE) == true or eventPlayer.isHoldingButton(Button.ABILITY_2) == true or eventPlayer.getThrottle() == Vector.LEFT or eventPlayer.getThrottle() == Vector.RIGHT or eventPlayer.isHoldingButton(Button.CROUCH)) == true) or (controller_mode == true and (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.isHoldingButton(Button.ABILITY_2) or eventPlayer.isHoldingButton(Button.CROUCH)))
    
    # We use the player variable menu_input to tell the subroutines we call that the player inputed one of our selection keys.
    if controller_mode == false:
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

rule "anticrash":
    @Condition getAverageServerLoad() >= 230

    wait(2, Wait.ABORT_WHEN_FALSE)
    smallMessage(hostPlayer, "    Server Avg Exceeded 230 for 2 seconds. Slow Motion Enabled.")
    bigMessage(hostPlayer, "    If you see this message either:\na) the server sucks\nb) the dev sucks\nc) your config takes too many resources")
    setSlowMotion(10)
    waitUntil(getAverageServerLoad() < 200, 99999)
    smallMessage(getAllPlayers(), "Server Avg Lowered. Slow Motion Disabled")
    setSlowMotion(100)

