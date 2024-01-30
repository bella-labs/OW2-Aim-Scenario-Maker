rule "Scenario End Handler Timer":
    @Event global
    @Condition scenario_status == true
    @Condition databot.sce_game_mode == 0
    @Condition timer == 0

    sce_stop_scenario()


rule "Scenario End Handler Score":
    @Event global
    @Condition scenario_status == true
    @Condition databot.sce_game_mode == 1
    @Condition sce_player.player_score >= databot.sce_game_limit

    sce_stop_scenario()


rule "Player Headshot Handler":
    @Event playerDealtDamage
    @Team 1
    @Condition scenario_status
    @Condition eventWasCriticalHit 

    eventPlayer.player_score += databot.sce_hs_points


rule "Player Bodyshot Handler":
    @Event playerDealtDamage
    @Team 1
    @Condition scenario_status
    @Condition not eventWasCriticalHit 

    eventPlayer.player_score += databot.sce_bs_points


rule "Player Elim Handler":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition scenario_status 

    elims += 1
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

    while(eventPlayer.strafe_dir == eventPlayer.getThrottle()):
        if eventPlayer.strafe_timer >= databot.sce_strafe_min and eventPlayer.strafe_timer < databot.sce_strafe_max:
            eventPlayer.player_score += databot.sce_strafe_pps/10
        wait(0.1)
    stopChasingVariable(eventPlayer.strafe_timer)
    wait()

    if RULE_CONDITION:
        goto RULE_START


rule "Show Next Scenario Bot":
    @Event playerDied
    @Condition databot.sce_spawn_order == 1

    show_next_bot()


def sce_start_scenario():
    @Name "SUB: sce_start_scenario"

    menu_visible = false
    wait(0.1)
    sce_player = eventPlayer
    sce_player.player_score = 0
    elims = 0

    for bot_gen_slot in range(0, 12):
        destroy_target_bot()
        active_bot_status[bot_gen_slot] = false

    scenario_bot = null
    scenario_bot_index = 0
    for bot_gen_slot in range(0, 12):
        if databot.bot_slot_status[bot_gen_slot]:
            create_target_bot()
            active_bot_status[bot_gen_slot] = true
            if databot.sce_spawn_order == 1:
                scenario_bot[scenario_bot_index] = getPlayersInSlot(bot_gen_slot, Team.2)

                scenario_bot[scenario_bot_index].setInvisibility(Invis.ALL)
                scenario_bot[scenario_bot_index].setStatusEffect(null, Status.PHASED_OUT, 9999)
                scenario_bot_index += 1

    scenario_bot_index = len(scenario_bot)

    if databot.sce_spawn_order == 1:
        show_next_bot()

    disable_player_input()
    setup_player_in_scenario()

    smallMessage(eventPlayer, "    3")
    wait(1)
    smallMessage(eventPlayer, "    2")
    wait(1)
    smallMessage(eventPlayer, "    1")
    wait(1)

    eventPlayer.player_speed = databot.sce_player_speed
    enable_player_input()

    bigMessage(eventPlayer, "Start")

    if databot.sce_game_mode == 0:
        timer = databot.sce_game_limit
        chase(timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)
    else:
        timer = 0
        chase(timer, 9999, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    scenario_status = true


def setup_player_in_scenario():
    @Name "SUB: setup_player_in_scenario"
    
    sce_player.teleport(databot.sce_player_spawn)
    sce_player.setFacing(databot.sce_player_facing, Relativity.TO_WORLD)
    sce_player.setGravity(databot.sce_player_gravity)


def reset_player():
    @Name "SUB: reset_player"

    if not menu_visible:
        sce_player.setMoveSpeed(100)
    sce_player.setGravity(100)


def sce_stop_scenario():
    @Name "SUB: sce_stop_scenario"

    reset_player()

    for bot_gen_slot in range(0, 12):
        destroy_target_bot()
        active_bot_status[bot_gen_slot] = false
    
    bot_gen_slot = menu_item_var_1[menu_index-1]

    stopChasingVariable(timer)

    if databot.sce_game_mode == 0:
        sce_player.last_score = sce_player.player_score
    else:
        sce_player.last_score = timer
    if sce_player.last_score > sce_player.high_score:
        sce_player.high_score = sce_player.last_score

    elims = 0
    timer = 0

    scenario_status = false


def show_next_bot():
    @Name "SUB: show_next_bot"

    scenario_bot[scenario_bot_index].setInvisibility(Invis.ALL)
    scenario_bot[scenario_bot_index].setStatusEffect(null, Status.PHASED_OUT, 9999)
    scenario_bot_index += 1
    if scenario_bot_index >= len(scenario_bot):
        scenario_bot_index = 0
    scenario_bot[scenario_bot_index].setInvisibility(Invis.NONE)
    scenario_bot[scenario_bot_index].clearStatusEffect(Status.PHASED_OUT)