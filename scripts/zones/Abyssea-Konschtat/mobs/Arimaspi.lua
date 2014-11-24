-----------------------------------
-- Area: 
-- NPC:  Arimaspi
-----------------------------------

-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/TextIDs");
require("scripts/globals/keyitems");
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
	local yellowTrigger = 0
	local dayElement = (VanadielDayElement());
	if dayElement == 0 then
		yellowTrigger = (select((math.random(1,3)),0,1,7));
	elseif dayElement == 7 then
		yellowTrigger = (select((math.random(1,3)),0,6,7));
	else
		yellowTrigger = (dayElement+(math.random(-1,1)));
	end;
	printf("yellowTrigger: %u",yellowTrigger);
	mob:setLocalVar("yellowSpell",(math.random(1,7)));
	printf("yellowSpell: %u",mob:getLocalVar("yellowSpell"));
	local redTrigger = math.random(1,13);
	printf("redTrigger: %u",redTrigger);
	mob:setLocalVar("redTrigger",redTrigger);
	mob:setLocalVar("yellowTrigger",yellowTrigger);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

--local battletime = mob:getBattleTime();
--if battletime <= 1 then
--	local dayElement = VanadielDayElement();
--	printf("DayElement: %u",dayElement);
--	local TEST = mob:getID();
--	printf("TEST: %u",TEST);
--	local redTrigger = math.random(1,13);
--	printf("redTrigger: %u",redTrigger);
--	mob:setLocalVar("redTrigger",redTrigger);
--end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	local redtrigdrops = mob:getLocalVar("redWeakness");
	local randomnumber = (math.random(0,100));
	if (randomnumber >= 50) and (killer:hasKeyItem(MUCID_AHRIMAN_EYEBALL) == false) then
		killer:addKeyItem(MUCID_AHRIMAN_EYEBALL);
		killer:messageSpecial(KEYITEM_OBTAINED,MUCID_AHRIMAN_EYEBALL);
	end
end;