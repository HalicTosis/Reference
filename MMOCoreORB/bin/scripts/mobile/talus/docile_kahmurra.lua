docile_kahmurra = Creature:new {
	objectName = "@mob/creature_names:docile_kahmurra",
	socialGroup = "self",
	faction = "",
	level = 10,
	chanceHit = 0.28,
	damageMin = 80,
	damageMax = 90,
	baseXp = 292,
	baseHAM = 1000,
	baseHAMmax = 1200,
	armor = 0,
	resists = {0,0,110,0,0,0,0,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 45,
	hideType = "hide_bristley",
	hideAmount = 27,
	boneType = "bone_mammal",
	boneAmount = 32,
	milkType = "milk_domesticated",
	milk = 20,
	tamingChance = 0,
	ferocity = 1,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/kahmurra.iff"},
	scale = 0.9,

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
	}
}

CreatureTemplates:addCreatureTemplate(docile_kahmurra, "docile_kahmurra")
