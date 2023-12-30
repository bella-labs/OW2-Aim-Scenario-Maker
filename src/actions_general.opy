def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = chg_submenu_target
        menu_index = submenu_start_indexes[submenu_index] + chg_submenu_item_target
        
def act_general_chg_num():
    @Name "SUB: act_general_chg_num"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
            action_var -= general_small
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            action_var += general_small
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            action_var -= general_large
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            action_var += general_large
            break
        
    if action_var < general_range_min:
        action_var = general_range_max
    elif action_var > general_range_max:
        action_var = general_range_min

    menu_wait = 0.05

        
def act_general_chg_var_1_num():
    @Name "SUB: act_general_chg_var_1_num"

    action_var = menu_item_var_1[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][0]]
    general_large = large_steps[menu_item_large_step[menu_index][0]]
    general_range_min = ranges[menu_item_range[menu_index][0]][0]
    general_range_max = ranges[menu_item_range[menu_index][0]][1]
    act_general_chg_num()
    menu_item_var_1[menu_index] = action_var


def act_general_chg_var_2_num():
    @Name "SUB: act_general_chg_var_2_num"

    action_var = menu_item_var_2[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][1]]
    general_large = large_steps[menu_item_large_step[menu_index][1]]
    general_range_min = ranges[menu_item_range[menu_index][1]][0]
    general_range_max = ranges[menu_item_range[menu_index][1]][1]
    act_general_chg_num()
    menu_item_var_2[menu_index] = action_var


def act_general_chg_var_3_num():
    @Name "SUB: act_general_chg_var_3_num"

    action_var = menu_item_var_3[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][2]]
    general_large = large_steps[menu_item_large_step[menu_index][2]]
    general_range_min = ranges[menu_item_range[menu_index][2]][0]
    general_range_max = ranges[menu_item_range[menu_index][2]][1]
    act_general_chg_num()
    menu_item_var_3[menu_index] = action_var

        
def act_general_toggle_var_1_bool():
    @Name "SUB: act_general_toggle_var_1_bool" 

    menu_item_var_1[menu_index] = not menu_item_var_1[menu_index]
    

def act_general_change_vect():
    @Name "SUB: act_general_change_vect"
    
    general_small = small_steps[SMALL_TYPE.SMALL_0_01]
    general_large = large_steps[LARGE_TYPE.LARGE_1]
    general_range_min = ranges[RANGE_TYPE.RANGE_VECTOR][0]
    general_range_max = ranges[RANGE_TYPE.RANGE_VECTOR][1]

    switch general_target:
        case GENERAL_TARGET.VECT_X:
            action_var = action_var_2.x
            act_general_chg_num()
            action_var_2 = vect(action_var, action_var_2.y, action_var_2.z)
            break
        case GENERAL_TARGET.VECT_Y:
            action_var = action_var_2.y
            act_general_chg_num()
            action_var_2 = vect(action_var_2.x, action_var, action_var_2.z)
            break
        case GENERAL_TARGET.VECT_Z:
            action_var = action_var_2.z
            act_general_chg_num()
            action_var_2 = vect(action_var_2.x, action_var_2.y, action_var)
            break
    

def act_general_change_list():
    @Name "SUB: act_general_change_list"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            action_var -= 1
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            action_var += 1
            break

    if action_var < 0:
        action_var = general_option_size-1
    elif action_var >= general_option_size:
        action_var = 0


def act_general_change_min_max():
    @Name "SUB: act_general_change_min_max"
    
    general_small = small_steps[menu_item_small_step[menu_index][1]]
    general_large = large_steps[menu_item_large_step[menu_index][1]]
    general_range_min = ranges[menu_item_range[menu_index][1]][0]
    general_range_max = ranges[menu_item_range[menu_index][1]][1]

    switch general_target:
        case GENERAL_TARGET.MIN:
            act_general_chg_num()
            if action_var > action_var_2:
                action_var_2 = action_var
            break
        case GENERAL_TARGET.MAX:
            # Store min in temp var, override min with max, change min, update max with new min, restore old min
            action_var_3 = action_var
            action_var = action_var_2
            act_general_chg_num()
            action_var_2 = action_var
            if action_var_3 < action_var_2:
                action_var = action_var_3
            break
