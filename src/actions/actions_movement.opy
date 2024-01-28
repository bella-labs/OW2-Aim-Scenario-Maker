def act_mvmt_select_prof():
    @Name "SUB: act_mvmt_select_prof"

    act_general_num_var_1()
    profile_slot = menu_item_var_1[menu_index]

    action_var = databot.mvmt_weights[profile_slot]
    act_general_unsum_weights()
    movement_weights = action_result

    subact_mvmt_select_refresh()


def subact_mvmt_select_refresh():
    @Name "SUB: subact_mvmt_select_refresh"

    # Horizontal Type
    refresh_index = refresh_start[1]
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_hori_type[profile_slot]]
    menu_item_var_2[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_hori_impulse[profile_slot]
    # Left Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = movement_weights[XZ_DIR.LEFT]
    menu_item_var_2[refresh_index] = databot.mvmt_left_min[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_left_max[profile_slot]
    # Right Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = movement_weights[XZ_DIR.RIGHT]
    menu_item_var_2[refresh_index] = databot.mvmt_right_min[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_right_max[profile_slot]
    # Forward Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = movement_weights[XZ_DIR.FORWARD]
    menu_item_var_2[refresh_index] = databot.mvmt_fwd_min[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_fwd_max[profile_slot]
    # Backward Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = movement_weights[XZ_DIR.BACKWARD]
    menu_item_var_2[refresh_index] = databot.mvmt_back_min[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_back_max[profile_slot]
    # Vertical Movement
    refresh_index += 1
    menu_item_var_1[refresh_index] = strings_options[lang_type][OPTIONS_TYPE.MVMT_TYPE][databot.mvmt_vert_type[profile_slot]]
    menu_item_var_2[refresh_index] = databot.mvmt_vert_impulse[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_vert_interval[profile_slot]
    # Jump
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_jump_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_jump_interval[profile_slot]
    # Crouch
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_crouch_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_crouch_interval[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_uncrouch_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_uncrouch_max[profile_slot]
    # LR Idle
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_lr_idle_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_lr_idle_interval[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_lr_idle_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_lr_idle_max[profile_slot]
    # FB Idle
    refresh_index += 1
    menu_item_var_1[refresh_index] = databot.mvmt_fb_idle_chance[profile_slot]
    menu_item_var_2[refresh_index] = databot.mvmt_fb_idle_interval[profile_slot]
    menu_item_var_3[refresh_index] = databot.mvmt_fb_idle_min[profile_slot]
    menu_item_var_4[refresh_index] = databot.mvmt_fb_idle_max[profile_slot]


def act_mvmt_override_prof():
    @Name "SUB: act_mvmt_override_prof"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            act_general_num_var_1()
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[9]] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[9]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = menu_colors_custom[0]
            waitUntil((eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])) == true, 2)
            if (eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])):
                for loop_index in range(0,12):
                    menu_item_color_on[menu_index] = menu_colors_custom[1]
                    action_var = loop_index
                    subact_mvmt_override_slot()
                wait(0.25)
            menu_item_color_on[menu_index] = menu_color_on_index
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            smallMessage(eventPlayer, "    {0} {1} {2}".format(strings_prompt[lang_type][1], strings_inputs[lang_type][user_controls[9]] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else buttonString(ui_inputs[9]), strings_prompt[lang_type][6]))
            menu_item_color_on[menu_index] = menu_colors_custom[0]
            waitUntil((eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])) == true, 2)
            if (eventPlayer.getThrottle() == ui_inputs[9] if user_controls[9] <= INPUT_OPTIONS.VECT_RIGHT else eventPlayer.isHoldingButton(ui_inputs[9])):
                subact_mvmt_override_slot()
                menu_item_color_on[menu_index] = menu_colors_custom[1]
                wait(0.25)
            menu_item_color_on[menu_index] = menu_color_on_index


def subact_mvmt_override_slot():
    @Name "SUB: subact_mvmt_override_slot"

    action_var = menu_item_var_1[menu_index]

    # Horizontal Type
    databot.mvmt_hori_type[action_var] = databot.mvmt_hori_type[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    databot.mvmt_hori_impulse[action_var] = databot.mvmt_hori_impulse[profile_slot]
    #  Weight
    databot.mvmt_weights[action_var] = databot.mvmt_weights[profile_slot]
    databot.mvmt_max_weight[action_var] = databot.mvmt_max_weight[profile_slot]
    # Left Time
    databot.mvmt_left_min[action_var] = databot.mvmt_left_min[profile_slot]
    databot.mvmt_left_max[action_var] = databot.mvmt_left_max[profile_slot]
    # Right Time
    databot.mvmt_right_min[action_var] = databot.mvmt_right_min[profile_slot]
    databot.mvmt_right_max[action_var] = databot.mvmt_right_max[profile_slot]
    # Forward Time
    databot.mvmt_fwd_min[action_var] = databot.mvmt_fwd_min[profile_slot]
    databot.mvmt_fwd_max[action_var] = databot.mvmt_fwd_max[profile_slot]
    # Backward Time
    databot.mvmt_back_min[action_var] = databot.mvmt_back_min[profile_slot]
    databot.mvmt_back_max[action_var] = databot.mvmt_back_max[profile_slot]
    # Vertical Movement
    databot.mvmt_vert_type[action_var] = databot.mvmt_vert_type[profile_slot]
    databot.mvmt_vert_impulse[action_var] = databot.mvmt_vert_impulse[profile_slot]
    databot.mvmt_vert_interval[action_var] = databot.mvmt_vert_interval[profile_slot]
    # Jump
    databot.mvmt_jump_chance[action_var] = databot.mvmt_jump_chance[profile_slot]
    databot.mvmt_jump_interval[action_var] = databot.mvmt_jump_interval[profile_slot]
    # Crouch
    databot.mvmt_crouch_chance[action_var] = databot.mvmt_crouch_chance[profile_slot]
    databot.mvmt_crouch_interval[action_var] = databot.mvmt_crouch_interval[profile_slot]
    databot.mvmt_uncrouch_min[action_var] = databot.mvmt_uncrouch_min[profile_slot]
    databot.mvmt_uncrouch_max[action_var] = databot.mvmt_uncrouch_max[profile_slot]
    # LR Idle
    databot.mvmt_lr_idle_chance[action_var] = databot.mvmt_lr_idle_chance[profile_slot]
    databot.mvmt_lr_idle_interval[action_var] = databot.mvmt_lr_idle_interval[profile_slot]
    databot.mvmt_lr_idle_min[action_var] = databot.mvmt_lr_idle_min[profile_slot]
    databot.mvmt_lr_idle_max[action_var] = databot.mvmt_lr_idle_max[profile_slot]
    # FB Idle
    databot.mvmt_fb_idle_chance[action_var] = databot.mvmt_fb_idle_chance[profile_slot]
    databot.mvmt_fb_idle_interval[action_var] = databot.mvmt_fb_idle_interval[profile_slot]
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


def act_mvmt_left():
    @Name "SUB: act_mvmt_left" 


    switch subitem_index[menu_index]:
        case 0:
            general_target = movement_weights
            action_var = menu_item_var_1[menu_index]
            act_general_clear()
            
            action_var_2 = 0
            act_general_num_temp()

            general_target[XZ_DIR.LEFT] = action_temp
            if action_temp > 0:
                if general_target[XZ_DIR.FORWARD] > 0:
                    general_target[XZ_DIR.FORWARD_LEFT] = (action_temp + general_target[XZ_DIR.FORWARD]) / 2
                if general_target[XZ_DIR.BACKWARD] > 0:
                    general_target[XZ_DIR.BACKWARD_LEFT] = (action_temp + general_target[XZ_DIR.BACKWARD]) / 2
            else:
                general_target[XZ_DIR.FORWARD_LEFT] = 0
                general_target[XZ_DIR.BACKWARD_LEFT] = 0

            action_var = action_temp
            act_general_disable()
            menu_item_var_1[menu_index] = action_var

            movement_weights = general_target
            action_var = general_target
            act_general_calc_weights()
            databot.mvmt_weights[profile_slot] = action_var_2
            databot.mvmt_max_weight[profile_slot] = action_result
            break
        case 1:
        case 2:
            action_var = databot.mvmt_left_min[profile_slot]
            action_var_2 = databot.mvmt_left_max[profile_slot]
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_left_min[profile_slot] = action_var
            databot.mvmt_left_max[profile_slot] = action_var_2
            break

    
def act_mvmt_right():
    @Name "SUB: act_mvmt_right" 

    switch subitem_index[menu_index]:
        case 0:
            general_target = movement_weights
            action_var = menu_item_var_1[menu_index]
            act_general_clear()
            
            action_var_2 = 0
            act_general_num_temp()

            general_target[XZ_DIR.RIGHT] = action_temp
            if action_temp > 0:
                if general_target[XZ_DIR.FORWARD] > 0:
                    general_target[XZ_DIR.FORWARD_RIGHT] = (action_temp + general_target[XZ_DIR.FORWARD]) / 2
                if general_target[XZ_DIR.BACKWARD] > 0:
                    general_target[XZ_DIR.BACKWARD_RIGHT] = (action_temp + general_target[XZ_DIR.BACKWARD]) / 2
            else:
                general_target[XZ_DIR.FORWARD_RIGHT] = 0
                general_target[XZ_DIR.BACKWARD_RIGHT] = 0

            action_var = action_temp
            act_general_disable()
            menu_item_var_1[menu_index] = action_var

            movement_weights = general_target
            action_var = general_target
            act_general_calc_weights()
            databot.mvmt_weights[profile_slot] = action_var_2
            databot.mvmt_max_weight[profile_slot] = action_result
            break
        case 1:
        case 2:
            action_var = databot.mvmt_right_min[profile_slot]
            action_var_2 = databot.mvmt_right_max[profile_slot]
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_right_min[profile_slot] = action_var
            databot.mvmt_right_max[profile_slot] = action_var_2
            break


def act_mvmt_forward():
    @Name "SUB: act_mvmt_forward" 

    switch subitem_index[menu_index]:
        case 0:
            general_target = movement_weights
            action_var = menu_item_var_1[menu_index]
            act_general_clear()
            
            action_var_2 = 0
            act_general_num_temp()

            general_target[XZ_DIR.FORWARD] = action_temp
            if action_temp > 0:
                if general_target[XZ_DIR.LEFT] > 0:
                    general_target[XZ_DIR.FORWARD_LEFT] = (action_temp + general_target[XZ_DIR.LEFT]) / 2
                if general_target[XZ_DIR.RIGHT] > 0:
                    general_target[XZ_DIR.FORWARD_RIGHT] = (action_temp + general_target[XZ_DIR.RIGHT]) / 2
            else:
                general_target[XZ_DIR.FORWARD_LEFT] = 0
                general_target[XZ_DIR.FORWARD_RIGHT] = 0

            action_var = action_temp
            act_general_disable()
            menu_item_var_1[menu_index] = action_var

            movement_weights = general_target
            action_var = general_target
            act_general_calc_weights()
            databot.mvmt_weights[profile_slot] = action_var_2
            databot.mvmt_max_weight[profile_slot] = action_result
            break
        case 1:
        case 2:
            action_var = databot.mvmt_fwd_min[profile_slot]
            action_var_2 = databot.mvmt_fwd_max[profile_slot]
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_fwd_min[profile_slot] = action_var
            databot.mvmt_fwd_max[profile_slot] = action_var_2
            break


def act_mvmt_backward():
    @Name "SUB: act_mvmt_backward" 

    switch subitem_index[menu_index]:
        case 0:
            general_target = movement_weights
            action_var = menu_item_var_1[menu_index]
            act_general_clear()
            
            action_var_2 = 0
            act_general_num_temp()

            general_target[XZ_DIR.BACKWARD] = action_temp
            if action_temp > 0:
                if general_target[XZ_DIR.LEFT] > 0:
                    general_target[XZ_DIR.BACKWARD_LEFT] = (action_temp + general_target[XZ_DIR.LEFT]) / 2
                if general_target[XZ_DIR.RIGHT] > 0:
                    general_target[XZ_DIR.BACKWARD_RIGHT] = (action_temp + general_target[XZ_DIR.RIGHT]) / 2
            else:
                general_target[XZ_DIR.BACKWARD_LEFT] = 0
                general_target[XZ_DIR.BACKWARD_RIGHT] = 0

            action_var = action_temp
            act_general_disable()
            menu_item_var_1[menu_index] = action_var

            movement_weights = general_target
            action_var = general_target
            act_general_calc_weights()
            databot.mvmt_weights[profile_slot] = action_var_2
            databot.mvmt_max_weight[profile_slot] = action_result
            break
        case 1:
        case 2:
            action_var = databot.mvmt_back_min[profile_slot]
            action_var_2 = databot.mvmt_back_max[profile_slot]
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_back_min[profile_slot] = action_var
            databot.mvmt_back_max[profile_slot] = action_var_2
            break


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


def act_mvmt_jump():
    @Name "SUB: act_mvmt_jump" 

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_jump_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
        case 2:
            action_var = databot.mvmt_jump_min[profile_slot]
            action_var_2 = databot.mvmt_jump_max[profile_slot]
    
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
    
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_jump_min[profile_slot] = action_var
            databot.mvmt_jump_max[profile_slot] = action_var_2
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_jump_interval[profile_slot] = menu_item_var_4[menu_index]
            break
        

def act_mvmt_crouch():
    @Name "SUB: act_mvmt_crouch" 
            
    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_crouch_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
        case 2:
            action_var = databot.mvmt_uncrouch_min[profile_slot]
            action_var_2 = databot.mvmt_uncrouch_max[profile_slot]
    
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
    
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_uncrouch_min[profile_slot] = action_var
            databot.mvmt_uncrouch_max[profile_slot] = action_var_2
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_crouch_interval[profile_slot] = menu_item_var_4[menu_index]
            break


def act_mvmt_lr_idle():
    @Name "SUB: act_mvmt_lr_idle" 

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_lr_idle_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
        case 2:
            action_var = databot.mvmt_lr_idle_min[profile_slot]
            action_var_2 = databot.mvmt_lr_idle_max[profile_slot]
    
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
    
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_lr_idle_min[profile_slot] = action_var
            databot.mvmt_lr_idle_max[profile_slot] = action_var_2
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_lr_idle_interval[profile_slot] = menu_item_var_4[menu_index]
            break


def act_mvmt_fb_idle():
    @Name "SUB: act_mvmt_fb_idle"

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_fb_idle_chance[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
        case 2:
            action_var = databot.mvmt_fb_idle_min[profile_slot]
            action_var_2 = databot.mvmt_fb_idle_max[profile_slot]
    
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
    
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.mvmt_fb_idle_min[profile_slot] = action_var
            databot.mvmt_fb_idle_max[profile_slot] = action_var_2
            break
        case 3:
            act_general_num_var_4()
            databot.mvmt_fb_idle_interval[profile_slot] = menu_item_var_4[menu_index]
            break
