def menu_subact_copy_to_bot_slot():
	@Name "SUB: menu_subact_copy_to_bot_slot"

	databot.data_bot_slots[menu_opt_var_1[menu_index]] = databot.data_bot_slots[menu_opt_var_1[menu_index-1]]
	
