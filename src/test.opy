#settings "settings.json"
settings "echo_settings.json"

globalvar last_impulse

# Includes
#!include "header.opy"
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
#!include "custom_scripts/echo.opy"
##!include "custom_scripts/genji.opy"
##!include "custom_scripts/blink_melee.opy"
##!include "custom_scripts/nevermiss.opy"


rule "mvmt arrow":
    @Event global
    @Condition getPlayersInSlot(0, Team.2)
    @Disabled

    createBeam(getPlayersInSlot(0, Team.1), Beam.GRAPPLE, getPlayersInSlot(0, Team.2).getEyePosition(), getPlayersInSlot(0, Team.2).getEyePosition() + getPlayersInSlot(0, Team.2).target_mvmt_dir * 10, Color.BLACK, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)