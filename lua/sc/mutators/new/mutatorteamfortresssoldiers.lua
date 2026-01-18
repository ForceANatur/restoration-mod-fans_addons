--rocket men
--suffer
MutatorRocketGrunts = MutatorRocketGrunts or class(BaseMutator)
MutatorRocketGrunts._type = "MutatorRocketGrunts"
MutatorRocketGrunts.name_id = "mutator_rocketgunts"
MutatorRocketGrunts.desc_id = "mutator_rocketgunts_desc"
MutatorRocketGrunts.reductions = {
	money = 0,
	exp = 0
}
MutatorRocketGrunts.disables_achievements = false
MutatorRocketGrunts.categories = {"enemies"}
MutatorRocketGrunts.icon_coords = {
	8,
	3
}

function MutatorRocketGrunts:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local unit_types = tweak_data.group_ai.unit_categories.titan_sniper.unit_types
	local rpg_guy_suffer = "units/pd2_mod_sharks/characters/ene_rpg_grunt/ene_rpg_grunt"

    if not PackageManager:loaded("packages/rpg_grunts") then
		PackageManager:load("packages/rpg_grunts")
	end

	table.insert(unit_types.america, rpg_guy_suffer)
	table.insert(unit_types.russia, rpg_guy_suffer)
	table.insert(unit_types.zombie, rpg_guy_suffer)
	table.insert(unit_types.federales, rpg_guy_suffer)
	table.insert(unit_types.murkywater, rpg_guy_suffer)
	table.insert(unit_types.nypd, rpg_guy_suffer)
	table.insert(unit_types.lapd, rpg_guy_suffer)
	table.insert(unit_types.fbi, rpg_guy_suffer)
end