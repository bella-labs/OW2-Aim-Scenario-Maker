def create_bot():
    @Name "SUB: create_bot"

    createDummy(bot_gen_hero, bot_gen_team, bot_gen_slot, bot_gen_position, bot_gen_facing)


def destroy_bot():
    @Name "SUB: destroy_bot"

    destroyDummy(bot_gen_team, bot_gen_slot)


def create_target_bot():
    @Name "SUB: create_target_bot"
    
    bot_gen_hero = random.choice(databot.bot_hero_pool[bot_gen_slot])
    bot_gen_team = Team.2
    switch databot.bot_spawn_type[bot_gen_slot]:
        case 0:
            bot_gen_position = databot.bot_spawn_vect[bot_gen_slot]
            break
        case 1:
            bot_gen_position = vect(
                databot.bot_bound_pos[bot_gen_slot].x + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].x, databot.bot_bound_dim[bot_gen_slot].x),
                databot.bot_bound_pos[bot_gen_slot].y + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].y, databot.bot_bound_dim[bot_gen_slot].y),
                databot.bot_bound_pos[bot_gen_slot].z + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].z, databot.bot_bound_dim[bot_gen_slot].z)
            )
            break
        case 2:
            bot_gen_position = nearestWalkablePosition(vect(
                databot.bot_bound_pos[bot_gen_slot].x + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].x, databot.bot_bound_dim[bot_gen_slot].x)/2,
                databot.bot_bound_pos[bot_gen_slot].y + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].y, databot.bot_bound_dim[bot_gen_slot].y)/2,
                databot.bot_bound_pos[bot_gen_slot].z + random.uniform(-1 * databot.bot_bound_dim[bot_gen_slot].z, databot.bot_bound_dim[bot_gen_slot].z)/2)
            )
            break
    bot_gen_facing = databot.bot_facing_vect[bot_gen_slot]
    create_bot()


def destroy_target_bot():
    @Name "SUB: destroy_target_bot"

    bot_gen_team = Team.2
    destroy_bot()
