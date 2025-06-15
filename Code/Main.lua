--- ===================================================================================================================
--- Responsible for all main game functionality.
---
--- @author Soundwave2142
--- ===================================================================================================================

-- TODO: OPTIONAL fix map icons on save load
function OnMsg.PreLoadSessionData()
    if not IsFinalStand() then
        return
    end
end

function OnMsg.SatelliteTick()
    if not IsFinalStand() then
        return
    end

    if FinalStandSquadSpawner:IsTimeToSpawn() then
        FinalStandSquadSpawner:Spawn()
    end
end

function OnMsg.ConflictEnd()
    if not IsFinalStand() then
        return
    end

    if not Game.FinalStand.currentWaveStarted or not IsFinalStandSectorPlayerControlled() then
        return
    end

    FinalStandSquadScheduler:EndWave()
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadScheduler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadScheduler = {}

function FinalStandSquadScheduler:Schedule()
    Game.FinalStand.currentWave = Game.FinalStand.currentWave + 1
    Game.FinalStand.scheduledStand = self:CalculateAttackTime()
    Game.FinalStand.scheduledStandSquads = FinalStandSquadSpawner:PickSquads()

    Msg('FinalStandWaveScheduled', Game.FinalStand.scheduledStand, Game.FinalStand.currentWave)

    self:ScheduleTimeLineMarker()
end

function FinalStandSquadScheduler:ScheduleTimeLineMarker()
    local typ = "final-stand-squad-attack"
    if GetFinalStandCurrentWave() == 1 then
        typ = 'final-stand-squad-attack-first'
    elseif GetFinalStandCurrentWave() == GetFinalStandMaxWaves() then
        typ = 'final-stand-squad-attack-final'
    end

    local sector = GetFinalStandSector();
    AddTimelineEvent("final-stand-squad-attack", Game.FinalStand.scheduledStand, typ, sector)
end

--- @return string(?)
function FinalStandSquadScheduler:CalculateAttackTime()
    local attackInHours = math.random(
        GetFinalStandConfigValue('attackTimeMin'),
        GetFinalStandConfigValue('attackTimeMax')
    )
    local attackTime = Game.CampaignTime + (attackInHours * const.Scale.h)

    if GetFinalStandConfigValue('attackTimeIncludeMercArrivalTime') then
        attackTime = attackTime + const.Satellite.MercArrivalTime
    end

    return attackTime
end

function FinalStandSquadScheduler:EndWave()
    FinalStandConfigurator:ResetPerWaveFlags()
    Msg("FinalStandWaveEnded")

    if GetFinalStandCurrentWave() < GetFinalStandMaxWaves() then
        FinalStandRewardProvider:GiveMoney()
        FinalStandRewardProvider:GiveXP()
        FinalStandRewardProvider:GiveLoyalty()

        FinalStandSquadScheduler:Schedule()
        -- we need to restock bobby after the next wave has been scheduled,
        -- as we need to know when it's going to happen.
        FinalStandRewardProvider:RestockBobby()
    else
        FinalStandFinale:StartEnding()
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadSpawner
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadSpawner = {}

--- @return boolean
function FinalStandSquadSpawner:IsTimeToSpawn()
    if not Game['FinalStand'] then
        return false
    end

    if not Game.FinalStand.scheduledStand then
        return false
    end

    return Game.CampaignTime == Game.FinalStand.scheduledStand
end

function FinalStandSquadSpawner:Spawn()
    -- Squads are picked by the FinalStandSquadScheduler:Schedule()
    if not Game.FinalStand.scheduledStandSquads then
        Game.FinalStand.scheduledStandSquads = self:PickSquads()
    end

    local sector = GetFinalStandSector()
    local squads = Game.FinalStand.scheduledStandSquads

    Msg("FinalStandAttackSquadsSpawning", squads)

    for _, squadId in pairs(squads) do
        GenerateEnemySquad(squadId, sector, "Effect", nil, "enemy1")
    end

    Game.FinalStand.scheduledStand = false
    Game.FinalStand.currentWaveStarted = true
end

--- @return table
function FinalStandSquadSpawner:PickSquads()
    local currentWave = GetFinalStandCurrentWave()
    local EnemyFaction = GetFinalStandEnemyFaction(true)

    local squads = {}

    local allowedSquadsPool = EnemyFaction:GetPoolForWave(currentWave)
    local randomIndex = InteractionRandRange(1, #allowedSquadsPool, "LDFinalStand");
    table.insert(squads, allowedSquadsPool[randomIndex])

    local allowedExtraSquadsPool = EnemyFaction:GetPoolForWave(currentWave, true)
    if #allowedExtraSquadsPool > 0 then
        local randomExtraIndex = InteractionRandRange(1, #allowedExtraSquadsPool, "LDFinalStand");
        table.insert(squads, allowedSquadsPool[randomExtraIndex])
    end

    Msg("FinalStandAttackSquadsPicked", squads)

    return squads
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandRewardProvider
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandRewardProvider = {}

function FinalStandRewardProvider:GiveMoney()
    local baseValue = self:GetBaseForAttribute('baseMoney')
    local modifiers = self:GetModifiersForAttribute('moneyModifier')
    local flatBonuses = {}

    if GetFinalStandConfigValue('loyaltyIncreasesMoney') == true then
        local sector = GetFinalStandSector(true)
        modifiers['loyalty'] = GetCityLoyalty(sector.City)
    end

    print('FinalStandRewardMoney', baseValue, modifiers, flatBonuses)
    Msg('FinalStandRewardMoney', baseValue, modifiers, flatBonuses)
    local moneyReward = self:CalculateValue(baseValue, modifiers, flatBonuses);

    if moneyReward > 0 then
        AddMoney(moneyReward, "reward")
    end
end

function FinalStandRewardProvider:GiveXP()
    local units = GetAllPlayerUnitsOnMap()
    local baseValue = self:GetBaseForAttribute('baseXp')
    local modifiers = self:GetModifiersForAttribute('xpModifier')
    local flatBonuses = {}

    Msg('FinalStandRewardXP', baseValue, modifiers, flatBonuses, units)
    local xpReward = self:CalculateValue(baseValue, modifiers, flatBonuses)

    if xpReward > 0 then
        FinalStandRewardProvider:GiveXPToUnits(units, xpReward)
    end
    -- todo: add log messages
end

--- @param units table
--- @param xp number
function FinalStandRewardProvider:GiveXPToUnits(units, xp)
    if #units <= 0 then
        return
    end

    local livingUnits = {}

    for _, unit in ipairs(units) do
        if not unit:IsDead() then
            livingUnits[#livingUnits + 1] = unit
        end
    end

    units = livingUnits;

    local xpBonusPercent = 0

    for i, unit in ipairs(units) do -- add one time bonus xp from Teacher
        if HasPerk(unit, "Teacher") then
            xpBonusPercent = xpBonusPercent + CharacterEffectDefs.Teacher:ResolveValue("squad_exp_bonus")
            break
        end
    end

    for i, unit in ipairs(units) do -- add one time bonus xp from OldDog
        if HasPerk(unit, "OldDog") then
            xpBonusPercent = xpBonusPercent + CharacterEffectDefs.OldDog:ResolveValue("old_dog_XP_bonus")
            break
        end
    end

    xp = xp + MulDivRound(xp, xpBonusPercent, 100)

    local leveledUp = {}
    local perUnit = MulDivRound(xp, 1000, #units * 1000)

    for i, unit in ipairs(units) do
        local previousLvl = unit:GetLevel()
        local gain = CalcRewardExperienceToUnit(unit, perUnit)

        ReceiveStatGainingPoints(unit, gain)
        unit.Experience = (unit.Experience or 0) + gain
        local newLvl = unit:GetLevel()

        local levelsGained = newLvl - previousLvl

        if levelsGained > 0 then
            leveledUp[#leveledUp + 1] = unit
            unit.perkPoints = unit.perkPoints + levelsGained
            TutorialHintsState.GainLevel = true
        end
    end

    for _, unit in ipairs(leveledUp) do
        ObjModified(unit)
        Msg("UnitLeveledUp", unit)
    end
end

function FinalStandRewardProvider:GiveLoyalty()
    local sector = GetFinalStandSector(true)
    local baseValue = self:GetBaseForAttribute('baseLoyalty')
    local modifiers = self:GetModifiersForAttribute('loyaltyModifier')
    local flatBonuses = {}

    Msg('FinalStandRewardLoyalty', baseValue, modifiers, flatBonuses, sector)
    local loyaltyReward = self:CalculateValue(baseValue, modifiers, flatBonuses)

    if loyaltyReward > 0 then
        CityModifyLoyalty(sector.City, loyaltyReward, "")
    end
end

function FinalStandRewardProvider:GetBaseForAttribute(attribute)
    return {
        default = GetFinalStandConfigValue(attribute)
    }
end

function FinalStandRewardProvider:GetModifiersForAttribute(attribute)
    return {
        length = GetFinalStandLengthValue(attribute),
        sector = GetFinalStandSectorValue(attribute),
        faction = GetFinalStandFriendlyFactionValue(attribute),
        enemyFaction = GetFinalStandEnemyFactionValue(attribute)
    }
end

--- @param baseValue table
--- @param modifiers table
--- @param flatBonuses table
function FinalStandRewardProvider:CalculateValue(baseValue, modifiers, flatBonuses)
    -- first, add up all base reward values
    local baseReward = 0
    for _, value in pairs(baseValue) do
        baseReward = baseReward + value
    end

    -- second, take base reward and modify it for each of the modifiers and subract base reward from it
    local finalReward = baseReward
    for _, modifier in pairs(modifiers) do
        if type(modifier) == "number" and modifier ~= 0 then
            finalReward = finalReward + (MulDivRound(baseReward, 100 + modifier, 100) - baseReward)
        end
    end

    -- lastly, add any flat bonuses if present
    for _, flatBonus in pairs(flatBonuses) do
        finalReward = finalReward + flatBonus
    end

    return finalReward
end

--- Bobby restocks after the next wave has been scheduled, as we need to know when it's going to happen.
function FinalStandRewardProvider:RestockBobby()
    local unlockedTier = BobbyRayShopGetUnlockedTier()

    local bobbyRayValues = {
        nextTier = (unlockedTier and unlockedTier or 0) + 1,
        nextRestock = Game.FinalStand.scheduledStand + (20 * const.Scale.m),
        modifierStandard = 100,
        modifierUsed = 100
    }

    Msg('FinalStandBobbyRayRestock', bobbyRayValues)

    -- TODO: add tier per wave modifier
    SetQuestVar(QuestGetState("BobbyRayQuest"), "UnlockedTier", bobbyRayValues.nextTier)

    if bobbyRayValues.nextTier > 0 then
        BobbyRayStoreRestock(bobbyRayValues.modifierStandard, bobbyRayValues.modifierUsed)
    end

    if Game.FinalStand.scheduledStand >= Game.CampaignTime then
        SetQuestVar(QuestGetState("BobbyRayQuest"), "RestockTimer", bobbyRayValues.nextRestock)
    end
end
