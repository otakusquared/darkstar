-----------------------------------
-- Area: 
-- NPC:  Gangly Gean
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

function onMobDeath(mob, killer)
	if (math.random(0,100) >= 50) then
		killer:addKeyItem(FRAGRANT_TREANT_PETAL);
		killer:messageSpecial(KEYITEM_OBTAINED,FRAGRANT_TREANT_PETAL);
	end
end;