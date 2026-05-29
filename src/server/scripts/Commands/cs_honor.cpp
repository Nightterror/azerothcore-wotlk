/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "AchievementMgr.h"
#include "Chat.h"
#include "CommandScript.h"
#include "Language.h"
#include "ObjectDefines.h"
#include "Player.h"
#include "RBAC.h"
#include "WorldSession.h"

using namespace Acore::ChatCommands;

class honor_commandscript : public CommandScript
{
public:
    honor_commandscript() : CommandScript("honor_commandscript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable honorAddCommandTable =
        {
            { "kills", HandleHonorAddKillsCommand, rbac::RBAC_PERM_COMMAND_HONOR_ADD_KILL, Console::No },
            { "kill",  HandleHonorAddKillCommand,  rbac::RBAC_PERM_COMMAND_HONOR_ADD_KILL, Console::No },
            { "",      HandleHonorAddCommand,      rbac::RBAC_PERM_COMMAND_HONOR_ADD,      Console::No }
        };

        static ChatCommandTable honorCommandTable =
        {
            { "add",    honorAddCommandTable },
            { "update", HandleHonorUpdateCommand, rbac::RBAC_PERM_COMMAND_HONOR_UPDATE, Console::No }
        };

        static ChatCommandTable commandTable =
        {
            { "honor", honorCommandTable }
        };
        return commandTable;
    }

    static bool HandleHonorAddCommand(ChatHandler* handler, uint32 amount)
    {
        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendErrorMessage(LANG_PLAYER_NOT_FOUND);
            return false;
        }

        // check online security
        if (handler->HasLowerSecurity(target, ObjectGuid::Empty))
            return false;

        target->RewardHonor(nullptr, 1, amount);
        return true;
    }

    static bool HandleHonorAddKillCommand(ChatHandler* handler)
    {
        Unit* target = handler->getSelectedUnit();
        if (!target)
        {
            handler->SendErrorMessage(LANG_PLAYER_NOT_FOUND);
            return false;
        }

        // check online security
        if (Player* player = target->ToPlayer())
            if (handler->HasLowerSecurity(player, ObjectGuid::Empty))
                return false;

        handler->GetSession()->GetPlayer()->RewardHonor(target, 1);
        return true;
    }

    static bool HandleHonorAddKillsCommand(ChatHandler* handler, uint32 amount)
    {
        if (!amount)
        {
            handler->SendErrorMessage(LANG_BAD_VALUE);
            return false;
        }

        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendErrorMessage(LANG_PLAYER_NOT_FOUND);
            return false;
        }

        // check online security
        if (handler->HasLowerSecurity(target, ObjectGuid::Empty))
            return false;

        target->UpdateHonorFields();

        uint32 kills = target->GetUInt32Value(PLAYER_FIELD_KILLS);
        uint16 killsToday = PAIR32_LOPART(kills);
        uint16 killsYesterday = PAIR32_HIPART(kills);

        uint32 newKillsToday = killsToday + amount;
        if (newKillsToday > 0xFFFF)
            newKillsToday = 0xFFFF;

        target->SetUInt32Value(PLAYER_FIELD_KILLS,
            MAKE_PAIR32(uint16(newKillsToday), killsYesterday));
        target->ApplyModUInt32Value(PLAYER_FIELD_LIFETIME_HONORABLE_KILLS,
            amount, true);
        target->UpdateAchievementCriteria(
            ACHIEVEMENT_CRITERIA_TYPE_EARN_HONORABLE_KILL);

        handler->PSendSysMessage(LANG_COMMAND_HONOR_ADD_KILLS,
            amount, handler->GetNameLink(target),
            target->GetUInt32Value(PLAYER_FIELD_LIFETIME_HONORABLE_KILLS));

        return true;
    }

    static bool HandleHonorUpdateCommand(ChatHandler* handler)
    {
        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendErrorMessage(LANG_PLAYER_NOT_FOUND);
            return false;
        }

        // check online security
        if (handler->HasLowerSecurity(target, ObjectGuid::Empty))
            return false;

        target->UpdateHonorFields();
        return true;
    }
};

void AddSC_honor_commandscript()
{
    new honor_commandscript();
}
