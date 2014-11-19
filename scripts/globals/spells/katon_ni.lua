-----------------------------------------
-- Spell: Katon: Ni
-- Deals fire damage to an enemy and lowers its resistance against water.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doNinjutsuNuke(68,1,caster,spell,target,false,1.0);
	handleNinjutsuDebuff(caster, target, spell, 30, 15, MOD_WATERRES);
	local zone = caster:getZone();
	local yellowTrig = target:getLocalVar("yellowTrigger");
	local yellowSpell = target:getLocalVar("yellowSpell");
	local yellowWeak = target:getLocalVar("yellowWeakness");
	if zone == 15 or zone == 45 or zone == 132 or zone == 215 or zone == 216 or zone == 217 or zone == 218 or zone == 253 or zone == 254 or zone == 255 then
		if yellowTrig == 0 then
			if yellowSpell == 6 and yellowWeak == 0 then
				target:weaknessTrigger(0);
				target:addStatusEffect(EFFECT_SILENCE,1,0,30);
				target:setLocalVar("yellowWeakness",yellowWeak+1);
				return dmg;
			elseif yellowSpell == 6 and yellowWeak == 1 then
				target:weaknessTrigger(0);
				target:addStatusEffect(EFFECT_SILENCE,1,0,15);
				target:setLocalVar("yellowWeakness",yellowWeak+1);
				return dmg;
			elseif yellowSpell == 6 and yellowWeak == 2 then
				target:weaknessTrigger(0);
				target:addStatusEffect(EFFECT_SILENCE,1,0,7);
				target:setLocalVar("yellowWeakness",yellowWeak+1);
				return dmg;
			elseif yellowSpell == 6 and yellowWeak == 3 then
				target:weaknessTrigger(0);
				target:addStatusEffect(EFFECT_SILENCE,1,0,3);
				target:setLocalVar("yellowWeakness",yellowWeak+1);
				return dmg;
			elseif yellowSpell == 6 and yellowWeak >= 4 then
				target:weaknessTrigger(0);
				target:addStatusEffect(EFFECT_SILENCE,1,0,1);
				target:setLocalVar("yellowWeakness",yellowWeak+1);
				return dmg;
			else
				return dmg;
			end;
		else
			return dmg;
		end;
	else
		return dmg;
	end;
end;
