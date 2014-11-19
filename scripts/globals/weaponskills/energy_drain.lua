------------------------
--    Energy Drain    --
------------------------

function OnUseWeaponSkill(player, target, wsID)
   -- TODO: Should steal MP based on TP and not wake the mob involved.
	
	local zone = player:getZone();
	local redTrig = target:getLocalVar("redTrigger");
	local redWeak = target:getLocalVar("redWeakness");
	if zone == 15 or zone == 45 or zone == 132 or zone == 215 or zone == 216 or zone == 217 or zone == 218 or zone == 253 or zone == 254 or zone == 255 then
		if redTrig == 3 and redWeak == 0 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,30);
			target:setLocalVar("redWeakness",redWeak+1);
			return 1, 0, false, 65;
		elseif redTrig == 3 and redWeak == 1 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,15);
			target:setLocalVar("redWeakness",redWeak+1);
			return 1, 0, false, 65;
		elseif redTrig == 3 and redWeak == 2 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,7);
			target:setLocalVar("redWeakness",redWeak+1);
			return 1, 0, false, 65;
		elseif redTrig == 3 and redWeak == 3 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,3);
			target:setLocalVar("redWeakness",redWeak+1);
			return 1, 0, false, 65;
		elseif redTrig == 3 and redWeak >= 4 then
			target:weaknessTrigger(2);
			target:addStatusEffect(EFFECT_TERROR,1,0,1);
			target:setLocalVar("redWeakness",redWeak+1);
			return 1, 0, false, 65;
		else
			return 1, 0, false, 65;
		end;
	else
		return 1, 0, false, 65;
	end;
end;
