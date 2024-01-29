rule "Initialize: Workshop Settings":

    data_loaded[DATA_TYPE.CONTROLS] = false

    lang_type = createWorkshopSetting(enum["English", "한국어", "中文"], "1. Language   |   언어   |   语言", "Language   |   언어   |   语言", 0, 0)
    
    ui_delay = createWorkshopSetting(float[0:5], "2. Configure Inputs   |   입력 구성   |   配置输入", "Menu Hold Delay   |   메뉴 홀드 지연   |   菜单保持延迟", 0, 0)

    user_controls[0] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互動", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Toggle Menu", 4, 1)
    user_controls[1] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Menu Up", 0, 2)
    user_controls[2] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Menu Down", 1, 3)
    user_controls[3] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Step Left", 2, 4)
    user_controls[4] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Step Right", 3, 5)
    user_controls[5] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Jump Left", 13, 6)
    user_controls[6] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Jump Right", 12, 7)
    user_controls[7] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Next Subitem", 6, 8)
    user_controls[8] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Next Subitem", 5, 9)
    user_controls[9] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Set Vector / Action Button", 10, 10)
    user_controls[10] = createWorkshopSetting(enum["Move Forward   |   앞으로 이동   |   前行", "Move Backward   |   뒤로 이동   |   向后移动", "Move Left   |   왼쪽으로 이동   |   向左移动   |", "Move Right   |   오른쪽으로 이동   |   向右转", "Interact   |   상호 작용   |   互动", "Jump   |   점프   |   跳", "Crouch   |   웅크리기   |   蹲", "Melee   |   근접 공격   |   近战", "Primary Fire   |   기본 발사   |   主要攻擊", "Secondary Fire   |   보조 발사   |   次要攻擊", "Reload   |   재장전   |   裝填", "Ability 1   |   기술 1   |   技能 1", "Ability 2   |   기술 2   |   技能 2", "Ultimate   |   궁극기   |   絕招"], "2. Configure Inputs   |   입력 구성   |   配置输入", "Turbo Cycle", 11, 11)

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
    @Condition getServerLoad() >= 225

    wait(2, Wait.ABORT_WHEN_FALSE)
    smallMessage(hostPlayer, "    Server Avg Exceeded 230 for 2 seconds. Slow Motion Enabled.")
    bigMessage(hostPlayer, "    If you see this message either:\na) the server sucks\nb) the dev sucks\nc) your config takes too many resources")
    setSlowMotion(10)
    waitUntil(getServerLoad() < 175, 9999)
    smallMessage(getAllPlayers(), "Server Avg Lowered. Slow Motion Disabled")
    setSlowMotion(100)

