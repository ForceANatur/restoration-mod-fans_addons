--DO NOT TURN ON THIS MUTATOR!
MutatorSafehouseNightmareHell = MutatorSafehouseNightmareHell or class(BaseMutator)
MutatorSafehouseNightmareHell._type = "MutatorSafehouseNightmareHell"
MutatorSafehouseNightmareHell.name_id = "mutator_deadtitans"
MutatorSafehouseNightmareHell.desc_id = "mutator_deadtitans_desc"
MutatorSafehouseNightmareHell.reductions = {
	money = 0,
	exp = 0
}	
MutatorSafehouseNightmareHell.disables_achievements = true
MutatorSafehouseNightmareHell.categories = {"enemies"}
MutatorSafehouseNightmareHell.icon_coords = {
	1,
	3
}

function MutatorSafehouseNightmareHell:setup(data)
	if not PackageManager:loaded("packages/undead_titans") then
		PackageManager:load("packages/undead_titans")
	end
end

-- temp until i can somehow apply it to all special units
MutatorSafehouseNightmareHell.zombies = {
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
	Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
	Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
	Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
	Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"),
	Idstring("units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"),
	Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
	Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf"),
	Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"),
	Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
	Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
	Idstring("units/pd2_mod_halloween/characters/ene_marshal_marksman_1/ene_marshal_marksman_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
	Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
	Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),
	Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"),
	Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
	Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
	Idstring("units/pd2_dlc_hvh/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
}

function MutatorSafehouseNightmareHell:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_zombies = table.contains(MutatorSafehouseNightmareHell.zombies, value)

		if is_zombies then
			return Idstring("units/pd2_mod_halloween/characters/ene_undead_titan/ene_undead_titan")
		end
	end
	return value
end