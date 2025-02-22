MutatorUMP4U2 = MutatorUMP4U2 or class(BaseMutator)
MutatorUMP4U2._type = "MutatorUMP4U2"
MutatorUMP4U2.name_id = "MutatorUMP4U2"
MutatorUMP4U2.desc_id = "MutatorUMP4U2_desc"
MutatorUMP4U2.reductions = {
	money = 0,
	exp = 0
}
MutatorUMP4U2.incompatibility_tags = {}
MutatorUMP4U2.disables_achievements = true
MutatorUMP4U2.categories = {"enemies"}
MutatorUMP4U2.icon_coords = {
	2,
	3
}
MutatorUMP4U2.load_priority = -10

function MutatorUMP4U2:setup(data)
	if restoration then
		restoration.umpp = true
	end
end