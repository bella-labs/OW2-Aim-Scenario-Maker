def act_mvmt_hori_type():
    @Name "SUB: act_mvmt_hori_type" 

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.mvmt_hori_type[profile_slot]
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.MVMT_TYPE
            act_general_change_list_var_1()
            databot.mvmt_hori_type[bot_slot] = action_var
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_hori_impulse[profile_slot] = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.mvmt_hori_interval[profile_slot] = menu_item_var_3[menu_index]
            break


def act_mvmt_hori_ratio():
    @Name "SUB: act_mvmt_hori_ratio" 

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.mvmt_lr_ratio[profile_slot] = menu_item_var_1[menu_index]
            break
        case 1:
            act_general_num_var_2()
            databot.mvmt_fb_ratio[profile_slot] = menu_item_var_2[menu_index]
            break


def act_mvmt_lr_time():
    @Name "SUB: act_mvmt_lr_time" 

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_left_min[bot_slot]
        action_var_2 = databot.mvmt_left_max[bot_slot]
        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX
        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_left_min[bot_slot] = action_var
        databot.mvmt_left_max[bot_slot] = action_var_2
    else:
        action_var = databot.mvmt_right_min[bot_slot]
        action_var_2 = databot.mvmt_right_max[bot_slot]
        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX
        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_right_min[bot_slot] = action_var
        databot.mvmt_right_max[bot_slot] = action_var_2


def act_mvmt_fb_time():
    @Name "SUB: act_mvmt_fb_time"

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_fwd_min[bot_slot]
        action_var_2 = databot.mvmt_fwd_max[bot_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_fwd_min[bot_slot] = action_var
        databot.mvmt_fwd_max[bot_slot] = action_var_2
    else:
        action_var = databot.mvmt_back_min[bot_slot]
        action_var_2 = databot.mvmt_back_max[bot_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_back_min[bot_slot] = action_var
        databot.mvmt_back_max[bot_slot] = action_var_2


def act_mvmt_vert_type():
    @Name "SUB: act_mvmt_vert_type" 

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.mvmt_vert_type[profile_slot]
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.MVMT_TYPE
            act_general_change_list_var_1()
            databot.mvmt_vert_type[bot_slot] = action_var
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

    action_var = databot.mvmt_jump_min[bot_slot]
    action_var_2 = databot.mvmt_jump_max[bot_slot]

    if subitem_index[menu_index] == 0:
        general_target = GENERAL_TARGET.MIN
    else:
        general_target = GENERAL_TARGET.MAX

    act_general_change_min_max()

    menu_item_var_1[menu_index] = action_var
    menu_item_var_2[menu_index] = action_var_2

    databot.mvmt_jump_min[bot_slot] = action_var
    databot.mvmt_jump_max[bot_slot] = action_var_2


def act_mvmt_crouch_time():
    @Name "SUB: act_mvmt_crouch_time" 

    if subitem_index[menu_index] <= 1:
        action_var = databot.mvmt_crouch_min[bot_slot]
        action_var_2 = databot.mvmt_crouch_max[bot_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_crouch_min[bot_slot] = action_var
        databot.mvmt_crouch_max[bot_slot] = action_var_2
    else:
        action_var = databot.mvmt_uncrouch_min[bot_slot]
        action_var_2 = databot.mvmt_uncrouch_max[bot_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_uncrouch_min[bot_slot] = action_var
        databot.mvmt_uncrouch_max[bot_slot] = action_var_2


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
        action_var = databot.mvmt_lr_idle_min[bot_slot]
        action_var_2 = databot.mvmt_lr_idle_max[bot_slot]

        if subitem_index[menu_index] == 0:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_1[menu_index] = action_var
        menu_item_var_2[menu_index] = action_var_2
    
        databot.mvmt_lr_idle_min[bot_slot] = action_var
        databot.mvmt_lr_idle_max[bot_slot] = action_var_2
    else:
        action_var = databot.mvmt_fb_idle_min[bot_slot]
        action_var_2 = databot.mvmt_fb_idle_max[bot_slot]

        if subitem_index[menu_index] == 2:
            general_target = GENERAL_TARGET.MIN
        else:
            general_target = GENERAL_TARGET.MAX

        act_general_change_min_max()

        menu_item_var_3[menu_index] = action_var
        menu_item_var_4[menu_index] = action_var_2
    
        databot.mvmt_fb_idle_min[bot_slot] = action_var
        databot.mvmt_fb_idle_max[bot_slot] = action_var_2