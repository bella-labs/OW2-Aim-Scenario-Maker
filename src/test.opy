settings "settings.json"

#Extensions
#!extension spawnMoreDummyBots
##!optimizeForSize

# Includes
#!include "header.opy"
#!include "initialization/custom.opy"
#!include "initialization/init.opy"
#!include "initialization/player.opy"
#!include "data/static_data.opy"
#!include "data/databot.opy"
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
#!include "bot/bot_listener.opy"
#!include "bot/bot_handler.opy"
#!include "bot/mvmt_handler.opy"
#!include "scenario/scenario_handler.opy"

globalvar testbot

rule "Update Testbot":
    @Event eachPlayer
    @Team 2
    @Slot 0
    @Condition eventPlayer.hasSpawned()

    testbot = getPlayersInSlot(0, Team.2)

rule "Test Data":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer

    testbot = getPlayersInSlot(0, Team.2)

    hudSubheader(eventPlayer,
    " b: {0}\n rb: {1}\n r: {2}\n fr: {3}\n f: {4}\n fl {5}\n l {6}\n bl {7}\n u {8}\n d {9}".format(
        testbot.disabled_hori[0],
        testbot.disabled_hori[1],
        testbot.disabled_hori[2],
        testbot.disabled_hori[3],
        testbot.disabled_hori[4],
        testbot.disabled_hori[5],
        testbot.disabled_hori[6],
        testbot.disabled_hori[7],
        testbot.disabled_vert[0],
        testbot.disabled_vert[1]
        ),
    HudPosition.RIGHT, 900, Color.BLACK, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer,
    " bound: {0}".format(
        horizontalAngleOfDirection(testbot.getFacingDirection())
        ),
    HudPosition.RIGHT, 900, Color.RED, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer,
    " c1: {0}".format(
        testbot.boundary_limits[0].y),
    HudPosition.RIGHT, 900, Color.ORANGE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer,
    " c2: {0}".format(
        testbot.target_vert_dir),
    HudPosition.RIGHT, 900, Color.GREEN, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)

    hudSubheader(eventPlayer,
    "DB0: {0}\nDB1: {1}\nDB2: {2}\nDB3: {3}\n".format(
        testbot.disabled_boundary[0],
        testbot.disabled_boundary[1],
        testbot.disabled_boundary[2],
        testbot.disabled_boundary[3]
        ),
    HudPosition.RIGHT, 900, Color.BLUE, HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.ALWAYS)
