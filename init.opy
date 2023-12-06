def import_player_menu():
    @Name "----->  Paste Player Variables Here  <-----"

    smallMessage(null, "paste after here!")


def default_player_menu():
    @Name "SUB: default_player_menu"

    smallMessage(null, "")


rule "Initialize: Workshop Settings":

    ## UI Settings
    controller_mode = createWorkshopSetting(bool, "0. UI Settings", "Controller UI", false, 0)
    set_ui_data()
    use_import_data = createWorkshopSetting(bool, "1. Import Settings", "Import Existing Settings (Paste Player Variables in the 1st workshop rule)", false, 0)


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
        ui_inputs[2] = Vector.BACKWARD
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



rule "Change Hero":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)
    @Condition eventPlayer.isHoldingButton(Button.MELEE)

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

