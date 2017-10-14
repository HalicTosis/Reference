trainer_unarmed = Creature:new {
	objectName = "@mob/creature_names:trainer_unarmed",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	faction = "",
	level = 100,
	chanceHit = 0.390000,
	damageMin = 290,
	damageMax = 300,
	baseXp = 2914,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {-1,-1,-1,-1,-1,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = INVULNERABLE + CONVERSABLE + JTLINTERESTING,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_unarmed_trainer_01.iff",
		"object/mobile/dressed_unarmed_trainer_02.iff",
		"object/mobile/dressed_unarmed_trainer_03.iff"
	},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "unarmedTrainerConvoTemplate",
	attacks = {}
}
CreatureTemplates:addCreatureTemplate(trainer_unarmed,"trainer_unarmed")
