rule "Load Static Data":
    @Event global

    hero_array =   [Hero.TRACER,
                    Hero.REAPER,
                    Hero.WIDOWMAKER,
                    Hero.PHARAH,
                    Hero.REINHARDT,
                    Hero.MERCY,
                    Hero.TORBJORN,
                    Hero.HANZO,
                    Hero.WINSTON,
                    Hero.ZENYATTA,
                    Hero.BASTION,
                    Hero.SYMMETRA,
                    Hero.ZARYA,
                    Hero.MCCREE,
                    Hero.SOLDIER,
                    Hero.LUCIO,
                    Hero.ROADHOG,
                    Hero.JUNKRAT,
                    Hero.DVA,
                    Hero.MEI,
                    Hero.GENJI,
                    Hero.ANA,
                    Hero.SOMBRA,
                    Hero.ORISA,
                    Hero.DOOMFIST,
                    Hero.MOIRA,
                    Hero.BRIGITTE,
                    Hero.HAMMOND,
                    Hero.ASHE,
                    Hero.BAPTISTE,
                    Hero.SIGMA,
                    Hero.ECHO,
                    Hero.SOJOURN,
                    Hero.JUNKER_QUEEN,
                    Hero.KIRIKO,
                    Hero.RAMATTRA,
                    Hero.LIFEWEAVER,
                    Hero.ILLARI,
                    Hero.MAUGA
                   #Hero.VENTURE
                   #Hero.SPACE_RANGER 
                    ]

    ranges = [["N/A", "N/A"], [0,11], [0,len(hero_array)-1], [0,100], [0,180], [0,200], [0,600], [0, 1000], [-1000,1000], [0, 1000000]]
    small_steps = ["N/A", 0.01, 1]
    large_steps = ["N/A", 1, 10]
    help_configs = [[0,0,0,0,0,0,0,0], # Default
                    [0,0,1,1,1,1,0,1], # Cycle List
                    [0,0,1,1,3,3,0,1], # Cycle Toggle
                    [0,0,1,1,4,4,0,1], # Cycle Override
                    [0,0,1,1,1,1,1,1], # Subitem Cycle List
                    [0,0,2,2,2,2,1,1], # Subitem Cycle List + Toggle
                    [0,0,1,1,1,1,1,2], # Subitem Vector List
                    [0,0,2,2,2,2,1,2], # Subitem Vector Toggle
                    []
                    ] 
                    

rule "load_language_data":
    @Event global

    data_loaded[DATA_TYPE.DATA_STATIC] = false

    strings_help = [[["Previous Item"], ["Next Item"], ["Select Item", "-", "Previous Option / -"], ["Select Item", "+", "Next Option / +"], ["Select Item", "-", "Previous Option / -", "Toggle All", "Override All", ], ["Select Item", "+", "Next Option / +", "Toggle Selected", "Override Selected"], ["N/A", "Next Subitem"], ["Select Item", "N/A", "Set Vector to Current", "Update Visual Effect"]]]
    strings_controls = [[["Up", "Down", "Step Left", "Step Right", "Jump Left", "Jump Right", "Next Subitem", "Action Item"]],[[""]],[[""]]]
    strings_inputs = [["Forward", "Backward", "Left", "Right"], ["", "", "", ""], ["", "", "", ""]]
    strings_misc = [["Iris", "Open The Menu to Begin Editing. See <website> for documentation."], ["데이터 저장소"], ["数据存储"]]
    strings_submenu_0 = [["For detailed documentation visit\nbellalabs.dev/OW2-Aim-Scenario-Maker\n", "Configure", "Scenario  ▶", "Bot       ▶", "Profile   ▶", "Test", "Open Hero Select", "Test Bot in Slot", "Test Scenario", "Save and Export", "Export Instructions", "Import Instructions"]]
    strings_submenu_1 = [["Bot Settings", "◀ Main Menu", "Bot Slot", "Select Bot Slot", "Override Bot Slot", "Bot Parameters", "Hero Pool", "Health", "Scale", "Gravity", "Spawn and Boundaries", "Spawn Type", "Facing", "Boundary Position", "Boundary Dimentions", "Distance", "Profiles", "Profiles Status", "Randomize Profile Order", "Use Custom Scripts"]]
    strings_submenu_2 = [["Profile Settings", "◀ Main Menu", "Profiles", "Select Profile Slot", "Override Profile from Slot", "Movement", "Movement Settings ▶", "Reactions", "Detect Collisions", "Swap Strafe Direction When Damage", "Swap Strafe Wait Timer"]]
    strings_submenu_2_1 = [["Movement Settings", "◀ Profile Settings", "Left / Right Movement", "Sync Left and Right Settings", "Left Strafe Time", "Right Strafe Time", "Swap Left / Right Strafe Time", "Left Strafe Speed", "Right Strafe Speed", "Swap Left / Right Strafe Speed", "Forward / Backward Movement", "Sync Forward / Backward settings", "Forward Strafe Time", "Backward Strafe Time", "Swap Forward / Backward Strafe Time", "Forward Strafe Speed", "Backward Strafe Speed", "Swap Forward / Backward Strafe Speed", "Idle Movement", "Idle Type", "Left / Right Idle", "Forward / Backward Idle", "Vertical Movement", "Jump Frequency", "Crouch Frequency", "Uncrouch Frequency"]]
    strings_submenu_3 = [["Scenario Settings", "◀ Main Menu", "Scoring", "Score Type", "Points", "Strafe Score", "Player", "Spawn Position", "Spawn Facing", "Speed", "Gravity", "Custom Script"]]
    strings_on_titles = [["", "Slot", "Profile", "Hero"]]
    strings_options = [[["Enabled", "Disabled"], ["Visible", "Hidden"], ["Timed", "Score Limit"], ["Static", "Random", "Health"], ["Fixed Position", "Random Position"], ["Fixed", "Player"]], ["Off", "On Death", "On Death and Timer"], [["사용 안 함", "사용"]], [["禁用", "已启用"]]]
    strings_prompt = [["Hold", "Press", "to", "close", "open", "menu", "to confirm override"],[],[]]
    
    strings_instructions = [["How to export your configuration:\n1. Open the Overwatch menu (esc)\n2. Select \"Open Workshop Inspector\"\n3. Select \"auto\"\n4. Select \"Iris\"\n5. Select the rightmost button from the bottom left that looks like this: [(x)]\n    When you hover over the button it should say\n    \"Copy clipboard current varaibles for current variables target as workshop actions\"\n6. Your settings variables will now be in your clipboard\n    6a. To save your work, paste your settings into a text file on your computer.\n    6b. To share your scenario or resume your work please see \"import instructions\"\n", 
                       "How to import your configuration:\n1. Select the import code button from the settings page of the lobby menu.\n2. Enter the code\n    2a. If you want to share your scenario use the code for the Aim Scenario Player: XXXXX\n    2b. If you are resuming creating a scenario enter code for the Aim Scenario Maker: YYYYY\n3.Select the \"Workshop\" tile with black text.\n4. Scroll to the top of the first page\n5. Click the \">\" icon to the left of the first rule titled \"Paste Player Variables Here\"\n6. In the \"actions\" column to the right, select the orange \"paste\" button.\n7. Start/Restart the Match and your settings should load.\n    7a. If you are using the Aim Scenario Player code you may now create a share code by\n        selecting \"Share Code\" in the workshop settings menu\n    7b. If you are using the Aim Scenario Maker code you may now continue designing your scenario \n", 
                       "To list your share code on bellalabs.dev/ow2-scenario-codes\nfill out the form avaliable at: bellalabs.dev/ow2-share-form\n","",""],
                       ["", ""],
                       ["", ""]]
    strings_tags = [[["Health %: ", "HPS: ", "Wait Until Heal: "], ["min: ", "max: "], ["Type: ", "min: ", "max: ", "time: "], ["X: ", "Y: ", "Z: "],  ["Type: ", "X: ", "Y: ", "Z: "], ["Angle: ", "Length: ", "Height: ", "Width: "]], [[]], [[]]]
    strings_symbols = ["—————————————————————————\n", [iconString(Icon.CHECKMARK), iconString(Icon.CROSS)]]

    data_loaded[DATA_TYPE.DATA_STATIC] = true