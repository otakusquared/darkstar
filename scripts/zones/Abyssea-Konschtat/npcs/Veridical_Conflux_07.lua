-----------------------------------
-- Area: Abyssea-Konschtat
-- NPC:  Veridical_Conflux #07
-- 
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local CurrentVC = 6
	local CRUOR = player:getCruor();
	local ActiveVC = player:getVar("ABY_KON_VC");
	if (ActiveVC < 64) then
		player:startEvent(0x085A,0,0,0,350,ActiveVC,CurrentVC,2,CRUOR);
	else
		player:startEvent(0x085A,0,0,0,350,ActiveVC,CurrentVC,1,CRUOR);
	end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("CSID2: %u",csid);
printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

	local CRUOR = player:getCruor();
	local ActiveVC = player:getVar("ABY_KON_VC");
	if (csid == 0x085A) then
		if (option == 1) then
			if (CRUOR >= 350) then
				player:delCruor(350);
				player:setVar("ABY_KON_VC",ActiveVC+64);
			end;
		end;
	end;		
end;