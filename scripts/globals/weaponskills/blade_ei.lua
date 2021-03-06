-----------------------------------	
-- Blade Ei
-- Katana weapon skill	
-- Skill Level: 175	
-- Delivers a dark elemental attack. Damage varies with TP.	
-- Aligned with the Shadow Gorget.	
-- Aligned with the Shadow Belt.	
-- Element: Dark	
-- Modifiers: STR:30% ; INT:30%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.50      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	local zone = player:getZone();
	local redTrig = target:getLocalVar("redTrigger");
	local redWeak = target:getLocalVar("redWeakness");
	if zone == 15 or zone == 45 or zone == 132 or zone == 215 or zone == 216 or zone == 217 or zone == 218 or zone == 253 or zone == 254 or zone == 255 then
		if redTrig == 7 and redWeak == 0 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,30);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 7 and redWeak == 1 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,15);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 7 and redWeak == 2 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,7);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 7 and redWeak == 3 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,3);
			target:setLocalVar("redWeakness",redWeak+1);
			return tpHits, extraHits, criticalHit, damage;
		elseif redTrig == 7 and redWeak >= 4 then
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
