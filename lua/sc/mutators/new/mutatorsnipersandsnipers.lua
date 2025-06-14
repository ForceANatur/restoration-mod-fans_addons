MutatorSnipersAndSnipers = MutatorSnipersAndSnipers or class(BaseMutator)
MutatorSnipersAndSnipers._type = "MutatorSnipersAndSnipers"
MutatorSnipersAndSnipers.name_id = "MutatorSnipersAndSnipers"
MutatorSnipersAndSnipers.desc_id = "MutatorSnipersAndSnipers_desc"
MutatorSnipersAndSnipers.reductions = {
	money = 0,
	exp = 0
}
MutatorSnipersAndSnipers.incompatibility_tags = {
	"replaces_weapons"
}		
MutatorSnipersAndSnipers.disables_achievements = true
MutatorSnipersAndSnipers.categories = {"enemies"}
MutatorSnipersAndSnipers.icon_coords = {
	2,
	3
}
MutatorSnipersAndSnipers.load_priority = -10

function MutatorSnipersAndSnipers:setup(data)
	if restoration then
		restoration.whywhywhywhy = true
	end
end