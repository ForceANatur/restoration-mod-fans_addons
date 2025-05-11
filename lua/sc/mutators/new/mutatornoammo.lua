-- Disbale dropping ammo pickups

MutatorNoAmmoPickups = MutatorNoAmmoPickups or class(BaseMutator)
MutatorNoAmmoPickups._type = "MutatorNoAmmoPickups"
MutatorNoAmmoPickups.name_id = "mutator_no_ammo_pickups"
MutatorNoAmmoPickups.desc_id = "mutator_no_ammo_pickups_desc"
MutatorNoAmmoPickups.reductions = {
	money = 0,
	exp = 0
}
MutatorNoAmmoPickups.disables_achievements = false
MutatorNoAmmoPickups.categories = {"gameplay","enemies"}
MutatorNoAmmoPickups.icon_coords = {
	3,
	5
}
function MutatorNoAmmoPickups:setup(data)
	-- thanks Miss Miki
	local forbidden_names = table.list_to_set({})
	local char_tweak = tweak_data.character
	local enemy
	for _, name in pairs(char_tweak:enemy_list()) do
		enemy = not forbidden_names[name] and char_tweak[name]

		if enemy then
			enemy.do_not_drop_ammo = true
		end
	end
end