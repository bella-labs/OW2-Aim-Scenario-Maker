rule "Scenario End Handler Timer":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer
    @Condition scenario_status
    @Condition databot.sce_game_mode == 0
    @Condition scenario_timer == 0

    sce_stop_scenario()


rule "Scenario End Handler Score":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer
    @Condition scenario_status
    @Condition databot.sce_game_mode == 1
    @Condition eventPlayer.player_score >= databot.sce_game_limit

    sce_stop_scenario()


rule "Player Bodyshot Handler":
    @Event playerDealtDamage
    @Team 1
    @Condition scenario_status
    @Condition not eventWasCriticalHit

    eventPlayer.player_score += databot.sce_bs_points


rule "Player Headshot Handler":
    @Event playerDealtDamage
    @Team 1
    @Condition scenario_status
    @Condition eventWasCriticalHit

    eventPlayer.player_score += databot.sce_hs_points


rule "Player Elim Handler":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition scenario_status

    eventPlayer.elims += 1
    eventPlayer.player_score += databot.sce_elim_points


rule "Player Strafe Score Handler":
    @Event eachPlayer
    @Team 1
    @Condition scenario_status
    @Condition databot.sce_strafe_pps > 0
    @Condition eventPlayer.getThrottle() != vect(0,0,0)

    eventPlayer.strafe_dir = eventPlayer.getThrottle()
    eventPlayer.strafe_timer = 0
    chase(eventPlayer.strafe_timer, 9999, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    waitUntil(eventPlayer.strafe_dir != eventPlayer.getThrottle(), 9999)
    stopChasingVariable(eventPlayer.strafe_timer)

    if  eventPlayer.strafe_timer >= databot.sce_strafe_min:
        if eventPlayer.strafe_timer < databot.sce_strafe_max:
            eventPlayer.player_score += databot.sce_strafe_pps * (eventPlayer.strafe_timer - databot.sce_strafe_min)
        else:
            eventPlayer.player_score += databot.sce_strafe_pps * (databot.sce_strafe_max - databot.sce_strafe_min)

    wait()

    if RULE_CONDITION:
        goto RULE_START


rule "Show Next Scenario Bot":
    @Event playerDied
    @Condition databot.sce_spawn_order == 1

    hide_current_bot()
    show_next_bot()



def sce_start_scenario():
    @Name "SUB: sce_start_scenario"

    menu_visible = false
    wait(0.1)
    sce_player = eventPlayer
    sce_player.player_score = 0
    sce_player.elims = 0

    for bot_gen_slot in range(0, 12):
        destroy_target_bot()
        active_bot_status[bot_gen_slot] = false

    scenario_bots = null
    for bot_gen_slot in range(0, 12):
        if databot.bot_slot_status[bot_gen_slot]:
            create_target_bot()
            active_bot_status[bot_gen_slot] = true
            scenario_bots[bot_gen_slot] = getPlayersInSlot(bot_gen_slot, Team.2)
            scenario_bots_index = bot_gen_slot
            hide_current_bot()

    disable_player_input()
    setup_player_in_scenario()

    countdown_timer = countdown_max
    while countdown_timer > 0:
        smallMessage(sce_player, "  Starting in... {0}".format(countdown_timer))
        wait(0.5)
        countdown_timer -= 1
        wait(0.5)


    scenario_bots_index = 0

    if databot.sce_spawn_order == 1:
        show_next_bot()
    else:
        while scenario_bots_index < len(scenario_bots):
            show_next_bot()


    eventPlayer.player_speed = databot.sce_player_speed
    eventPlayer.startScalingSize(databot.sce_player_scale, true)
    enable_player_input()
    bigMessage(eventPlayer, "Start")

    if databot.sce_game_mode == 0:
        scenario_timer = databot.sce_game_limit
        chase(scenario_timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)
    else:
        scenario_timer = 0
        chase(scenario_timer, 9999, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    scenario_status = true


def setup_player_in_scenario():
    @Name "SUB: setup_player_in_scenario"

    sce_player.setGravity(databot.sce_player_gravity)
    wait(0.1)
    sce_player.teleport(databot.sce_player_spawn)
    sce_player.setFacing(databot.sce_player_facing, Relativity.TO_WORLD)



def reset_player():
    @Name "SUB: reset_player"

    if not menu_visible:
        sce_player.setMoveSpeed(100)
    sce_player.stopScalingSize()
    sce_player.setGravity(100)


def sce_stop_scenario():
    @Name "SUB: sce_stop_scenario"

    reset_player()

    for bot_gen_slot in range(0, 12):
        destroy_target_bot()
        active_bot_status[bot_gen_slot] = false

    bot_gen_slot = menu_item_var_1[menu_index-1]

    stopChasingVariable(scenario_timer)

    if databot.sce_game_mode == 0:
        sce_player.last_score = sce_player.player_score
        if sce_player.last_score > sce_player.high_score:
            sce_player.high_score = sce_player.last_score
    else:
        sce_player.last_score = scenario_timer
        if sce_player.last_score < sce_player.high_score:
            sce_player.high_score = sce_player.last_score

    scenario_status = false


def hide_current_bot():
    @Name "SUB: hide_current_bot"

    scenario_bots[scenario_bots_index].setInvisibility(Invis.ALL)
    scenario_bots[scenario_bots_index].setStatusEffect(null, Status.PHASED_OUT, 9999)



def show_next_bot():
    @Name "SUB: show_next_bot"

    if scenario_bots_index >= len(scenario_bots):
        scenario_bots_index = 0

    scenario_bot = scenario_bots[scenario_bots_index]
    switch scenario_bot.bot_spawn_type:
        case 0:
            scenario_bot.teleport(scenario_bot.bot_spawn_vect)
            break
        case 1:
            scenario_bot.teleport(scenario_bot.bot_bound_pos + vect(random.uniform(-1 * scenario_bot.bot_bound_dim.x, scenario_bot.bot_bound_dim.x)/2, random.uniform(-scenario_bot.bot_bound_dim.y, scenario_bot.bot_bound_dim.y)/2, random.uniform(-scenario_bot.bot_bound_dim.z, scenario_bot.bot_bound_dim.z)/2))
            break
        case 2:
            scenario_bot.teleport(nearestWalkablePosition(scenario_bot.bot_bound_pos + vect(random.uniform(-scenario_bot.bot_bound_dim.x, scenario_bot.bot_bound_dim.x)/2, random.uniform(-scenario_bot.bot_bound_dim.y, scenario_bot.bot_bound_dim.y)/2, random.uniform(-scenario_bot.bot_bound_dim.z, scenario_bot.bot_bound_dim.z)/2)))
            break

    scenario_bots[scenario_bots_index].setInvisibility(Invis.NONE)
    scenario_bots[scenario_bots_index].clearStatusEffect(Status.PHASED_OUT)
    scenario_bots_index += 1



