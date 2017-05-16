local ObjectManager = require("managers.object.object_manager")

painting_exchange = ScreenPlay:new {
   numberOfActs = 1, 
   questString = "painting_exchange_task",
   states = {}, 
}

registerScreenPlay("painting_exchange", true)

function painting_exchange:start() 
   -- Spawn our character into the world, setting pLarry a pointer variable we can use to check or change his state.
   local pMerchant = spawnMobile("corellia", "painting_exchange",60,-146.217,28,-4738.99,346.392,0)

end

painting_exchange_convo_handler = Object:new {
   tstring = "conversation_exchange_dealer"
 }

function painting_exchange_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
   -- Assign the player to variable creature for use inside this function.
   local creature = LuaCreatureObject(conversingPlayer)
   -- Get the last conversation to determine whetehr or not we're  on the first screen
   local convosession = creature:getConversationSession()
   lastConversation = nil
   local conversation = LuaConversationTemplate(conversationTemplate)
   local nextConversationScreen 
   
   -- If there is a conversation open, do stuff with it
   if ( conversation ~= nil ) then
      -- check to see if we have a next screen
      if ( convosession ~= nil ) then
          local session = LuaConversationSession(convosession)
          if ( session ~= nil ) then
             lastConversationScreen = session:getLastConversationScreen()
          end
      end
      
      -- Last conversation was nil, so get the first screen
      if ( lastConversationScreen == nil ) then
         nextConversationScreen = conversation:getInitialScreen()
      else
         -- Start playing the rest of the conversation based on user input
         local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
         
         -- Set variable to track what option the player picked and get the option picked
         local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
         nextConversationScreen = conversation:getScreen(optionLink)
         
         -- Get some information about the player.
         local credits = creature:getCashCredits()
	 ObjectManager.withCreatureObject(conversingPlayer, function(creature )

	 --local creature = LuaCreatureObject(conversingPlayer)	 
         local pInventory = creature:getSlottedObject("inventory")
         local inventory = LuaSceneObject(pInventory)
         local containerSize = inventory:getContainerObjectsSize()
         local itemCounter = 0
         local i = 0 
         local DeleteItems = 0

         for i = 0, containerSize - 1, 1 do
        	 local pInvObj = inventory:getContainerObject(i)
	         local InvObj = LuaSceneObject(pInvObj)
	        	 -- Get Objectnames from Each Item and check if its the choosen Item. (This is your token for the vendor)
	         	if (InvObj:getObjectName() == "socket_gem_clothing")   then
	         		itemCounter = itemCounter + 1
	         else	if (InvObj:getObjectName() == "socket_gem_armor")   then
	         		itemCounter = itemCounter + 1
				
	         	end
	     end
end
         -- Insufficent Space
         if (SceneObject(pInventory):isContainerFullRecursive()) then
	            -- Bail if the player doesn't have enough space in their inventory.
	            -- Plays a chat box message from the NPC as well as a system message.
	            nextConversationScreen = conversation:getScreen("insufficient_space")
	            creature:sendSystemMessage("You do not have enough inventory space")  
	            -- check if player have the item in the inventory

	-- Main screen selects

		-- Five Token Screen

	elseif (optionLink == "five") then
		nextConversationScreen = conversation:getScreen("five_screen")

		-- Ten Token Screen

	elseif (optionLink == "ten") then
		nextConversationScreen = conversation:getScreen("ten_screen")

		-- Seventy Token Screen

	elseif (optionLink == "seventy") then
		nextConversationScreen = conversation:getScreen("seventy_screen")

	-- 5 SEA Options

	     elseif (optionLink == "1" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "1" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/yr7_painting_2010.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 1")

	     elseif (optionLink == "2" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "2" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_painting_s011.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 2")
				
	     elseif (optionLink == "3" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "3" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_painting_community_summit_s02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 3")

	     elseif (optionLink == "4" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "4" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_painting_april_07.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 4")
				
	     elseif (optionLink == "5" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "5" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_painting_anniversary_s30.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 5")
				
	     elseif (optionLink == "6" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "6" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_6_year_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 6")

	     elseif (optionLink == "7" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "7" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_5_year_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 7")
				
	     elseif (optionLink == "8" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "8" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_galactic_gathering_2008_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 8")
				
	     elseif (optionLink == "9" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "9" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/loot/mustafar/must_painting_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 9")
				
	     elseif (optionLink == "10" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "10" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/loot/mustafar/must_painting_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 10")
				
	     elseif (optionLink == "11" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "11" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/loot/mustafar/must_painting_03.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 11")
				
	     elseif (optionLink == "12" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "12" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/loot/mustafar/must_painting_04.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 12")
				
	     elseif (optionLink == "13" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "13" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/furniture/decorative/vet_reward_emperor_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 13")

	-- 10 SEA Options

	     elseif (optionLink == "14" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "14" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/furniture/decorative/pub29_ryatt_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 14")
				
	     elseif (optionLink == "15" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "15" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/furniture/decorative/pub29_corellia_painting.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 15")
				
	     elseif (optionLink == "16" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "16" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/collection/reward/com_link_painting_reward.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 16")
				
	     elseif (optionLink == "17" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "17" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_chp5.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 17")
				
	     elseif (optionLink == "18" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "18" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_clone_trooper_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 18")
				
	     elseif (optionLink == "19" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "19" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_corl_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 19")
				
	     elseif (optionLink == "20" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "20" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_corl_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 20")
				
	     elseif (optionLink == "21" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "21" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_grievous_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 21")
				
	     elseif (optionLink == "22" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "22" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_heroic_exar_kun_ultra_rare.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 22")
				
	     elseif (optionLink == "23" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "23" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_house_cleanup_imperial.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 23")
				
	     elseif (optionLink == "24" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "24" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_house_cleanup_rebel.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 24")
				
	     elseif (optionLink == "25" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "25" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_loot_heroic_exar_kun.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 25")
		
	     elseif (optionLink == "26" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "26" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_outbreak_biohazard_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 26")

	-- 70 SEA Options

	     elseif (optionLink == "27" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "27" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_outbreak_biohazard_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 27")
				
	     elseif (optionLink == "28" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "28" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_outbreak_biohazard_03.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 28")
				
	     elseif (optionLink == "29" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "29" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_pvp_reward_imperial.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 29")
				
	     elseif (optionLink == "30" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "30" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_pvp_reward_rebel.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 30")
				
	     elseif (optionLink == "31" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "31" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_ns_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 31")
				
	     elseif (optionLink == "32" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "32" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_ns_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 32")
				
	     elseif (optionLink == "33" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "33" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_outcast.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 33")
				
	     elseif (optionLink == "34" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "34" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_scene_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 34")
				
	     elseif (optionLink == "35" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "35" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_scene_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 35")
				
	     elseif (optionLink == "36" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "36" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_scene_03.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 36")	
				
	     elseif (optionLink == "37" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "37" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_scene_04.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 37")
				
	     elseif (optionLink == "38" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "38" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_sm_01.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 38")
				
	     elseif (optionLink == "39" and itemCounter < 25) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "39" and itemCounter >= 25) then
	            local pItem = giveItem(pInventory, "object/tangible/painting/painting_wod_sm_02.iff", -1)
	            DeleteItems = 25
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Painting 39")

          	end
	
          for i = containerSize - 1 , 0 , -1 do
          	pInvObj = inventory:getContainerObject(i)
        	invObj = LuaSceneObject(pInvObj)
     	    -- Get Objectnames from Each Item and check if its the choosen Item.
		     	if (invObj:getObjectName() == "socket_gem_clothing" and DeleteItems > 0 ) then
		     		DeleteItems = DeleteItems - 1
		     		invObj:destroyObjectFromWorld()
					invObj:destroyObjectFromDatabase()

		  else   	if (invObj:getObjectName() == "socket_gem_armor" and DeleteItems > 0 ) then
		     		DeleteItems = DeleteItems - 1
		     		invObj:destroyObjectFromWorld()
					invObj:destroyObjectFromDatabase()
		       	end					
		       	end
   	  end
   end)		  
 end	
  end    
      -- end of the conversation logic.
   return nextConversationScreen
   
end

function painting_exchange_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
   -- Plays the screens of the conversation.
   return conversationScreen
end
