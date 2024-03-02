def import_settings():
    @Name "----->  Paste Export Data Here / 여기에 플레이어 변수를 붙여넣으세요 / 將您的玩家變數貼到此處  <-----"

    smallMessage(null, "paste here! / 여기에 붙여넣으세요! / 貼在這裡！")
    #eventPlayer.export_data = [[vect(15, 0, 0), vect(-1, 0, 0), 100, 1, 100, 0, 600, 0, 0, 0, 0, 1, 10, 0, 0, 0, false, [true, true, true, true, true, true, true, true, false, false, false, false], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)], [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0], [vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 15, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(100, 15, 100), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10)], [20, 20, 20, 20, 10, 10, 10, 10, 0, 0, 0, 0], [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50], [[Hero.ECHO], [Hero.ECHO], [Hero.ECHO], [Hero.ECHO], [Hero.GENJI], [Hero.GENJI], [Hero.GENJI], [Hero.GENJI], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER]], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [[2, 5.5, 10.5, 13.5, 14.5, 17.5, 22.5, 26, -1, -1, -1, -1], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8]], [26, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8], [0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [2.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [2.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]]
    eventPlayer.export_data = [[vect(15, 0, 0), vect(-1, 0, 0), 100, 1, 100, 0, 60, 0, 0, 0, 0, 0, 10, 0, 0, 0, false, [true, false, false, false, false, false, false, false, false, false, false, false], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0), vect(1, 0, 0)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0), vect(0, 10, 0)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [vect(4, 4, 4), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10), vect(10, 10, 10)], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50], [[Hero.HAMMOND], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER]], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100], [[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [[1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4, 5, 6, 7, 8]], [8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [5, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], [0.05, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]]


rule "Initialize: Workshop Settings":

    data_loaded[DATA_TYPE.CONTROLS] = false

    import_index = createWorkshopSetting(float[0:11], "1. Save Data   |   x   |   x   | ","Import Index   |   x   |   x   |", 0, 0)

    lang_type = createWorkshopSetting(enum["English", "한국어", "中文"], "2. Language   |   언어   |   语言", "Language   |   언어   |   语言", 0, 0)

    ui_delay = createWorkshopSetting(float[0:5], "3. Configure Inputs   |   입력 구성   |   配置输入", "Menu Hold Delay   |   메뉴 홀드 지연   |   菜单保持延迟", 0, 0)

    user_controls[0] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互動", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Toggle Menu", 4, 1)
    user_controls[1] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Menu Up", 0, 2)
    user_controls[2] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Menu Down", 1, 3)
    user_controls[3] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Step Left", 2, 4)
    user_controls[4] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Step Right", 3, 5)
    user_controls[5] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Jump Left", 13, 6)
    user_controls[6] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Jump Right", 12, 7)
    user_controls[7] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Next Subitem", 6, 8)
    user_controls[8] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Next Subitem", 5, 9)
    user_controls[9] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Set Vector / Action Button", 10, 10)
    user_controls[10] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "3. Configure Inputs   |   입력 구성   |   配置输入", "Turbo Cycle", 11, 11)

    match_timer = createWorkshopSetting(int[0:60], "4. Timers", "Match Timer(Change for replay support)", 0, 0)
    countdown_max = createWorkshopSetting(int[0:10], "4. Timers", "Countdown Timer", 3, 1)
    for loop_index in range(0,len(user_controls),1):
        switch user_controls[loop_index]:
            case 0:
                ui_inputs[loop_index] = Vector.FORWARD
                break
            case 1:
                ui_inputs[loop_index] = Vector.BACKWARD
                break
            case 2:
                ui_inputs[loop_index] = Vector.LEFT
                break
            case 3:
                ui_inputs[loop_index] = Vector.RIGHT
                break
            case 4:
                ui_inputs[loop_index] = Button.INTERACT
                break
            case 5:
                ui_inputs[loop_index] = Button.JUMP
                break
            case 6:
                ui_inputs[loop_index] = Button.CROUCH
                break
            case 7:
                ui_inputs[loop_index] = Button.MELEE
                break
            case 8:
                ui_inputs[loop_index] = Button.PRIMARY_FIRE
                break
            case 9:
                ui_inputs[loop_index] = Button.SECONDARY_FIRE
                break
            case 10:
                ui_inputs[loop_index] = Button.RELOAD
                break
            case 11:
                ui_inputs[loop_index] = Button.ABILITY_1
                break
            case 12:
                ui_inputs[loop_index] = Button.ABILITY_2
                break
            case 13:
                ui_inputs[loop_index] = Button.ULTIMATE
                break

    data_loaded[DATA_TYPE.CONTROLS] = true


rule "anticrash":
    @Event global
    @Condition getServerLoad() >= 225

    wait(2, Wait.ABORT_WHEN_FALSE)
    smallMessage(hostPlayer, "    Server Avg Exceeded 230 for 2 seconds. Slow Motion Enabled.")
    bigMessage(hostPlayer, "    If you see this message either:\na) the server sucks\nb) the dev sucks\nc) your config takes too many resources")
    setSlowMotion(10)
    waitUntil(getServerLoad() < 175, 9999)
    smallMessage(getAllPlayers(), "Server Avg Lowered. Slow Motion Disabled")
    setSlowMotion(100)


rule "Pause Timer":
    @Event global

    if match_timer == 0:
        pauseMatchTime()
    else:
        setMatchTime(match_timer)