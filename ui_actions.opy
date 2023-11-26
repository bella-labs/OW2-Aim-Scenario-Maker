### Menu Actions
#### Submenu 0
subroutine menu_act_change_submenu
subroutine menu_act_save_profile2
subroutine menu_act_cycle_player_x
subroutine menu_act_cycle_player_y
subroutine menu_act_cycle_player_z
subroutine menu_act_cycle_player_speed
subroutine menu_act_cycle_player_gravity
subroutine menu_act_toggle_player_impulse
subroutine menu_act_change_score_type
subroutine menu_act_change_score_limit
subroutine menu_act_cycle_score_kill
subroutine menu_act_cycle_score_body
subroutine menu_act_cycle_score_head
subroutine menu_act_cycle_score_strafe
subroutine menu_act_cycle_score_strafe_min
subroutine menu_act_cycle_score_strafe_max
#### Submenu 1
subroutine menu_act_cycle_bot_slot
subroutine menu_act_bot_hero_pool
subroutine menu_act_cycle_bot_health
subroutine menu_act_cycle_bot_scale
subroutine menu_act_cycle_bot_speed_type
subroutine menu_act_cycle_bot_speed_min
subroutine menu_act_cycle_bot_speed_max
subroutine menu_act_cycle_bot_gravity
subroutine menu_act_cycle_spawn_x
subroutine menu_act_cycle_spawn_y
subroutine menu_act_cycle_spawn_z
subroutine menu_act_cycle_boundary_type
subroutine menu_act_cycle_boundary_lower_x
subroutine menu_act_cycle_boundary_lower_y
subroutine menu_act_cycle_boundary_lower_z
subroutine menu_act_cycle_boundary_upper_x
subroutine menu_act_cycle_boundary_upper_y
subroutine menu_act_cycle_boundary_upper_z
subroutine menu_act_cycle_boundary_dist_min
subroutine menu_act_cycle_boundary_dist_max
subroutine menu_act_cycle_facing_type
subroutine menu_act_cycle_facing_x
subroutine menu_act_cycle_facing_y
subroutine menu_act_cycle_facing_z
subroutine menu_act_cycle_movement_profile
#### Submenu 2
subroutine menu_act_toggle_AD
subroutine menu_act_cycle_AD_min
subroutine menu_act_cycle_AD_max 
subroutine menu_act_toggle_WS
subroutine menu_act_cycle_WS_min
subroutine menu_act_cycle_WS_max 
subroutine menu_act_cycle_jump 
subroutine menu_act_cycle_crouch 
subroutine menu_act_cycle_uncrouch_min 
subroutine menu_act_cycle_uncrouch_max 
subroutine menu_act_toggle_bot_impulse 
subroutine menu_act_cycle_profile_slot 
subroutine menu_act_select_save_profile

rule "Menu Actions: Input Read":
    @Event eachPlayer
    @Condition menu_visible == true
    @Condition eventPlayer.isHoldingButton(ui_inputs[3] or ui_inputs[4] or ui_inputs[5] or ui_inputs[6] or ui_inputs[7] or ui_inputs[8] or ui_inputs[9])
    
    if eventPlayer.isHoldingButton(ui_inputs[3]):
        menu_input = 0
    elif eventPlayer.isHoldingButton(ui_inputs[4]):
        menu_input = 1
    elif eventPlayer.isHoldingButton(ui_inputs[5]):
        menu_input = 2
    elif eventPlayer.isHoldingButton(ui_inputs[6]):
        menu_input = 3
    elif eventPlayer.isHoldingButton(ui_inputs[7]):
        menu_input = 4
    elif eventPlayer.isHoldingButton(ui_inputs[8]):
        menu_input = 5
    elif eventPlayer.isHoldingButton(ui_inputs[9]):
        menu_input = 6

    menu_substart_value = submenu_start_index[submenu_index]
    menu_wait = 0.1

    if submenu_index == 0:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 1
            menu_act_change_submenu()
        elif menu_index == 1 + menu_substart_value:
            menu_submenu_target = 2
            menu_act_change_submenu()
        elif menu_index == 2 + menu_substart_value:
            menu_wait = 0.032
            menu_act_cycle_player_x()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_player_y()
        elif menu_index == 4 + menu_substart_value:
            menu_act_cycle_player_z()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_player_speed()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_player_gravity()
        elif menu_index == 7 + menu_substart_value:
            menu_act_toggle_player_impulse()
        elif menu_index == 8 + menu_substart_value:
            menu_act_change_score_type()
        elif menu_index == 9 + menu_substart_value:
            menu_act_change_score_limit()
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_score_kill()
        elif menu_index == 11 + menu_substart_value:
            menu_act_cycle_score_body()
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_score_head()
        elif menu_index == 13 + menu_substart_value:
            menu_act_cycle_score_strafe()
        elif menu_index == 14 + menu_substart_value:
            menu_act_cycle_score_strafe_min()
        elif menu_index == 15 + menu_substart_value:
            menu_act_cycle_score_strafe_max()
    elif submenu_index == 1:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 0
            menu_act_change_submenu()
        elif menu_index == 1 + menu_substart_value:
            menu_act_cycle_bot_slot()
        elif menu_index == 2 + menu_substart_value:
            menu_act_bot_hero_pool()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_bot_health()
        elif menu_index == 4 + menu_substart_value:
            menu_act_cycle_bot_scale()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_bot_speed_type()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_bot_speed_min()
        elif menu_index == 7 + menu_substart_value:
            menu_act_cycle_bot_speed_max()
        elif menu_index == 8 + menu_substart_value:
            menu_act_cycle_bot_gravity()
        elif menu_index == 9 + menu_substart_value:
            menu_act_cycle_spawn_x()
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_spawn_y()
        elif menu_index == 11 + menu_substart_value:
            menu_act_cycle_spawn_z()
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_boundary_type()
        elif menu_index == 13 + menu_substart_value:
            menu_act_cycle_boundary_lower_x()
        elif menu_index == 14 + menu_substart_value:
            menu_act_cycle_boundary_lower_y()
        elif menu_index == 15 + menu_substart_value:
            menu_act_cycle_boundary_lower_z()
        elif menu_index == 16 + menu_substart_value:
            menu_act_cycle_boundary_upper_x()
        elif menu_index == 17 + menu_substart_value:
            menu_act_cycle_boundary_upper_y()
        elif menu_index == 18 + menu_substart_value:
            menu_act_cycle_boundary_upper_z()
        elif menu_index == 19 + menu_substart_value:
            menu_act_cycle_boundary_dist_min()
        elif menu_index == 20 + menu_substart_value:
            menu_act_cycle_boundary_dist_max()
        elif menu_index == 21 + menu_substart_value:
            menu_act_cycle_facing_type()
        elif menu_index == 22 + menu_substart_value:
            menu_act_cycle_facing_x()
        elif menu_index == 23 + menu_substart_value:
            menu_act_cycle_facing_y()
        elif menu_index == 24 + menu_substart_value:
            menu_act_cycle_facing_z()
        elif menu_index == 25 + menu_substart_value:
            menu_act_cycle_movement_profile()
    elif submenu_index == 2:
        if menu_index == 0 + menu_substart_value:
            menu_submenu_target = 1
            menu_act_change_submenu() 
        elif menu_index == 1 + menu_substart_value:
            menu_act_toggle_AD()
        elif menu_index == 2 + menu_substart_value:
            menu_act_cycle_AD_min()
        elif menu_index == 3 + menu_substart_value:
            menu_act_cycle_AD_max() 
        elif menu_index == 4 + menu_substart_value:
            menu_act_toggle_WS()
        elif menu_index == 5 + menu_substart_value:
            menu_act_cycle_WS_min()
        elif menu_index == 6 + menu_substart_value:
            menu_act_cycle_WS_max() 
        elif menu_index == 7 + menu_substart_value:
            menu_act_cycle_jump() 
        elif menu_index == 8 + menu_substart_value:
            menu_act_cycle_crouch() 
        elif menu_index == 9 + menu_substart_value:
            menu_act_cycle_uncrouch_min() 
        elif menu_index == 10 + menu_substart_value:
            menu_act_cycle_uncrouch_max() 
        elif menu_index == 11 + menu_substart_value:
            menu_act_toggle_bot_impulse() 
        elif menu_index == 12 + menu_substart_value:
            menu_act_cycle_profile_slot() 
        elif menu_index == 13 + menu_substart_value:
            menu_act_select_save_profile()


    wait(menu_wait)
    if RULE_CONDITION:
        goto RULE_START
        

def menu_act_change_submenu():
    @Name "SUB: menu_act_change_submenu"

    if submenu_index == 0:
        submenu_index = menu_submenu_target
        menu_index = submenu_start_index[submenu_index]
    else:
        submenu_index = 0
        menu_index = menu_submenu_target + submenu_start_index[submenu_index]

def menu_act_cycle_player_x():
    @Name "SUB: menu_act_cycle_player_x"

    if menu_input == 2:
        eventPlayer.player_spawn = vect(eventPlayer.getPosition().x, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == 1:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x + 1, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == 0:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x + 0.01, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == -1:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x - 1, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    elif menu_input == -2:
        eventPlayer.player_spawn = vect(eventPlayer.player_spawn.x - 0.01, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
        
    if eventPlayer.player_spawn.x > 1000:
        eventPlayer.player_spawn = vect(-1000, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)
    if eventPlayer.player_spawn.x < -1000:
        eventPlayer.player_spawn = vect(1000, eventPlayer.player_spawn.y, eventPlayer.player_spawn.z)

    menu_opt_var[2] = eventPlayer.player_spawn.x


def menu_act_save_profile():
    @Name "SUB: menu_act_save_profile"

    eventPlayer.profile_count += 1
    smallMessage(hostPlayer, "Profile Saved as {}".format(eventPlayer.profile_count))

    menu_opt_var[3] = eventPlayer.profile_count
    menu_opt_var[4] = eventPlayer.profile_count