-----------------------------------	
-- Tachi Jinpu	
-- Great Katana weapon skill	
-- Skill level: 150	
-- Two-hit attack. Deals Physical and wind elemental damage to enemy. Additonal Effect Damage varies with TP.	
-- Will stack with Sneak Attack and Souleater.	
-- Aligned with the Breeze Gorget & Shadow Gorget.	
-- Aligned with the Breeze Belt & Shadow Belt.	
-- Element: Wind	
-- Modifiers: STR:40%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	local zone = player:getZone();
	local redTrig = target:getLocalVar("redTrigger");
	local redWeak = target:getLocalVar("redWeakness");
	if zone == 15 or zone == 45 or zone == 132 or zone == 215 or zone == 216 or zone == 217 or zone == 218 or zone == 253 or zone == 254 or zone == 255 then
		if redTrig == 4 and redWeak == 0 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,30);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 4 and redWeak == 1 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,15);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 4 and redWeak == 2 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,7);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 4 and redWeak == 3 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,3);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 4 and redWeak >= 4 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,1);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		else
			return tpHits, extraHits, criticalHit, damage;
		end;
	else
		return tpHits, extraHits, criticalHit, damage;
	end;	
end;
