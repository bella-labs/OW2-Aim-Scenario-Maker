rule "Target Bot Horizontal Movement":
    @Event eachPlayer
    @Team 2

    async(select_mvmt_dir, AsyncBehavior.RESTART)
    wait(eventPlayer.target_mvmt_wait)

    goto RULE_START

        
def select_mvmt_dir():
    @Name "SUB: select_mvmt_dir"

    eventPlayer.target_rand = random.uniform(0, eventPlayer.mvmt_max_weight[eventPlayer.profile_index])
    switch true:
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_back_min[eventPlayer.profile_index], eventPlayer.mvmt_back_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD
            eventPlayer.target_mvmt_vect = Vector.BACKWARD
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_br_min[eventPlayer.profile_index], eventPlayer.mvmt_br_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_RIGHT
            eventPlayer.target_mvmt_vect = Vector.BACKWARD + Vector.RIGHT
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_right_min[eventPlayer.profile_index], eventPlayer.mvmt_right_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.RIGHT
            eventPlayer.target_mvmt_vect = Vector.RIGHT
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_RIGHT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fr_min[eventPlayer.profile_index], eventPlayer.mvmt_fr_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_RIGHT
            eventPlayer.target_mvmt_vect = Vector.FORWARD + Vector.RIGHT
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fwd_min[eventPlayer.profile_index], eventPlayer.mvmt_fwd_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD
            eventPlayer.target_mvmt_vect = Vector.FORWARD
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.FORWARD_LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_fl_min[eventPlayer.profile_index], eventPlayer.mvmt_fl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.FORWARD_LEFT
            eventPlayer.target_mvmt_vect = Vector.FORWARD + Vector.LEFT
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_left_min[eventPlayer.profile_index], eventPlayer.mvmt_left_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.LEFT
            eventPlayer.target_mvmt_vect = Vector.LEFT
            break
        case eventPlayer.target_rand <= eventPlayer.mvmt_weights[eventPlayer.profile_index][XZ_DIR.BACKWARD_LEFT]:
            eventPlayer.target_mvmt_wait = random.uniform(eventPlayer.mvmt_bl_min[eventPlayer.profile_index], eventPlayer.mvmt_bl_max[eventPlayer.profile_index])
            eventPlayer.target_mvmt_index = XZ_DIR.BACKWARD_LEFT
            eventPlayer.target_mvmt_vect = Vector.BACKWARD + Vector.LEFT
            break
        default:
            eventPlayer.target_mvmt_wait = 0.01
            eventPlayer.target_mvmt_vect = vect(0,0,0)
            break

    if eventPlayer.disabled_movements[eventPlayer.target_mvmt_index] > 0:
        switch eventPlayer.bot_bound_type:
            case 0:
                eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_vect * vect(-1, -1, -1)
                break
            case 1:
                eventPlayer.target_mvmt_dir = vect(0,0,0)
                break
            case 2:
                teleport_target()
                eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_vect
                break
    else:
        eventPlayer.target_mvmt_dir = eventPlayer.target_mvmt_vect
    