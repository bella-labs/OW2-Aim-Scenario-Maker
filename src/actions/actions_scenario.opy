def act_sce_player_spawn():
    @Name "SUB: act_sce_player_spawn"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        action_var_2 = eventPlayer.getPosition()
        databot.sce_player_spawn = action_var_2
        menu_item_var_1[menu_index] = action_var_2.x
        menu_item_var_2[menu_index] = action_var_2.y
        menu_item_var_3[menu_index] = action_var_2.z
    else:
        action_var = databot.sce_player_spawn
        action_var_2 = menu_index
        switch subitem_index[menu_index]:
            case 0:
                general_target = GENERAL_TARGET.VECT_X
                act_general_change_vect()
                databot.sce_player_spawn = action_result
                menu_item_var_1[menu_index] = action_result.x
                break
            case 1:
                general_target = GENERAL_TARGET.VECT_Y
                act_general_change_vect()
                databot.sce_player_spawn = action_result
                menu_item_var_2[menu_index] = action_result.y
                break
            case 2:
                general_target = GENERAL_TARGET.VECT_Z
                act_general_change_vect()
                databot.sce_player_spawn = action_result
                menu_item_var_3[menu_index] = action_result.z
                break


def act_sce_player_facing():
    @Name "SUB: act_sce_player_facing"

    if menu_action == MENU_ACTIONS.MENU_SET_VECTOR:
        action_var_2 = eventPlayer.getFacingDirection()
        databot.sce_player_facing = action_var_2
        menu_item_var_1[menu_index] = action_var_2.x
        menu_item_var_2[menu_index] = action_var_2.y
        menu_item_var_3[menu_index] = action_var_2.z
    else:
        action_var = databot.sce_player_facing
        action_var_2 = menu_index
        switch subitem_index[menu_index]:
            case 0:
                general_target = GENERAL_TARGET.VECT_X
                act_general_change_vect()
                databot.sce_player_facing = action_result
                menu_item_var_1[menu_index] = action_result.x
                break
            case 1:
                general_target = GENERAL_TARGET.VECT_Y
                act_general_change_vect()
                databot.sce_player_facing = action_result
                menu_item_var_2[menu_index] = action_result.y
                break
            case 2:
                general_target = GENERAL_TARGET.VECT_Z
                act_general_change_vect()
                databot.sce_player_facing = action_result
                menu_item_var_3[menu_index] = action_result.z
                break


def act_sce_player_speed():
    @Name "SUB: act_sce_player_speed"

    act_general_num_var_1()
    databot.sce_player_speed = menu_item_var_1[menu_index]


def act_sce_player_gravity():
    @Name "SUB: act_sce_player_gravity"

    act_general_num_var_1()
    databot.sce_player_gravity = menu_item_var_1[menu_index]


def act_sce_mode():
    @Name "SUB: act_sce_mode"

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.sce_game_mode
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.GAME_TYPE
            act_general_change_list_var_1()
            databot.sce_game_mode = action_var
            action_var = menu_index

            if databot.sce_game_mode == 0:
                action_var = ITEM_TYPE.SCORE_TIME
            else:
                action_var = ITEM_TYPE.SCORE_POINTS
                databot.sce_game_limit = round(databot.sce_game_limit)
                menu_item_var_2[menu_index] = databot.sce_game_limit
            action_var_2 = menu_index
            set_item_data()
            break
        case 1:
            act_general_num_var_2()
            databot.sce_game_limit = menu_item_var_2[menu_index]
            break

def act_sce_bot_spawn():
    @Name "SUB: act_sce_bot_spawn"

    switch subitem_index[menu_index]:
        case 0:
            action_var = databot.sce_spawn_order
            action_var_2 = menu_index
            action_var_3 = OPTIONS_TYPE.SCE_ORDER
            act_general_change_list()
            menu_item_var_1[action_var_2] = strings_options[lang_type][action_var_3][action_var]
            databot.sce_spawn_order = action_var
            action_var = menu_index
            break
        case 1:
        case 2:
            action_var = databot.sce_respawn_min
            action_var_2 = databot.sce_respawn_max

            switch subitem_index[menu_index]:
                case 1:
                    general_target = GENERAL_TARGET.MIN
                    break
                case 2:
                    general_target = GENERAL_TARGET.MAX
                    break
        
            act_general_change_min_max()
        
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.sce_respawn_min = action_var
            databot.sce_respawn_max = action_var_2

def act_sce_points():
    @Name "SUB: act_sce_points"

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.sce_bs_points = menu_item_var_1[menu_index]
            break
        case 1:
            act_general_num_var_2()
            databot.sce_hs_points = menu_item_var_2[menu_index]
            break
        case 2:
            act_general_num_var_3()
            databot.sce_elim_points = menu_item_var_3[menu_index]
            break


def act_sce_strafe():
    @Name "SUB: act_sce_strafe"

    switch subitem_index[menu_index]:
        case 0:
            act_general_num_var_1()
            databot.sce_strafe_pps = menu_item_var_1[menu_index]
            break
        case 1:
        case 2:
            action_var = databot.sce_strafe_min
            action_var_2 = databot.sce_strafe_max
    
            if subitem_index[menu_index] == 1:
                general_target = GENERAL_TARGET.MIN
            else:
                general_target = GENERAL_TARGET.MAX
    
            act_general_change_min_max()
    
            menu_item_var_2[menu_index] = action_var
            menu_item_var_3[menu_index] = action_var_2
        
            databot.sce_strafe_min = action_var
            databot.sce_strafe_max = action_var_2
            break


def act_sce_script_status():
    @Name "SUB: act_sce_script_status"

    databot.sce_custom_status = not databot.sce_custom_status
    action_var = databot.sce_custom_status
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()
