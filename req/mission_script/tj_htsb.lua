local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 720
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 660	
	elseif difficulty_index == 8 then
		ponr_value = 600
	end
    
    if Global.game_settings and Global.game_settings.one_down then	
        if difficulty_index == 5 or difficulty_index == 6 or difficulty_index == 7 or difficulty_index == 8 then
            vet_on_break = "units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"
        end
    end
return {
	--Pro Job PONR 
	[103669] = {
		ponr = ponr_value
	},
    -- non bloddy vet cop probably smoking at the police station 
    [101606] = {
        values = {
         enemy =  vet_on_break
        }
    }
}