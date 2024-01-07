def set_cube():
    @Name "SUB: set_cube" 

    eventPlayer.calc_var[0] = cosDeg(eventPlayer.bot_bound_angle)
    eventPlayer.calc_var[1] = sinDeg(eventPlayer.bot_bound_angle)

    eventPlayer.cube = [eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], -eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], -eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(-eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - -eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], -eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], -eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], eventPlayer.bot_bound_dim.y, -eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1]),
                 eventPlayer.bot_bound_pos + vect(eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[0] + eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[1], eventPlayer.bot_bound_dim.y, eventPlayer.bot_bound_dim.z * eventPlayer.calc_var[0] - eventPlayer.bot_bound_dim.x * eventPlayer.calc_var[1])]
    
    eventPlayer.boundary_limits[0] = vect(
        min(eventPlayer.cube[0].x, min(eventPlayer.cube[1].x, min(eventPlayer.cube[2].x, min(eventPlayer.cube[3].x, min(eventPlayer.cube[4].x, min(eventPlayer.cube[5].x, min(eventPlayer.cube[6].x, eventPlayer.cube[7].x))))))),
        min(eventPlayer.cube[0].y, min(eventPlayer.cube[1].y, min(eventPlayer.cube[2].y, min(eventPlayer.cube[3].y, min(eventPlayer.cube[4].y, min(eventPlayer.cube[5].y, min(eventPlayer.cube[6].y, eventPlayer.cube[7].y))))))),
        min(eventPlayer.cube[0].z, min(eventPlayer.cube[1].z, min(eventPlayer.cube[2].z, min(eventPlayer.cube[3].z, min(eventPlayer.cube[4].z, min(eventPlayer.cube[5].z, min(eventPlayer.cube[6].z, eventPlayer.cube[7].z)))))))
    )
    eventPlayer.boundary_limits[1] = vect(
        max(eventPlayer.cube[0].x, max(eventPlayer.cube[1].x, max(eventPlayer.cube[2].x, max(eventPlayer.cube[3].x, max(eventPlayer.cube[4].x, max(eventPlayer.cube[5].x, max(eventPlayer.cube[6].x, eventPlayer.cube[7].x))))))),
        max(eventPlayer.cube[0].y, max(eventPlayer.cube[1].y, max(eventPlayer.cube[2].y, max(eventPlayer.cube[3].y, max(eventPlayer.cube[4].y, max(eventPlayer.cube[5].y, max(eventPlayer.cube[6].y, eventPlayer.cube[7].y))))))),
        max(eventPlayer.cube[0].z, max(eventPlayer.cube[1].z, max(eventPlayer.cube[2].z, max(eventPlayer.cube[3].z, max(eventPlayer.cube[4].z, max(eventPlayer.cube[5].z, max(eventPlayer.cube[6].z, eventPlayer.cube[7].z)))))))
    )