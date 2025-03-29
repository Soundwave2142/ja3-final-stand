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
    if not IsFinalStand() or not Game.FinalStand.currentWaveStarted then
        return
    end

    Game.FinalStand.currentWaveStarted = false
    Msg("FinalStandWaveEnded")

    if Game.FinalStand.currentWave >= Game.FinalStand.maxWaves then
        FinalStandFinale:StartEnding()
    else
        FinalStandSquadScheduler:__exec()
        FinalStandRewardProvider:GiveRewards()
    end
end

--- ====================================================================================================
--- Spawner Definitions:
--- @class FinalStandSquadSpawner
--- ====================================================================================================
DefineClass.FinalStandSquadSpawner = {}

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
    local sector = CampaignPresets["FinalStand"].InitialSector
    local squads = self:PickSquads()

    Msg("FinalStandAttackSquadSpawning", squads)

    for _, squadId in pairs(squads) do
        GenerateEnemySquad(squadId, sector, "Effect", nil, "enemy1")
    end

    Game.FinalStand.scheduledStand = false
    Game.FinalStand.currentWaveStarted = true
end

--- @return table
function FinalStandSquadSpawner:PickSquads()
    local currentWave = Game.FinalStand.currentWave
    local EnemyFaction = GetFinalStandEnemyFaction()

    local squads = {}

    local allowedSquadsPool = EnemyFaction:GetPoolForWave(currentWave)
    local randomIndex = InteractionRandRange(1, #allowedSquadsPool, "LDFinalStand");
    table.insert(squads, allowedSquadsPool[randomIndex])

    local allowedExtraSquadsPool = EnemyFaction:GetPoolForWave(currentWave, true)
    if #allowedExtraSquadsPool > 0 then
        local randomExtraIndex = InteractionRandRange(1, #allowedExtraSquadsPool, "LDFinalStand");
        table.insert(squads, allowedSquadsPool[randomExtraIndex])
    end

    return squads
end

--- ====================================================================================================
--- Reward Provider Definitions:
--- @class FinalStandRewardProvider
--- ====================================================================================================
DefineClass.FinalStandRewardProvider = {}

function FinalStandRewardProvider:GiveRewards()
    self:GiveMoney()
    self:GiveXP()
    self:RestockBobby()
end

function FinalStandRewardProvider:GiveMoney()
    local modifiers = { faction = GetFinalStandEnemyFactionValue('moneyModifier') --[[TODO:GetFinalStandWaveValue]] }
    local baseValue = { default = GetFinalStandConfigValue('baseMoney') }
    local flatBonuses = {}

    Msg('FinalStandRewardMoney', baseValue, modifiers, flatBonuses)
    AddMoney(self:CalculateValue(baseValue, modifiers, flatBonuses), "reward")
end

function FinalStandRewardProvider:GiveXP()
    local modifiers = { faction = GetFinalStandEnemyFactionValue('xpModifier') --[[TODO:GetFinalStandWaveValue]] }
    local baseValue = { default = GetFinalStandConfigValue('baseXp') }
    local flatBonuses = {}

    Msg('FinalStandRewardXP', baseValue, modifiers, flatBonuses)
    local xpReward = self:CalculateValue(baseValue, modifiers, flatBonuses)

    local units = GetAllPlayerUnitsOnMap()
    for key, unit in ipairs(units) do
        UnitGainXP(unit, xpReward)
    end
end

function FinalStandRewardProvider:CalculateValue(baseValue, modifiers, flatBonuses)
    local finalReward = 0

    for key, value in pairs(baseValue) do
        finalReward = finalReward + value
    end

    for key, modifier in pairs(modifiers) do
        if modifier > 0 then
            finalReward = MulDivRound(finalReward, 100 + modifier, 100)
        end
    end

    for key, flatBonus in pairs(flatBonuses) do
        finalReward = finalReward + flatBonus
    end

    return finalReward
end

function FinalStandRewardProvider:RestockBobby()
    if not BobbyRayShopIsUnlocked() then
        return
    end

    local bobbyRayValues = {
        nextTear = BobbyRayShopGetUnlockedTier() + 1,
        nextRestock = Game.FinalStand.scheduledStand
    }

    Msg('FinalStandBobbyRayRestock', bobbyRayValues)

    -- TODO: add tier per wave modifier
    SetQuestVar(QuestGetState("BobbyRayQuest"), "UnlockedTier", bobbyRayValues.nextTear)
    SetQuestVar(QuestGetState("BobbyRayQuest"), "RestockTimer", bobbyRayValues.nextRestock)
end
