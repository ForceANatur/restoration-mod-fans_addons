--fat medical fuck
ModifierHeavyMedics = ModifierHeavyMedics or class(BaseModifier)
ModifierHeavyMedics._type = "ModifierHeavyMedics"
ModifierHeavyMedics.name_id = "none"
ModifierHeavyMedics.desc_id = "menu_cs_modifier_heavymedics"

ModifierHeavyMedics.default_value = "spawn_chance"
ModifierHeavyMedics.medics = {
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
	Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870")
}

ModifierHeavyMedics.zombiemedic = {
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
	Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
	Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic")
}

function ModifierHeavyMedics:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_medic = table.contains(ModifierHeavyMedics.medics, value)
		local is_zombiemedic = table.contains(ModifierHeavyMedics.zombiemedic, value)
		
		if is_medic and math.random(0,100) <= 25 then
			return Idstring("units/pd2_mod_nc/characters/ene_heavymedic_1/ene_heavymedic_1")
		elseif is_zombiemedic and math.random(0,100) < 25 then
			return Idstring("units/pd2_mod_halloween/characters/ene_heavymedic_1/ene_heavymedic_1")
		end
	end
	return value
end