settings "settings.json"


rule "Update Testbot":
    @Event eachPlayer
    @Team 1
    @Slot 0

    hudHeader(eventPlayer, "Speed {0}".format(eventPlayer.getSpeed()), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudHeader(eventPlayer, "Velocity {0}".format(eventPlayer.getVelocity()), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)