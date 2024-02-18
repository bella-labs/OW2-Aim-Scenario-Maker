rule "Target Bot Initalization":
    @Event eachPlayer
    @Team 2

    # Set Owner Player
    eventPlayer.owner_player = getPlayersInSlot(0, Team.1)
    # Set Movement Direction
    eventPlayer.target_mvmt_dir = vect(0,0,0)
    # Set Disabled Movements
    eventPlayer.disabled_hori = [0,0,0,0,0,0,0,0]
    eventPlayer.disabled_vert = [0,0]
    eventPlayer.disabled_boundary = [-1, -1, -1, -1]
    eventPlayer.target_vert_dir = 0
    # Set Gravity and Speed to -1 to force listener rule trigger when set to 0
    eventPlayer.bot_speed_min = -1
    eventPlayer.bot_gravity = -1


def create_target_bot():
    @Name "SUB: create_target_bot"

    bot_gen_hero = random.choice(databot.bot_hero_pool[bot_gen_slot])
    bot_gen_team = Team.2
    switch databot.bot_spawn_type[bot_gen_slot]:
        case 0:
            bot_gen_position = databot.bot_spawn_vect[bot_gen_slot]
            break
        case 1:
            bot_gen_position = databot.bot_bound_pos[bot_gen_slot] + vect(random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].x, databot.bot_bound_dim[bot_gen_slot].x)/2, random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].y, databot.bot_bound_dim[bot_gen_slot].y)/2, random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].z, databot.bot_bound_dim[bot_gen_slot].z)/2)
            break
        case 2:
            bot_gen_position = nearestWalkablePosition(databot.bot_bound_pos[bot_gen_slot] + vect(random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].x, databot.bot_bound_dim[bot_gen_slot].x)/2, random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].y, databot.bot_bound_dim[bot_gen_slot].y)/2, random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].z, databot.bot_bound_dim[bot_gen_slot].z)/2))
            break
    bot_gen_facing = normalize(databot.bot_facing_vect[bot_gen_slot])
    createDummy(bot_gen_hero, bot_gen_team, bot_gen_slot, bot_gen_position, bot_gen_facing)

    getPlayersInSlot(bot_gen_slot, bot_gen_team).startForcingName("{0}{1}".format(strings_misc[lang_type][10], bot_gen_slot))

    if databot.bot_health[bot_gen_slot] == 0:
        getPlayersInSlot(bot_gen_slot, bot_gen_team).setStatusEffect(eventPlayer, Status.UNKILLABLE, 9999)


def destroy_target_bot():
    @Name "SUB: destroy_target_bot"

    destroyDummy(Team.2, bot_gen_slot)
