--Spawn Frag Dozers--
MutatorFragDozers = MutatorFragDozers or class(BaseMutator)
MutatorFragDozers._type = "MutatorFragDozers"
MutatorFragDozers.name_id = "mutator_fragdozers"
MutatorFragDozers.desc_id = "mutator_fragdozers_desc"
MutatorFragDozers.reductions = {
	money = 0,
	exp = 0
}
MutatorFragDozers.disables_achievements = false
MutatorFragDozers.categories = {"enemies"}
MutatorFragDozers.icon_coords = {
	6,
	3
}

function MutatorFragDozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	local a = tweak_data.levels.ai_groups.america
	local r = tweak_data.levels.ai_groups.russia
	local m = tweak_data.levels.ai_groups.murkywater
	local z = tweak_data.levels.ai_groups.zombie
	local f = tweak_data.levels.ai_groups.federales
	local la = tweak_data.levels.ai_groups.lapd
	local ny = tweak_data.levels.ai_groups.nypd
	local feds = tweak_data.levels.ai_groups.fbi
	local ai_type = tweak_data.levels:get_ai_group_type()

	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types

	local frag_unit_name = Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag/ene_bulldozer_frag")
	local zeal_frag_unit = Idstring("units/pd2_mod_boom/characters/ene_zeal_bulldozer_frag/ene_zeal_bulldozer_frag")

	-- so we dont oom
	-- its really ugly, but anything do deal with 32bit
	if ai_type == z then
		if not PackageManager:loaded("packages/frag_bulldozers_hvh") then
			PackageManager:load("packages/frag_bulldozers_hvh")
		end
	elseif ai_type == r then
		if not PackageManager:loaded("packages/frag_bulldozers_akan") then
			PackageManager:load("packages/frag_bulldozers_akan")
		end
	elseif ai_type == f then
		if not PackageManager:loaded("packages/frag_bulldozers_bex") then
			PackageManager:load("packages/frag_bulldozers_bex")
		end
	elseif ai_type == m then
		if not PackageManager:loaded("packages/frag_bulldozers_murky") then
			PackageManager:load("packages/frag_bulldozers_murky")
		end
	else
		if not PackageManager:loaded("packages/frag_bulldozers") then
			PackageManager:load("packages/frag_bulldozers")
		end
	end

	if difficulty_index <= 7 then
		table.insert(unit_types.america, frag_unit_name)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types.nypd, frag_unit_name)
		table.insert(unit_types.lapd, frag_unit_name)
		table.insert(unit_types.fbi, frag_unit_name)
		
		table.insert(unit_types_black.america, frag_unit_name)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types_black.nypd, frag_unit_name)
		table.insert(unit_types_black.lapd, frag_unit_name)
		table.insert(unit_types_black.fbi, frag_unit_name)

		table.insert(unit_types_skull.america, frag_unit_name)
		table.insert(unit_types_skull.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types_skull.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types_skull.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types_skull.nypd, frag_unit_name)
		table.insert(unit_types_skull.lapd, frag_unit_name)	
		table.insert(unit_types_skull.fbi, frag_unit_name)
	else
		table.insert(unit_types.america, zeal_frag_unit)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types.nypd, zeal_frag_unit)
		table.insert(unit_types.lapd, zeal_frag_unit)
		table.insert(unit_types.fbi, zeal_frag_unit)
		
		table.insert(unit_types_black.america, zeal_frag_unit)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types_black.nypd, zeal_frag_unit)
		table.insert(unit_types_black.lapd, zeal_frag_unit)
		table.insert(unit_types_black.fbi, zeal_frag_unit)

		table.insert(unit_types_skull.america, zeal_frag_unit)
		table.insert(unit_types_skull.russia, Idstring("units/pd2_mod_boom/characters/ene_akan_dozer_m32/ene_akan_dozer_m32"))
		table.insert(unit_types_skull.zombie, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_hvh/ene_bulldozer_frag_hvh"))
		table.insert(unit_types_skull.federales, Idstring("units/pd2_mod_boom/characters/ene_swat_dozer_policia_federale_m32/ene_swat_dozer_policia_federale_m32"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_boom/characters/ene_bulldozer_frag_murky/ene_bulldozer_frag_murky"))
		table.insert(unit_types_skull.nypd, zeal_frag_unit)
		table.insert(unit_types_skull.lapd, zeal_frag_unit)	
		table.insert(unit_types_skull.fbi, zeal_frag_unit)
	end
end