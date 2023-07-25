local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1050
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1020	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 990	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 960
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 930	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 900		
	end

return {
	--Pro Job PONR 
	[101640] = {
		ponr = ponr_value
	}
}