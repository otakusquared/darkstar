-----------------------------------
-- Area: 
-- NPC:  Raskovnik
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Konschtat/TextIDs");
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
--	local dayElement = VanadielDayElement();
--	printf("DayElement: %u",dayElement);
--	local redTrigger = math.random(1,13);
--	target:setVar("redTrigger",redTrigger);
--	printf("redTrigger: %u",redTrigger);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

local battletime = mob:getBattleTime();
if battletime <= 1 then
	local dayElement = VanadielDayElement();
	printf("DayElement: %u",dayElement);
	local TEST = mob:getID();
	printf("TEST: %u",TEST);
	local redTrigger = math.random(1,13);
	printf("redTrigger: %u",redTrigger);
	SetServerVariable(TEST,redTrigger);
end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local TEST = mob:getID();
	SetServerVariable(TEST,0);
	local redtrigdrops = GetServerVariable(TEST+7);
	local randomnumber = (math.random(0,100));
	if (randomnumber >= 50) and (killer:hasKeyItem(FETID_RAFFLESIA_STALK) == false) then
		killer:addKeyItem(FETID_RAFFLESIA_STALK);
		killer:messageSpecial(KEYITEM_OBTAINED,FETID_RAFFLESIA_STALK);
	end
	if (redtrigdrops >= 1) and (killer:hasKeyItem(ATMA_OF_THRASHING_TENDRILS) == false) then
		if redtrigdrops == 1 then
			killer:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
			killer:messageSpecial(KEYITEM_OBTAINED,ATMA_OF_THRASHING_TENDRILS);
		elseif redtrigdrops == 2 then
			if (randomnumber >= 25) then
				killer:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
				killer:messageSpecial(KEYITEM_OBTAINED,ATMA_OF_THRASHING_TENDRILS);
			end;
		elseif redtrigdrops == 3 then
			if (randomnumber >= 50) then
				killer:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
				killer:messageSpecial(KEYITEM_OBTAINED,ATMA_OF_THRASHING_TENDRILS);
			end;
		elseif redtrigdrops == 4 then
			if (randomnumber >= 75) then
				killer:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
				killer:messageSpecial(KEYITEM_OBTAINED,ATMA_OF_THRASHING_TENDRILS);
			end;
		else 
			if (randomnumber >= 95) then
			killer:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
			killer:messageSpecial(KEYITEM_OBTAINED,ATMA_OF_THRASHING_TENDRILS);
			end;
		end;
	end;
	SetServerVariable(TEST+7,0);
end;