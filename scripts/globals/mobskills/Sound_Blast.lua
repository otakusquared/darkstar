---------------------------------------------------
-- Sound Blast
-- 15' Reduces INT of players in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_INT_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120));

    return typeEffect;
end;
