local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540		
	end

return {
	--Pro Job PONR 
	[300204] = {
		ponr = ponr_value
	},
	-- Delay SWAT response
	[300203] = {
		on_executed = {
			{ id = 300164, delay = 45 }
		}
	},
	-- access fix (doesn't work for some reason)
	[302019] = {
		values = {
			SO_access = "96"
		}
	},
	[302021] = {
		values = {
			SO_access = "96"
		}
	},
	[302022] = {
		values = {
			SO_access = "96"
		}
	}
}