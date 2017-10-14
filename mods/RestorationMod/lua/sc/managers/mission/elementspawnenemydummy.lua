if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local murky = {
			["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
			["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull",
			["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
			["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870",
			["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_ump/ene_murky_heavy_ump",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_swat_r870/ene_murky_swat_r870",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_1/ene_murky_hrt_1",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	local sm_wish = {
			["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_greendozer/ene_deathvox_greendozer",
			["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_blackdozer/ene_deathvox_blackdozer",
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lmgdozer/ene_deathvox_lmgdozer",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_gageammo/characters/ene_deathvox_shield/ene_deathvox_shield",
			["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_gageammo/characters/ene_deathvox_lightar/ene_deathvox_lightar",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyar/ene_deathvox_heavyar",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_gageammo/characters/ene_deathvox_heavyshot/ene_deathvox_heavyshot",
			["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_5/ene_security_5"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_6/ene_security_6"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_7/ene_security_7"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard",
			["units/payday2/characters/ene_security_8/ene_security_8"] = "units/pd2_mod_gageammo/characters/ene_deathvox_guard/ene_deathvox_guard"
		}
	local deathwish = {
			["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
			["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}
	local easy_wish = {
			["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
			["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
			["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
			["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
			["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
			["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_1/ene_shield_1",
			["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/payday2/characters/ene_shield_1/ene_shield_1",
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}
	local fbi_sniper = {
			["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
		}
	local normal_sniper = {
			["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
		}
		
	function ElementSpawnEnemyDummy:init(...)
		ElementSpawnEnemyDummy.super.init(self, ...)
		local ai_type = tweak_data.levels:get_ai_group_type()
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local job = Global.level_data and Global.level_data.level_id

		if ai_type == "america" and job ~= "firestarter_2" then --only replace enemies if we're in america and not on firestarter 2, otherwise DHS appear in FBI office and it looks fucking stupid
			if difficulty_index == 8 then --DHS over GenSec/FBI
				if sm_wish[self._values.enemy] then
					self._values.enemy = sm_wish[self._values.enemy]
				end
				self._values.enemy = sm_wish[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 7 then --GenSec over FBI
				if deathwish[self._values.enemy] then
					self._values.enemy = deathwish[self._values.enemy]
				end
				self._values.enemy = deathwish[self._values.enemy] or self._values.enemy
			elseif difficulty_index == 6 then --FBI over GenSec
				if easy_wish[self._values.enemy] then
					self._values.enemy = easy_wish[self._values.enemy]
				end
				self._values.enemy = easy_wish[self._values.enemy] or self._values.enemy
			end
		end

		if ai_type == "murky" then
				if murky[self._values.enemy] then
					self._values.enemy = murky[self._values.enemy]
				end
				self._values.enemy = murky[self._values.enemy] or self._values.enemy
		end

		--always replace snipers
		if job == "firestarter_2" and difficulty_index >= 4 then  --FBI Snipers over regular, if on firestarter 2
			 if normal_sniper[self._values.enemy] then
				self._values.enemy = normal_sniper[self._values.enemy]
			 end
			 self._values.enemy = normal_sniper[self._values.enemy] or self._values.enemy
		elseif difficulty_index == 4 or difficulty_index == 5 then --FBI Snipers over regular
			 if normal_sniper[self._values.enemy] then
				self._values.enemy = normal_sniper[self._values.enemy]
			 end
			 self._values.enemy = normal_sniper[self._values.enemy] or self._values.enemy
		elseif difficulty_index == 2 or difficulty_index == 3 then --Regular Snipers over FBI
			if fbi_sniper[self._values.enemy] then
				self._values.enemy = fbi_sniper[self._values.enemy]
			 end
			 self._values.enemy = fbi_sniper[self._values.enemy] or self._values.enemy
		end
		
		self._enemy_name = self._values.enemy and Idstring(self._values.enemy) or Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		self._values.enemy = nil
		self._units = {}
		self._events = {}
		self:_finalize_values()
	end

end