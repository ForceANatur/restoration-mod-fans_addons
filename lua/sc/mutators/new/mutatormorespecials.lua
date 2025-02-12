--why would you want this lol--
MutatorMoreSpecials = MutatorMoreSpecials or class(BaseMutator)
MutatorMoreSpecials._type = "MutatorMoreSpecials"
MutatorMoreSpecials.name_id = "mutator_morespecials_whywhywhy"
MutatorMoreSpecials.desc_id = "mutator_morespecials_whywhywhy_desc"
MutatorMoreSpecials.reductions = {
	money = 0,
	exp = 0
}
MutatorMoreSpecials.disables_achievements = false
MutatorMoreSpecials.categories = {
	"enemies"
}

MutatorMoreSpecials.icon_coords = {
	6,
	1
}

function MutatorOopsAllSpecials:modify_unit_categories(group_ai_tweak, difficulty_index)
	group_ai_tweak.special_unit_spawn_limits = {
		tank = 99,
		taser = 99,
		boom = 99,
		spooc = 99,
		shield = 99,
		medic = 99
	}
end