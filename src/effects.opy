

rule "Create Effects on effect index":
    @Event eachPlayer
    @Team 1
    @Slot 0
    @Condition menu_index in menu_effect_index

    
    update_bound_effect()
    update_distance_effect()

    create_bound_effect()
    create_distance_effect()
    

rule "Destroy Effects on non effect index":
    @Event eachPlayer
    @Team 1
    @Slot 0
    @Condition menu_index not in menu_effect_index
    
    destroy_effects()


def destroy_effects():
    @Name "SUB: destroy_effects"
    # Use a random variable that the player doesn't touch for loop since there is potential runtime conflict with using loop_index
    for eventPlayer.import_status in range(0,len(effect_array),1):
        destroyEffect(effect_array[eventPlayer.import_status])


def update_bound_effect():
    @Name "SUB: update_bound_effect"    

    eventPlayer.bot_bound_pos = databot.bot_bound_pos[bot_slot]
    eventPlayer.bot_bound_dim = databot.bot_bound_dim[bot_slot]
    eventPlayer.bot_bound_angle = databot.bot_bound_angle[bot_slot]

    set_unit_cube()


def set_unit_cube():
    @Name "SUB: set_unit_cube" 

    eventPlayer.calc_var_1 = cosDeg(eventPlayer.bot_bound_angle)
    eventPlayer.calc_var_2 = sinDeg(eventPlayer.bot_bound_angle)
    #eventPlayer.bot_bound_dim /= 2

    eventPlayer.unit_cube = [eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, -eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, -eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, -eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, -eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_1 + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_2, eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var_1 - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var_2)]
    
    #eventPlayer.bot_bound_dim *= 2

def create_bound_effect():
    @Name "SUB: create_bound_effect"
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[0], eventPlayer.unit_cube[1], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[0], eventPlayer.unit_cube[1], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[0] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[0], eventPlayer.unit_cube[2], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[1] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[0], eventPlayer.unit_cube[4], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[2] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[1], eventPlayer.unit_cube[3], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[3] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[1], eventPlayer.unit_cube[5], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[4] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[2], eventPlayer.unit_cube[3], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[5] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[2], eventPlayer.unit_cube[6], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[6] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[3], eventPlayer.unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[7] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[4], eventPlayer.unit_cube[5], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[8] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[4], eventPlayer.unit_cube[6], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[9] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[5], eventPlayer.unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[10] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.unit_cube[6], eventPlayer.unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[11] = getLastCreatedEntity()


def update_distance_effect():
    @Name "SUB: update_distance_effect"

    ring_data[0] = databot.sce_player_spawn
    ring_data[1] = databot.bot_dist_min[bot_slot]
    ring_data[2] = databot.bot_dist_max[bot_slot]


def create_distance_effect():
    @Name "SUB: create_distance_effect"

    createEffect(getAllPlayers(), Effect.RING, Color.RED, ring_data[0], databot.bot_dist_min[bot_slot], EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[12] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, ring_data[0],  databot.bot_dist_max[bot_slot], EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    effect_array[13] = getLastCreatedEntity()
    