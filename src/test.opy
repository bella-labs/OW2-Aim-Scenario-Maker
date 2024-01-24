settings "settings.json"

#Extensions
#!extension spawnMoreDummyBots
##!optimizeForSize

# Includes
#!include "header.opy"
#!include "data/init.opy"
#!include "data/static_data.opy"
#!include "ui/ui_framework.opy"
#!include "ui/ui_builder.opy"
#!include "actions/actions_handler.opy"
#!include "actions/actions_general.opy"
#!include "actions/actions_main_menu.opy"
#!include "actions/actions_scenario.opy"
#!include "actions/actions_bot.opy"
#!include "actions/actions_movement.opy"
#!include "utilities/util.opy"
#!include "utilities/effects.opy"
#!include "bot/bot_generation.opy"
#!include "data/databot.opy"
#!include "bot/bot_listener.opy"
#!include "bot/bot_handler.opy"
#!include "bot/mvmt_handler.opy"
#!include "scenario/player.opy"
#!include "scenario/scenario_handler.opy"


rule "text":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer

    # eventPlayer.owner_player = getPlayersInSlot(0, Team.2)
    #createBeam(eventPlayer, Beam.GRAPPLE, vect(0,3,0), vect(0,3,100), Color.BLUE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    hudSubheader(eventPlayer, "{0}".format(getPlayersInSlot(0, Team.2).owner_player), HudPosition.TOP, 9999, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    hudSubheader(eventPlayer, 
    " b: {0}\n rb: {1}\n r: {2}\n fr: {3}\n f: {4}\n fl {5}\n l {6}\n bl {7}\n u {8}\n d {9}".format(
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
    " a: {0}\n b: {1}\n c: {2}\n d: {3}\n e: {4}".format(
        calc1, 
        calc2,
        calc3,
        getPlayersInSlot(0, Team.2).disabled_bound,
        null
        ), 
        HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
