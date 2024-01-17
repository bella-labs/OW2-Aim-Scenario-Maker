def act_mvmt_select_prof():
    @Name "SUB: act_mvmt_select_prof"

    act_general_num_var_1()
    profile_slot = menu_item_var_1[menu_index]
    smallMessage(hostPlayer, "HI")
    subact_mvmt_select_refresh()


def subact_mvmt_select_refresh():
    @Name "SUB: subact_mvmt_select_refresh"

    # Horizontal Type
    refresh_index = menu_index + 2
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_hori_type[profile_slot]]
    menu_item_var_2[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    # Horizontal Weight
    refresh_index += 1
    menu_item_var_1[refresh_index] = movement_weights[profile_slot][XZ_DIR.LEFT]
    menu_item_var_2[refresh_index] = movement_weights[profile_slot][XZ_DIR.RIGHT]
    menu_item_var_3[refresh_index] = movement_weights[profile_slot][XZ_DIR.FORWARD]
    menu_item_var_4[refresh_index] = movement_weights[profile_slot][XZ_DIR.BACKWARD]
    # Left / Right Time
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_left_min[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_left_max[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_right_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_right_max[profile_slot]
    # Forward / Backward Time
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_fwd_min[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_fwd_max[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_back_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_back_max[profile_slot]
    # Vertical Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_vert_type[profile_slot]]
    menu_item_var_2[refresh_index] = databot.mvmt_vert_impulse[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_vert_interval[profile_slot]
    # Verical Probability
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_jump_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_jump_interval[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_crouch_chance[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_crouch_interval[profile_slot]
    # Jump Time
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_jump_min[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_jump_max[profile_slot]
    # Crouch Time
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_crouch_min[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_crouch_max[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_uncrouch_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_uncrouch_max[profile_slot]
    # Idle Probability
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_lr_idle_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_lr_idle_interval[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_fb_idle_chance[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_fb_idle_interval[profile_slot]
    # Idle Time
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_lr_idle_min[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_lr_idle_max[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_fb_idle_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_fb_idle_max[profile_slot]


def act_mvmt_override_prof():
    @Name "SUB: act_mvmt_override_prof"

    switch menu_action:
        # Change target slot
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            break
        # Override all slots? not sure if good / needed
        case MENU_ACTIONS.MENU_JUMP_LEFT:
        # Override target slot
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[8]] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[8]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = Color.RED
            waitUntil((eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])) == true, 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_mvmt_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_mvmt_override_slot():
    @Name "SUB: subact_mvmt_override_slot"

    action_var = menu_item_var_1[menu_index]

    # Horizontal Type
    databot.mvmt_hori_type[action_var] = databot.mvmt_hori_type[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    # Horizontal Weight
    databot.mvmt_weights[action_var] = databot.mvmt_weights[profile_slot]
    databot.mvmt_max_weight[action_var] = databot.mvmt_max_weight[profile_slot]
    # Left / Right Time
    databot.mvmt_left_min[action_var] = databot.mvmt_left_min[profile_slot]
    databot.mvmt_left_max[action_var] = databot.mvmt_left_max[profile_slot]
    databot.mvmt_right_min[action_var] = databot.mvmt_right_min[profile_slot]
    databot.mvmt_right_max[action_var] = databot.mvmt_right_max[profile_slot]
    # Forward / Backward Time
    databot.mvmt_fwd_min[action_var] = databot.mvmt_fwd_min[profile_slot]
    databot.mvmt_fwd_max[action_var] = databot.mvmt_fwd_max[profile_slot]
    databot.mvmt_back_min[action_var] = databot.mvmt_back_min[profile_slot]
    databot.mvmt_back_max[action_var] = databot.mvmt_back_max[profile_slot]
    # Vertical Movement
    databot.mvmt_vert_type[action_var] = databot.mvmt_vert_type[profile_slot]
    databot.mvmt_vert_impulse[action_var] = databot.mvmt_vert_impulse[profile_slot]
    databot.mvmt_vert_interval[action_var] = databot.mvmt_vert_interval[profile_slot]
    # Vertical Probability
    databot.mvmt_jump_chance[action_var] = databot.mvmt_jump_chance[profile_slot]
    databot.mvmt_jump_interval[action_var] = databot.mvmt_jump_interval[profile_slot]
    databot.mvmt_crouch_chance[action_var] = databot.mvmt_crouch_chance[profile_slot]
    databot.mvmt_crouch_interval[action_var] = databot.mvmt_crouch_interval[profile_slot]
    # Jump Time
    databot.mvmt_jump_min[action_var] = databot.mvmt_jump_min[profile_slot]
    databot.mvmt_jump_max[action_var] = databot.mvmt_jump_max[profile_slot]
    # Crouch Time
    databot.mvmt_crouch_min[action_var] = databot.mvmt_crouch_min[profile_slot]
    databot.mvmt_crouch_max[action_var] = databot.mvmt_crouch_max[profile_slot]
    databot.mvmt_uncrouch_min[action_var] = databot.mvmt_uncrouch_min[profile_slot]
    databot.mvmt_uncrouch_max[action_var] = databot.mvmt_uncrouch_max[profile_slot]
    # Idle Probability
    databot.mvmt_lr_idle_chance[action_var] = databot.mvmt_lr_idle_chance[profile_slot]
    databot.mvmt_lr_idle_interval[action_var] = databot.mvmt_lr_idle_interval[profile_slot]
    databot.mvmt_fb_idle_chance[action_var] = databot.mvmt_fb_idle_chance[profile_slot]
    databot.mvmt_fb_idle_interval[action_var] = databot.mvmt_fb_idle_interval[profile_slot]
    # Idle Time
    databot.mvmt_lr_idle_min[action_var] = databot.mvmt_lr_idle_min[profile_slot]
    databot.mvmt_lr_idle_max[action_var] = databot.mvmt_lr_idle_max[profile_slot]
    databot.mvmt_fb_idle_min[action_var] = databot.mvmt_fb_idle_min[profile_slot]
    databot.mvmt_fb_idle_max[action_var] = databot.mvmt_fb_idle_max[profile_slot]


def act_mvmt_hori_type():
    @Name "SUB: act_mvmt_hori_type" 

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.mvmt_hori_type[profile_slot]
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.MVMT_TYPE
            act_general_change_list_var_1()
            databot.mvmt_hori_type[profile_slot] = action_var
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_hori_impulse[profile_slot] = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.mvmt_hori_interval[profile_slot] = menu_item_var_3[menu_index]
            break


def act_mvmt_hori_weight():
    @Name "SUB: act_mvmt_hori_weight" 

    action_var = movement_weights[profile_slot]

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            action_var[XZ_DIR.LEFT] = menu_item_var_1[menu_index]
            action_var[XZ_DIR.FORWARD_LEFT] = action_var[XZ_DIR.LEFT] * action_var[XZ_DIR.FORWARD]
            action_var[XZ_DIR.BACKWARD_LEFT] = action_var[XZ_DIR.LEFT] * action_var[XZ_DIR.BACKWARD]
            break
        case 1:
            act_general_num_var_2()
            action_var[XZ_DIR.RIGHT] = menu_item_var_2[menu_index]
            action_var[XZ_DIR.FORWARD_RIGHT] = action_var[XZ_DIR.RIGHT] * action_var[XZ_DIR.FORWARD]
            action_var[XZ_DIR.BACKWARD_RIGHT] = action_var[XZ_DIR.RIGHT] * action_var[XZ_DIR.BACKWARD]
            break
        case 2:
            act_general_num_var_3()
            action_var[XZ_DIR.FORWARD] = menu_item_var_3[menu_index]
            action_var[XZ_DIR.FORWARD_LEFT] = action_var[XZ_DIR.FORWARD] * action_var[XZ_DIR.LEFT]
            action_var[XZ_DIR.FORWARD_RIGHT] = action_var[XZ_DIR.FORWARD] * action_var[XZ_DIR.RIGHT]
            
            break
        case 3:
            act_general_num_var_4()
            action_var[XZ_DIR.BACKWARD] = menu_item_var_4[menu_index]
            action_var[XZ_DIR.BACKWARD_LEFT] = action_var[XZ_DIR.BACKWARD] * action_var[XZ_DIR.LEFT]
            action_var[XZ_DIR.BACKWARD_RIGHT] = action_var[XZ_DIR.BACKWARD] * action_var[XZ_DIR.RIGHT]
            break
    
    act_general_calc_weights()
    databot.mvmt_weights = action_var_2
    databot.mvmt_max_weight = action_result

    
def act_mvmt_lr_time():
    @Name "SUB: act_mvmt_lr_time" 

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_left_min[profile_slot]
        action_var_2 = databot.mvmt_left_max[profile_slot]
        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX
        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_left_min[profile_slot] = action_var
        databot.mvmt_left_max[profile_slot] = action_var_2
    else:
        action_var = databot.mvmt_right_min[profile_slot]
        action_var_2 = databot.mvmt_right_max[profile_slot]
        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX
        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_right_min[profile_slot] = action_var
        databot.mvmt_right_max[profile_slot] = action_var_2


def act_mvmt_fb_time():
    @Name "SUB: act_mvmt_fb_time"

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_fwd_min[profile_slot]
        action_var_2 = databot.mvmt_fwd_max[profile_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_fwd_min[profile_slot] = action_var
        databot.mvmt_fwd_max[profile_slot] = action_var_2
    else:
        action_var = databot.mvmt_back_min[profile_slot]
        action_var_2 = databot.mvmt_back_max[profile_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_back_min[profile_slot] = action_var
        databot.mvmt_back_max[profile_slot] = action_var_2


def act_mvmt_vert_type():
    @Name "SUB: act_mvmt_vert_type" 

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.mvmt_vert_type[profile_slot]
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.MVMT_TYPE
            act_general_change_list_var_1()
            databot.mvmt_vert_type[profile_slot] = action_var
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_vert_impulse[profile_slot] = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.mvmt_vert_interval[profile_slot] = menu_item_var_3[menu_index]
            break


def act_mvmt_vert_chance():
    @Name "SUB: act_mvmt_vert_chance" 

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_jump_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_jump_interval[profile_slot] = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.mvmt_crouch_chance[profile_slot] = menu_item_var_3[menu_index]
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_crouch_interval[profile_slot] = menu_item_var_4[menu_index]
            break


def act_mvmt_jump_time():
    @Name "SUB: act_mvmt_jump_time" 

    action_var = databot.mvmt_jump_min[profile_slot]
    action_var_2 = databot.mvmt_jump_max[profile_slot]

    if subitem_index[menu_index] == 0:
        general_target = GENERAL_TARGET.MIN
    else:
        general_target = GENERAL_TARGET.MAX

    act_general_change_min_max()

    menu_item_var_1[menu_index] = action_var
    menu_item_var_2[menu_index] = action_var_2

    databot.mvmt_jump_min[profile_slot] = action_var
    databot.mvmt_jump_max[profile_slot] = action_var_2


def act_mvmt_crouch_time():
    @Name "SUB: act_mvmt_crouch_time" 

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_crouch_min[profile_slot]
        action_var_2 = databot.mvmt_crouch_max[profile_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_crouch_min[profile_slot] = action_var
        databot.mvmt_crouch_max[profile_slot] = action_var_2
    else:
        action_var = databot.mvmt_uncrouch_min[profile_slot]
        action_var_2 = databot.mvmt_uncrouch_max[profile_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_uncrouch_min[profile_slot] = action_var
        databot.mvmt_uncrouch_max[profile_slot] = action_var_2


def act_mvmt_idle_chance():
    @Name "SUB: act_mvmt_idle_chance" 

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_lr_idle_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_lr_idle_interval[profile_slot] = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.mvmt_fb_idle_chance[profile_slot] = menu_item_var_3[menu_index]
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_fb_idle_interval[profile_slot] = menu_item_var_4[menu_index]
            break


def act_mvmt_idle_time():
    @Name "SUB: act_mvmt_idle_time" 

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_lr_idle_min[profile_slot]
        action_var_2 = databot.mvmt_lr_idle_max[profile_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_lr_idle_min[profile_slot] = action_var
        databot.mvmt_lr_idle_max[profile_slot] = action_var_2
    else:
        action_var = databot.mvmt_fb_idle_min[profile_slot]
        action_var_2 = databot.mvmt_fb_idle_max[profile_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_fb_idle_min[profile_slot] = action_var
        databot.mvmt_fb_idle_max[profile_slot] = action_var_2