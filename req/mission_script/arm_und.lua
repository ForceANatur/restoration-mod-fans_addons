local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local gensec_rifle = "units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"
local gensec_smg = "units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"
local gensec_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"

	if difficulty_index == 7 or difficulty_index == 8 then
		gensec_rifle = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"
		gensec_smg = "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"	
	end

	if difficulty_index == 5 or difficulty_index == 6 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif difficulty_index == 7 or difficulty_index == 8 then
		gensec_dozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"	
	end

	if difficulty_index <= 5 then
		ponr_value = 300
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 420	
	elseif difficulty_index == 8 then
		ponr_value = 540	
	end

return {
	--Pro Job PONR
	[100329] = {
		ponr = ponr_value
	},
	--Force FBI Agents
	[100515] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100521] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100551] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100563] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100567] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100569] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100571] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	[100573] = {
		values = {
            enemy = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
		}
	},
	--GenSec Scripted Spawns
	--Drivers
	[100279] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100281] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100280] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100282] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100283] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100284] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100285] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100286] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100287] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100288] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100289] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100290] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100291] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100292] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100293] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100294] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100295] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100296] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100297] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100298] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100299] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100300] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100301] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100302] = {
		values = {
            enemy = gensec_smg
		}
	},
	--Protection Teams (seems to be unused???? Still, it's better to replace it)
	[100522] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100523] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100526] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100527] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100530] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100531] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100532] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100534] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100535] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100536] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100538] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100539] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100540] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100542] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100543] = {
		values = {
            enemy = gensec_smg
		}
	},
	[100544] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100524] = {
		values = {
            enemy = gensec_rifle
		}
	},
	[100525] = {
		values = {
            enemy = gensec_rifle
		}
	},
	--Van Bulldozers
	[101178] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101179] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101180] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101181] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101182] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101183] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101184] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101185] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101186] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101187] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101188] = {
		values = {
            enemy = gensec_dozer
		}
	},
	[101189] = {
		values = {
            enemy = gensec_dozer
		}
	}
}