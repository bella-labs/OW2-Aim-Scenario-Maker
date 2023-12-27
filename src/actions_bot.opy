def act_bot_select_slot():
    @Name "SUB: act_bot_select_slot"

    switch menu_action:
        # Change bot slot.
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            bot_slot = menu_item_var_1[menu_index]
            subact_select_slot_refresh()
            break
        # Toggle all slots.
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            # Set the action var to the opposite of the current selection boolean.
            action_var = not databot.bot_slots[bot_slot]
            # Loop through all slots and set the flag to the new value.
            for loop_index in range(0, 12, 1):
                databot.bot_slots[loop_index] = action_var
            break
        # Toggle current slot.
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            databot.bot_slots[bot_slot] = not databot.bot_slots[bot_slot]
            break
    # Update the status text and color
    if databot.bot_slots[bot_slot] == true:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][0]
        menu_item_color_on[menu_index] = Color.GREEN
    else:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][1]
        menu_item_color_on[menu_index] = Color.RED

def subact_select_slot_refresh():
    @Name "SUB: subact_select_slot_refresh"

    refresh_index = menu_index
    # Override Slot
    refresh_index += 1
    # Hero Pool
    refresh_index += 1
    if hero_array[menu_item_var_3[refresh_index]] in databot.bot_hero_pool[bot_slot] == true:
        menu_item_var_2[refresh_index] = strings_options[lang_type][0][0]
        menu_item_color_on[refresh_index] = Color.GREEN
    else:
        menu_item_var_2[refresh_index] = strings_options[lang_type][0][1]
        menu_item_color_on[refresh_index] = Color.RED
    # Health
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_health[bot_slot] 
    menu_item_var_2[refresh_index] = databot.bot_hps[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_hps_wait[bot_slot]
    # Scale
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][3][databot.bot_scale_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_scale_min[bot_slot]
    menu_item_var_3[refresh_index] = databot.bot_scale_max[bot_slot]
    # Gravity
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.bot_gravity[bot_slot]
    # Spawn
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][4][databot.bot_spawn_type[bot_slot]]
    menu_item_var_2[refresh_index] = databot.bot_spawn_vect[bot_slot].x
    menu_item_var_3[refresh_index] = databot.bot_spawn_vect[bot_slot].y
    menu_item_var_4[refresh_index] = databot.bot_spawn_vect[bot_slot].z
    # Facing
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][5][databot.bot_facing_type[bot_slot]]
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

        
    
def act_bot_override_slot():
    @Name "SUB: act_bot_override_slot"

    switch menu_action:
        # Change target slot
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_1_num()
            break
        # Override all slots? not sure if good / needed
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        # Override target slot
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil(eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_bot_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_bot_override_slot():
    @Name "SUB: subact_bot_override_slot"
    action_var = menu_item_var_1[menu_index]

    databot.bot_slots[action_var] = databot.bot_slots[bot_slot]

    databot.bot_hero_pool[action_var] = databot.bot_hero_pool[bot_slot]

    databot.bot_health[action_var] = databot.bot_health[bot_slot]
    databot.bot_hps[action_var] = databot.bot_hps[bot_slot]
    databot.bot_hps_wait[action_var] = databot.bot_hps_wait[bot_slot]

    databot.bot_scale_type[action_var] = databot.bot_scale_type[bot_slot]
    databot.bot_scale_min[action_var] = databot.bot_scale_min[bot_slot]
    databot.bot_scale_max[action_var] = databot.bot_scale_max[bot_slot]

    databot.bot_gravity[action_var] = databot.bot_gravity[bot_slot]

    databot.bot_spawn_type[action_var] = databot.bot_spawn_type[bot_slot]
    databot.bot_spawn_vect[action_var] = databot.bot_spawn_vect[bot_slot]
    
    databot.bot_facing_type[action_var] = databot.bot_facing_type[bot_slot]
    databot.bot_facing_vect[action_var] = databot.bot_facing_vect[bot_slot]

    databot.bot_bound_pos[action_var] = databot.bot_bound_pos[bot_slot]

    databot.bot_bound_angle[action_var] = databot.bot_bound_angle[bot_slot]
    databot.bot_bound_dim[action_var] = databot.bot_bound_dim[bot_slot]


def act_bot_hero_pool():
	@Name "SUB: act_bot_hero_pool"

    switch menu_action:
        # Change target hero
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_chg_var_3_num()
            break
        # Toggle all heroes
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
                new_hero_array = []
            else:
                new_hero_array = hero_array
            databot.bot_hero_pool[bot_slot] = new_hero_array
            break
        # Toggle selected hero
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            new_hero_array = databot.bot_hero_pool[bot_slot]
            if hero_array[menu_item_var_3[menu_index]] in new_hero_array == true:
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

    if hero_array[menu_item_var_3[menu_index]] in databot.bot_hero_pool[bot_slot] == true:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][0]
        menu_item_color_on[menu_index] = Color.GREEN
    else:
        menu_item_var_2[menu_index] = strings_options[lang_type][0][1]
        menu_item_color_on[menu_index] = Color.RED
	

def act_bot_health():
    @Name "SUB: act_bot_health"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            switch subitem_index[menu_index]:
                case 0:
                    act_general_chg_var_1_num()
                    databot.bot_health[bot_slot] = menu_item_var_1[menu_index]
                    break
                case 1:
                    act_general_chg_var_2_num()
                    databot.bot_hps[bot_slot] = menu_item_var_2[menu_index]
                    break
                case 2:
                    act_general_chg_var_3_num()
                    databot.bot_hps_wait[bot_slot] = menu_item_var_3[menu_index]
                    break

                    
def act_bot_scale():
    @Name "SUB: act_bot_scale"

    switch subitem_index[menu_index]:
        case 0:
            general_num = databot.bot_scale_type[bot_slot]
            general_option_size = len(strings_options[lang_type][3])
            act_general_change_list()
            databot.bot_scale_type[bot_slot] = general_num
            menu_item_var_1[menu_index] = strings_options[lang_type][3][databot.bot_scale_type[bot_slot]]
            break
        case 1:
            act_general_chg_var_2_num()
            databot.bot_scale_min[bot_slot] = menu_item_var_2[menu_index]
            break

        case 2:
            act_general_chg_var_3_num()
            databot.bot_scale_max[bot_slot] = menu_item_var_3[menu_index]
            break


def act_bot_gravity():
    @Name "SUB: act_bot_gravity"

    act_general_chg_var_1_num()
    databot.bot_gravity[bot_slot] = menu_item_var_1[menu_index]


def act_bot_spawn():
    @Name "SUB: act_bot_spawn"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        general_vect = eventPlayer.getPosition()
        databot.bot_spawn_vect[bot_slot] = general_vect
        menu_item_var_2[menu_index] = general_vect.x
        menu_item_var_3[menu_index] = general_vect.y
        menu_item_var_4[menu_index] = general_vect.z
    else:
        general_vect = databot.bot_spawn_vect[bot_slot]
        switch subitem_index[menu_index]:
            case 0:
                general_num = databot.bot_spawn_type[bot_slot]
                general_option_size = len(strings_options[lang_type][4])
                act_general_change_list()
                databot.bot_spawn_type[bot_slot] = general_num
                menu_item_var_1[menu_index] = strings_options[lang_type][4][databot.bot_spawn_type[bot_slot]]
                break
            case 1:
                general_vect_target = VECTOR_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = general_vect
                menu_item_var_2[menu_index] = general_vect.x
                break
            case 2:
                general_vect_target = VECTOR_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = general_vect
                menu_item_var_3[menu_index] = general_vect.y
                break
            case 3:
                general_vect_target = VECTOR_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_spawn_vect[bot_slot] = general_vect
                menu_item_var_4[menu_index] = general_vect.z
                break


def act_bot_facing():
    @Name "SUB: act_bot_facing"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        general_vect = eventPlayer.getFacingDirection()
        databot.bot_facing_vect[bot_slot] = general_vect
        menu_item_var_2[menu_index] = general_vect.x
        menu_item_var_3[menu_index] = general_vect.y
        menu_item_var_4[menu_index] = general_vect.z
    else:
        general_vect = databot.bot_facing_vect[bot_slot]
        switch subitem_index[menu_index]:
            case 0:
                general_num = databot.bot_facing_type[bot_slot]
                general_option_size = len(strings_options[lang_type][5])
                act_general_change_list()
                databot.bot_facing_type[bot_slot] = general_num
                menu_item_var_1[menu_index] = strings_options[lang_type][5][databot.bot_facing_type[bot_slot]]
                break
            case 1:
                general_vect_target = VECTOR_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = general_vect
                menu_item_var_2[menu_index] = general_vect.x
                break
            case 2:
                general_vect_target = VECTOR_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = general_vect
                menu_item_var_3[menu_index] = general_vect.y
                break
            case 3:
                general_vect_target = VECTOR_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_facing_vect[bot_slot] = general_vect
                menu_item_var_4[menu_index] = general_vect.z
                break


def act_bot_bound_pos():
    @Name "SUB: act_bot_bound_pos"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        general_vect = eventPlayer.getPosition()
        databot.bot_bound_pos[bot_slot] = general_vect
        menu_item_var_1[menu_index] = general_vect.x
        menu_item_var_2[menu_index] = general_vect.y
        menu_item_var_3[menu_index] = general_vect.z
    else:
        general_vect = databot.bot_bound_pos[bot_slot]
        switch subitem_index[menu_index]:
            case 0:
                general_vect_target = VECTOR_TARGET.VECT_X
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = general_vect
                menu_item_var_1[menu_index] = general_vect.x
                break
            case 1:
                general_vect_target = VECTOR_TARGET.VECT_Y
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = general_vect
                menu_item_var_2[menu_index] = general_vect.y
                break
            case 2:
                general_vect_target = VECTOR_TARGET.VECT_Z
                act_general_change_vect()
                databot.bot_bound_pos[bot_slot] = general_vect
                menu_item_var_3[menu_index] = general_vect.z
                break
    update_bound_effect()

    
def act_bot_bound_dim():
    @Name "SUB: act_bot_bound_dim"

    general_vect = databot.bot_bound_dim[bot_slot]
    switch subitem_index[menu_index]:
        case 0:
            act_general_chg_var_1_num()
            databot.bot_bound_angle[bot_slot] = menu_item_var_1[menu_index]
            break
        case 1:
            general_vect_target = VECTOR_TARGET.VECT_X
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = general_vect
            menu_item_var_2[menu_index] = general_vect.x
            break
        case 2:
            general_vect_target = VECTOR_TARGET.VECT_Y
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = general_vect
            menu_item_var_3[menu_index] = general_vect.y
            break
        case 3:
            general_vect_target = VECTOR_TARGET.VECT_Z
            act_general_change_vect()
            databot.bot_bound_dim[bot_slot] = general_vect
            menu_item_var_4[menu_index] = general_vect.z
            break
    update_bound_effect()