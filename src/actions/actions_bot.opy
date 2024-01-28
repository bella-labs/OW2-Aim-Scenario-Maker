def act_bot_select_slot():
    @Name "SUB: act_bot_select_slot"

    switch menu_action:
        # Change bot slot.
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            bot_slot = menu_item_var_1[menu_index]
            subact_select_slot_refresh()
            break
        # Toggle all slots.
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            # Set the action var to the opposite of the current selection boolean.
            action_var = not databot.bot_slot_status[bot_slot]
            # Loop through all slots and set the flag to the new value.
            for loop_index in range(0, len(databot.bot_slot_status), 1):
                databot.bot_slot_status[loop_index] = action_var
            break
        # Toggle current slot.
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            databot.bot_slot_status[bot_slot] = not databot.bot_slot_status[bot_slot]
            break
    # Update the status text and color

    action_var = databot.bot_slot_status[bot_slot]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()

    if display_boundary:
        update_bound_effect()


def subact_select_slot_refresh():
    @Name "SUB: subact_select_slot_refresh"

    refresh_index = refresh_start[0]
    # Spawn
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.SPAWN][databot.bot_spawn_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_spawn_vect[bot_slot].x
    menu_item_var_3[refresh_index] = databot.bot_spawn_vect[bot_slot].y
    menu_item_var_4[refresh_index] = databot.bot_spawn_vect[bot_slot].z
    # Facing
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.FACING][databot.bot_facing_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_facing_vect[bot_slot].x
    menu_item_var_3[refresh_index] = databot.bot_facing_vect[bot_slot].y
    menu_item_var_4[refresh_index] = databot.bot_facing_vect[bot_slot].z
    # Boundary Position
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_bound_pos[bot_slot].x
    menu_item_var_2[refresh_index] = databot.bot_bound_pos[bot_slot].y
    menu_item_var_3[refresh_index] = databot.bot_bound_pos[bot_slot].z
    # Boundary Dimension
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_bound_angle[bot_slot]
    menu_item_var_2[refresh_index] = databot.bot_bound_dim[bot_slot].x
    menu_item_var_3[refresh_index] = databot.bot_bound_dim[bot_slot].y
    menu_item_var_4[refresh_index] = databot.bot_bound_dim[bot_slot].z
    update_bound_effect()
    # Distance
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_dist_min[bot_slot]
    menu_item_var_2[refresh_index] = databot.bot_dist_max[bot_slot]
    # Hero Pool
    refresh_index += 1
    action_var = hero_array[menu_item_var_3[refresh_index]] in databot.bot_hero_pool[bot_slot] 
    action_var_2 = refresh_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()
    # Health
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_health[bot_slot] 
    menu_item_var_2[refresh_index] = databot.bot_hps[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_hps_wait[bot_slot]
    # Speed
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.TARGET][databot.bot_speed_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_speed_min[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_speed_max[bot_slot]
    menu_item_var_4[refresh_index] = databot.bot_speed_target[bot_slot]
    # Scale
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.TARGET][databot.bot_scale_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_scale_min[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_scale_max[bot_slot]
    menu_item_var_4[refresh_index] = databot.bot_scale_target[bot_slot]
    # Gravity
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_gravity[bot_slot]
    # Profile Weights
    refresh_index += 1
    action_var = databot.bot_profile_weights[bot_slot]
    act_general_unsum_weights()
    profile_weights = action_result
    menu_item_var_2[refresh_index] = profile_weights[profile_slot]
    # Random Profile
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.PROFILE][databot.bot_profile_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_profile_min[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_profile_max[bot_slot]
    # Custom Scripts
    refresh_index += 1
    if databot.bot_script_status[bot_slot] == 0:
        menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.TOGGLE][0]
    else:
        menu_item_var_1[refresh_index] = databot.bot_script_status[bot_slot]
    menu_item_var_2[refresh_index] = databot.bot_script_status[bot_slot]
    

def act_bot_override_slot():
    @Name "SUB: act_bot_override_slot"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[9]] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[9]), strings_prompt[lang_type][7]))
            menu_item_color_on[menu_index] = menu_colors_custom[0]
            waitUntil((eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])) == true, 1)
            if (eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])):
                menu_item_color_on[menu_index] = menu_colors_custom[1]
                for loop_index in range(0,12):
                    action_var = loop_index
                    subact_bot_override_slot()
                wait(0.25)
            menu_item_color_on[menu_index] = menu_color_on_index
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[9]] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[9]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = menu_colors_custom[0]
            waitUntil((eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])) == true, 2)
            if (eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])):
                action_var = menu_item_var_1[menu_index]
                subact_bot_override_slot()
                menu_item_color_on[menu_index] = menu_colors_custom[1]
                wait(0.25)
            menu_item_color_on[menu_index] = menu_color_on_index
            break



def subact_bot_override_slot():
    @Name "SUB: subact_bot_override_slot"

    # Slot Status
    databot.bot_slot_status[action_var] = databot.bot_slot_status[bot_slot]
    # Hero Pool
    databot.bot_hero_pool[action_var] = databot.bot_hero_pool[bot_slot]
    # Health
    databot.bot_health[action_var] = databot.bot_health[bot_slot]
    databot.bot_hps[action_var] = databot.bot_hps[bot_slot]
    databot.bot_hps_wait[action_var] = databot.bot_hps_wait[bot_slot]
    # Speed
    databot.bot_speed_type[action_var] = databot.bot_speed_type[bot_slot]
    databot.bot_speed_min[action_var] = databot.bot_speed_min[bot_slot]
    databot.bot_speed_max[action_var] = databot.bot_speed_max[bot_slot]
    databot.bot_speed_target[action_var] = databot.bot_speed_target[bot_slot]
    # Scale
    databot.bot_scale_type[action_var] = databot.bot_scale_type[bot_slot]
    databot.bot_scale_min[action_var] = databot.bot_scale_min[bot_slot]
    databot.bot_scale_max[action_var] = databot.bot_scale_max[bot_slot]
    databot.bot_scale_target[action_var] = databot.bot_scale_target[bot_slot]
    # Gravity
    databot.bot_gravity[action_var] = databot.bot_gravity[bot_slot]
    # Spawn
    databot.bot_spawn_type[action_var] = databot.bot_spawn_type[bot_slot]
    databot.bot_spawn_vect[action_var] = databot.bot_spawn_vect[bot_slot]
    # Facing
    databot.bot_facing_type[action_var] = databot.bot_facing_type[bot_slot]
    databot.bot_facing_vect[action_var] = databot.bot_facing_vect[bot_slot]
    # Boundary Origin
    databot.bot_bound_pos[action_var] = databot.bot_bound_pos[bot_slot]
    # Boundary Box
    databot.bot_bound_angle[action_var] = databot.bot_bound_angle[bot_slot]
    databot.bot_bound_dim[action_var] = databot.bot_bound_dim[bot_slot]
    # Distance
    databot.bot_dist_min[action_var] = databot.bot_dist_min[bot_slot]
    databot.bot_dist_max[action_var] = databot.bot_dist_max[bot_slot]
    # Profile Status
    databot.bot_profile_weights[action_var] = databot.bot_profile_weights[bot_slot]
    databot.bot_profile_max_weight[action_var] = databot.bot_profile_max_weight[bot_slot]
    # Profile Randomizer
    databot.bot_profile_type[action_var] = databot.bot_profile_type[bot_slot]
    databot.bot_profile_min[action_var] = databot.bot_profile_min[bot_slot]
    databot.bot_profile_max[action_var] = databot.bot_profile_max[bot_slot]

    databot.bot_script_status[action_var] = databot.bot_script_status[bot_slot]


def act_bot_spawn():
    @Name "SUB: act_bot_spawn"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        action_var_2 = eventPlayer.getPosition()
        databot.bot_spawn_vect[bot_slot] = action_var_2
        menu_item_var_2[menu_index] = action_var_2.x
        menu_item_var_3[menu_index] = action_var_2.y
        menu_item_var_4[menu_index] = action_var_2.z
    else:
        action_var = databot.bot_spawn_vect[bot_slot]
        action_var_2 = menu_index
        switch subitem_index[menu_index]:
            case 0:
                action_var = databot.bot_spawn_type[bot_slot]
                action_var_2 = menu_index
                action_var_3 = OPTIONS_TYPE.SPAWN
                act_general_change_list_var_1()
                databot.bot_spawn_type[bot_slot] = action_var
                break
            case 1:
                general_target = GENERAL_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = action_result
                menu_item_var_2[menu_index] = action_result.x
                break
            case 2:
                general_target = GENERAL_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = action_result
                menu_item_var_3[menu_index] = action_result.y
                break
            case 3:
                general_target = GENERAL_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = action_result
                menu_item_var_4[menu_index] = action_result.z
                break


def act_bot_facing():
    @Name "SUB: act_bot_facing"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        action_var_2 = eventPlayer.getFacingDirection()
        databot.bot_facing_vect[bot_slot] = action_var_2
        menu_item_var_2[menu_index] = action_var_2.x
        menu_item_var_3[menu_index] = action_var_2.y
        menu_item_var_4[menu_index] = action_var_2.z
    else:
        action_var = databot.bot_facing_vect[bot_slot]
        action_var_2 = menu_index
        switch subitem_index[menu_index]:
            case 0:
                action_var = databot.bot_facing_type[bot_slot]
                action_var_2 = menu_index
                action_var_3 = OPTIONS_TYPE.FACING
                act_general_change_list_var_1()
                databot.bot_facing_type[bot_slot] = action_var
                break
            case 1:
                general_target = GENERAL_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = action_result
                menu_item_var_2[menu_index] = action_result.x
                break
            case 2:
                general_target = GENERAL_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = action_result
                menu_item_var_3[menu_index] = action_result.y
                break
            case 3:
                general_target = GENERAL_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = action_result
                menu_item_var_4[menu_index] = action_result.z
                break


def act_bot_bound():
    @Name "SUB: act_bot_bound"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        action_var_2 = eventPlayer.getPosition()
        databot.bot_bound_pos[bot_slot] = action_var_2
        menu_item_var_2[menu_index] = action_var_2.x
        menu_item_var_3[menu_index] = action_var_2.y
        menu_item_var_4[menu_index] = action_var_2.z
    else:
        action_var = databot.bot_bound_pos[bot_slot]
        action_var_2 = menu_index
        switch subitem_index[menu_index]:
            case 0:
                action_var = databot.bot_bound_type[bot_slot]
                action_var_2 = menu_index
                action_var_3 = OPTIONS_TYPE.BOUNDS
                act_general_change_list_var_1()
                databot.bot_bound_type[bot_slot] = action_var
                break
            case 1:
                general_target = GENERAL_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = action_result
                menu_item_var_2[menu_index] = action_result.x
                break
            case 2:
                general_target = GENERAL_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = action_result
                menu_item_var_3[menu_index] = action_result.y
                break
            case 3:
                general_target = GENERAL_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = action_result
                menu_item_var_4[menu_index] = action_result.z
                break
    update_bound_effect()

    
def act_bot_bound_dimentions():
    @Name "SUB: act_bot_bound_dimentions"

    action_var = databot.bot_bound_dim[bot_slot]
    action_var_2 = menu_index
    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.bot_bound_angle[bot_slot] = menu_item_var_1[menu_index]
            break
        case 1:
            general_target = GENERAL_TARGET.VECT_X
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = action_result
            menu_item_var_2[menu_index] = action_result.x
            break
        case 2:
            general_target = GENERAL_TARGET.VECT_Y
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = action_result
            menu_item_var_3[menu_index] = action_result.y
            break
        case 3:
            general_target = GENERAL_TARGET.VECT_Z
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = action_result
            menu_item_var_4[menu_index] = action_result.z
            break
    update_bound_effect()


def act_bot_distance():
    @Name "SUB: act_bot_distance"

    action_var = menu_item_var_1[menu_index]
    action_var_2 = menu_item_var_2[menu_index]

    switch subitem_index[menu_index]:
        case 0:
            general_target = GENERAL_TARGET.MIN
            break
        case 1:
            general_target = GENERAL_TARGET.MAX
            break

    act_general_change_min_max()

    menu_item_var_1[menu_index] = action_var
    menu_item_var_2[menu_index] = action_var_2

    databot.bot_dist_min[bot_slot] = action_var
    databot.bot_dist_max[bot_slot] = action_var_2


def act_bot_hero_pool():
	@Name "SUB: act_bot_hero_pool"

    switch menu_action:
        # Change target hero
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_3()
            break
        # Toggle all heroes
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array :
                new_hero_array = []
            else:
                new_hero_array = hero_array
            databot.bot_hero_pool[bot_slot] = new_hero_array
            break
        # Toggle selected hero
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array :
                new_hero_array.remove(hero_array[menu_item_var_3[menu_index]])
            else:
                if len(new_hero_array) > 0:
                    new_hero_array.append(hero_array[menu_item_var_3[menu_index]])
                else: 
                    new_hero_array[0] = hero_array[menu_item_var_3[menu_index]]
            databot.bot_hero_pool[bot_slot] = new_hero_array
            break

    # Update item data
    menu_item_title_on[menu_index] = heroIcon(hero_array[menu_item_var_3[menu_index]])
    menu_item_var_1[menu_index] = hero_array[menu_item_var_3[menu_index]]

    action_var = hero_array[menu_item_var_3[menu_index]] in databot.bot_hero_pool[bot_slot]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_2()
	

def act_bot_health():
    @Name "SUB: act_bot_health"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            switch subitem_index[menu_index]:
                case 0:
                    act_general_num_var_1()
                    databot.bot_health[bot_slot] = menu_item_var_1[menu_index]
                    break
                case 1:
                    act_general_num_var_2()
                    databot.bot_hps[bot_slot] = menu_item_var_2[menu_index]
                    break
                case 2:
                    act_general_num_var_3()
                    databot.bot_hps_wait[bot_slot] = menu_item_var_3[menu_index]
                    break


def act_bot_speed():
    @Name "SUB: act_bot_speed"

    if subitem_index[menu_index] == 0:
        action_var = databot.bot_speed_type[bot_slot]
        action_var_2 = menu_index
        action_var_3 = OPTIONS_TYPE.TARGET
        act_general_change_list_var_1()
        databot.bot_speed_type[bot_slot] = action_var
    elif subitem_index[menu_index] == 3:
        act_general_num_var_4()
        databot.bot_speed_target[bot_slot] = menu_item_var_4[menu_index]
    else:
        action_var = databot.bot_speed_min[bot_slot]
        action_var_2 = databot.bot_speed_max[bot_slot]

        if subitem_index[menu_index] == 1:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()
        menu_item_var_2[menu_index] = action_var
        menu_item_var_3[menu_index] = action_var_2
        databot.bot_speed_min[bot_slot] = action_var
        databot.bot_speed_max[bot_slot] = action_var_2


def act_bot_scale():
    @Name "SUB: act_bot_scale"

    if subitem_index[menu_index] == 0:
        action_var = databot.bot_scale_type[bot_slot]
        action_var_2 = menu_index
        action_var_3 = OPTIONS_TYPE.TARGET
        act_general_change_list_var_1()
        databot.bot_scale_type[bot_slot] = action_var
    elif subitem_index[menu_index] == 3:
        act_general_num_var_4()
        databot.bot_scale_target[bot_slot] = menu_item_var_4[menu_index]
    else:
        action_var = databot.bot_scale_min[bot_slot]
        action_var_2 = databot.bot_scale_max[bot_slot]

        if subitem_index[menu_index] == 1:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()
        menu_item_var_2[menu_index] = action_var
        menu_item_var_3[menu_index] = action_var_2
        databot.bot_scale_min[bot_slot] = action_var
        databot.bot_scale_max[bot_slot] = action_var_2


def act_bot_gravity():
    @Name "SUB: act_bot_gravity"

    act_general_num_var_1()
    databot.bot_gravity[bot_slot] = menu_item_var_1[menu_index]


def act_bot_select_profile():
    @Name "SUB: act_bot_select_profile"

    if subitem_index[menu_index] == 0:
        act_mvmt_select_prof()
    else:
        action_var = menu_item_var_2[menu_index]
        act_general_clear()
        
        action_var_2 = 1
        act_general_num_temp()
        profile_weights[profile_slot] = action_temp

        action_var = profile_weights
        act_general_calc_weights()
        databot.bot_profile_weights[bot_slot] = action_var_2
        databot.bot_profile_max_weight[bot_slot] = action_result

    action_var = profile_weights[profile_slot]
    act_general_disable()
    menu_item_var_2[menu_index] = action_var


def act_bot_profile_order():
    @Name "SUB: act_bot_profile_order"
    
    if subitem_index[menu_index] == 0:
        action_var = databot.bot_profile_type[bot_slot]
        action_var_2 = menu_index
        action_var_3 = OPTIONS_TYPE.PROFILE
        act_general_change_list_var_1()
        databot.bot_profile_type[bot_slot] = action_var
    else:
        action_var = databot.bot_profile_min[bot_slot]
        action_var_2 = databot.bot_profile_max[bot_slot]
        if subitem_index[menu_index] == 1:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX
        act_general_change_min_max()
        menu_item_var_2[menu_index] = action_var
        menu_item_var_3[menu_index] = action_var_2
        databot.bot_profile_min[bot_slot] = action_var
        databot.bot_profile_max[bot_slot] = action_var_2


def act_bot_script_status():
    @Name "SUB: act_bot_script_status"
    
    databot.bot_script_status[bot_slot] = not databot.bot_script_status[bot_slot]
    action_var = databot.bot_script_status[bot_slot]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()
    