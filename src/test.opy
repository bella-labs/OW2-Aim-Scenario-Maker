rule "text":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer

    # eventPlayer.owner_player = getPlayersInSlot(0, Team.2)
    createBeam(eventPlayer, Beam.GRAPPLE, vect(0,3,0), vect(0,3,100), Color.BLUE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    hudSubheader(eventPlayer, "{0}".format(scenario_in_progress), HudPosition.TOP, 9999, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "dist: {0}".format(distance(eventPlayer.getPosition(), getPlayersInSlot(0, Team.2).getPosition())), HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "{0}".format(horizontalAngleTowards(eventPlayer, getPlayersInSlot(0, Team.2).getPosition())), HudPosition.RIGHT, 991, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "{0}".format(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC]), HudPosition.RIGHT, 993, Color.GREEN, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "{0}".format(eventPlayer.disabled_indexes[DISABLED_VARS.DIST_CALC]), HudPosition.RIGHT, 994, Color.GREEN, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "{0}".format(bot_gen_facing), HudPosition.RIGHT, 995, Color.BLUE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, "{0}".format(getPlayersInSlot(0, Team.2).getFacingDirection()), HudPosition.RIGHT, 995, Color.BLUE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)



rule "recalc dist idx":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer

    eventPlayer.disabled_target = DISABLED_VARS.DIST_CALC
    eventPlayer.disabled_indexes[DISABLED_VARS.DIST_OFFSET] = -1
    eventPlayer.disabled_indexes[DISABLED_VARS.DIST_POS] = getPlayersInSlot(0, Team.2).getPosition()
    set_disabled_index_dist()
    wait(0.25)
    
    if RULE_CONDITION:
        goto RULE_START