--This file is part of the AmsTaFFix' GMR plugins/profiles distribution
--(https://github.com/AmsTaFFix/gmr-stuff).
--Copyright (C) 2022 Nikita Sapogov
--
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <https://www.gnu.org/licenses/>.

AMST_SHARE = AMST_SHARE or {}
AMST_SHARE["CR>S/E.LOADED"] = true
local VERSION = "v1.0.0"
local printMsgPrefix = "[CR>S/E|" .. VERSION .. "] "
local PLAYER_TARGET = "player"

---Print message with CR prefix
---@param msg string
local function Print(msg)
    GMR.Print(printMsgPrefix .. msg)
end

local function Error(msg)
    Print(printMsgPrefix .. "[ERROR]  " .. msg)
end

local CLASS_WARRIOR = "WARRIOR"
local CLASS_PALADIN = "PALADIN"
local CLASS_HUNTER = "HUNTER"
local CLASS_ROGUE = "ROGUE"
local CLASS_PRIEST = "PRIEST"
local CLASS_DEATHKNIGHT = "DEATHKNIGHT"
local CLASS_SHAMAN = "SHAMAN"
local CLASS_MAGE = "MAGE"
local CLASS_WARLOCK = "WARLOCK"
local CLASS_MONK = "MONK"
local CLASS_DRUID = "DRUID"
local CLASS_DEMONHUNTER = "DEMONHUNTER"
local CLASS_EVOKER = "EVOKER"

local spells = {
    lightningBolt = GetSpellInfo(49238),
    chainLightning = GetSpellInfo(49271),
    thunderstorm = GetSpellInfo(59159),
    totemOfWrath = GetSpellInfo(57722),
    manaSpringTotem = GetSpellInfo(58774),
    healingStreamTotem = GetSpellInfo(58757),
    healingWave = GetSpellInfo(49273),
    lesserHealingWave = GetSpellInfo(8004),
    lavaBurst = GetSpellInfo(60043),
    flameShock = GetSpellInfo(49233),
    earthShock = GetSpellInfo(49231),
    frostShock = GetSpellInfo(49236),
    flameTongueWeapon = GetSpellInfo(58790),
    waterShield = GetSpellInfo(33736),
    callOfTheElements = GetSpellInfo(66842),
    elementalMastery = GetSpellInfo(16166)
}

local spellKnown = {
    lightningBolt = GMR.IsSpellKnown(spells.lightningBolt),
    chainLightning = GMR.IsSpellKnown(spells.chainLightning),
    thunderstorm = GMR.IsSpellKnown(spells.thunderstorm),
    totemOfWrath = GMR.IsSpellKnown(spells.totemOfWrath),
    manaSpringTotem = GMR.IsSpellKnown(spells.manaSpringTotem),
    healingStreamTotem = GMR.IsSpellKnown(spells.healingStreamTotem),
    healingWave = GMR.IsSpellKnown(spells.healingWave),
    lesserHealingWave = GMR.IsSpellKnown(spells.lesserHealingWave),
    lavaBurst = GMR.IsSpellKnown(spells.lavaBurst),
    flameShock = GMR.IsSpellKnown(spells.flameShock),
    earthShock = GMR.IsSpellKnown(spells.earthShock),
    frostShock = GMR.IsSpellKnown(spells.frostShock),
    flameTongueWeapon = GMR.IsSpellKnown(spells.flameTongueWeapon),
    elementalMastery = GMR.IsSpellKnown(spells.elementalMastery),
    waterShield = GMR.IsSpellKnown(spells.waterShield)
}

local buffs = {
    waterShield = GetSpellInfo(33736),
    totemOfWrath = GetSpellInfo(57662),
    totemOfWrathGlyph = GetSpellInfo(63283)
}

local buffSameClassLists = {
    { buffs.greaterBlessingOfMight, buffs.blessingOfMight, buffs.battleShout },
    { buffs.greaterBlessingOfKings, buffs.blessingOfKings },
}

local debuffs = {
    hammerOfJustice = GetSpellInfo(10308),
    wintersChill = GetSpellInfo(12579),
    improvedScorch = GetSpellInfo(22959),
    livingBomb = GetSpellInfo(44457),
    corruption = GetSpellInfo(27216),
    ignite = GetSpellInfo(12654),
    frostFever = GetSpellInfo(55095),
    frostbite = GetSpellInfo(12494),
    righteousVengeance = GetSpellInfo(61840),
    chainsOfIce = GetSpellInfo(45524),
    seedOfCorruption = GetSpellInfo(27243),
    strangulate = GetSpellInfo(47476),
    infectedWounds = GetSpellInfo(58181),
    coneOfCold = GetSpellInfo(27087),
    flameShock = GetSpellInfo(25457),
    moonfire = GetSpellInfo(26988),
    holyVengeance = GetSpellInfo(31803),
    thunderclap = GetSpellInfo(15588),
    woundPoison5 = GetSpellInfo(27189),
    shatteredBarrier = GetSpellInfo(55080),
    judgementOfLight = GetSpellInfo(20185),
    shadowWordPain = GetSpellInfo(25367),
    silencedShieldOfTheTemplar = GetSpellInfo(63529),
    psychicScream = GetSpellInfo(10890),
    bloodPlague = GetSpellInfo(55078),
    huntersMark = GetSpellInfo(14325),
    vampiricTouch = GetSpellInfo(34917),
    frostNova = GetSpellInfo(27088),
    judgementOfJustice = GetSpellInfo(20184),
    vindication = GetSpellInfo(26017),
    chilled = GetSpellInfo(7321),
    devouringPlague = GetSpellInfo(25467),
    insectSwarm = GetSpellInfo(27013),
    repentance = GetSpellInfo(20066),
    frostbolt = GetSpellInfo(38697),
    serpentSting = GetSpellInfo(27016),
    earthAndMoon = GetSpellInfo(60433),
    shadowfury = GetSpellInfo(30414),
    immolate = GetSpellInfo(27215),
    viperSting = GetSpellInfo(3034),
    unstableAffliction = GetSpellInfo(31117),
    haunt = GetSpellInfo(59161),
    ebonPlague = GetSpellInfo(51735),
    deathCoil = GetSpellInfo(27223),
    judgementOfWisdom = GetSpellInfo(20186),
    deadlyPoison = GetSpellInfo(34655),
    silencingShot = GetSpellInfo(34490),
    psychicHorror = GetSpellInfo(64044),
    deadlyPoison7 = GetSpellInfo(27187),
    avengersShield = GetSpellInfo(32700),
    mindTrauma = GetSpellInfo(48301),
    shadowMastery = GetSpellInfo(17800),
    shadowEmbrace = GetSpellInfo(32391),
    earthbind = GetSpellInfo(3600),
    dragonsBreath = GetSpellInfo(33043),
    cripplingPoison = GetSpellInfo(3409),
    spellLock = GetSpellInfo(24259),
    faerieFire = GetSpellInfo(770),
    envelopingWeb = GetSpellInfo(15471),
    aftermath = GetSpellInfo(18118),
    entrapment = GetSpellInfo(19185),
    cryptFever = GetSpellInfo(50509),
    blackArrow = GetSpellInfo(63670),
    faerieFireFeral = GetSpellInfo(16857),
    forbearance = GetSpellInfo(25771),
    freezingTrapEffect = GetSpellInfo(14309),
    markOfBlood = GetSpellInfo(49005),
    freeze = GetSpellInfo(33395),
}

local debuffIndex = {}
for _, v in pairs(debuffs) do
    debuffIndex[v] = true
end

local debuffsLowPriority = {
    debuffs.wintersChill,
    debuffs.improvedScorch,
    debuffs.corruption,
    debuffs.ignite,
    debuffs.righteousVengeance,
    debuffs.flameShock,
    debuffs.moonfire,
    debuffs.holyVengeance,
    debuffs.judgementOfLight,
    debuffs.shadowWordPain,
    debuffs.bloodPlague,
    debuffs.chilled,
    debuffs.serpentSting,
    debuffs.judgementOfWisdom,
    debuffs.deadlyPoison,
    debuffs.deadlyPoison7,
    debuffs.shadowMastery,
    debuffs.ebonPlague,
    debuffs.frostFever,
    debuffs.huntersMark,
    debuffs.faerieFire,
    debuffs.vindication,
    debuffs.frostbolt,
    debuffs.cryptFever,
    debuffs.blackArrow,
    debuffs.faerieFireFeral,
}

local debuffNotRecommendDispelList = {
    debuffs.livingBomb,
    debuffs.vampiricTouch
}

local debuffNeverDispelList = {
    debuffs.unstableAffliction,
}

local debuffTopPriorityList = {
    debuffs.frostbite,
    debuffs.chainsOfIce,
    debuffs.hammerOfJustice,
    debuffs.strangulate,
    debuffs.thunderclap,
    debuffs.woundPoison5,
    debuffs.shatteredBarrier,
    debuffs.silencedShieldOfTheTemplar,
    debuffs.psychicScream,
    debuffs.frostNova,
    debuffs.judgementOfJustice,
    debuffs.repentance,
    debuffs.shadowfury,
    debuffs.viperSting,
    debuffs.haunt,
    debuffs.deathCoil,
    debuffs.silencingShot,
    debuffs.psychicHorror,
    debuffs.spellLock,
    debuffs.freezingTrapEffect,
    debuffs.markOfBlood,
    debuffs.freeze,
}

local debuffCustomLogicList = {
    debuffs.livingBomb,
}

local debuffBlessingOfFreedomList = {
    debuffs.envelopingWeb,
}

local glyphSpells = {
}

---@class ShamanConfig
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = false,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = false,
    ---Use online loading feature to get last updates
    onlineLoad = true
}

function Config:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

---Apply object to change default values
---@param object ShamanConfig another config
function Config:apply(object)
    object = object or {}
    for k, v in pairs(object) do
        if self[k] == nil then
            Print("Unknown config key '" .. tostring(k) .. "', skip.")
        elseif self[k] ~= v then
            Print("Option '" .. tostring(k) .. "' changed from '" .. tostring(self[k]) .. "' to '" .. tostring(v) .. "'.")
            self[k] = v
        end
    end
end

---@class ShamanState
local State = {

}

function State:new()
    local o = { }
    setmetatable(o, self)
    self.__index = self
    return o
end

---Determine state
---@param cfg ShamanConfig config
---@return void
function State:determine(cfg)

end

---@param cfg ShamanConfig
---@return fun(msg:string):void
local function createDbgPrintFunc(cfg)
    if cfg.debug == false then
        return function()
        end
    end

    return function(msg)
        local message = "[DEBUG] " .. msg
        GMR.Print(message)
        GMR.Log(message)
    end
end

---@class ShamanRotation
local Rotation = {
    ---@type ShamanConfig
    cfg = nil,
    ---@type ShamanState
    state = nil,
    ---@type fun(msg:string):void
    dbgPrint = function(msg)
    end
}
---@param cfg ShamanConfig
---@param state ShamanState
---@return ShamanRotation
function Rotation:new(cfg, state)
    local dbgPrint = createDbgPrintFunc(cfg)

    ---@type ShamanRotation
    local o = {
        cfg = cfg,
        state = state,
        dbgPrint = dbgPrint,
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

local function HasBuffClassed(unit, buff, byPlayer)
    local hasSameClassBuff = false
    local sameClassBuffList = nil
    for _, list in ipairs(buffSameClassLists) do
        for _, buffFromList in ipairs(list) do
            if buff == buffFromList then
                hasSameClassBuff = true
                sameClassBuffList = list
                break
            end
        end
        if hasSameClassBuff then
            break
        end
    end

    if not hasSameClassBuff then
        return GMR.HasBuff(unit, buff, byPlayer)
    end

    for _, buffFromList in ipairs(sameClassBuffList) do
        if GMR.HasBuff(unit, buffFromList, byPlayer) then
            return true
        end
    end

    return false
end

---@return void
function Rotation:execute()
    if self:isStunned() then
        self.dbgPrint("player is stunned, can't do anything")
        return
    end

    if self:isSilent() then
        self.dbgPrint("player is silent, can't cast anything")
        return
    end

    if GMR.IsMoving() and IsMounted("player") then
        return
    end

    local targetFlameShockExpiration = GMR.GetDebuffExpiration("target", spells.flameShock)
    local shouldCastFlameShock = false
    local currentMana = GMR.GetMana("player")
    if targetFlameShockExpiration <= 3 then
        shouldCastFlameShock = true
    end

    local isTargetAttackable = GMR.IsAlive("target") and GMR.UnitCanAttack("player", "target")
            and not GMR.IsImmune("target")
    local enemiesAround8y = GMR.GetNumEnemies("player", 8)


    -- Thunderstorm
    if spellKnown.thunderstorm
            and GetSpellCooldown(spells.thunderstorm) == 0
            and spellKnown.thunderstorm
            and (enemiesAround8y > 1 or currentMana < 80) then
        if GMR.IsCastable(spells.thunderstorm, "target") then
            self.dbgPrint("should use thunderstorm")
            GMR.Cast(spells.thunderstorm, "target")
            return
        end
    end

    if not GMR.HasBuff(PLAYER_TARGET, buffs.waterShield, true)
        and spellKnown.waterShield
        and GMR.IsCastable(spells.waterShield, PLAYER_TARGET) then
        self.dbgPrint("should cast watershield")
        GMR.Cast(spells.waterShield, "target")
        return
    end

    if isTargetAttackable and spellKnown.flameShock and GMR.IsCastable(spells.flameShock, "target")
            and GMR.IsSpellInRange(spells.flameShock, "target") and shouldCastFlameShock then
        self.dbgPrint("should cast flameshock")
        GMR.Cast(spells.flameShock, "target")
        return
    end

    if isTargetAttackable
        and not GMR.HasBuff(PLAYER_TARGET, buffs.totemOfWrathGlyph, true)
        and spellKnown.totemOfWrath
        and GMR.IsCastable(spells.totemOfWrath, "target") then
        self.dbgPrint("should cast totemOfWrath")
        GMR.Cast(spells.totemOfWrath, "target")
        return
    end

    if isTargetAttackable and spellKnown.lightningBolt and GMR.IsCastable(spells.lightningBolt, "target")
            and GMR.IsSpellInRange(spells.lightningBolt, "target") then
        self.dbgPrint("should cast lightningBolt")
        GMR.Cast(spells.lightningBolt, "target")
        return
    end


end

---@return boolean
function Rotation:isSilent()
    return false
end

---@return boolean
function Rotation:isStunned()
    if GMR.HasDebuff("player", debuffs.hammerOfJustice) then
        return true
    end

    return false
end

do
    local isSuccess, err = pcall(function()
        if GMR.GetClass("player") == "SHAMAN" then
            Print("Rotation would be initialized")

            local cfg = Config:new()
            cfg:apply(AMST_SHARE["CR>S/E.CFG"])

            local state = State:new()
            state:determine(cfg)

            local rotation = Rotation:new(cfg, state)
            local executeRotationFunc = function()
                local isSuccess, err = pcall(rotation.execute, rotation)
                if not isSuccess then
                    Error("Can't launch rotation: " .. err)
                end
            end

            if cfg.useCombatRotationLauncher then
                local resultFunction = nil
                if GMR.CustomCombatConditions == nil then
                    resultFunction = executeRotationFunc
                else
                    Print("There is another combat conditions, it will be merged with this rotation")
                    local oldCombatConditions = GMR.CustomCombatConditions
                    resultFunction = function()
                        local isSuccess, err = pcall(oldCombatConditions)
                        if not isSuccess then
                            Error("Can't launch previous custom combat rotation: " .. err)
                        end
                        executeRotationFunc()
                    end
                end

                GMR.CustomCombatConditions = resultFunction
                C_Timer.NewTicker(1, function()
                    if GMR.CustomCombatConditions ~= resultFunction then
                        GMR.CustomCombatConditions = resultFunction
                        Error("Something changed GMR.CustomCombatConditions func, it was changed back!")
                    end
                end)
            else
                C_Timer.NewTicker(0.1, function()
                    if (not GMR.IsExecuting() or not GMR.IsAlive()) then
                        return
                    end

                    if GMR.IsEating("player") or GMR.IsDrinking("player") then
                        return false
                    end

                    executeRotationFunc()
                end)
            end

            Print("Rotation fully initialed and turned on.")
        end
    end)

    if not isSuccess then
        Error(err)
    end
end