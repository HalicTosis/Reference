giant_canyon_krayt_dragon_elder = Creature:new {
	-- objectName = "@mob/creature_names:",
	customName = "giant canyon krayt dragon elder",
	socialGroup = "krayt",
	faction = "",
	level = 300,
	chanceHit = 30.0,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 28549,
	baseHAM = 385000,
	baseHAMmax = 471000,
	armor = 2,
	resists = {170,170,170,170,130,170,170,170,135},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 870,
	boneType = "bone_mammal",
	boneAmount = 805,
	milk = 0,
	tamingChance = 0,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/canyon_krayt_dragon.iff"},
	scale = 1.2;

	lootGroups = {
		{
	        groups = {
				{group = "krayt_dragon_common", chance = 2500000},
				{group = "krayt_tissue_uncommon", chance = 2000000},
				{group = "junk", chance = 1500000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2000000},
			},
			lootChance = 10000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareaattack","stateAccuracyBonus=50"},
		{"creatureareaknockdown","stateAccuracyBonus=50"}
	}
}

CreatureTemplates:addCreatureTemplate(giant_canyon_krayt_dragon_elder, "giant_canyon_krayt_dragon_elder")
