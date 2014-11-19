-----------------------------------
-- Area: 
-- NPC:  Gangly Gean
-----------------------------------

-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	local rand = (math.random(0,100));
	if (rand >= 50) and (killer:hasKeyItem(FRAGRANT_TREANT_PETAL) == false) then
		killer:addKeyItem(FRAGRANT_TREANT_PETAL);
		killer:messageSpecial(KEYITEM_OBTAINED,FRAGRANT_TREANT_PETAL);
	end;
end;