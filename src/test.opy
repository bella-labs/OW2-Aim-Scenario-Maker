rule "text":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer

    # eventPlayer.owner_player = getPlayersInSlot(0, Team.2)
    #createBeam(eventPlayer, Beam.GRAPPLE, vect(0,3,0), vect(0,3,100), Color.BLUE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    hudSubheader(eventPlayer, "{0}".format(getPlayersInSlot(0, Team.2).owner_player), HudPosition.TOP, 9999, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, 
    " f: {0}\n fr: {1}\n r: {2}\n rb: {3}\n b: {4}\n bl {5}\n l {6}\n lr {7}\n u {8}\n d {9}".format(
        getPlayersInSlot(0, Team.2).disabled_movements[0],
        getPlayersInSlot(0, Team.2).disabled_movements[1],
        getPlayersInSlot(0, Team.2).disabled_movements[2],
        getPlayersInSlot(0, Team.2).disabled_movements[3],
        getPlayersInSlot(0, Team.2).disabled_movements[4],
        getPlayersInSlot(0, Team.2).disabled_movements[5],
        getPlayersInSlot(0, Team.2).disabled_movements[6],
        getPlayersInSlot(0, Team.2).disabled_movements[7],
        getPlayersInSlot(0, Team.2).disabled_movements[8],
        getPlayersInSlot(0, Team.2).disabled_movements[9]), 
        HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

        hudSubheader(eventPlayer, 
    " dir: {0}\n rand: {1}\n wait: {2}\n idx: {3}".format(
        getPlayersInSlot(0, Team.2).target_mvmt_dir, 
        getPlayersInSlot(0, Team.2).target_mvmt_rand,
        getPlayersInSlot(0, Team.2).target_mvmt_wait,
        getPlayersInSlot(0, Team.2).profile_index), 
        HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    

    
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