--Spawn Mememen--
MutatorMemezMalware = MutatorMemezMalware or class(BaseMutator)
MutatorMemezMalware._type = "MutatorMemezMalware"
MutatorMemezMalware.name_id = "mutator_memez"
MutatorMemezMalware.desc_id = "mutator_memez_desc"
MutatorMemezMalware.reductions = {
	money = 0,
	exp = 0
}
MutatorMemezMalware.disables_achievements = false
MutatorMemezMalware.categories = {"enemies"}
MutatorMemezMalware.icon_coords = {
	8,
	3
}

function MutatorMemezMalware:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types

	local unit_types_shields = tweak_data.group_ai.unit_categories.CS_shield.unit_types
	local unit_types_shield_fbi = tweak_data.group_ai.unit_categories.FBI_shield.unit_types
	local unit_types_shields_city = tweak_data.group_ai.unit_categories.GS_shield.unit_types

	local unit_types_snipers = tweak_data.group_ai.unit_categories.titan_sniper.unit_types

	local unit_types_sgt = tweak_data.group_ai.unit_categories.gensec_sgt.unit_types

	local unit_types_boom = tweak_data.group_ai.unit_categories.boom_M4203.unit_types

	local mememan_mini = Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1")
	local mememan_shield = Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")
	local mememan_sniper = Idstring("units/payday2/characters/ene_mememan_3/ene_mememan_3")
	local mememan_dodge = Idstring("units/payday2/characters/ene_mememan_4/ene_mememan_4")
	local mememan_boom = Idstring("units/payday2/characters/ene_mememan_5_kamikaze/ene_mememan_5_kamikaze")

	table.insert(unit_types.america, mememan_mini)
	table.insert(unit_types.russia, mememan_mini)
	table.insert(unit_types.zombie, mememan_mini)
	table.insert(unit_types.federales, mememan_mini)
	table.insert(unit_types.murkywater, mememan_mini) 
	table.insert(unit_types.nypd, mememan_mini)
	table.insert(unit_types.lapd, mememan_mini)
	table.insert(unit_types.fbi, mememan_mini)
	
	table.insert(unit_types_black.america, mememan_mini)
	table.insert(unit_types_black.russia, mememan_mini)
	table.insert(unit_types_black.zombie, mememan_mini)
	table.insert(unit_types_black.federales, mememan_mini)
	table.insert(unit_types_black.murkywater, mememan_mini)
	table.insert(unit_types_black.nypd, mememan_mini)
	table.insert(unit_types_black.lapd, mememan_mini)
	table.insert(unit_types_black.fbi, mememan_mini)

	table.insert(unit_types_skull.america, mememan_mini)
	table.insert(unit_types_skull.russia, mememan_mini)
	table.insert(unit_types_skull.zombie, mememan_mini)
	table.insert(unit_types_skull.federales, mememan_mini)
	table.insert(unit_types_skull.murkywater, mememan_mini)
	table.insert(unit_types_skull.nypd, mememan_mini)
	table.insert(unit_types_skull.lapd, mememan_mini)	
	table.insert(unit_types_skull.fbi, mememan_mini)

	table.insert(unit_types_shields.america, mememan_shield)
	table.insert(unit_types_shields.russia, mememan_shield)
	table.insert(unit_types_shields.zombie, mememan_shield)
	table.insert(unit_types_shields.federales, mememan_shield)
	table.insert(unit_types_shields.murkywater, mememan_shield) 
	table.insert(unit_types_shields.nypd, mememan_shield)
	table.insert(unit_types_shields.lapd, mememan_shield)
	table.insert(unit_types_shields.fbi, mememan_shield)

	table.insert(unit_types_shield_fbi.america, mememan_shield)
	table.insert(unit_types_shield_fbi.russia, mememan_shield)
	table.insert(unit_types_shield_fbi.zombie, mememan_shield)
	table.insert(unit_types_shield_fbi.federales, mememan_shield)
	table.insert(unit_types_shield_fbi.murkywater, mememan_shield) 
	table.insert(unit_types_shield_fbi.nypd, mememan_shield)
	table.insert(unit_types_shield_fbi.lapd, mememan_shield)
	table.insert(unit_types_shield_fbi.fbi, mememan_shield)

	table.insert(unit_types_shields_city.america, mememan_shield)
	table.insert(unit_types_shields_city.russia, mememan_shield)
	table.insert(unit_types_shields_city.zombie, mememan_shield)
	table.insert(unit_types_shields_city.federales, mememan_shield)
	table.insert(unit_types_shields_city.murkywater, mememan_shield) 
	table.insert(unit_types_shields_city.nypd, mememan_shield)
	table.insert(unit_types_shields_city.lapd, mememan_shield)
	table.insert(unit_types_shields_city.fbi, mememan_shield)

	table.insert(unit_types_snipers.america, mememan_sniper)
	table.insert(unit_types_snipers.russia, mememan_sniper)
	table.insert(unit_types_snipers.zombie, mememan_sniper)
	table.insert(unit_types_snipers.federales, mememan_sniper)
	table.insert(unit_types_snipers.murkywater, mememan_sniper)
	table.insert(unit_types_snipers.nypd, mememan_sniper)
	table.insert(unit_types_snipers.lapd, mememan_sniper)
	table.insert(unit_types_snipers.fbi, mememan_sniper)

	table.insert(unit_types_sgt.america, mememan_dodge)
	table.insert(unit_types_sgt.russia, mememan_dodge)
	table.insert(unit_types_sgt.zombie, mememan_dodge)
	table.insert(unit_types_sgt.federales, mememan_dodge)
	table.insert(unit_types_sgt.murkywater, mememan_dodge)
	table.insert(unit_types_sgt.nypd, mememan_dodge)
	table.insert(unit_types_sgt.lapd, mememan_dodge)
	table.insert(unit_types_sgt.fbi, mememan_dodge)

	table.insert(unit_types_boom.america, mememan_boom)
	table.insert(unit_types_boom.russia, mememan_boom)
	table.insert(unit_types_boom.zombie, mememan_boom)
	table.insert(unit_types_boom.federales, mememan_boom)
	table.insert(unit_types_boom.murkywater, mememan_boom)
	table.insert(unit_types_boom.nypd, mememan_boom)
	table.insert(unit_types_boom.lapd, mememan_boom)
	table.insert(unit_types_boom.fbi, mememan_boom)
end