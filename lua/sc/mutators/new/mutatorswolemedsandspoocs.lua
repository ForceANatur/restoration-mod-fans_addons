--fat medical fuck
MutatorSWOLENBOYS = MutatorSWOLENBOYS or class(BaseMutator)
MutatorSWOLENBOYS._type = "MutatorSWOLENBOYS"
MutatorSWOLENBOYS.name_id = "MutatorSWOLENBOYS"
MutatorSWOLENBOYS.desc_id = "MutatorSWOLENBOYS_desc"
MutatorSWOLENBOYS.reductions = {
	money = 0,
	exp = 0
}
MutatorSWOLENBOYS.disables_achievements = false
MutatorSWOLENBOYS.categories = {"crime_spree"}
MutatorSWOLENBOYS.icon_coords = {
	8,
	3
}

MutatorSWOLENBOYS.default_value = "spawn_chance"
MutatorSWOLENBOYS.medics = {
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
	Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870")
}
MutatorSWOLENBOYS.spoocs = {
	Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
	Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"),
    Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
    Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
    Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
    Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
    Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
    Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
}

function MutatorSWOLENBOYS:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_medic = table.contains(MutatorSWOLENBOYS.medics, value)
        local is_spook = table.contains(MutatorSWOLENBOYS.spoocs, value)
		
		if is_medic then
			return Idstring("units/payday2/characters/ene_swole_medic_m249/ene_swole_medic_m249")
		end
        if is_spook then
			return Idstring("units/payday2/characters/ene_swole_spook_1/ene_swole_spook_1")
		end
	end
	return value
end