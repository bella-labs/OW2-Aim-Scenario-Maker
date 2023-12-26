def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

        submenu_index = chg_submenu_target
        menu_index = submenu_start_indexes[submenu_index] + chg_submenu_item_target
        
def act_general_chg_num():
    @Name "SUB: act_general_chg_num"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
            general_num -= general_small
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
            general_num += general_small
            break
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            general_num -= general_large
            break
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            general_num += general_large
            break
        
    if general_num < general_range_min:
        general_num = general_range_max
    elif general_num > general_range_max:
        general_num = general_range_min

        
def act_general_chg_var_1_num():
    @Name "SUB: act_general_chg_var_1_num"

    general_num = menu_item_var_1[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][0]]
    general_large = large_steps[menu_item_large_step[menu_index][0]]
    general_range_min = ranges[menu_item_range[menu_index][0]][0]
    general_range_max = ranges[menu_item_range[menu_index][0]][1]
    act_general_chg_num()
    menu_item_var_1[menu_index] = general_num


def act_general_chg_var_2_num():
    @Name "SUB: act_general_chg_var_2_num"

    general_num = menu_item_var_2[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][1]]
    general_large = large_steps[menu_item_large_step[menu_index][1]]
    general_range_min = ranges[menu_item_range[menu_index][1]][0]
    general_range_max = ranges[menu_item_range[menu_index][1]][1]
    act_general_chg_num()
    menu_item_var_2[menu_index] = general_num


def act_general_chg_var_3_num():
    @Name "SUB: act_general_chg_var_3_num"

    general_num = menu_item_var_3[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][2]]
    general_large = large_steps[menu_item_large_step[menu_index][2]]
    general_range_min = ranges[menu_item_range[menu_index][2]][0]
    general_range_max = ranges[menu_item_range[menu_index][2]][1]
    act_general_chg_num()
    menu_item_var_3[menu_index] = general_num

        
def act_general_toggle_var_1_bool():
    @Name "SUB: act_general_toggle_var_1_bool" 

    menu_item_var_1[menu_index] = not menu_item_var_1[menu_index]
    

def act_general_change_vect():
    @Name "SUB: act_general_change_vect"
    
    general_small = small_steps[SMALL_INDEXES.SMALL_0_01]
    general_large = large_steps[LARGE_INDEXES.LARGE_1]
    general_range_min = ranges[RANGE_INDEXES.RANGE_VECTOR][0]
    general_range_max = ranges[RANGE_INDEXES.RANGE_VECTOR][1]

    switch general_vect_target:
        case VECTOR_TARGET.VECT_X:
            general_num = general_vect.x
            act_general_chg_num()
            general_vect = vect(general_num, general_vect.y, general_vect.z)
        case VECTOR_TARGET.VECT_Y:
            general_num = general_vect.y
            act_general_chg_num()
            general_vect = vect(general_vect.x, general_num, general_vect.z)
        case VECTOR_TARGET.VECT_Z:
            general_num = general_vect.z
            act_general_chg_num()
            general_vect = vect(general_vect.x, general_vect.y, general_num)
    

def act_general_change_list():
    @Name "SUB: act_general_change_list"

    switch menu_action:
        case MENU_ACTIONS.MENU_STEP_LEFT:
        case MENU_ACTIONS.MENU_JUMP_LEFT:
            general_num -= 1
            break
        case MENU_ACTIONS.MENU_STEP_RIGHT:
        case MENU_ACTIONS.MENU_JUMP_RIGHT:
            general_num += 1
            break

    if general_num < 0:
        general_num = general_option_size
    elif general_num >= general_option_size:
        general_num = 0