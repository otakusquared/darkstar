-----------------------------------
-- Area: Garlaige Citadel(S)
-- NPC:  Randecque
-- Involved in Mission: WoTG - Back to the Beginning
-- @pos 141 -6 138 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/campaign");
require("scripts/zones/Garlaige_Citadel_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(ENABLE_WOTG == 1 and player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:hasKeyItem(RED_RECOMMENDATION_LETTER) == false) then
	player:startEvent(0x0001);
	elseif(ENABLE_WOTG == 1 and player:hasKeyItem(RED_RECOMMENDATION_LETTER) == true) then
	player:startEvent(0x0002);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x0001 and option == 0) then
		player:addKeyItem(RED_RECOMMENDATION_LETTER);
		player:messageSpecial(KEYITEM_OBTAINED,RED_RECOMMENDATION_LETTER);
		player:setVar("BACK_TO_THE_BEGINNING_STATUS",1);
	elseif(csid == 0x0002) then
		player:startEvent(0x000C);
	end
end;



