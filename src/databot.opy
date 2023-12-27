rule "Databot Populate Settings":
    @Event eachPlayer
    @Team 1
    @Slot 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true

    data_loaded[DATA_TYPE.DATA_BOT] = false
    waitUntil(data_loaded[DATA_TYPE.DATA_CONTROLS] == true, 9999)
    
    eventPlayer.import_mode = false
    import_settings()
    if eventPlayer.import_mode == false:
        default_settings()

    data_loaded[DATA_TYPE.DATA_BOT] = true
        

def setup_databot():
    @Name "SUB: setup_databot"

    bot_gen_hero = Hero.ECHO
    bot_gen_team = Team.1
    bot_gen_slot = 1
    bot_gen_position = vect(1000,1000,1000)
    bot_gen_facing = vect(0,0,0)
    create_bot()

    databot = getPlayersInSlot(bot_gen_slot,bot_gen_team)
    databot.setGravity(0)
    databot.startForcingName(strings_misc[lang_type][0])
    databot.setStatusEffect(null, Status.PHASED_OUT, 9999)
    #eventPlayer.setInvisibility(Invis.ALL)
    #eventPlayer.startFacing(directionTowards( eventPlayer.getEyePosition(), (getPlayersInSlot(eventPlayer.getSlot() - 6, Team.1)).getEyePosition()), default_turn_rate, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    #eventPlayer.attachTo(getPlayersInSlot(eventPlayer.getSlot() - 6, Team.1), vect(0, 0, -2))


def default_settings():
    @Name "SUB: default_settings"
    
    eventPlayer.import_mode = true
    
    for loop_index in range(0, 11, 1):
        eventPlayer.bot_slot_status[loop_index] = false
        eventPlayer.bot_hero_pool[loop_index] = [Hero.TRACER]
        eventPlayer.bot_health[loop_index] = 100
        eventPlayer.bot_hps[loop_index] = 0
        eventPlayer.bot_hps_wait[loop_index] = 0
        eventPlayer.bot_scale_type[loop_index] = 0
        eventPlayer.bot_scale_min[loop_index] = 100
        eventPlayer.bot_scale_max[loop_index] = 100
        eventPlayer.bot_gravity[loop_index] = 100
        eventPlayer.bot_spawn_type[loop_index] = 0
        eventPlayer.bot_spawn_vect[loop_index] = vect(0,0,0)
        eventPlayer.bot_facing_type[loop_index] = 0
        eventPlayer.bot_facing_vect[loop_index] = vect(0,0,0)
        eventPlayer.bot_bound_pos[loop_index] = vect(0,0,0)
        eventPlayer.bot_bound_angle[loop_index] = 0
        eventPlayer.bot_bound_dim[loop_index] = vect(0,0,0)
        eventPlayer.bot_dist_min[loop_index] = 0
        eventPlayer.bot_dist_max[loop_index] = 0
        eventPlayer.bot_profile_status[loop_index] = [false, false, false, false, false, false, false, false, false, false, false, false]
        eventPlayer.bot_profile_type[loop_index] = 0
        eventPlayer.bot_profile_min[loop_index] = 0
        eventPlayer.bot_profile_max[loop_index] = 0
        eventPlayer.bot_custom_script[loop_index] = false

    eventPlayer.scen_player_spawn = vect(0,0,0)
