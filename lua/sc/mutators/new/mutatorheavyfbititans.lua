--asu with more hp lol
MutatorHeavyFBITitans = MutatorHeavyFBITitans or class(BaseMutator)
MutatorHeavyFBITitans._type = "MutatorHeavyFBITitans"
MutatorHeavyFBITitans.name_id = "MutatorHeavyFBITitans"
MutatorHeavyFBITitans.desc_id = "MutatorHeavyFBITitans_desc"
MutatorHeavyFBITitans.reductions = {
	money = 0,
	exp = 0
}
MutatorHeavyFBITitans.disables_achievements = false
MutatorHeavyFBITitans.categories = {"enemies", "crime_spree"}
MutatorHeavyFBITitans.icon_coords = {
	6,
	4
}

MutatorHeavyFBITitans.default_value = "spawn_chance"
MutatorHeavyFBITitans.hrt_titan = {
	Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
}

MutatorHeavyFBITitans.hrt_titan_hvh = {
	Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
}

function MutatorHeavyFBITitans:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_asu = table.contains(MutatorHeavyFBITitans.hrt_titan, value)
		local is_hvh_asu = table.contains(MutatorHeavyFBITitans.hrt_titan_hvh, value)
		
		if is_asu and math.random(0,2) <= 1 then
			return Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_heavy_1/ene_fbi_titan_heavy_1")
		elseif is_hvh_asu and math.random(0,2) <= 1 then
			return Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_heavy_1/ene_fbi_titan_heavy_1")
		end
	end
	return value
end