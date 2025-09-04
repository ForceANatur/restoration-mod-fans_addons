local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")

Month = os.date("%m")
local job = Global.level_data and Global.level_data.level_id

-- Reserved tables for Summers DR effect
local summers_dr_effect_table_host = nil
local summers_dr_effect_table_client = nil

-- LPF effect positions
local effect_usual = Vector3(0,0,0)
local effect_no_gear = Vector3(0,0,-3)
local effect_high = Vector3(1,8,-3)
local effect_low = Vector3(0,-3,0)
local effect_tank = Vector3(1,13,-5)
local effect_tank_titan = Vector3(1,11,-3)
-- Tables below need for LPF effect handling
local units_no_gear = { 
	"cop",
	"fbi",
	"hrt",
	"swat",
	-- for LPF mutator
	"hrt_titan",
	"fbi_vet",
	"security",
	"gensec_guard",
	"city_swat_guard"		
}

local tswat_high = { -- Majority of T SWAT need higher effect position
	Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle_husk"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun_husk"),
	Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),
	Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault_husk"),
	Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"),
	Idstring("units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle_husk"),
	Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun"),
	Idstring("units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun_husk")
}

local units_low = { -- Zeal heavies and grenadier need lower effect position
	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk")
}

local hrt_exclude_list = { -- for HRT enemies where usual effect position will be better
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5_husk")
}

local murky_and_federales_no_gear = { -- Majority of murky units (and some federales) looks better with "no_gear" effect position
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3_husk"),
	--Idstring("units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3"),
	--Idstring("units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3_husk"),
	Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
	Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex_husk"),
	Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
	Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex_husk")
}

--Reset Summers effect stuff
function CopBase:reset_summers_dr_effect()
	summers_dr_effect_table_host = {"red","", "orange","","yellow"} -- CopDamage:die executing twice on host for some reason so this is temp solution
	summers_dr_effect_table_client = {"red", "orange","yellow"} 
	
	self._summers_dr_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/character/glowing_eyes_"..summers_dr_effect_table_host[1].."_summers"),
			parent = self._unit:get_object(Idstring("Head"))
	})
end
--When someone kill Doc/Molly/Elektra -> find Summers and update his effect
function CopBase:find_summers(is_client)					
	local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), 160000000, managers.slot:get_mask("enemies"))
	if enemies then
		for _, enemy in ipairs(enemies) do
			if enemy:base()._tweak_table == "summers" then
				enemy:base():update_summers_dr_effect(false, is_client)
			end
		end
	end
end
--Update Summers DR effect if someone from captain's crew is dead (or when Summers killed when he still has alive crew members)
function CopBase:update_summers_dr_effect(summers_death, is_client)
	if self._unit:base()._tweak_table == "summers" and summers_death then
		World:effect_manager():fade_kill(self._summers_dr_effect)
	else
		if self._summers_dr_effect then
			World:effect_manager():fade_kill(self._summers_dr_effect)
			local summers_dr_effect = nil
			if is_client then
				table.remove(summers_dr_effect_table_client, 1)
				summers_dr_effect = summers_dr_effect_table_client[1]
			else
				table.remove(summers_dr_effect_table_host, 1)
				summers_dr_effect = summers_dr_effect_table_host[1]
			end
			
			if summers_dr_effect ~= nil then
				self._summers_dr_effect = World:effect_manager():spawn({
					effect = Idstring("effects/particles/character/glowing_eyes_"..summers_dr_effect.."_summers"),
					parent = self._unit:get_object(Idstring("Head"))
				})
			end
		end
	end
end

function CopBase:converted_enemy_effect(state)
	if state then
		self._convert_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/character/moneyburn"),
			parent = self._unit:get_object(Idstring("Spine2"))
		})
	else
		if self._convert_effect then
			World:effect_manager():fade_kill(self._convert_effect)
		end
	end
end

function CopBase:enable_lpf_buff(state)
	if self._overheal_unit then
		return
	end
	
	local align_obj_name = Idstring("Head")
	local align_obj = self._unit:get_object(align_obj_name)
	
	local effect_id = Idstring("effects/pd2_mod_omnia/particles/character/overkillpack/mega_alien_eyes")
	local effect_pos = effect_usual
 	
	local unit = self._unit:base()._tweak_table
	local unit_name = self._unit:name()

	local faction = tweak_data.levels:get_ai_group_type()

	if table.contains(units_no_gear, unit) and not table.contains(hrt_exclude_list, unit_name) then
		effect_pos = effect_no_gear
	end
	
	if table.contains(murky_and_federales_no_gear, unit_name) then
		effect_pos = effect_no_gear
	end
	
	if table.contains(tswat_high, unit_name) then
		effect_pos = effect_high
	end
	
	if table.contains(units_low, unit_name) then
		effect_pos = effect_low
	end
	
	if unit == "taser_titan" and faction ~= "zombie" then
		effect_pos = effect_high
	end
		
	if string.match(unit, "tank") then
		effect_pos = effect_tank
		if unit == "tank_titan" then
			effect_pos = effect_tank_titan
		end
	end

	self._overheal_unit = World:effect_manager():spawn({
		effect = effect_id,
		parent = align_obj,
		position = effect_pos
	})
end

function CopBase:disable_lpf_buff()
	if self._overheal_unit then
		World:effect_manager():fade_kill(self._overheal_unit)
	end
end

function CopBase:lpf_heal_effect(overheal)
	local body_obj = Idstring("Spine2")
	local attach_to_body = self._unit:get_object(body_obj)
	if not attach_to_body then
		return
	end
	
	if overheal then
		World:effect_manager():spawn({
			effect = Idstring("effects/pd2_mod_omnia/particles/character/shadow_cloaker/smoke_trail/smoke_distorted_purple"),
			parent = attach_to_body
		})
	else
		World:effect_manager():spawn({
			effect = Idstring("effects/pd2_mod_omnia/particles/character/shadow_cloaker/smoke_trail/smoke_distorted_green"),
			parent = attach_to_body
		})
	end
end

function CopBase:enable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon and alive(weapon) then
		weapon:base():set_asu_laser_enabled(state)
	end
end

function CopBase:disable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon and alive(weapon) then
		weapon:base():set_asu_laser_enabled(false)
	end
end

Hooks:PostHook(CopBase, "post_init", "postinithooksex", function(self)
	self:random_mat_seq_initialization()

	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	elseif self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or self._tweak_table == "autumn" or self._tweak_table == "heavygunner" then
		GroupAIStateBesiege:set_assault_endless(true)
		managers.hud:set_buff_enabled("vip", true)		
		
		if managers.skirmish:is_skirmish() then
			managers.skirmish:set_captain_active()
		end
		
	end
	
	--Just in case Summers decides to spawn again, his DR is back
	if self._tweak_table == "summers" then
		managers.groupai:state():_reset_summers_dr()
		self._unit:base():reset_summers_dr_effect()
	end		

	self._unit:character_damage():add_listener("asu_laser_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_asu_laser"))	
	
	self._unit:character_damage():add_listener("lpf_buff_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_lpf_buff"))	

	--Yufu Wang Hitbox fix
	if self._tweak_table == "triad_boss" then
		self._unit:body("head"--[[self._unit:character_damage()._head_body_name--]]):set_sphere_radius(16)
		self._unit:body("body"):set_sphere_radius(22)	

		self._unit:body("rag_LeftArm"):set_enabled(true)
		self._unit:body("rag_LeftForeArm"):set_enabled(true)

		self._unit:body("rag_RightArm"):set_enabled(true)
		self._unit:body("rag_RightForeArm"):set_enabled(true)

		self._unit:body("rag_LeftArm"):set_sphere_radius(11)
		self._unit:body("rag_LeftForeArm"):set_sphere_radius(7)
		self._unit:body("rag_RightArm"):set_sphere_radius(11)
		self._unit:body("rag_RightForeArm"):set_sphere_radius(7)

		self._unit:body("rag_LeftUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_LeftLeg"):set_sphere_radius(7)
		self._unit:body("rag_RightUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_RightLeg"):set_sphere_radius(7)
	end
	
	if not self._char_tweak.big_head_mode and not self._unit:base():has_tag("tank") then
		local head = self._unit:character_damage()._head_body_name and self._unit:body(self._unit:character_damage()._head_body_name)
		if head then
			head:set_sphere_radius(16)
		end
	end	
	
	--Faction appropriate colors for Cloaker NVGs
	local faction = tweak_data.levels:get_ai_group_type()
    local lights = self._unit:get_objects_by_type(Idstring("light"))
	if faction == "russia" then
		if self._tweak_table == "spooc" or self._tweak_table == "spooc_titan" then
			for k, v in pairs(lights) do
				v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end
	
	if faction == "federales" then
		if self._tweak_table == "spooc_titan" then
			for k, v in pairs(lights) do
				v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end	
	
end)

function CopBase:random_mat_seq_initialization()
    local unit_name = self._unit:name()
 	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
       	
	--BEAT COP FACE STUFF STARTS HERE	
	local cop1_4 = unit_name == Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1/ene_cop_1_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
	or unit_name == Idstring("units/payday2/characters/ene_cop_3/ene_cop_3_husk")
	
	local cop2_3 = unit_name == Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") 
	or unit_name == Idstring("units/payday2/characters/ene_cop_2/ene_cop_2_husk")	
	or unit_name == Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	or unit_name == Idstring("units/payday2/characters/ene_cop_4/ene_cop_4_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest")
	or unit_name == Idstring("units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest_husk")
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_1_4") and cop1_4 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_1_4")
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_2_3") and cop2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_2_3")	
	end	
	--END BEAT COP FACE STUFF

	-- sniper nonsense (don't trust this being executed every time a common unit spawns tbh)
	local sniper_fbi = unit_name == Idstring("units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc_husk")
	
	local sniper_blue = unit_name == Idstring("units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc_husk")
	
	local sniper_gensec = unit_name == Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3_husk")

	local switch_mat_config_federales_sniper = unit_name == Idstring("units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1")
	or unit_name == Idstring("units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1_husk")

	if faction == "federales" and difficulty_index == 6 then
		if self._unit:damage() and self._unit:damage():has_sequence("swap_federales_to_fbi") and switch_mat_config_federales_sniper then
			self._unit:damage():run_sequence_simple("swap_federales_to_fbi")
		elseif faction == "federales" and difficulty_index == 7 then
			if self._unit:damage() and self._unit:damage():has_sequence("swap_federales_to_city") and switch_mat_config_federales_sniper then
				self._unit:damage():run_sequence_simple("swap_federales_to_city")
			end
		end	
	end
	
	if self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_lapd") and sniper_fbi and faction == "lapd" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_lapd")
	elseif self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_nypd") and sniper_fbi and faction == "nypd" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_nypd")		
	elseif self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_zombie") and sniper_fbi and faction == "zombie" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_zombie")		
	end
			
	if self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_3_to_zombie") and sniper_gensec and faction == "zombie" then
		self._unit:damage():run_sequence_simple("switch_sniper_3_to_zombie")	
	end	
	
	--START FBI HRT FACES.
	local fbi_1_2 = unit_name == Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") 
	or unit_name == Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1_husk")	
	or unit_name == Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	or unit_name == Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2_husk")
	
	local fbi_3 = unit_name == Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
	or unit_name == Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3_husk")	
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_1_2") and fbi_1_2 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_1_2")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_3") and fbi_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_3")	
	end	 	
	
	--security $!!SLAT^* insanity	
	local sec_2_3 = unit_name == Idstring("units/payday2/characters/ene_security_2/ene_security_2") 
	or unit_name == Idstring("units/payday2/characters/ene_security_2/ene_security_2_husk")
	or unit_name == Idstring("units/payday2/characters/ene_security_3/ene_security_3")
	or unit_name == Idstring("units/payday2/characters/ene_security_3/ene_security_3_husk")
	
	local sec_1 = unit_name == Idstring("units/payday2/characters/ene_security_1/ene_security_1") 
	or unit_name == Idstring("units/payday2/characters/ene_security_1/ene_security_1_husk")
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_1") and sec_1 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_1")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_2_3") and sec_2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_2_3")	
	end
	--end security shit
	
    local murk_sec = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45_husk")	
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull_husk")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5")	
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5_husk")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870_husk")
		
    local murkies = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1") 
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk")
	
    if self._unit:damage() and self._unit:damage():has_sequence("murksecrandom") and murk_sec then
        self._unit:damage():run_sequence_simple("murksecrandom")				
    elseif self._unit:damage() and self._unit:damage():has_sequence("set_style_murky") and murkies then
        self._unit:damage():run_sequence_simple("set_style_murky")
    end
end	

local material_config_paths = {
  "units/payday2/characters/ene_cop_vars/ene_cop_var1",
  "units/payday2/characters/ene_cop_vars/ene_cop_var2",
  "units/payday2/characters/ene_cop_vars/ene_cop_var3",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var1",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var2",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var3",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var4",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var5",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var6",
  "units/payday2/characters/ene_security_vars/ene_security_var1",
  "units/payday2/characters/ene_security_vars/ene_security_var2",
  "units/payday2/characters/ene_security_vars/ene_security_var3",
  "units/payday2/characters/ene_security_vars/ene_security_var4",
  "units/payday2/characters/ene_security_vars/ene_security_var5",
  "units/payday2/characters/ene_security_vars/ene_security_var6",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var1",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var2",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var3",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var4",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var5",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var6",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var1",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var2",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var3",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var4",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var5",  
  "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_disktrasa"
}

for i, material_config_path in pairs(material_config_paths) do
  local normal_ids = Idstring(material_config_path)
  local contour_ids = Idstring(material_config_path .. "_contour")

  CopBase._material_translation_map[tostring(normal_ids:key())] = contour_ids
  CopBase._material_translation_map[tostring(contour_ids:key())] = normal_ids 
end

--Deleting dozer hats cause it blows people up, pls gib standalone that's always loaded
function CopBase:_chk_spawn_gear()
	local region = tweak_data.levels:get_ai_group_type()
	local difficulty_index = tweak_data:difficulty_to_index(Global and Global.game_settings and Global.game_settings.difficulty or "overkill")

	--Using this only so we can slap this on custom heists
	if restoration and restoration.Options:GetValue("OTHER/Holiday") then
		for _,x in pairs(restoration.christmas_heists) do
			if job == x or Month == "12" then
				if self:char_tweak().is_special and not self._char_tweak.no_xmas_hat then
					self._headwear_unit = safe_spawn_unit("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc", Vector3(), Rotation())					
				end

				if self._headwear_unit then
					local align_obj_name = Idstring("Head")
					local align_obj = self._unit:get_object(align_obj_name)

					self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
				end
			end
		end
	end
end

--Random Weapons For Enemies
local weapons_map = {
	--Secret Service Bois--
	[Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = {"m1911_npc", "mp5", "m4"},

	--Biker Weapon Changes--
	[Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"):key()] = {"c45", "m4", "r870"},
	
	--Female Bikers
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	--Mendoza Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	--Cobras Weapon Changes
	["man"] = {
		[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = "raging_bull",
		[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = "raging_bull",
	},
	[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer"):key()] = {"ak47", "rpk_lmg", "saiga"},

	--Russian Gangster Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	[Idstring("units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer"):key()] = {"m32", "rpk_lmg", "saiga"},

	-- colombians
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"):key()] = {"ak47", "rpk_lmg", "saiga"},
	
	--Bolivian Weapons
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = {"raging_bull", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	
	--Border Crossing Guards
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_thug_outdoor_02/ene_mex_thug_outdoor_02"):key()] = {"m1911_npc", "mac11", "mossberg", "ak47", "raging_bull"},
	
	--Triads (Because why the fuck they carry only pistols)
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = {"m1911_npc", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	
	--Midland Ranch Guards
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = {"c45", "raging_bull", "mac11"},

	--Security Guards
	["trai"] = {
		[Idstring("units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5", "m4"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5", "m4"},
		[Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"):key()] = {"deagle_guard", "ump", "g36"},
		[Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"):key()] = {"deagle_guard", "ump", "g36"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = {"m1911_npc", "mp5", "g36"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = {"m1911_npc", "mp5", "g36"},
	},
	[Idstring("units/payday2/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_4/ene_security_4"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_5/ene_security_5"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_6/ene_security_6"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_7/ene_security_7"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_8/ene_security_8"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1"):key()] = {"bravo_rifle", "deagle_guard"},
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2"):key()] = {"bravo_shotgun", "deagle_guard"},
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"):key()] = {"bravo_lmg", "deagle_guard"},
	
	["shoutout_raid"] = {
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"):key()] = "scar_npc",
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"):key()] = "benelli",
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"):key()] = "lmg_titan",
	},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"):key()] = {"scar_npc", "deagle_guard"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"):key()] = {"benelli", "deagle_guard"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"):key()] = {"lmg_titan", "deagle_guard"},
	
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"):key()] = {"deagle_guard", "ump"},
	[Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"):key()] = {"deagle_guard", "ump"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = {"m1911_npc", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"):key()] = {"raging_bull", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_reapers/characters/ene_security_1/ene_security_1"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_2/ene_security_2"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	
	[Idstring("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = {"m1911_npc", "mp5", "m4"},
	
	["vit"] = {
		[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"):key()] = {"scar_murky", "ump", "m4"},
		[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"):key()] = {"scar_murky", "ump", "m4"},
	},
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"):key()] = {"m1911_npc", "ump", "m4"},
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"):key()] = {"m1911_npc", "ump", "m4"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = {"m500"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = {"m500"},
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"):key()] = "r870",
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = {"m1911_npc", "mp5", "m4"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"):key()] = {"ump", "r870", "m416_npc"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"):key()] = {"ump", "r870", "m416_npc"},
	
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"):key()] = {"m1911_npc", "deagle_guard", "mp5", "m4"},
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"):key()] = {"m1911_npc", "deagle_guard", "mp5", "m4"},
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"):key()] = "r870",
	
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_1/ene_security_fri_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_2/ene_security_fri_2"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_3/ene_security_fri_3"):key()] = {"m1911_npc", "mp5"},
	
	--Vanilla Murkies with variety weapons
	[Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = {"ump", "r870", "scar_murky"},
	[Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = {"ump", "r870", "scar_murky"},
	[Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = {"r870", "ump", "scar_murky"},
	
	--Commissar gets his precious RPK back from Russia
	[Idstring("units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss"):key()] = "rpk_lmg",
	
	--Overkill MC Boss has Benelli auto-shotty instead of LMG
	[Idstring("units/pd2_dlc_born/characters/ene_gang_biker_boss/ene_gang_biker_boss"):key()] = "benelli",
	
	--FSB gets proper Russian Weapons
	--Security bois
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = {"streak", "akmsu_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = {"streak", "akmsu_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = {"fort_500"}, --keeping the tradition of shotgun guards :)
	--Beat Cops
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = {"streak"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = {"raging_bull"}, --keeping the tradition of bronco cops :)
	--why there are 2 cop shotgunners?
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = {"akmsu_smg"},
	--FSB
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = {"ak47_ass"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = {"ak47_ass"},
	--FSB City but they are not City
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = {"ak47_ass"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = {"ak47_ass"},
	--FSB Shields
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = {"streak"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = {"sr2_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = {"sr2_smg"},

	--Giving Friendly AI silenced pistols
	[Idstring("units/pd2_dlc_spa/characters/npc_spa/npc_spa"):key()] = "beretta92",
	[Idstring("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "beretta92",
	[Idstring("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "beretta92",

	--Giving vanilla units the right guns
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "fort_500",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")] = "ak47_yellow"
--	[Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "m500",

--	[Idstring("units/pd2_mod_nc/characters/ene_heavymedic_1/ene_heavymedic_1")] = {"scar_murky", "ump", "g36"}
}

local default_weapon_name_orig = CopBase.default_weapon_name
function CopBase:default_weapon_name(...)
	local job = Global.level_data and Global.level_data.level_id or ""
	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local weapon_override = weapons_map[job] and weapons_map[job][self._unit:name():key()] or weapons_map[self._unit:name():key()]
	
	--For Jungle Inferno Mutator
	if not self._weapon_set and restoration and restoration.disco_inferno and not self._char_tweak.no_mutator_weapon_override then
		self._default_weapon_id = "flamethrower"
		self._weapon_set = true
	end

	--For Sniper Hell Mutator
	if not self._weapon_set and restoration and restoration.whywhywhywhy and not self._char_tweak.no_mutator_weapon_override then
		self._default_weapon_id = "m14_sniper_npc"
		self._weapon_set = true

		if faction == "russia" then
			self._default_weapon_id = "asval_smg_elite"
		end

		--Manually give dozers the right weapons
		local dozers_snipers = {
			-- Vanilla Bulldozers
			[Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"m14_sniper_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"m14_sniper_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = {"m14_sniper_npc"},
			-- Akan (asval_smg_elite was reprogramed to be a sniper so I'm doing that)
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"):key()] = {"asval_smg_elite"},
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"):key()] = {"asval_smg_elite"},
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"):key()] = {"asval_smg_elite"},
			-- HVH
			[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"):key()] = {"m14_sniper_npc"},
			-- BPH
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"):key()] = {"m14_sniper_npc"},
			-- BEX
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = {"m14_sniper_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"):key()] = {"m14_sniper_npc"},
			-- SC Bulldozers
			[Idstring("units/payday2/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic")] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_vip/characters/ene_vip_2_minion/ene_vip_2_minion"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_biker_1/ene_bulldozer_biker_1"):key()] = {"railgun_npc"},
			-- Akan SC
			[Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2"):key()] = {"railgun_npc"},
			-- HVH SC
			[Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"):key()] = {"railgun_npc"},
			[Idstring("units/payday2/characters/ene_bulldozer_4_minion/ene_bulldozer_4_minion"):key()] = {"railgun_npc"},
			-- BEX SC
			[Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = {"railgun_npc"},
			-- NYPD
			[Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"railgun_npc"},
			-- OMNIA
			[Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = {"railgun_npc"},
			[Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = {"railgun_npc"},
			-- Captains
			[Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")] = {"railgun_npc"},
			[Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman"):key()] = {"railgun_npc"}
		}

		local tank_snipers = dozers_snipers[self._unit:name():key()]

		if tank_snipers then
			self._default_weapon_id = type(tank_snipers) == "table" and table.random(tank_snipers) or tank_snipers
		end
	end

	--For UMP 4U2 mutator
	--Female FBI units have bronco and that thing already hurts like hell
	if not self._weapon_set and restoration and restoration.umpp then
		if self._tweak_table == "fbi" then
			self._default_weapon_id = "benelli"
			self._weapon_set = true
		elseif self._tweak_table == "fbi_vet" then
			self._default_weapon_id = "x_raging_bull_npc"
			self._weapon_set = true
		elseif self._tweak_table == "hrt" or self._tweak_table == "hrt_titan" then
			self._default_weapon_id = "ump"
			self._weapon_set = true
		end

		if self._tweak_table == "medic" then
			if faction == "america" or faction == "zombie" or faction == "nypd" or faction == "lapd" or faction == "fbi" then
				self._default_weapon_id = "bravo_lmg"
				self._weapon_set = true
			elseif faction == "russia" then
				self._default_weapon_id = "bravo_rpk74"
				self._weapon_set = true
			elseif faction == "murkywater" then
				self._default_weapon_id = "m60_om"
				self._weapon_set = true
			elseif faction == "federales" then
				self._default_weapon_id = "hk21_bravo_npc"
				self._weapon_set = true
			end
		end

		if self._tweak_table == "spooc" then
			if faction == "america" or faction == "zombie" or faction == "nypd" or faction == "lapd" or faction == "fbi" then
				self._default_weapon_id = "bravo_rifle"
				self._weapon_set = true
			elseif faction == "russia" then
				self._default_weapon_id = "bravo_ak17"
				self._weapon_set = true
			elseif faction == "murkywater" then
				self._default_weapon_id = "oicw"
				self._weapon_set = true
			elseif faction == "federales" then
				self._default_weapon_id = "hk33_bravo"
				self._weapon_set = true
			end
		end
		-- suffer
		if self._tweak_table == "medic_heavy" then
			self._default_weapon_id = "m32"
			self._weapon_set = true
		end
	end

	--For High Noon mutator
	if not self._weapon_set and restoration and restoration.high_noon and not self._char_tweak.no_mutator_weapon_override then
		if self._tweak_table == "autumn" then
			self._default_weapon_id = "x_peacemaker"
			self._weapon_set = true
		end

		if self._tweak_table == "dave" then
			self._default_weapon_id = "x_raging_bull_npc"
			self._weapon_set = true
		end

		if self._tweak_table == "heavygunner" then
			self._default_weapon_id = "mossberg"
			self._weapon_set = true
		end
		
		if self._default_weapon_id == "r870" then
			self._default_weapon_id = "mossberg"
			self._weapon_set = true
		end
		
		if self._default_weapon_id == "ump" then
			self._default_weapon_id = "peacemaker"
			self._weapon_set = true
		end		
		
		if self._default_weapon_id == "m4" or self._default_weapon_id == "mp5" or self._default_weapon_id == "amcar" then
			self._default_weapon_id = "raging_bull"
			self._weapon_set = true
		end
	end

	--Have White Titandozers use Grenade Launchers/AA-12s like their Reaper counterparts in Russia/Mexico heists (mostly for Holiday Effects and consistency with factions)
	if self._tweak_table == "tank_hw" and faction == "russia" then
		self._default_weapon_id = "m32_large"
		self._weapon_set = true
	end
	if self._tweak_table == "tank_hw" and faction == "federales" or self._tweak_table == "tank_titan_assault" and faction == "federales" then
		self._default_weapon_id = "aa12_dozer"
		self._weapon_set = true
	end

	if not self._weapon_set and weapon_override then
		self._default_weapon_id = type(weapon_override) == "table" and table.random(weapon_override) or weapon_override
		self._weapon_set = true
	end

	return default_weapon_name_orig(self, ...)
end

function CopBase:change_char_tweak(new_tweak_name)
	local new_tweak_data = tweak_data.character[new_tweak_name]

	if not new_tweak_data then
		return
	end

	if new_tweak_name == self._tweak_table then
		return
	end

	local old_tweak_data = self._char_tweak
	self._tweak_table = new_tweak_name
	self._char_tweak = new_tweak_data
	local old_tags = self._tags
	local was_special = self:has_tag("special")

	self:_set_tags(new_tweak_data.tags)

	if was_special then
		managers.groupai:state():on_unit_tags_updated(self._unit, old_tags, self._tags)
	end
	
	--Drops CS gas
	if Network:is_server() and self._tweak_table == "phalanx_vip_break" then
		managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
	end

	self:_chk_call_tweak_data_changed_listeners(old_tweak_data, new_tweak_data)
end

-- IareAwesome17's mixed weapons
-- Knowing my hijinks, it's gonna crash
-- In the event the game perma loads, disable this
--Beat cops
local cop = {
	pistol = {
		"c45",
		"raging_bull"
	},
	heavy = {
		"mp5",
		"r870",
		"ump"
	}
}
--SWAT
local swat = {
	rifle_light = {
		"mp5",
		"ump"
	},
	rifle_heavy = {
		"mp5",
		"m4",
		"ump"
	}
}
--FBI and Medics
local fbi = {
	pistol_agent = {
		"c45",
		"raging_bull"
	},
	rifle_agent = {
		"mp5",
		"m4"
	},
	rifle_light = {
		"mp5",
		"m4"
	},
	rifle_heavy = {
		"m4",
		"m249"
	},
	shotgun = {
		"r870",
		"saiga"
	},
	shotgun_medic = {
		"r870",
		"benelli",
		"saiga"
	}
}
--GenSec
local gensec = {
	rifle_heavy = {
		"g36",
		"m249"
	},
	shotgun = {
		"r870",
		"saiga",
		"benelli",
		"spas12",
		"ksg"
	}
}
--ZEAL
local zeal = {
	rifle_light = {
		"m4",
		"mp5",
		"ump",
		"shepheard"
	},
	rifle_heavy = {
		"m4",
		"g36",
		"ump",
		"m249",
		"r870",
		"saiga",
		"benelli",
		"spas12",
		"ksg"
	},
}
--Russian Reapers
local russia = {
	rifle_light = {
		"ak47_ass",
		"akmsu_smg"
	},
	rifle_heavy = {
		"ak47_ass_elite",
		"rpk_lmg"
	},
	shotgun = {
		"fort_500",
		"saiga",
		"benelli"
	}
}
--Murkywater
local murkywater = {
	rifle_light = {
		"m4",
		"scar_murky",
		"ump",
		"scar_npc",
		"shepheard"
	},
	rifle_heavy = {
		"m4",
		"scar_murky",
		"ump",
		"shepheard",
		"m249",
		"m249",
		"m249",
		"m249"
	},
	shotgun = {
		"r870",
		"benelli",
		"saiga",
		"spas12",
		"ksg"
	}
}
--Policia Federal
local federales = {
	rifle_light = {
		"mp5",
		"m4",
		"ump",
		"shepheard"
	},
	rifle_heavy = {
		"m4",
		"ump",
		"m249"
	},
	shotgun = {
		"ksg",
		"r870",
		"benelli",
		"saiga"
	}
}
local dave = {
	all_the_guns = {
		"c45",
		"raging_bull",
		"mp5",
		"r870",
		"benelli",
		"ump",
		"m4",
		"g36",
		"m249",
	--	"scar_murky",
	--	"m1911_npc",
	--	"deagle",
	--	"lmg_titan",
	--	"aa12_npc",
		"mateba_ap",
		"m14_sniper_npc",
		"atf_ddm4v7",
		"saiga",
		"hk21_sc",
		"shepheard",
		"spas12",
		"ksg"
	--	"mini", -- funny, but i think it's too goofy
	--	"railgun_npc"
	}
}
local weapon_mapping = {
-- Beat cops
	[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = cop.pistol,
	[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = cop.pistol,
	[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = cop.heavy,
	[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = cop.heavy,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"):key()] = cop.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"):key()] = cop.pistol,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = cop.heavy,
	[("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = cop.heavy,
	[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = cop.pistol,
	[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = cop.pistol,
-- SWAT
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = swat.rifle_light,
	[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = swat.rifle_heavy,
-- FBI
	[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = fbi.pistol_agent,
	[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = fbi.rifle_agent,
	[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = fbi.rifle_agent,
	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = fbi.rifle_light,
--	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = fbi.rifle_light,
	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = fbi.rifle_heavy,
	[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = fbi.shotgun,
	[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = fbi.shotgun,
	[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = fbi.shotgun_medic,
-- GenSec
	[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = gensec.rifle_heavy,
	[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = gensec.shotgun,
	[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = gensec.shotgun,
	[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = gensec.shotgun,
-- ZEAL
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = zeal.rifle_light,
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = zeal.rifle_heavy,
-- Russia
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = russia.rifle_light,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = russia.rifle_heavy,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = russia.shotgun,
	[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = russia.shotgun,
-- Zombie
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"):key()] = cop.pistol,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = cop.heavy,
	[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = swat.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = swat.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = fbi.pistol_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = fbi.rifle_agent,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = fbi.rifle_light,
--	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = fbi.rifle_light,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = fbi.rifle_heavy,
	[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = fbi.shotgun,
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = fbi.shotgun_medic,
-- Murkywater
	[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = murkywater.rifle_light,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = murkywater.rifle_heavy,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = murkywater.shotgun,
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = murkywater.shotgun,
-- Federales
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = federales.rifle_light,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = federales.rifle_heavy,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = federales.shotgun,
	[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = federales.shotgun,
-- Dave's guns
	[("units/pd2_mod_dave/characters/ene_big_dave/ene_big_dave"):key{}] = dave.all_the_guns
}

Hooks:PreHook(CopBase, "post_init", "MIX_post_init", function(self)
	local weapon_swap = weapon_mapping[self._unit:name():key()]

	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end)