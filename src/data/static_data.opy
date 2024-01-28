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
                    [0,0,1,1,1,1,0,0,1,0], # Cycle List
                    [0,0,1,1,3,3,0,0,1,0], # Cycle Toggle
                    [0,0,1,1,4,4,0,0,3,0], # Cycle Override
                    [0,0,1,1,1,1,1,1,1,0], # Subitem Cycle
                    [0,0,2,2,2,2,1,1,1,0], # Subitem Cycle List + Toggle
                    [0,0,1,1,1,1,1,1,2,0], # Subitem Vector List
                    [0,0,2,2,2,2,1,1,2,0]  # Subitem Vector Toggle
                    ] 
    
    item_data = [
                        [
                            TAG_TYPE.NONE,
                            [],
                            [],
                            [],
                            [HELP_TYPE.DEFAULT],
                            HELP_TYPE.DEFAULT
                        ],
                        [
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE
                        ],
                        [
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SLOT],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1],
                            HELP_TYPE.CYCLE_OVERRIDE
                        ],
                        [
                            TAG_TYPE.VECT,
                            [RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR],
                            [SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT
                        ],
                        [
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_10],
                            HELP_TYPE.CYCLE
                        ],
                        [
                            TAG_TYPE.SCE_TIMED,
                            [RANGE_TYPE.NONE, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [
                            TAG_TYPE.SCE_POINTS,
                            [RANGE_TYPE.NONE, RANGE_TYPE.POINTS],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [
                            TAG_TYPE.POINTS,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [
                            TAG_TYPE.STRAFE,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [
                            TAG_TYPE.TYPE_VECT,
                            [RANGE_TYPE.NONE, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR, RANGE_TYPE.VECTOR],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT_OPT
                        ],
                        [
                            TAG_TYPE.ANGLE_DIM,
                            [RANGE_TYPE.ANGLE, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT
                        ],
                        [
                            TAG_TYPE.MIN_MAX,
                            [RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [
                            TAG_TYPE.NONE,
                            [RANGE_TYPE.NONE, RANGE_TYPE.NONE, RANGE_TYPE.HERO],
                            [SMALL_TYPE.NONE, SMALL_TYPE.NONE, SMALL_TYPE.SM_1],
                            [],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [
                            TAG_TYPE.HEALTH,
                            [RANGE_TYPE.SCALAR, RANGE_TYPE.VECTOR, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [
                            TAG_TYPE.TARGET,
                            [RANGE_TYPE.NONE, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR, RANGE_TYPE.SCALAR],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_10],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [
                            TAG_TYPE.TARGET,
                            [RANGE_TYPE.NONE, RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_10, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [
                            TAG_TYPE.PROFILE_STATUS,
                            [RANGE_TYPE.SLOT, RANGE_TYPE.PERCENT],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_1],
                            [LARGE_TYPE.LG_1, LARGE_TYPE.LG_10],
                            HELP_TYPE.CYCLE_TOGGLE
                        ],
                        [
                            TAG_TYPE.PROFILE_ORDER,
                            [RANGE_TYPE.NONE, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_VECT_OPT
                        ],
                        [
                            TAG_TYPE.MVMT_TYPE,
                            [RANGE_TYPE.NONE, RANGE_TYPE.PERCENT, RANGE_TYPE.TIME],
                            [SMALL_TYPE.NONE, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.NONE, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_TOGGLE
                        ],
                        [
                            TAG_TYPE.MVMT_DIR,
                            [RANGE_TYPE.PERCENT, RANGE_TYPE.TIME, RANGE_TYPE.TIME],
                            [SMALL_TYPE.SM_1, SMALL_TYPE.SM_0_01, SMALL_TYPE.SM_0_01],
                            [LARGE_TYPE.LG_10, LARGE_TYPE.LG_1, LARGE_TYPE.LG_1],
                            HELP_TYPE.SUBITEM_CYCLE
                        ],
                        [
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
            ["Turbo Cycle"]
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
            "For detailed documentation visit\nbellalabs.dev/OW2-Aim-Scenario-Maker\n", 
            "Configure",
            "Scenario  ▶",
            "Bot       ▶",
            "Profile   ▶",
            "Test",
            "Open Hero Select",
            "Display Boundaries",
            "Test Bot in Slot",
            "Test Scenario",
            "Export and Share",
            "Display Export Instructions",
            "Display Import Instructions"
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
            "Profiles",
            "Profiles Status",
            "Profile Order",
            "Use Custom Script"
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
            "Profile Settings", 
            "◀ Main Menu",
            "Profiles", 
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
            "Scoring",
            "Scenario Type",
            "Points",
            "Strafe Score",
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
            ["Reverse on Collision", "Stop on Collision", "Teleport to In-Bounds"],
            ["In Order", "Randomized"],
            ["Inputs", "Impulse"],
            ["Timed", "Elims"]
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
            ["Profile ", "Weight: "],
            ["Type: ", "min: ", "max: ", "time: "],
            ["X: ", "Y: ", "Z: "],
            ["Type: ", "X: ", "Y: ", "Z: "],
            ["Angle: ", "Length: ", "Height: ", "Width: "],
            ["Type: ", "Impulse Strength: ", "Impulse Interval: "],
            ["Weight : ", "Min Time : ", "Max Time : "],
            ["Chance %: ", "Interval: ", "Min Time : ", "Max Time : "],
            ["Type: ", "Seconds: "],
            ["Type: ", "Score: "],
            ["Bodyshot: ", "Headshot: ", "Elim: "],
            ["Max Score Per Strafe: ", "Min Time: ", "Max Time: "]
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
            "How to export your configuration:\n1. Open the Overwatch menu (esc)\n2. Select \"Open Workshop Inspector\"\n3. Select the dropdown menu \"Variable Target\"\n4. Select \"Iris\"\n5. select the \"Live\" button so that the red dot turns grey\n6.Move the blue slider backwards then completly forward\n    to ensure the data is correctly updated\n7. Select the rightmost button from the bottom left that looks like this: [(x)]\n    When you hover over the button it will say\n    \"Copy clipboard current varaibles for current variables target as workshop actions\"\n8. Your settings variables will now be in your clipboard\n    8a. To save your work, paste your settings into a text file on your computer.\n    8b. To share your scenario or resume your work please see \"import instructions\"\n", 
            "How to import your configuration:\n1. Select the import code button from the settings page of the lobby menu.\n2. Enter the code\n    2a. If you want to share your scenario use the code for the Aim Scenario Player: XXXXX\n    2b. If you are resuming creating a scenario enter code for the Aim Scenario Maker: YYYYY\n3.Select the \"Workshop\" tile with black text.\n4. Scroll to the top of the first page\n5. Click the \">\" symbol to the left of the first rule titled \"Paste Player Variables Here\"\n6. In the \"actions\" column to the right, select the orange \"paste\" button.\n7. Start/Restart the Match and your settings will be loaded.\n    7a. If you are using the Aim Scenario Player code you may now create a share code by\n        selecting \"Share Code\" in the lobby settings menu\n    7b. If you are using the Aim Scenario Maker code you may now continue designing your scenario \n", 
            "To list your share code on bellalabs.dev/ow2-scenario-codes\nfill out the form avaliable at: bellalabs.dev/ow2-share-form\n"
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
            "Iris"
        ], 
        [
            "데이터 저장소"
        ], 
        [
            "数据存储"
        ]
    ]
    strings_symbols = ["—————————————————————————\n"]
    

    data_loaded[DATA_TYPE.STATIC] = true
