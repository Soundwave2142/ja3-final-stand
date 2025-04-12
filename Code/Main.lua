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

    if FinalStandSquadSpawner:isTimeToSpawn() then
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

    Game.FinalStand.currentWaveStarted = false
    Msg("FinalStandWaveEnded")

    if GetFinalStandCurrentWave() < GetFinalStandMaxWaves() then
        FinalStandSquadScheduler:Schedule()
        FinalStandRewardProvider:GiveRewards()
    else
        FinalStandFinale:StartEnding()
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadSpawner
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadSpawner = {}

--- @return boolean
function FinalStandSquadSpawner:isTimeToSpawn()
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
-- TODO: Give loyalty on win

function FinalStandRewardProvider:GiveRewards()
    self:GiveMoney()
    self:GiveXP()
    self:RestockBobby()
end

function FinalStandRewardProvider:GiveMoney()
    local baseValue = {
        default = GetFinalStandConfigValue('baseMoney')
    }

    local modifiers = {
        faction = GetFinalStandFriendlyFactionValue('moneyModifier'),
        enemyFaction = GetFinalStandEnemyFactionValue('moneyModifier')
        -- TODO: add reward based on wave
    }

    local flatBonuses = {}

    Msg('FinalStandRewardMoney', baseValue, modifiers, flatBonuses)
    AddMoney(self:CalculateValue(baseValue, modifiers, flatBonuses), "reward")
end

function FinalStandRewardProvider:GiveXP()
    local baseValue = {
        default = GetFinalStandConfigValue('baseXp')
    }

    -- TODO: collect all instances that inherit certain class
    local modifiers = {
        faction = GetFinalStandFriendlyFactionValue('xpModifier'),
        enemyFaction = GetFinalStandEnemyFactionValue('xpModifier')
        -- TODO: add reward based on wave
    }

    local flatBonuses = {}

    Msg('FinalStandRewardXP', baseValue, modifiers, flatBonuses)

    local xpReward = self:CalculateValue(baseValue, modifiers, flatBonuses)
    local units = GetAllPlayerUnitsOnMap()
    if #units <= 0 then
        return
    end

    local xpRewardPerMerc = xpReward / #units
    for _, unit in ipairs(units) do
        UnitGainXP(unit, xpRewardPerMerc)
    end
end

function FinalStandRewardProvider:CalculateValue(baseValue, modifiers, flatBonuses)
    -- first, add up all base reward values
    local baseReward = 0
    for _, value in pairs(baseValue) do
        baseReward = baseReward + value
    end

    -- second, take base reward and modify it for each of the modifiers and subract base reward from it
    local finalReward = baseReward
    for _, modifier in pairs(modifiers) do
        if type(modifier) == "number" then
            finalReward = finalReward + (MulDivRound(baseReward, 100 + modifier, 100) - baseReward)
        end
    end

    print("Calculating reward:", baseReward, modifiers, finalReward)

    -- lastly, add any flat bonuses if present
    for _, flatBonus in pairs(flatBonuses) do
        finalReward = finalReward + flatBonus
    end

    return finalReward
end

function FinalStandRewardProvider:RestockBobby()
    local unlockedTier = BobbyRayShopGetUnlockedTier()

    local bobbyRayValues = {
        nextTier = (unlockedTier and unlockedTier or 0) + 1,
        nextRestock = Game.FinalStand.scheduledStand + (20 * const.Scale.m),
        modifierStandard = 100,
        modifierUsed = 100
    }

    Msg('FinalStandBobbyRayRestock', bobbyRayValues)
    print("Final Stand: Restocking Bobby -", bobbyRayValues)

    -- TODO: add tier per wave modifier
    SetQuestVar(QuestGetState("BobbyRayQuest"), "UnlockedTier", bobbyRayValues.nextTier)

    if bobbyRayValues.nextTier > 0 then
        BobbyRayStoreRestock(bobbyRayValues.modifierStandard, bobbyRayValues.modifierUsed)
    end

    if Game.FinalStand.scheduledStand >= Game.CampaignTime then
        SetQuestVar(QuestGetState("BobbyRayQuest"), "RestockTimer", bobbyRayValues.nextRestock)
    end
end
