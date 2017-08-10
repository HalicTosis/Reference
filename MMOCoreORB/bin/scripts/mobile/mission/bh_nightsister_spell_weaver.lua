bh_nightsister_spell_weaver = Creature:new {
	objectName = "@mob/creature_names:nightsister_spell_weaver",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 107,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 10174,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 2,
	resists = {35,100,35,90,100,100,90,100,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_spellweaver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "loot_kit_parts", chance = 2500000},
				{group = "junk", chance = 5000000},
				{group = "tailor_components", chance = 1000000},
				{group = "junk", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000}
			},
			lootChance = 5140000
		},
		{
			groups = {
				{group = "loot_kit_parts", chance = 2500000},
				{group = "junk", chance = 5000000},
				{group = "tailor_components", chance = 1000000},
				{group = "junk", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000}
			},
			lootChance = 5140000
		},
		{
			groups = {
				{group = "loot_kit_parts", chance = 2500000},
				{group = "junk", chance = 5000000},
				{group = "tailor_components", chance = 1000000},
				{group = "junk", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000}
			},
			lootChance = 5140000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(pikemanmaster,brawlermaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(bh_nightsister_spell_weaver, "bh_nightsister_spell_weaver")
