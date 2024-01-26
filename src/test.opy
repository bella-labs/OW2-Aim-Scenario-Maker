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
        getPlayersInSlot(0, Team.2).disabled_movements[9]
        ),
    HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer, 
    " b: {0}\n rb: {1}\n r: {2}\n fr: {3}\n f: {4}\n fl {5}\n l {6}\n bl {7}".format(
        getPlayersInSlot(0, Team.2).disabled_dir[0],
        getPlayersInSlot(0, Team.2).disabled_dir[1],
        getPlayersInSlot(0, Team.2).disabled_dir[2],
        getPlayersInSlot(0, Team.2).disabled_dir[3],
        getPlayersInSlot(0, Team.2).disabled_dir[4],
        getPlayersInSlot(0, Team.2).disabled_dir[5],
        getPlayersInSlot(0, Team.2).disabled_dir[6],
        getPlayersInSlot(0, Team.2).disabled_dir[7]
        ),
    HudPosition.RIGHT, 900, Color.BLUE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer, 
    " bound: {0}".format(
        horizontalAngleOfDirection(getPlayersInSlot(0, Team.2).getFacingDirection())
        ),
    HudPosition.RIGHT, 900, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer, 
    " c1: {0}".format(
        calc1),
        udPosition.RIGHT, 900, Color.ORANGE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer, 
    " c2: {0}".format(
        calc2),
    HudPosition.RIGHT, 900, Color.GREEN, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)


rule "Override Databot Data":
    @Event global
    @Condition data_loaded[DATA_TYPE.DATA_BOT] == true

    
    #databot.bot_facing_type[0] = 1
    #databot.mvmt_weights[0] = [1,-1,-1,-1,-1,-1,-1,-1]
    #databot.mvmt_max_weight = 1

    #databot.mvmt_left_min[0] = 5
    #databot.mvmt_left_max[0] = 5
    #databot.mvmt_right_min[0] = 5
    #databot.mvmt_right_max[0] = 5

    #databot.mvmt_fwd_min[0] = 5
    #databot.mvmt_fwd_max[0] = 5
    #databot.mvmt_back_min[0] = 5
    #databot.mvmt_back_max[0] = 5