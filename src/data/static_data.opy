rule "Load Static Data":
    @Event global

    hero_array =    [
                        Hero.TRACER,
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

    ranges =    [   
                    ["N/A", "N/A"], # None
                    [0,11], # Slot
                    [0,len(hero_array)-1], # Hero
                    [0,100], # Percentage
                    [0,179], # Angle
                    [0,600], # Time
                    [0, 1000], # Scalar
                    [-1000,1000], # Vector
                    [0, 1000000] # Score
                ]

    small_steps =   [
                        "N/A", 
                        0.01, 
                        1
                    ]

    large_steps =   [
                        "N/A",
                        1,
                        10
                    ]

    help_data = [
                    [0,0,0,0,0,0,0,0,0,0], # Default
                    [0,0,1,1,1,1,0,0,1,1], # Cycle List
                    [0,0,1,1,3,3,0,0,1,1], # Cycle Toggle
                    [0,0,1,1,4,4,0,0,3,1], # Cycle Override
                    [0,0,1,1,1,1,1,1,1,1], # Subitem Cycle
                    [0,0,2,2,2,2,1,1,1,1], # Subitem Cycle List + Toggle
                    [0,0,1,1,1,1,1,1,2,1], # Subitem Vector List
                    [0,0,2,2,2,2,1,1,2,1]  # Subitem Vector Toggle
                    ] 
    
    item_data = [
                        [ # None
                            TAG_TYPE.NONE,
                            [],
                            [],
                            [],
                            [HELP_TYPE.DEFAULT],
                            HELP_TYPE.DEFAULT
                        ],
                        [ # SLOT
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE
                        ],
                        [ # TOGGLE_SLOT
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [ # OVERRIDE_SLOT
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE_OVERRIDE
                        ],
                        [ # VECTOR
                            TAG_TYPE.VECT,
                            [RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR],
                            [SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT
                        ],
                        [ # SCALAR
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_10],
                            HELP_TYPE.CYCLE
                        ],
                        [ # SCORE_TIME
                            TAG_TYPE.SCE_TIMED,
                            [RANGE_TYPE.NONE, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [ # SCORE_POINTS
                            TAG_TYPE.SCE_POINTS,
                            [RANGE_TYPE.NONE, RANGE_TYPE.POINTS],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [ # POINTS
                            TAG_TYPE.POINTS,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [ # STRAFE
                            TAG_TYPE.STRAFE,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [ # TYPE_VECT
                            TAG_TYPE.TYPE_VECT,
                            [RANGE_TYPE.NONE, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT_OPT
                        ],
                        [ # BOUNDARY
                            TAG_TYPE.ANGLE_DIM,
                            [RANGE_TYPE.ANGLE, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT
                        ],
                        [ # DISTANCE
                            TAG_TYPE.MIN_MAX,
                            [RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [ # HERO
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.NONE, RANGE_TYPE.NONE, RANGE_TYPE.HERO],
                            [SMALL_TYPE.NONE, SMALL_TYPE.NONE, SMALL_TYPE.SM_1],
                            [],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [ # HEALTH
                            TAG_TYPE.HEALTH,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.VECTOR, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [ # SPEED
                            TAG_TYPE.TARGET,
                            [RANGE_TYPE.NONE, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [ # SCALE
                            TAG_TYPE.TARGET,
                            [RANGE_TYPE.NONE, RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [ # PROF_STATUS
                            TAG_TYPE.PROFILE_STATUS,
                            [RANGE_TYPE.SLOT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_10],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [ # ORDER
                            TAG_TYPE.PROFILE_ORDER,
                            [RANGE_TYPE.NONE, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT_OPT
                        ],
                        [ # MVMT_TYPE
                            TAG_TYPE.MVMT_TYPE,
                            [RANGE_TYPE.NONE, RANGE_TYPE.SCALAR, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [ # MVMT_DIR
                            TAG_TYPE.MVMT_DIR,
                            [RANGE_TYPE.PERCENT, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [ # CHANCE
                            TAG_TYPE.CHANCE,
                            [RANGE_TYPE.PERCENT, RANGE_TYPE.TIME, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ]
                    ]

    menu_wait = [0.10, 0.05, 0.01]

                    

rule "load_language_data":
    @Event global

    data_loaded[DATA_TYPE.STATIC] = false

    strings_prompt = [
        [
            "Hold", 
            "Press",
            "to",
            "close",
            "open",
            "menu",
            "to override the currently selected slot",
            "to override all slots",
            "Slot is disabled in bot settings"
        ],
        [
            "", 
            "",
            "",
            "",
            "",
            "",
            ""
        ],
        [
            "", 
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    ]
    strings_help = [
        [
            ["Previous Item"],
            ["Next Item"],
            ["Select Item", "-", "Previous Option / -"],
            ["Select Item", "+", "Next Option / +"],
            ["Select Item", "-", "Previous Option / -", "Toggle All", "Override All"],
            ["Select Item", "+", "Next Option / +", "Toggle Selected", "Override Selected"],
            ["N/A", "Previous Subitem"],
            ["N/A", "Next Subitem"],
            ["Select Item", "N/A", "Set Vector to Current", "Confirm Override"],
            ["N/A", "Turbo Cycle"]
        ],
        [
            [""],
            [""],
            ["", "-", " / -"],
            ["", "+", " / +"],
            ["", "-", " / -", "", ""],
            ["", "+", " / +", "", ""],
            ["", ""],
            ["", "", "", ""]
        ],
        [
            [""],
            [""],
            ["", "-", " / -"],
            ["", "+", " / +"],
            ["", "-", " / -", "", ""],
            ["", "+", " / +", "", ""],
            ["", ""],
            ["", "", "", ""]
        ]
    ]
    strings_inputs = [
        [
            "Forward", 
            "Backward",
            "Left",
            "Right"
        ], 
        [
            "",
            "",
            "",
            ""
        ],
        [
            "",
            "",
            "",
            ""
        ]
    ]
    strings_main_menu = [
        [
            "For detailed documentation visit\nasm.bellalabs.dev\n", 
            "Configure",
            "Scenario  ▶",
            "Bot       ▶",
            "Movement  ▶",
            "Test",
            "Open Hero Select",
            "Display Boundaries",
            "Test Bot in Slot",
            "Test Scenario",
            "Reset Score",
            "Export and Share",
            "Display Export Instructions",
            "Display Import Instructions",
            "Create Export Package"
        ],
        [
            "*\n*\n", 
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ],
        [
            "\n\n", 
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    ]
    strings_bot_menu = [
        [
            "Bot Settings",
            "◀ Main Menu",
            "Bot Slot",
            "Select Bot Slot",
            "Copy Current Bot to Slot",
            "Spawn and Boundaries",
            "Spawn",
            "Facing",
            "Boundary",
            "Dimentions",
            "Distance",
            "Bot Parameters",
            "Hero Pool",
            "Health",
            "Speed",
            "Scale",
            "Gravity",
            "Movement Profiles",
            "Profile Status",
            "Profile Order",
            "Custom Script"
        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    ]
    strings_prof_menu = [
        [
            "Movement Profile Settings", 
            "◀ Main Menu",
            "Slot", 
            "Select Profile Slot",
            "Copy Current Profile to Slot",
            "Horizontal Movement",
            "Horizontal Type", 
            "Left",
            "Right",
            "Forward",
            "Backward",
            "Vertical Movement",
            "Vertical Type",
            "Jump",
            "Crouch",
            "Idle Movement",
            "Left / Right Idle",
            "Forward / Backward Idle"
        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    ]
    strings_sce_menu = [
        [
            "Scenario Settings",
            "◀ Main Menu",
            "Player",
            "Spawn Position",
            "Spawn Facing",
            "Speed",
            "Gravity",
            "Scenario",
            "Scenario Type",
            "Bot Respawn",
            "Points",
            "Strafe Points",
            "Custom Script"
        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""

        ],
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    ]
    strings_on_titles = [
        [
            "",
            "Slot",
            "Profile",
            "Hero"
        ],
        [
            "",
            "",
            "",
            ""
        ],
        [
            "",
            "",
            "",
            ""
        ]
    ]
    strings_options = [
        [
            ["Disabled", "Enabled"], 
            ["Timed", "Score Limit"],
            ["Random", "Health", "Elims (Target)", "Looping (Target)"],
            ["Fixed Position", "Random in Boundary", "Random Walkable in Boundary"],
            ["Fixed", "Player"],
            ["Reverse", "Stop", "Teleport"],
            ["In Order", "Randomized"],
            ["Inputs", "Impulse"],
            ["Timed", "Elims"],
            ["Simultaneous", "In Slot Order"]
        ],
        [
            ["사용 안 함", "사용"],
            ["", ""],
            ["", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", ""],
            ["", ""],
            ["", ""],
            ["", ""]
        ], 
        [
            ["禁用", "已启用"],
            ["", ""],
            ["", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", ""],
            ["", ""],
            ["", ""],
            ["", ""]
        ]
    ]
    strings_tags = [
        [
            [],
            ["Health %: ", "HPS: ", "Wait Until Heal: "], 
            ["min: ", "max: "],
            ["Type: ", "min: ", "max: ", "target: "],
            ["Profile: ", "Weight: "],
            ["Type: ", "min: ", "max: ", "time: "],
            ["X: ", "Y: ", "Z: "],
            ["Type: ", "X: ", "Y: ", "Z: "],
            ["Angle: ", "Length: ", "Height: ", "Width: "],
            ["Type: ", "Impulse Strength: ", "Impulse Interval: "],
            ["Weight : ", "Min Time : ", "Max Time : "],
            ["Chance %: ", "Min Time : ", "Max Time : ", "Interval: "],
            ["Type: ", "Seconds: "],
            ["Type: ", "Score: "],
            ["Bodyshot: ", "Headshot: ", "Elim: "],
            ["Points Per Second: ", "Min Time: ", "Max Time: "]
        ],
        [
            ["", "", ""], 
            ["", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", ""],
            ["", ""],
            ["", "", ""],
            ["", "", ""]
        ], 
        [
            ["", "", ""], 
            ["", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", ""],
            ["", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", "", "", ""],
            ["", ""],
            ["", ""],
            ["", "", ""],
            ["", "", ""]
        ]
    ]
    strings_instructions = [
        [
            "How to export your configuration:\n1. Scroll Down the In-Game Menu and select \"Create Export Package\".\n* This will package the data into a new bot which we will copy the data from.\n2. Open the Overwatch menu (esc).\n3. Select \"Open Workshop Inspector\".\n4. Select the dropdown menu \"Variable Target\".\n5. Select \"Winston\".\n6. In the middle panel \"Variables\", you should see a list of variables and numbers.\nIf the \"Variables\" panel is empty do the following:\n    6a. Move the blue slider above \"Variable Target\" slightly backwards.\n    6b. Move the blue slider completely forwards.\n7. Select the rightmost button from the bottom left that looks like this: [(x)]\n* When you hover over the button it will say:\n* \"Copy clipboard current variables for current variables target as workshop actions\"\n8. Your settings variables will now be in your clipboard.\n    8a. To save your work:\n        paste your settings into a text file on your computer\n    or\n        Follow the import instructions up to step 6, then save a preset.\n    8b. To share your scenario or resume your work please see \"import instructions\".",
            "How to import your configuration:\n1. Select the import code button from the settings page of the lobby menu.\n2. Enter the code\n    2a. If you are resuming creating a scenario enter code for the Aim Scenario Maker (SHRBX)\n    2b. If you want to share your scenario use the code for the Aim Scenario Player (5XDFV)\n3.Select the \"Workshop\" tile with black text.\n4. Scroll to the top of the first page\n5. Click the \">\" symbol to the left of the first rule titled \"Paste Player Variables Here\"\n6. In the \"actions\" column to the right, select the orange \"paste\" button.\n7a. If you are resuming work on the Aim Scenario Maker, you may start the match.\n7b. If you are ready to share your scenario please continue with the rest of the instructions.\n8. Under the second rule \"Scenario Info\"\n7. Start/Restart the Match and your settings will be loaded.\n    7a. If you are using the Aim Scenario Maker code you may now continue designing your scenario, \n    7a. If you are using the Aim Scenario Player please continue.\n8. Click the \">\" symbol to the left of the first rule titled \"Scenario Info\"\n9. Click the action \"Global.scenario_name\".\n10. Under the field \"String\" enter the name for your scenario.\n11. Click the orange \"OK\" button.\n12. Click the action \"Global.scenario_author\".\n13. Under the field \"String\" enter the name would would like to be credited as.\n14. Click the orange \"OK\" button.\n15. You may now create a share code by:\n    15a. Selecting \"Share Code\" in the lobby settings menu (Icon with 3 connected dots)\n    15b. Selecting \"Continue\"\n16. To have your scenario's share code listed with others:\n    16a. Share the code on Workshop.codes. Mark it as a derivation of the Aim Scenario Player (5XDFV)\n         so that it can be listed with other codes.\n    16b. Join my discord and paste the code in the new scenarios channel\n"
        ],
        [
            "",
            "",
            ""
        ],
        [   
            "",
            "",
            ""
        ],
    ]
    strings_misc = [
        [
            "Iris",
            "Server Load (Curr/Avg/Peak)",
            "Position",
            "Facing",
            "Score",
            "Last",
            "High",
            "Points",
            "Seconds"

        ], 
        [
            "데이터 저장소",

        ], 
        [
            "数据存储",

        ]
    ]
    strings_symbols = ["—————————————————————————\n"]
    

    data_loaded[DATA_TYPE.STATIC] = true
