--Minigun Dozers--
MutatorMinidozers = MutatorMinidozers or class(BaseMutator)
MutatorMinidozers._type = "MutatorMinidozers"
MutatorMinidozers.name_id = "mutator_minidozers"
MutatorMinidozers.desc_id = "mutator_minidozers_desc"
MutatorMinidozers.reductions = {
	money = 0,
	exp = 0
}
MutatorMinidozers.disables_achievements = false
MutatorMinidozers.categories = {"enemies"}
MutatorMinidozers.icon_coords = {
	6,
	3
}

function MutatorMinidozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	
	local mini_unit_name = Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	local classic_mini_unit_name = Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer")
	local vanilla_minigun = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	local zeal_minigun = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	
	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_mini_unit_name)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"))
		table.insert(unit_types.nypd, classic_mini_unit_name)
		table.insert(unit_types.lapd, classic_mini_unit_name)
		table.insert(unit_types.fbi, classic_mini_unit_name)
	
		table.insert(unit_types_black.america, classic_mini_unit_name)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"))
		table.insert(unit_types_black.nypd, classic_mini_unit_name)
		table.insert(unit_types_black.lapd, classic_mini_unit_name)
		table.insert(unit_types_black.fbi, classic_mini_unit_name)

		table.insert(unit_types.america, vanilla_minigun)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(unit_types.nypd, vanilla_minigun)
		table.insert(unit_types.lapd, vanilla_minigun)
		table.insert(unit_types.fbi, vanilla_minigun)
	
		table.insert(unit_types_black.america, vanilla_minigun)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(unit_types_black.nypd, vanilla_minigun)
		table.insert(unit_types_black.lapd, vanilla_minigun)
		table.insert(unit_types_black.fbi, vanilla_minigun)
	else	
		table.insert(unit_types.america, mini_unit_name)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli")) --Since the Murky Benellidozer only appears in scripted spawns
		table.insert(unit_types.nypd, mini_unit_name)
		table.insert(unit_types.lapd, mini_unit_name)
		table.insert(unit_types.fbi, mini_unit_name)
	
		table.insert(unit_types_black.america, mini_unit_name)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli")) --ditto
		table.insert(unit_types_black.nypd, mini_unit_name)
		table.insert(unit_types_black.lapd, mini_unit_name)
		table.insert(unit_types_black.fbi, mini_unit_name)

		table.insert(unit_types.america, zeal_minigun)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(unit_types.nypd, zeal_minigun)
		table.insert(unit_types.lapd, zeal_minigun)
		table.insert(unit_types.fbi, zeal_minigun)
	
		table.insert(unit_types_black.america, zeal_minigun)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(unit_types_black.nypd, zeal_minigun)
		table.insert(unit_types_black.lapd, zeal_minigun)
		table.insert(unit_types_black.fbi, zeal_minigun)
	end
end	