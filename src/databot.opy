rule "Databot Populate Settings":
    @Event eachPlayer
    @Team 1
    @Slot 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.hasSpawned() == true

    if use_import_data == true:
        import_settings()
    else:
        default_settings()

    databot_loaded = true
        

def setup_databot():
    @Name "SUB: setup_databot"

    databot_loaded = false

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
    
    eventPlayer.data_bot_hero_pool = [[Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER], [Hero.TRACER]]
    eventPlayer.data_bot_health = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]
    eventPlayer.data_bot_scale = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]
    eventPlayer.data_bot_spawn_type = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    eventPlayer.data_bot_position = [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)]
    eventPlayer.data_bot_facing_type = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    eventPlayer.data_bot_facing_vector = [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)]
    eventPlayer.data_bot_lower_bound = [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)]
    eventPlayer.data_bot_upper_bound = [vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0), vect(0, 0, 0)]
    eventPlayer.data_bot_distance = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
    eventPlayer.data_bot_movement_profile = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
    eventPlayer.data_bot_randomize_profile = [false, false, false, false, false, false, false, false, false, false, false, false]
    
    eventPlayer.data_mvmt_lr = [false, false, false, false, false, false, false, false, false, false, false, false]
    eventPlayer.data_mvmt_lr_time = null
    eventPlayer.data_mvmt_lr_speed = null
    eventPlayer.data_mvmt_lr_random = null
    eventPlayer.data_mvmt_fb = [false, false, false, false, false, false, false, false, false, false, false, false]
    eventPlayer.data_mvmt_fb_time = null
    eventPlayer.data_mvmt_fb_speed = null
    eventPlayer.data_mvmt_fb_random = null


    