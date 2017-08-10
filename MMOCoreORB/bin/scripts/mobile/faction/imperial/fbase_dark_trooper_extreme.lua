fbase_dark_trooper_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_dark_trooper_extreme",
	randomNameType = NAME_DARKTROOPER,
	randomNameTag = true,
	socialGroup = "imperial",
	faction = "imperial",
	level = 200,
	chanceHit = 11.0,
	damageMin = 1145,
	damageMax = 2000,
	baseXp = 20000,
	baseHAM = 149000,
	baseHAMmax = 205000,
	armor = 3,
	resists = {140,20,20,150,150,150,150,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + OVERT,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.5,

	templates = {"object/mobile/dressed_dark_trooper_black_hole.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 150000},
				{group = "junk", chance = 150000},
				{group = "junk", chance = 200000},
				{group = "junk", chance = 8000000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},
				{group = "junk", chance = 500000}
			}
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	attacks = merge(riflemanmaster,marksmanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(fbase_dark_trooper_extreme, "fbase_dark_trooper_extreme")
