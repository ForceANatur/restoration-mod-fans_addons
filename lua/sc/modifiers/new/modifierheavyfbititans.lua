--asu with more hp
ModifierHeavyFBITitans = ModifierHeavyFBITitans or class(BaseModifier)
ModifierHeavyFBITitans._type = "ModifierHeavyFBITitans"
ModifierHeavyFBITitans.name_id = "none"
ModifierHeavyFBITitans.desc_id = "menu_cs_modifier_heavyfbititans"

ModifierHeavyFBITitans.default_value = "spawn_chance"
ModifierHeavyFBITitans.hrt_titan = {
	Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
}

ModifierHeavyFBITitans.hrt_titan_hvh = {
	Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
}

function ModifierHeavyFBITitans:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_asu = table.contains(ModifierHeavyFBITitans.hrt_titan, value)
		local is_hvh_asu = table.contains(ModifierHeavyFBITitans.hrt_titan_hvh, value)
		
		if is_asu then
			return Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_heavy_1/ene_fbi_titan_heavy_1")
		elseif is_hvh_asu then
			return Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_heavy_1/ene_fbi_titan_heavy_1")
		end
	end
	return value
end