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

    menu_wait_index = 1

def act_general_num_temp():
    @Name "SUB: act_general_num_temp"

    action_var = action_temp
    general_small = small_steps[menu_item_small_step[menu_index][action_var_2]]
    general_large = large_steps[menu_item_large_step[menu_index][action_var_2]]
    general_range_min = ranges[menu_item_range[menu_index][action_var_2]][0]
    general_range_max = ranges[menu_item_range[menu_index][action_var_2]][1]
    act_general_chg_num()
    action_temp = action_var
    
    
def act_general_num_var_1():
    @Name "SUB: act_general_num_var_1"

    action_var = menu_item_var_1[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][0]]
    general_large = large_steps[menu_item_large_step[menu_index][0]]
    general_range_min = ranges[menu_item_range[menu_index][0]][0]
    general_range_max = ranges[menu_item_range[menu_index][0]][1]
    act_general_chg_num()
    menu_item_var_1[menu_index] = action_var


def act_general_num_var_2():
    @Name "SUB: act_general_num_var_2"

    action_var = menu_item_var_2[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][1]]
    general_large = large_steps[menu_item_large_step[menu_index][1]]
    general_range_min = ranges[menu_item_range[menu_index][1]][0]
    general_range_max = ranges[menu_item_range[menu_index][1]][1]
    act_general_chg_num()
    menu_item_var_2[menu_index] = action_var


def act_general_num_var_3():
    @Name "SUB: act_general_num_var_3"

    action_var = menu_item_var_3[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][2]]
    general_large = large_steps[menu_item_large_step[menu_index][2]]
    general_range_min = ranges[menu_item_range[menu_index][2]][0]
    general_range_max = ranges[menu_item_range[menu_index][2]][1]
    act_general_chg_num()
    menu_item_var_3[menu_index] = action_var


def act_general_num_var_4():
    @Name "SUB: act_general_num_var_4"

    action_var = menu_item_var_4[menu_index]
    general_small = small_steps[menu_item_small_step[menu_index][3]]
    general_large = large_steps[menu_item_large_step[menu_index][3]]
    general_range_min = ranges[menu_item_range[menu_index][3]][0]
    general_range_max = ranges[menu_item_range[menu_index][3]][1]
    act_general_chg_num()
    menu_item_var_4[menu_index] = action_var

        
def act_general_toggle_status():
    @Name "SUB: act_general_toggle_status" 

    if action_var:
        action_result = 1
        menu_item_color_on[action_var_2] = menu_colors_custom[1]
    else:
        action_result = 0
        menu_item_color_on[action_var_2] = menu_colors_custom[0]
    

def act_general_toggle_var_1():
    @Name "SUB: act_general_toggle_var_1" 

    act_general_toggle_status()
    menu_item_var_1[action_var_2] = strings_options[lang_type][action_var_3][action_result]


def act_general_toggle_var_2():
    @Name "SUB: act_general_toggle_var_2" 

    act_general_toggle_status()
    menu_item_var_2[action_var_2] = strings_options[lang_type][action_var_3][action_result]


def act_general_toggle_var_3():
    @Name "SUB: act_general_toggle_var_3" 

    act_general_toggle_status()
    menu_item_var_3[action_var_2] = strings_options[lang_type][action_var_3][action_result]


def act_general_toggle_var_4():
    @Name "SUB: act_general_toggle_var_4" 

    act_general_toggle_status()
    menu_item_var_4[action_var_2] = strings_options[lang_type][action_var_3][action_result]


def act_general_change_vect():
    @Name "SUB: act_general_change_vect"
    
    action_var_3 = subitem_index[action_var_2]
    general_small = small_steps[menu_item_small_step[action_var_2][action_var_3]]
    general_large = large_steps[menu_item_large_step[action_var_2][action_var_3]]
    general_range_min = ranges[menu_item_range[action_var_2][action_var_3]][0]
    general_range_max = ranges[menu_item_range[action_var_2][action_var_3]][1]

    action_var_3 = action_var
    switch general_target:
        case GENERAL_TARGET.VECT_X:
            action_var = action_var_3.x
            act_general_chg_num()
            action_result = vect(action_var, action_var_3.y, action_var_3.z)
            break
        case GENERAL_TARGET.VECT_Y:
            action_var = action_var_3.y
            act_general_chg_num()
            action_result = vect(action_var_3.x, action_var, action_var_3.z)
            break
        case GENERAL_TARGET.VECT_Z:
            action_var = action_var_3.z
            act_general_chg_num()
            action_result = vect(action_var_3.x, action_var_3.y, action_var)
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
        action_var = len(strings_options[lang_type][action_var_3])-1
    elif action_var >= len(strings_options[lang_type][action_var_3]):
        action_var = 0


def act_general_change_list_var_1():
    @Name "SUB: act_general_change_list_var_1"

    act_general_change_list()
    menu_item_var_1[action_var_2] = strings_options[lang_type][action_var_3][action_var]


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

# Usage: action_var => unsummed weights, action_var => calculated summed weights, action_result = max weight
def act_general_calc_weights():
    @Name "SUB: act_general_calc_weights"

    action_result = 0
    action_var_2 = null
    for loop_index in range(0, len(action_var)):
        if action_var[loop_index] > 0:
            action_result += action_var[loop_index]
            action_var_2[loop_index] = action_result
        else:
            action_var_2[loop_index] = -1


def act_general_unsum_weights():
    @Name "SUB: act_general_unsum_weights"

    action_var_2 = 0
    for loop_index in range(0, len(action_var)):
        action_result[loop_index] = max(0, action_var[loop_index] - action_var_2)
        if action_var[loop_index] > 0:
            action_var_2 = action_var[loop_index]
    

def act_general_clear():
    @Name "SUB: act_general_clear"

    if action_var == strings_options[lang_type][OPTIONS_TYPE.TOGGLE][0]:
        action_temp = 0
    else:
        action_temp = action_var


def act_general_disable():
    @Name "SUB: act_general_disable"

    if action_var == 0:
        action_var = strings_options[lang_type][OPTIONS_TYPE.TOGGLE][0]
