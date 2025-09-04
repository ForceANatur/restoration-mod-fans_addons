-- doo yooh rhemnmmembhur crack
-- healing
MutatorDeathvoxMedics = MutatorDeathvoxMedics or class(BaseMutator)
MutatorDeathvoxMedics._type = "MutatorDeathvoxMedics"
MutatorDeathvoxMedics.name_id = "MutatorDeathvoxMedics"
MutatorDeathvoxMedics.desc_id = "MutatorDeathvoxMedics_desc"
MutatorDeathvoxMedics.reductions = {
	money = 0,
	exp = 0
}
MutatorDeathvoxMedics.disables_achievements = false
MutatorDeathvoxMedics.categories = {"enemies"}
MutatorDeathvoxMedics.icon_coords = {
	6,
	2
}

function MutatorDeathvoxMedics:setup(data)
	if not PackageManager:loaded("packages/deathvox_medic") then
		PackageManager:load("packages/deathvox_medic")
	end
end

MutatorDeathvoxMedics.default_value = "spawn_chance"
MutatorDeathvoxMedics.medics = {
	Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
	Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
	Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
	Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),			
	Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
	Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
	Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
	Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
	Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
	Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
	Idstring("units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic"),
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
	Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
	Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
	Idstring("units/pd2_mod_ng/characters/ene_ntl_medic/ene_ntl_medic")
}

function MutatorDeathvoxMedics:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_medic = table.contains(MutatorDeathvoxMedics.medics, value)

		if is_medic and math.random(0,2) <= 1 then
			return Idstring("units/pd2_dlc_gitgud/characters/ene_deathvox_medic/ene_deathvox_medic")
		end
	end
	return value
end