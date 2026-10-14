--Spawn Warthogs--
MutatorPiggyBulldozer = MutatorPiggyBulldozer or class(BaseMutator)
MutatorPiggyBulldozer._type = "MutatorPiggyBulldozer"
MutatorPiggyBulldozer.name_id = "mutator_warthogs"
MutatorPiggyBulldozer.desc_id = "mutator_warthogs_desc"
MutatorPiggyBulldozer.reductions = {
	money = 0,
	exp = 0
}
MutatorPiggyBulldozer.disables_achievements = false
MutatorPiggyBulldozer.categories = {"enemies"}
MutatorPiggyBulldozer.icon_coords = {
	6,
	3
}

function MutatorPiggyBulldozer:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types

	local flamer_dozer = Idstring("units/pd2_dlc_pda10/characters/ene_dozer_piggy/ene_dozer_piggy")

	table.insert(unit_types.america, flamer_dozer)
	table.insert(unit_types.russia, flamer_dozer)
	table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_dozer_piggy/ene_dozer_piggy"))
	table.insert(unit_types.federales, flamer_dozer)
	table.insert(unit_types.murkywater, flamer_dozer) 
	table.insert(unit_types.nypd, flamer_dozer)
	table.insert(unit_types.lapd, flamer_dozer)
	table.insert(unit_types.fbi, flamer_dozer)
	
	table.insert(unit_types_black.america, flamer_dozer)
	table.insert(unit_types_black.russia, flamer_dozer)
	table.insert(unit_types_black.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_dozer_piggy/ene_dozer_piggy"))
	table.insert(unit_types_black.federales, flamer_dozer)
	table.insert(unit_types_black.murkywater, flamer_dozer)
	table.insert(unit_types_black.nypd, flamer_dozer)
	table.insert(unit_types_black.lapd, flamer_dozer)
	table.insert(unit_types_black.fbi, flamer_dozer)

	table.insert(unit_types_skull.america, flamer_dozer)
	table.insert(unit_types_skull.russia, flamer_dozer)
	table.insert(unit_types_skull.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_dozer_piggy/ene_dozer_piggy"))
	table.insert(unit_types_skull.federales, flamer_dozer)
	table.insert(unit_types_skull.murkywater, flamer_dozer)
	table.insert(unit_types_skull.nypd, flamer_dozer)
	table.insert(unit_types_skull.lapd, flamer_dozer)	
	table.insert(unit_types_skull.fbi, flamer_dozer)
end