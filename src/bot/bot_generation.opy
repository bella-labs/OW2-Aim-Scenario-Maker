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


def destroy_target_bot():
    @Name "SUB: destroy_target_bot"

    bot_gen_team = Team.2
    destroyDummy(bot_gen_team, bot_gen_slot)
