-- DB update 2026_06_05_00
-- Quest 8736: Eranikus stays immune at Nighthaven bridge when waypoint 4 is never reached.
-- Start combat after invasion scripts finish instead of relying on WP4 pathing.

-- Give invasion scripts time to finish before waypoint movement resumes
UPDATE `smart_scripts` SET `action_param1` = 200000
WHERE `entryorguid` = 15491 AND `source_type` = 0 AND `id` = 6 AND `event_type` = 40;

-- After second invasion wave dialogue, make Eranikus attackable and stop escort
DELETE FROM `smart_scripts` WHERE `entryorguid` = 15491 AND `source_type` = 0 AND `id` IN (42, 43, 44, 45, 46);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(15491, 0, 42, 43, 52, 0, 100, 1, 7, 15491, 0, 0, 55, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Text 7 Over - Stop Escort'),
(15491, 0, 43, 44, 61, 0, 100, 512, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Text 7 Over - Remove Immune Flags'),
(15491, 0, 44, 45, 61, 0, 100, 512, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Text 7 Over - Set Faction 14'),
(15491, 0, 45, 46, 61, 0, 100, 512, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Text 7 Over - Set Reactstate Aggressive'),
(15491, 0, 46, 0, 61, 0, 100, 512, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Text 7 Over - Attack Closest Player');

-- Inline fallback at end of invasion script (does not depend on WP4)
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1549101 AND `source_type` = 9 AND `id` IN (17, 18, 19, 20, 21);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1549101, 9, 17, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 55, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Stop Escort'),
(1549101, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Remove Immune Flags'),
(1549101, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Set Faction 14'),
(1549101, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Set Reactstate Aggressive'),
(1549101, 9, 21, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Attack Closest Player');
