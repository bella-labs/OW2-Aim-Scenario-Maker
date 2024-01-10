def act_prof_select_prof():
    @Name "SUB: act_prof_select_prof"

    act_general_num_var_1()
    profile_slot = menu_item_var_1[menu_index]
    smallMessage(hostPlayer, "HI")
    subact_select_prof_refresh()


def subact_select_prof_refresh():
    @Name "SUB: subact_select_prof_refresh"

    # Weight
    refresh_index = menu_index + 2
    menu_item_var_1[refresh_index] = databot.prof_weight[profile_slot]
    # Horizontal Type
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_hori_type[profile_slot]]
    menu_item_var_2[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    # Horizontal Probability
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_lr_ratio[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_fb_ratio[profile_slot]
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


def act_prof_override_prof():
    @Name "SUB: act_prof_override_prof"

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
            waitUntil(eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8]), 2)
            if (eventPlayer.getThrottle() == ui_inputs[8] if user_controls[8] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[8])):
                subact_prof_override_slot()
                menu_item_color_on[menu_index] = Color.GREEN
                wait(0.25)
        
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_prof_override_slot():
    @Name "SUB: subact_prof_override_slot"

    action_var = menu_item_var_1[menu_index]

    # Weight
    databot.prof_weight[action_var] = databot.prof_weight[profile_slot]
    # Horizontal Type
    databot.mvmt_hori_type[action_var] = databot.mvmt_hori_type[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    # Horizontal Probability
    databot.mvmt_lr_ratio[action_var] = databot.mvmt_lr_ratio[profile_slot]
    databot.mvmt_fb_ratio[action_var] = databot.mvmt_fb_ratio[profile_slot]
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


def act_prof_change_weight():
    @Name "SUB: act_prof_change_weight"

    act_general_num_var_1()
    databot.prof_weight[profile_slot] = menu_item_var_1[menu_index]
    