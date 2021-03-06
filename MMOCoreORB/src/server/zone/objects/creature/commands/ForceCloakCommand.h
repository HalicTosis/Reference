/*
                Copyright <SWGEmu>
        See file COPYING for copying conditions. */

#ifndef FORCECLOAKCOMMAND_H_
#define FORCECLOAKCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "ForcePowersQueueCommand.h"
#include "server/zone/objects/creature/events/ForceCloakEvent.h"

class ForceCloakCommand : public ForcePowersQueueCommand {
public:

    ForceCloakCommand(const String& name, ZoneProcessServer* server) :
        ForcePowersQueueCommand(name, server) {
    }

    int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
        if (!checkStateMask(creature))
            return INVALIDSTATE;

        if (!checkInvalidLocomotions(creature))
            return INVALIDLOCOMOTION;

        CreatureObject* player = cast<CreatureObject*>(creature);

        if (!creature->hasSkill("force_rank_gray_master"))
            return GENERALERROR;

        int nSkill = 0;
        if (creature->hasSkill("combat_brawler_novice"))
            nSkill += 1;
        if (creature->hasSkill("combat_marksman_novice"))
            nSkill += 1;
        if (creature->hasSkill("social_entertainer_novice"))
            nSkill += 1;
        if (creature->hasSkill("crafting_artisan_novice"))
            nSkill += 1;
        if (creature->hasSkill("outdoors_scout_novice"))
            nSkill += 1;

        if (nSkill > 0) {
            creature->sendSystemMessage("You are trying to use a top level skill while still being invested in other non jedi skills, "
                "you must master the force in all its aspects before using this command.");
            return GENERALERROR;
        }

        Reference<Task*> task = player->getPendingTask("cloakevent");

        if (task != NULL) {
            Reference<ForceCloakEvent*> cloakTask = task.castTo<ForceCloakEvent*>();
            if (cloakTask == NULL) {
                return GENERALERROR;
            }

            player->sendSystemMessage("You attempt to cloak has been canceled.");
            cloakTask->removeCloak();

            return SUCCESS;
        }

        ManagedReference<PlayerObject*> playerObject = player->getPlayerObject();

        if (playerObject->getForcePower() < ForceCloakEvent::getForceCost()) {
            player->sendSystemMessage("You don't have the force power to cloak yourself");
            return GENERALERROR;
        }

        if (player->isDead() || player->isIncapacitated()) {
            player->sendSystemMessage("You cant hide yourself on your back cowboy");
            return GENERALERROR;
        }

        if (player->getParent() != NULL || player->isInCombat()) {
            player->sendSystemMessage("You cant cloak right now");
            return GENERALERROR;
        }

        Reference<ForceCloakEvent*> forcecloakTask = new ForceCloakEvent(player);

        player->sendSystemMessage("The force surges through you...soon you will vanish from sight.");
        player->addPendingTask("cloakevent", forcecloakTask, 3000);

        return SUCCESS;
    }
};

#endif //FORCECLOAKCOMMAND_H_
