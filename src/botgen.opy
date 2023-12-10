def create_bot():
    @Name "SUB: create_bot"

    createDummy(bot_gen_hero, bot_gen_team, bot_gen_slot, bot_gen_position, bot_gen_facing)


def destroy_bot():
    @Name "SUB: destroy_bot"

    destroyDummy(bot_gen_team, bot_gen_slot)
