stunted_huf_dun = Creature:new {
	objectName = "@mob/creature_names:stunted_huf_dun",
	socialGroup = "huf_dun",
	faction = "",
	level = 9,
	chanceHit = 0.27,
	damageMin = 90,
	damageMax = 110,
	baseXp = 235,
	baseHAM = 675,
	baseHAMmax = 825,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 775,
	hideType = "hide_leathery",
	hideAmount = 800,
	boneType = "bone_mammal",
	boneAmount = 775,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/stunted_huf_dun.iff"},
	scale = 0.65,

--Creature Default Loot Template
	lootGroups = {
		{
			groups = {
				{group = "artifact", chance = 10000000}			
		},
			lootChance = 100000
		},
		{
			groups = {
				{group = "tierone", chance = 10000000}
		},
			lootChance = 50000
		},
		{
			groups = {
				{group = "tiertwo", chance = 10000000}
		},
			lootChance = 25000
		},
		{
			groups = {
				{group = "tierthree", chance = 10000000}
		},
			lootChance = 10000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"intimidationattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(stunted_huf_dun, "stunted_huf_dun")
