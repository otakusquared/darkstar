-----------------------------------
--  Area: Ru'Lude Gardens
--  NPC:  Nomad Moogle
--  Type: Adventurer's Assistant
--  @pos 10.012 1.453 121.883 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local tradeCount = trade:getItemCount();
	local NewWorldsAwait = player:getQuestStatus(JEUNO,NEW_WORLDS_AWAIT);
	local ExpandingHorizons = player:getQuestStatus(JEUNO,EXPANDING_HORIZONS);
	local BeyondtheStars = player:getQuestStatus(JEUNO,BEYOND_THE_STARS);
	local DormantPowersDislodged = player:getQuestStatus(JEUNO,DORMANT_POWERS_DISLODGED);
	local PreludetoPuissance = player:getQuestStatus(JEUNO,PRELUDE_TO_PUISSANCE);
	local BeyondInfinity = player:getQuestStatus(JEUNO,BEYOND_INFINITY);
	local LB9var = player:getVar("LB9_VAR");
	local LB10status = player:getVar("LB10_STATUS");
	
	if(NewWorldsAwait == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1127,5) and player:getMeritCount() >= 3 and tradeCount == 5) then -- Trade Kindred Seals x5 and have stored 3 merit points
			player:tradeComplete();
			player:startEvent(0x2797); -- Finish Quest "New Worlds Await"
		else
			player:messageSpecial(NOMAD_MOOGLE_DIALOG,1127,5,3);
		end
	end
	if(ExpandingHorizons == QUEST_ACCEPTED) then
		if(trade:hasItemQty(2955,5) and player:getMeritCount() >= 4 and tradeCount == 5) then -- Trade Kindred Crests x5 and have stored 4 merit points
			player:tradeComplete();
			player:startEvent(0x2798); -- Finish Quest "Expanding Horizons"
		else
			player:messageSpecial(NOMAD_MOOGLE_DIALOG,2955,5,4);
		end
	end
	if(BeyondtheStars == QUEST_ACCEPTED) then
		if(trade:hasItemQty(2955,10) and player:getMeritCount() >= 5 and tradeCount == 10) then -- Trade Kindred Crests x10 and have stored 5 merit points
			player:tradeComplete();
			player:startEvent(0x2799); -- Finish Quest "Beyond the Stars"
		else
			player:messageSpecial(NOMAD_MOOGLE_DIALOG,2955,10,5);
		end
	end
	if(DormantPowersDislodged == QUEST_ACCEPTED) then
		if(trade:hasItemQty(2955,1) and player:getMeritCount() >= 10 and tradeCount == 2) then
			if(LB9var == 0 and trade:hasItemQty(503,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 1 and trade:hasItemQty(613,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 2 and trade:hasItemQty(2757,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 3 and trade:hasItemQty(538,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 4 and trade:hasItemQty(541,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 5 and trade:hasItemQty(2759,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 6 and trade:hasItemQty(576,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 7 and trade:hasItemQty(553,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 8 and trade:hasItemQty(16656,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			elseif(LB9var == 9 and trade:hasItemQty(596,1)) then
				player:tradeComplete();
				player:startEvent(0x27CF);
			else
				player:startEvent(0x273D,0x4B,0x01,4,1,0,LB9var);
			end
		else
			player:startEvent(0x273D,0x4B,0x01,4,1,0,LB9var);
		end
	end
	if(PreludetoPuissance == QUEST_ACCEPTED) then
		if(trade:hasItemQty(3541,1) and tradeCount == 1) then
			player:startEvent(0x273D,0x4B,0x01,5);
			player:setVar("LB10_STATUS",1);
			player:tradeComplete();
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local NewWorldsAwait = player:getQuestStatus(JEUNO,NEW_WORLDS_AWAIT);
	local ExpandingHorizons = player:getQuestStatus(JEUNO,EXPANDING_HORIZONS);
	local BeyondtheStars = player:getQuestStatus(JEUNO,BEYOND_THE_STARS);
	local DormantPowersDislodged = player:getQuestStatus(JEUNO,DORMANT_POWERS_DISLODGED);
	local PreludetoPuissance = player:getQuestStatus(JEUNO,PRELUDE_TO_PUISSANCE);
	local BeyondInfinity = player:getQuestStatus(JEUNO,BEYOND_INFINITY);
	local LB9var = player:getVar("LB9_VAR");
	local LB9status = player:getVar("LB9_STATUS");
	local LB10status = player:getVar("LB10_STATUS");
	local LvL = player:getMainLvl();

	if(player:hasKeyItem(LIMIT_BREAKER) == false and player:getMainLvl() >= 75) then
		player:startEvent(0x273D,0x4B,0x02,0x0A,0x07,0x1E,0x049F2F,0x0FFF); -- Unlocks Merit Points
	elseif(player:hasKeyItem(LIMIT_BREAKER) == true and LvL >=75 and NewWorldsAwait == QUEST_AVAILABLE and player:levelCap() == 75 and MAX_LEVEL >= 80) then
		player:startEvent(0x273D,0x4B,0x01,0x01); -- Starts LB6
	elseif(NewWorldsAwait == QUEST_ACCEPTED) then
		player:startEvent(0x273D,0x4B,0x01,0x01,0x01); -- During Quest "New Worlds Await"
	elseif(player:hasKeyItem(LIMIT_BREAKER) == true and LvL >=76 and ExpandingHorizons == QUEST_AVAILABLE and player:levelCap() == 80 and MAX_LEVEL >= 85) then
		player:startEvent(0x273D,0x4B,0x01,0x02); -- Starts LB7
	elseif(ExpandingHorizons == QUEST_ACCEPTED) then
		player:startEvent(0x273D,0x4B,0x01,0x02,0x01); -- During Quest "Expanding Horizons"
	elseif(player:hasKeyItem(LIMIT_BREAKER) == true and LvL >=81 and BeyondtheStars == QUEST_AVAILABLE and player:levelCap() == 85 and MAX_LEVEL >= 90) then
		player:startEvent(0x273D,0x4B,0x01,0x03); -- Starts LB8
	elseif(BeyondtheStars == QUEST_ACCEPTED) then
		if(player:getVar("LB8_STATUS") == 1) then
			player:startEvent(0x27B1); -- During Quest "Beyond the Stars" after turn in
		else
			player:startEvent(0x273D,0x4B,0x01,0x03,0x01); -- During Quest "Beyond the Stars" prior to turn in
		end
	elseif(player:hasKeyItem(LIMIT_BREAKER) == true and LvL >=86 and DormantPowersDislodged == QUEST_AVAILABLE and player:levelCap() == 90 and MAX_LEVEL >= 95) then
		if(player:getVar("LB9_STATUS") ~=1) then
			local rand = math.random(0,9);
			player:startEvent(0x273D,0x4B,0x01,4,0,0,rand); -- Starts LB9
			player:setVar("LB9_VAR",rand);
			local rand = nil;
		else
			player:startEvent(0x273D,0x4B,0x01,4,0,1,LB9var);
		end
	elseif(DormantPowersDislodged == QUEST_ACCEPTED and LB9status ~=2) then
		player:startEvent(0x273D,0x4B,0x01,4,1,0,LB9var);
	elseif(DormantPowersDislodged == QUEST_ACCEPTED and LB9status ==2) then
		player:startEvent(0x27D0);
	elseif(PreludetoPuissance == QUEST_AVAILABLE and player:hasKeyItem(SOUL_GEM) == true and LvL >=91 and player:levelCap() == 95) then
		player:startEvent(0x27D2);
	elseif(PreludetoPuissance == QUEST_ACCEPTED) then
		if(LB10status == 1) then
			player:startEvent(0x273D,0x4B,0x01,5);
		else
			player:startEvent(0x273D,0x4B,0x01,6);
		end
	elseif(BeyondInfinity == QUEST_ACCEPTED and LvL >= 91 and player:levelCap() == 95 and MAX_LEVEL >= 99) then
		if(player:hasKeyItem(SOUL_GEM_CLASP)) then
			player:startEvent(0x273D,0x4B,0x01,5,1);
		else
			player:startEvent(0x273D,0x4B,0x01,5,3);
		end
	else
		player:startEvent(0x005E);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
 printf("CSID: %u",csid);
 printf("UpdateRESULT: %u",option);
 
	if(csid == 0x27B1 and option == 21) then	--LB8 MiniGame Raging Beast
		local rand1 = math.random(0,100);
		if(rand1 >=0 and rand1 <=32) then
			player:updateEvent(24);
		elseif(rand1 >=33 and rand1 <=65) then
			player:updateEvent(32);
		elseif(rand1 >=66 and rand1 <=100) then
			player:updateEvent(4);
		end
		local rand1 = nil;
	elseif(csid == 0x27B1 and option == 22) then	--LB8 MiniGame Silent Wind
		local rand2 = math.random(0,100);
		if(rand2 >=0 and rand2 <=32) then
			player:updateEvent(17);
		elseif(rand2 >=33 and rand2 <=65) then
			player:updateEvent(37);
		elseif(rand2 >=66 and rand2 <=100) then
			player:updateEvent(9);
		end
		local rand2 = nil;
	elseif(csid == 0x27B1 and option == 23) then	--LB8 MiniGame Soaring Dragon
		local rand3 = math.random(0,100);
		if(rand3 >=0 and rand3 <=32) then
			player:updateEvent(22);
		elseif(rand3 >=33 and rand3 <=65) then
			player:updateEvent(42);
		elseif(rand3 >=66 and rand3 <=100) then
			player:updateEvent(2);
		end
		local rand3 = nil;
	end
	if(csid == 0x273D and option == 8) then
		player:setVar("LB9_STATUS",1);
	end
	if(csid == 0x27D0 and option >=925 and option <= 1075) then
		player:updateEvent(2);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
 printf("CSID: %u",csid);
 printf("RESULT: %u",option);
	
	if(csid == 0x273D) then 
		if(option == 4) then -- Accept to be test subject and receive limit breaker and unlock merit points
			player:addKeyItem(LIMIT_BREAKER);
			player:messageSpecial(KEYITEM_OBTAINED,LIMIT_BREAKER);
		elseif(option == 5) then -- Accept LB6
			player:addQuest(JEUNO,NEW_WORLDS_AWAIT);
		elseif(option == 7) then -- Accept LB7
			player:addQuest(JEUNO,EXPANDING_HORIZONS);
		elseif(option == 9) then -- Accept LB8
			player:addQuest(JEUNO,BEYOND_THE_STARS);
		elseif(option == 11) then -- Accept LB9
			player:addQuest(JEUNO,DORMANT_POWERS_DISLODGED);
		elseif(option == 13) then
			player:setVar("LB10_STATUS",0);
			player:completeQuest(JEUNO,PRELUDE_TO_PUISSANCE);
			player:addKeyItem(SOUL_GEM_CLASP);
			player:messageSpecial(KEYITEM_OBTAINED,SOUL_GEM_CLASP);
			player:addQuest(JEUNO,BEYOND_INFINITY);
		elseif(option == 16) then
			player:setPos(-511.459,159.004,-210.543,10,139);
		elseif(option == 22) then
			player:setPos(-349.899,104.213,-260.150,0,144);
		elseif(option == 23) then
			player:setPos(299.316,-123.591,353.760,66,146);
		elseif(option == 24) then
			player:setPos(-225.146,-24.250,20.057,255,206);
		end
	elseif(csid == 0x2797) then -- Complete LB6
		player:setMerits(player:getMeritCount() - 3);
		player:levelCap(80);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_80);
		player:completeQuest(JEUNO,NEW_WORLDS_AWAIT);
		player:addFame(JEUNO, JEUNO_FAME*80);
	elseif(csid == 0x2798) then -- Complete LB7
		player:setMerits(player:getMeritCount() - 4);
		player:levelCap(85);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_85);
		player:completeQuest(JEUNO,EXPANDING_HORIZONS);
		player:addFame(JEUNO, JEUNO_FAME*80);
	elseif(csid == 0x2799) then -- Complete LB8 first cutscene prepare for rock,paper,scissors cutscene
		player:setMerits(player:getMeritCount() - 5);
		player:setVar("LB8_STATUS",1);
	elseif(csid == 0x27B1 and option == 254) then -- Complete LB8
		player:setVar("LB8_STATUS",0);
		player:levelCap(90);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_90);
		player:completeQuest(JEUNO,BEYOND_THE_STARS);
		player:addFame(JEUNO, JEUNO_FAME*80);
	elseif(csid == 0x27CF and option == 0) then
		player:setVar("LB9_STATUS",2);
		player:setMerits(player:getMeritCount() - 10);
	elseif(csid == 0x27D0 and option >=925 and option <= 1075) then
		player:setVar("LB9_STATUS",0);
		player:setVar("LB9_VAR",0);
		player:addKeyItem(SOUL_GEM);
		player:messageSpecial(KEYITEM_OBTAINED,SOUL_GEM);
		player:levelCap(95);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_95);
		player:completeQuest(JEUNO,DORMANT_POWERS_DISLODGED);
		player:addFame(JEUNO, JEUNO_FAME*80);
	elseif(csid == 0x27D2 and option == 0) then
		player:addQuest(JEUNO,PRELUDE_TO_PUISSANCE);
	end
	
end;