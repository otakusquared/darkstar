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
	local CurrentVC = 1
	local CRUOR = player:getCruor();
	local ActiveVC = player:getVar("ABY_KON_VC");
	local NOTON = 0
	local test = {
					0,1,4,5,8,9,12,13,16,17,20,21,
					24,25,28,29,32,33,36,37,40,41,
					44,45,48,49,52,53,56,57,60,61,
					64,65,68,69,72,73,76,77,80,81,
					84,85,88,89,92,93,96,97,100,101,
					104,105,108,109,112,113,116,117,
					120,121,124,125,128,129,132,133,
					136,137,140,141,144,145,148,149,
					152,153,156,157,160,161,164,165,
					168,169,172,173,176,177,180,181,
					184,185,188,189,192,193,196,197,
					200,201,204,205,208,209,212,213,
					216,217,220,221,224,225,228,229,
					232,233,236,237,240,241,244,245,
					248,249,252,253,
				  }
	for key,value in pairs(test) do
		if ActiveVC == value then
			NOTON = 1
		break;
		end;
	end;
	if (NOTON == 1) then
			player:startEvent(0x085A,0,0,0,0,ActiveVC,CurrentVC,2,CRUOR);
	else
		player:startEvent(0x085A,0,0,0,0,ActiveVC,CurrentVC,1,CRUOR);
	end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

	local CRUOR = player:getCruor();
	local ActiveVC = player:getVar("ABY_KON_VC");
		local NOTON = 0
	local test = {
					0,1,4,5,8,9,12,13,16,17,20,21,
					24,25,28,29,32,33,36,37,40,41,
					44,45,48,49,52,53,56,57,60,61,
					64,65,68,69,72,73,76,77,80,81,
					84,85,88,89,92,93,96,97,100,101,
					104,105,108,109,112,113,116,117,
					120,121,124,125,128,129,132,133,
					136,137,140,141,144,145,148,149,
					152,153,156,157,160,161,164,165,
					168,169,172,173,176,177,180,181,
					184,185,188,189,192,193,196,197,
					200,201,204,205,208,209,212,213,
					216,217,220,221,224,225,228,229,
					232,233,236,237,240,241,244,245,
					248,249,252,253,
				  }
	for key,value in pairs(test) do
		if ActiveVC == value then
			NOTON = 1
		break;
		end;
	end;
	if (csid == 0x085A) then
		if (option == 1) and (NOTON == 1) then
			if (CRUOR >= 0) then
				player:setVar("ABY_KON_VC",ActiveVC+2);
			end;
		end;
	end;		
end;