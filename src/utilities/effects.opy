

rule "Create Effects on effect index":
    @Event eachPlayer
    @Team 1
    @Slot 0
    @Condition menu_index in menu_effect_index or display_boundary

    
    update_bound_effect()

    # Create Boundary Box Effect, Using unused player variables cuz space ain't cheap
    eventPlayer.sce_game_limit = [[0, 1], [0, 2], [0, 4], [1, 3], [1, 5], [2, 3], [2, 6], [3, 7], [4, 5], [4, 6], [5, 7], [6, 7]]
    for eventPlayer.sce_game_mode in range(0, len(eventPlayer.sce_game_limit)):
        createBeam(hostPlayer, Beam.BAD, eventPlayer.cube[eventPlayer.sce_game_limit[evalOnce(eventPlayer.sce_game_mode)][0]], eventPlayer.cube[eventPlayer.sce_game_limit[evalOnce(eventPlayer.sce_game_mode)][1]], Color.ORANGE, EffectReeval.POSITION_AND_RADIUS)
        effect_array[eventPlayer.sce_game_mode] = getLastCreatedEntity()

    # Create Distance Effect
    createEffect(hostPlayer, Effect.RING, Color.AQUA, eventPlayer.getPosition() * vect(1,0,1), databot.bot_dist_min[bot_slot], EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())
    createEffect(hostPlayer, Effect.RING, Color.PURPLE, eventPlayer.getPosition() * vect(1,0,1),  databot.bot_dist_max[bot_slot], EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())

    # Create Player Spawn Effect
    createEffect(hostPlayer, Effect.SPHERE, Color.TEAM_1, databot.sce_player_spawn, 0.5, EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())
    # Create Player Facing Effect
    createBeam(hostPlayer, Beam.GOOD, databot.sce_player_spawn, databot.sce_player_spawn + normalize(databot.sce_player_facing) * 3, Color.TEAM_1, EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())

    # Create Spawn Effect
    createEffect(hostPlayer, Effect.SPHERE, Color.TEAM_2, databot.bot_spawn_vect[bot_slot], 0.5, EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())
    # Create Facing Effect
    createBeam(hostPlayer, Beam.GOOD, databot.bot_spawn_vect[bot_slot], databot.bot_spawn_vect[bot_slot] + normalize(databot.bot_facing_vect) * 3, Color.TEAM_2, EffectReeval.POSITION_AND_RADIUS)
    
    effect_array.append(getLastCreatedEntity())
    # Create Boundary Origin Effect
    createEffect(hostPlayer, Effect.SPHERE, Color.ORANGE, databot.bot_bound_pos[bot_slot], 0.1, EffectReeval.POSITION_AND_RADIUS)
    effect_array.append(getLastCreatedEntity())
    

    
    

rule "Destroy Effects on non effect index":
    @Event eachPlayer
    @Team 1
    @Slot 0
    @Condition menu_index not in menu_effect_index
    @Condition not display_boundary
    
    # Use a random variable that the player doesn't touch for loop since there is potential runtime conflict with using loop_index
    for eventPlayer.sce_game_limit in range(0,len(effect_array),1):
        destroyEffect(effect_array[eventPlayer.sce_game_limit])



def update_bound_effect():
    @Name "SUB: update_bound_effect"    

    eventPlayer.bot_bound_pos = databot.bot_bound_pos[bot_slot]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[bot_slot]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[bot_slot]

    set_cube()