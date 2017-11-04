dreaded_vir_vur = Creature:new {
	objectName = "@mob/creature_names:dreaded_vir_vir",
	socialGroup = "vir_vur",
	faction = "",
	level = 38,
	chanceHit = 0.44,
	damageMin = 370,
	damageMax = 450,
	baseXp = 3824,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {140,0,-1,-1,0,0,0,0,-1},
	meatType = "meat_avian",
	meatAmount = 25,
	hideType = "hide_wooly",
	hideAmount = 20,
	boneType = "bone_mammal",
	boneAmount = 16,
	milk = 0,
	tamingChance = 0.2,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	templates = {"object/mobile/vir_vur_hue.iff"},
	controlDeviceTemplate = "object/intangible/pet/vir_vur_hue.iff",
	scale = 1.35,

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

CreatureTemplates:addCreatureTemplate(dreaded_vir_vur, "dreaded_vir_vur")
