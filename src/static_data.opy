rule "Load Static Data":
    @Event global

    data_loaded[DATA_INDEXES.DATA_STATIC] = false

    ranges = [[0,11], [0,100], [0,250], [0,600], [0, 1000], [-1000,1000], [0, 1000000]]
    small_steps = [0.01, 1]
    large_steps = [1, 1, 10]

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


rule "load_language_data":
    @Event global

    strings_vector = [["Forward", "Backward", "Left", "Right"]]
    strings_misc = [["Iris", "Open The Menu to Begin Editing. See <website> for documentation."], ["데이터 저장소"], ["数据存储"]]
    strings_submenu_0 = [["Configure", "Bot       ▶", "Profile   ▶", "Scenario  ▶", "Test", "Test Bot in Slot", "Test Scenario", "Export", "Show Export Instructions"]]
    strings_submenu_1 = [["Bot Settings", "◀ Main Menu", "Bot Slot", "Select Bot Slot", "Copy From Bot Slot", "Bot Parameters", "Hero Pool", "", "Health", "Scale", "Gravity", "Spawn and Boundaries", "Spawn Type", "Facing", "Lower Bound", "Upper Bound", "Distance", "Profiles", "Profiles Status", "Randomize Profile Order", "Use Custom Scripts"]]
    strings_submenu_2 = [["Profile Settings", "◀ Main Menu", "Profiles", "Select Profile Slot", "Override Profile from Slot", "Movement", "Movement Settings ▶", "Reactions", "Detect Collisions", "Swap Strafe Direction When Damage", "Swap Strafe Wait Timer"]]
    strings_submenu_2_1 = [["Movement Settings", "◀ Profile Settings", "Left / Right Movement", "Sync Left and Right Settings", "Left Strafe Time", "Right Strafe Time", "Swap Left / Right Strafe Time", "Left Strafe Speed", "Right Strafe Speed", "Swap Left / Right Strafe Speed", "Forward / Backward Movement", "Sync Forward / Backward settings", "Forward Strafe Time", "Backward Strafe Time", "Swap Forward / Backward Strafe Time", "Forward Strafe Speed", "Backward Strafe Speed", "Swap Forward / Backward Strafe Speed", "Idle Movement", "Idle Type", "Left / Right Idle", "Forward / Backward Idle", "Vertical Movement", "Jump Frequency", "Crouch Frequency", "Uncrouch Frequency"]]
    strings_submenu_3 = [["Scenario Settings", "◀ Main Menu", "Scoring", "Score Type", "Points", "Strafe Score", "Player", "Spawn Position", "Spawn Facing", "Speed", "Gravity", "Custom Script"]]
    strings_on_titles = [["Slot", "Profile"]]
    strings_dynamic_titles = [[["Show Export Instructions", "Hide Export Instructions"]]]
    strings_options = [[["Disabled", "Enabled"], ["Timed", "Score Limit"]], [["사용 안 함", "사용"]], [["禁用", "已启用"]]]
    strings_prompt = [["Hold", "Press", "to", "close", "open", "menu", "to confirm override"],[],[]]
    strings_input = [[["Up", "Down", "Step Left", "Step Right", "Jump Left", "Jump Right", "Next Subitem", ""]],[[""]],[[""]]]
    strings_export = ["How to export:\n1. Open the Overwatch menu (esc)\n2. Select \"Open Workshop Inspector\"\n3 Select \"auto\"\n4. Select \"Iris\"\n5. Select the button that looks like this: \"(x)\"\n(Copy clipboard current varaibles for current variables target as workshop actions)\nYour settings will now be saved into your clipboard\n6. Paste your settings into a file if you are saving your progress, otherwise procced to \"how to import\"\n\nHow to Import:\n1. Select the import code button from the settings page of the lobby menu.\n2. Enter the code\n    2a. If you want to share your scenario use the code for the Aim Scenario Player: XXXXX\n    2b. If you are resuming creating a scenario enter code for the Aim Scenario Maker: YYYYY\n3.Select the \"Workshop\" tile with black text.\n4. Scroll to the top of the first page\n5. Click the \">\" icon to the left of the first rule titled \"Paste Player Variables Here\"\n6. In the \"actions\" to the right select the orange \"paste\" button.\n7. Start/Restart the Match and your settings should load.\n8. You may now create a share code containing your custom scenario.\n8. If you'd like to have your scenario listed with others made with this tool\n Either upload it to on workshop.codes as a fork of XXXXX or message the dev on discord/twitter/bing\n9. Have fun :)","",""]
    strings_tags = [[["min: ", "max: "]], [[]], [[]]]
    strings_symbols = ["——————————————————————"]

    data_loaded[DATA_INDEXES.DATA_STATIC] = true