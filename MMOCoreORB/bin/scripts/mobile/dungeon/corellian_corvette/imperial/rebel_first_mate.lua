rebel_first_mate = Creature:new {
	objectName = "@mob/creature_names:corvette_rebel_mate",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 86,
	chanceHit = 0.85,
	damageMin = 570,
	damageMax = 850,
	baseXp = 8223,
	baseHAM = 13000,
	baseHAMmax = 16000,
	armor = 0,
	resists = {45,35,0,0,30,30,80,65,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_rebel_first_lieutenant_bothan_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 750000},
				{group = "junk", chance = 7250000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "armor_attachments", chance = 1000000},
				
			}
		}
	},
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	attacks = merge(riflemanmaster,carbineermaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(rebel_first_mate, "rebel_first_mate")
