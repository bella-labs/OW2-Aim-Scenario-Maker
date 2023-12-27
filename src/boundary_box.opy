rule "Display Boundary Box":
    @Event global
    @Condition menu_index == menu_index_store[0] or menu_index == menu_index_store[0] + 1

    update_bound_effect()
    create_bound_effect()
    

rule "Destroy Boundary Box":
    @Event global
    @Condition menu_index != menu_index_store[0] and menu_index != menu_index_store[0] + 1
    
    destroyEffect(beam_array[0])
    destroyEffect(beam_array[1])
    destroyEffect(beam_array[2])
    destroyEffect(beam_array[3])
    destroyEffect(beam_array[4])
    destroyEffect(beam_array[5])
    destroyEffect(beam_array[6])
    destroyEffect(beam_array[7])
    destroyEffect(beam_array[8])
    destroyEffect(beam_array[9])
    destroyEffect(beam_array[10])
    destroyEffect(beam_array[11])


def update_bound_effect():
    @Name "SUB: update_unit_cube"    

    start_pos = databot.bot_bound_pos[bot_slot]
    scalar_length = databot.bot_bound_dim[bot_slot].x
    scalar_height = databot.bot_bound_dim[bot_slot].y
    scalar_width = databot.bot_bound_dim[bot_slot].z
    start_angle = databot.bot_bound_angle[bot_slot]

    unit_cube = [start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), -scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), -scalar_height/2, scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), scalar_height/2, scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), -scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), -scalar_height/2, scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), scalar_height/2, scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle))]
    

def create_bound_effect():
    @Name "SUB: create_bound_effect"
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[0], unit_cube[1], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[0], unit_cube[1], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[0] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[0], unit_cube[2], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[1] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[0], unit_cube[4], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[2] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[1], unit_cube[3], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[3] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[1], unit_cube[5], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[4] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[2], unit_cube[3], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[5] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[2], unit_cube[6], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[6] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[3], unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[7] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[4], unit_cube[5], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[8] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[4], unit_cube[6], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[9] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[5], unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[10] = getLastCreatedEntity()
    createBeam(getAllPlayers(), Beam.BAD, unit_cube[6], unit_cube[7], Color.ORANGE, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[11] = getLastCreatedEntity()


    



#rule "check in bounds":
#    @Event eachPlayer
#
#    eventPlayer.pos = eventPlayer.getPosition()
#    x_min = min(unit_cube[0].x, min(unit_cube[1].x, min(unit_cube[2].x, min(unit_cube[3].x, min(unit_cube[4].x, min(unit_cube[5].x, min(unit_cube[6].x, unit_cube[7].x)))))))
#    x_max = max(unit_cube[0].x, max(unit_cube[1].x, max(unit_cube[2].x, max(unit_cube[3].x, max(unit_cube[4].x, max(unit_cube[5].x, max(unit_cube[6].x, unit_cube[7].x)))))))
#    y_min = min(unit_cube[0].y, min(unit_cube[1].y, min(unit_cube[2].y, min(unit_cube[3].y, min(unit_cube[4].y, min(unit_cube[5].y, min(unit_cube[6].y, unit_cube[7].y)))))))
#    y_max = max(unit_cube[0].y, max(unit_cube[1].y, max(unit_cube[2].y, max(unit_cube[3].y, max(unit_cube[4].y, max(unit_cube[5].y, max(unit_cube[6].y, unit_cube[7].y)))))))
#    z_min = min(unit_cube[0].z, min(unit_cube[1].z, min(unit_cube[2].z, min(unit_cube[3].z, min(unit_cube[4].z, min(unit_cube[5].z, min(unit_cube[6].z, unit_cube[7].z)))))))
#    z_max = max(unit_cube[0].z, max(unit_cube[1].z, max(unit_cube[2].z, max(unit_cube[3].z, max(unit_cube[4].z, max(unit_cube[5].z, max(unit_cube[6].z, unit_cube[7].z)))))))
#
#    if  x_min < eventPlayer.pos.x and eventPlayer.pos.x < x_max and y_min < eventPlayer.pos.y and eventPlayer.pos.y < y_max and z_min < eventPlayer.pos.z and eventPlayer.pos.z < z_max:
#        Color.ORANGE = Color.GREEN
#    else:
#        Color.ORANGE = Color.RED
#
#    wait(0.5)
#    if RULE_CONDITION:
#        goto RULE_START
#
#