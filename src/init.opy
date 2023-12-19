def import_settings():
    @Name "----->  Paste Player Variables Here / 여기에 플레이어 변수를 붙여넣으세요 / 將您的玩家變數貼到此處  <-----"

    smallMessage(null, "paste here! / 여기에 붙여넣으세요! / 貼在這裡！")


def default_player_menu():
    @Name "SUB: default_player_menu"



rule "Initialize: Workshop Settings":

    
    use_import_data = createWorkshopSetting(bool, "0. Import Settings", "Import Settings (See Description for Instructions) / 가져오기 설정 (지침은 설명을 참조하세요) / 導入設定（請參閱說明以取得說明)", false, 0)

    lang_type = createWorkshopSetting(enum["English", "한국어", "中文"], "1. Language", "English / 한국어 / 中文", 0, 0)
    
    ui_delay = createWorkshopSetting(float, "2. UI Settings", "Menu toggle hold delay", 0, 0)

    user_controls[0] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Toggle Menu", 4, 1)
    user_controls[1] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Menu Up", 0, 2)
    user_controls[2] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Menu Down", 1, 3)
    user_controls[3] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Step Left", 2, 4)
    user_controls[4] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Step Right", 3, 5)
    user_controls[5] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Jump Left", 13, 6)
    user_controls[6] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Jump Right", 12, 7)
    user_controls[7] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Next Subitem", 11, 8)
    user_controls[8] = createWorkshopSetting(enum["Walk Forward", "Walk Backward", "Walk Left", "Walk Right", "Interact", "Jump", "Crouch", "Melee", "Primary Fire", "Secondary Fire", "Reload", "Ability 1", "Ability 2", "Ultimate"], "2. UI Settings", "Set Vector", 10, 9)

    for loop_index in range(0,len(user_controls)):
        switch user_controls[loop_index]:
            case 0:
                ui_controls[loop_index] = Vector.FORWARD
                break
            case 1:
                ui_controls[loop_index] = Vector.BACKWARD
                break
            case 2:
                ui_controls[loop_index] = Vector.LEFT
                break
            case 3:
                ui_controls[loop_index] = Vector.RIGHT
                break
            case 4:
                ui_controls[loop_index] = Button.INTERACT
                break
            case 5:
                ui_controls[loop_index] = Button.JUMP
                break
            case 6:
                ui_controls[loop_index] = Button.CROUCH
                break
            case 7:
                ui_controls[loop_index] = Button.MELEE
                break
            case 8:
                ui_controls[loop_index] = Button.PRIMARY_FIRE
                break
            case 9:
                ui_controls[loop_index] = Button.SECONDARY_FIRE
                break
            case 10:
                ui_controls[loop_index] = Button.RELOAD
                break
            case 11:
                ui_controls[loop_index] = Button.ABILITY_1
                break
            case 12:
                ui_controls[loop_index] = Button.ABILITY_2
                break
            case 13:
                ui_controls[loop_index] = Button.ULTIMATE
                break

# Defines the Input for UI, making it easy to change menu inputs.


rule "Change Hero":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)
    @Condition eventPlayer.isHoldingButton(Button.MELEE)
    @Condition menu_visible == false

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()


rule "anticrash":
    @Condition getServerLoad() >= 225

    wait(2, Wait.ABORT_WHEN_FALSE)
    smallMessage(hostPlayer, "    Server Avg Exceeded 230 for 2 seconds. Slow Motion Enabled.")
    bigMessage(hostPlayer, "    If you see this message either:\na) the server sucks\nb) the dev sucks\nc) your config takes too many resources")
    setSlowMotion(10)
    waitUntil(getServerLoad() < 175, 9999)
    smallMessage(getAllPlayers(), "Server Avg Lowered. Slow Motion Disabled")
    setSlowMotion(100)

