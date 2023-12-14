globalvar unit_cube
globalvar scalar_length
globalvar scalar_height
globalvar scalar_width
globalvar edge_array
globalvar beam_array
globalvar beam_color
globalvar index 
globalvar x_min
globalvar x_max
globalvar y_min
globalvar y_max
globalvar z_min
globalvar z_max
globalvar start_pos
globalvar start_angle

playervar pos

subroutine create_bounding_box
subroutine destroy_bounding_box


rule "set data":
    @Event global

    scalar_length = 7
    scalar_height = 7 
    scalar_width = 7

    start_pos = vect(5, 5, 5)
    start_angle = 80

    #unit_cube = [vect(0,0,0), vect(0,20,0)]
    # Only have to modify 4 vectices per scalar 

    #x * cosTheta + z * sinTheta;
    #z * cosTheta - x * sinTheta;


    unit_cube = [start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), -scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), -scalar_height/2, scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(-scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), scalar_height/2, scalar_width/2 * cosDeg(start_angle) - -scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), -scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), -scalar_height/2, scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + -scalar_width/2 * sinDeg(start_angle), scalar_height/2, -scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle)),
                 start_pos + vect(scalar_length/2 * cosDeg(start_angle) + scalar_width/2 * sinDeg(start_angle), scalar_height/2, scalar_width/2 * cosDeg(start_angle) - scalar_length/2 * sinDeg(start_angle))]
    
                 


def create_bounding_box():
    @Name "SUB: create_bounding_box"
    createBeam(hostPlayer, Beam.BAD, unit_cube[0], unit_cube[1], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    createBeam(hostPlayer, Beam.BAD, unit_cube[0], unit_cube[1], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[0] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[0], unit_cube[2], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[1] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[0], unit_cube[4], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[2] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[1], unit_cube[3], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[3] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[1], unit_cube[5], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[4] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[2], unit_cube[3], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[5] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[2], unit_cube[6], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[6] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[3], unit_cube[7], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[7] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[4], unit_cube[5], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[8] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[4], unit_cube[6], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[9] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[5], unit_cube[7], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[10] = getLastCreatedEntity()
    createBeam(hostPlayer, Beam.BAD, unit_cube[6], unit_cube[7], beam_color, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    beam_array[11] = getLastCreatedEntity()


    
def destroy_bounding_box():
    @Name "SUB: destroy_bounding_box"
    
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


rule "check in bounds":
    @Event eachPlayer

    eventPlayer.pos = eventPlayer.getPosition()
    x_min = min(unit_cube[0].x, min(unit_cube[1].x, min(unit_cube[2].x, min(unit_cube[3].x, min(unit_cube[4].x, min(unit_cube[5].x, min(unit_cube[6].x, unit_cube[7].x)))))))
    x_max = max(unit_cube[0].x, max(unit_cube[1].x, max(unit_cube[2].x, max(unit_cube[3].x, max(unit_cube[4].x, max(unit_cube[5].x, max(unit_cube[6].x, unit_cube[7].x)))))))
    y_min = min(unit_cube[0].y, min(unit_cube[1].y, min(unit_cube[2].y, min(unit_cube[3].y, min(unit_cube[4].y, min(unit_cube[5].y, min(unit_cube[6].y, unit_cube[7].y)))))))
    y_max = max(unit_cube[0].y, max(unit_cube[1].y, max(unit_cube[2].y, max(unit_cube[3].y, max(unit_cube[4].y, max(unit_cube[5].y, max(unit_cube[6].y, unit_cube[7].y)))))))
    z_min = min(unit_cube[0].z, min(unit_cube[1].z, min(unit_cube[2].z, min(unit_cube[3].z, min(unit_cube[4].z, min(unit_cube[5].z, min(unit_cube[6].z, unit_cube[7].z)))))))
    z_max = max(unit_cube[0].z, max(unit_cube[1].z, max(unit_cube[2].z, max(unit_cube[3].z, max(unit_cube[4].z, max(unit_cube[5].z, max(unit_cube[6].z, unit_cube[7].z)))))))

    if  x_min < eventPlayer.pos.x and eventPlayer.pos.x < x_max and y_min < eventPlayer.pos.y and eventPlayer.pos.y < y_max and z_min < eventPlayer.pos.z and eventPlayer.pos.z < z_max:
        beam_color = Color.GREEN
    else:
        beam_color = Color.RED

    wait(0.5)
    if RULE_CONDITION:
        goto RULE_START


rule "hud":
    @Event global

        # Small server load on right
        hudSubheader([i for i in localPlayer],
        "Server Load (Curr/Avg/Peak): {0}/{1}/{2}\n".format(getServerLoad(), getAverageServerLoad(), getPeakServerLoad()), 
        HudPosition.RIGHT, 
        -9999, 
        Color.WHITE, 
        HudReeval.VISIBILITY_AND_STRING, 
        SpecVisibility.DEFAULT)
    
        # Large vector data for reference on right
        hudSubtext([i for i in localPlayer],
        "Position: {0}\nFacing: {1}".format(magnitude(vect(7,7,7)), normalize(vect(7,7,7))),
        HudPosition.RIGHT, 
        -1, 
        Color.WHITE, 
        HudReeval.VISIBILITY_AND_STRING, 
        SpecVisibility.DEFAULT)