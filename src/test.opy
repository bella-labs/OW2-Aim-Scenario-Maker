settings "settings.json"


rule "Update Testbot":
    @Event eachPlayer
    @Team 1
    @Slot 0
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    createDummy(Hero.TRACER, Team.2, 0, eventPlayer.getPosition(), eventPlayer.getFacingDirection())