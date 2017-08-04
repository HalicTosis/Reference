object_draft_schematic_weapon_blasterfist = object_draft_schematic_weapon_shared_blasterfist:new {
templateType = DRAFTSCHEMATIC,

   customObjectName = "Blasterfist",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 25, 
   size = 2, 

   xpType = "crafting_weapons_general", 
   xp = 65, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"grip_unit", "strike_face", "powerhandler_advanced", "power_cell_socket", "vibration_generator"},
   ingredientSlotType = {0, 0, 1, 0, 1},
   resourceTypes = {"metal_ferrous", "steel", "object/tangible/component/weapon/blaster_power_handler.iff", "copper", "object/tangible/component/weapon/shared_vibro_unit.iff"},
   resourceQuantities = {12, 8, 1, 4, 1},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/melee/special/blasterfist.iff",

   additionalTemplates = {
             }


}
ObjectTemplates: addTemplate(object_draft_schematic_weapon_blasterfist, "object/draft_schematic/weapon/blasterfist.iff")