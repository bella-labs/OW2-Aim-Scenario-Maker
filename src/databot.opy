rule "Databot Populate Settings":
    @Event eachPlayer
    @Team 1
    @Slot 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true

    data_loaded[DATA_INDEXES.DATA_BOT] = false
    waitUntil(data_loaded[DATA_INDEXES.DATA_CONTROLS] == true, 9999)
    
    eventPlayer.import_mode = false
    import_settings()
    if eventPlayer.import_mode == false:
        default_settings()

    data_loaded[DATA_INDEXES.DATA_BOT] = true
        

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
        eventPlayer.bot_slots[loop_index] = false
        eventPlayer.bot_hero_pool[loop_index] = [Hero.TRACER]
        eventPlayer.bot_health = 100
        eventPlayer.bot_hps = 0
        eventPlayer.bot_hps_wait = 0
        eventPlayer.bot_scale_type = 0
        eventPlayer.bot_scale_min = 100
        eventPlayer.bot_scale_max = 100
        eventPlayer.bot_gravity = 100
        eventPlayer.bot_spawn_type = 0
        eventPlayer.bot_spawn_vect = vect(0,0,0)