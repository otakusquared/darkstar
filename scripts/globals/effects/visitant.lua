-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (target:getVar("Abyssea_Time") >= 3) then
		local abytime = target:getVar("Abyssea_Time");
		local newabytime = math.ceil(abytime - 3);
        target:setVar("Abyssea_Time",newabytime);
	else 
		target:delStatusEffect(EFFECT_VISITANT);
    end
-- TODO: messages about remaining time.
-- Some will need to handled outside of this effect (zone ejection warnings after visitant is gone).
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;