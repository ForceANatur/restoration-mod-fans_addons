local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 6 then
		jerome_dude = "units/payday2/characters/ene_security_3/ene_security_3"	
	elseif difficulty_index == 7 then
		jerome_dude = "units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
	else
		jerome_dude = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
	end

	if difficulty_index <= 5 then
		ponr_value = 360	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end

return {
	--Pro Job PONR 
	[104701] = {
		ponr = ponr_value
	},
	[104650] = {
		ponr = ponr_value
	},
	--Shotgun Man in Sec Room
	[104279] = {
		values = {
			enemy = jerome_dude	
		}
	}
}