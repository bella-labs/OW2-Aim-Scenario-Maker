rule "Load Static Data":
    @Event global

    static_data_loaded = false

    ranges = [[0,11], [0,100], [0, 200], [0,600], [0, 1000], [-1000,1000], [0, 1000000]]
    small_steps = [0.01, 1]
    large_steps = [1, 10]

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

    strings_misc = [["Data Storage"], ["데이터 저장소"], ["数据存储"]]
    strings_submenu_0 = [["Configure", "Bot       ▶", "Profile   ▶", "Scenario  ▶", "Play", "Test Bot in Slot", "Test Scenario"]]
    strings_submenu_1 = [["Bot Settings", "◀ Main Menu", "Bot Slot", "Select Bot Slot", "Copy From Bot Slot", "Bot Parameters", "Hero Pool", "", "Health", "Scale", "Gravity", "Spawn and Boundaries", "Spawn Type", "Facing", "Lower Bound", "Upper Bound", "Distance", "Profiles", "Profiles Status", "Randomize Profile Order", "Use Custom Scripts"]]
    strings_submenu_2 = [["Profile Settings", "◀ Main Menu", "Profiles", "Select Profile Slot", "Override Profile from Slot", "Movement", "Movement Settings ▶", "Reactions", "Detect Collisions", "Swap Strafe Direction When Damage", "Swap Strafe Wait Timer"]]
    strings_submenu_2_1 = [["Movement Settings", "◀ Profile Settings", "Left / Right Movement", "Sync Left and Right Settings", "Left Strafe Time", "Right Strafe Time", "Swap Left / Right Strafe Time", "Left Strafe Speed", "Right Strafe Speed", "Swap Left / Right Strafe Speed", "Forward / Backward Movement", "Sync Forward / Backward settings", "Forward Strafe Time", "Backward Strafe Time", "Swap Forward / Backward Strafe Time", "Forward Strafe Speed", "Backward Strafe Speed", "Swap Forward / Backward Strafe Speed", "Idle Movement", "Idle Type", "Left / Right Idle", "Forward / Backward Idle", "Vertical Movement", "Jump Frequency", "Crouch Frequency", "Uncrouch Frequency"]]
    strings_submenu_3 = [["Scenario Settings", "◀ Main Menu", "Scoring", "Score Type", "Points", "Strafe Score", "Player", "Spawn Position", "Spawn Facing", "Speed", "Gravity", "Custom Script"]]
    strings_on_titles = [["Profile"]]
    strings_options = [[["Disabled", "Enabled"], ["Timed", "Score Limit"]], [["사용 안 함", "사용"]], [["禁用", "已启用"]]]
    
    static_data_loaded = true