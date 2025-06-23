--- ===================================================================================================================
--- Holds common function.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- @param reasons table
--- @param achievement (?)
function OnMsg.UnableToUnlockAchievementReasons(reasons, achievement)
    if IsFinalStand() then
        reasons["final stand campaign"] = true
    end
end

--- Get current Campaign object, whether it is starting or started
--- @return CampaignPreset
function GetCampaign()
    if Game and Game.Campaign then
        return CampaignPresets[Game.Campaign]
    end

    if NewGameObj and NewGameObj.campaignId then
        return CampaignPresets[NewGameObj.campaignId]
    end

    return nil
end

--- Collect checks to ensure Final Stand Campaign is identified
--- @return boolean
function IsFinalStand(campaignId)
    local isFinalStandChecks = {}
    Msg("isFinalStand", isFinalStandChecks, campaignId)

    for _, check in pairs(isFinalStandChecks) do
        if check == true then
            return true
        end
    end

    return false
end

--- Add check to identify basic Final Stand campaign
--- @param isFinalStandChecks table
function OnMsg.isFinalStand(isFinalStandChecks, campaignId)
    local campaign = GetCampaign()
    local correctCampaign = not campaignId or campaignId == campaign.id

    if campaign and campaign:ResolveValue('IsFinalStand') and correctCampaign then
        isFinalStandChecks[campaign.id] = true
    end
end

--- @param collection table
--- @return table
function GetSortedCollection(collection)
    local sorted = {}

    for _, item in pairs(collection) do
        sorted[#sorted + 1] = item
    end

    table.stable_sort(sorted, function(a, b)
        return (a.SortKey or 0) < (b.SortKey or 0)
    end)

    return sorted
end

--- @return FinalStandConfigDef
function GetFinalStandConfig()
    if Game and Game.FinalStand and Game.FinalStand.config then
        return FinalStandConfigs[Game.FinalStand.config]
    end

    local allConfigs = GetSortedCollection(FinalStandConfigs)
    for _, config in ipairs(allConfigs) do
        return config
    end

    return nil
end

--- Get FinalStandConfig value, some values need to be taken from Game.FinalStand object
--- @param value string
--- @return (table|string|number|boolean)
function GetFinalStandConfigValue(value)
    if Game and Game.FinalStand and Game.FinalStand[value] then
        return Game.FinalStand[value]
    end

    return GetFinalStandConfig():ResolveValue(value)
end

--- @param asObject boolean
--- @return (string|FinalStandFriendlyFactionDef)
function GetFinalStandFriendlyFaction(asObject)
    local faction = GetFinalStandConfigValue('faction')

    if asObject then
        return FinalStandFriendlyFactions[faction]
    end

    return faction
end

--- @param value string
--- @param faction (FinalStandFriendlyFactionDef|string)
--- @return (table|string|number|boolean|nil)
function GetFinalStandFriendlyFactionValue(value, faction)
    if not faction then
        faction = GetFinalStandFriendlyFaction(true)
    end

    if not IsKindOf(faction, "FinalStandFriendlyFactionDef") then
        faction = FinalStandFriendlyFactions[faction]
    end

    if not faction then
        return nil
    end

    return faction:ResolveValue(value)
end

--- @param asObject boolean
--- @return (string|FinalStandEnemyFactionDef)
function GetFinalStandEnemyFaction(asObject)
    local faction = GetFinalStandConfigValue('enemyFaction')

    if asObject then
        return FinalStandEnemyFactions[faction]
    end

    return faction
end

--- @param value string
--- @param faction (FinalStandEnemyFactionDef|string)
--- @return (table|string|number|boolean)
function GetFinalStandEnemyFactionValue(value, faction)
    if not faction then
        faction = GetFinalStandEnemyFaction(true)
    end

    if not IsKindOf(faction, "FinalStandEnemyFactionDef") then
        faction = FinalStandEnemyFactions[faction]
    end

    if not faction then
        return nil
    end

    return faction[value]
end

--- @param asObject boolean
--- @return (string|FinalStandSectorDef|table)
function GetFinalStandSector(asObject, asFinalStandObject)
    local sector = GetFinalStandConfigValue('sector')

    if asObject and asFinalStandObject then
        return FinalStandSectors[sector]
    elseif asObject then
        sector = FinalStandSectors[sector].Sector
        return gv_Sectors[sector]
    end

    return sector
end

function GetFinalStandSectorStash()
    local sector = GetFinalStandSector(true)

    return GetSectorInventory(sector.Id)
end

--- @param value string
--- @param sector (FinalStandLengthDef|string)
--- @return (table|string|number|boolean)
function GetFinalStandSectorValue(value, sector)
    if not sector then
        sector = GetFinalStandSector(true)
    end

    if not IsKindOf(sector, "FinalStandSectorDef") then
        sector = FinalStandSectors[sector]
    end

    if not sector then
        return nil
    end

    return sector:ResolveValue(value)
end

--- @return boolean
function IsFinalStandSectorPlayerControlled()
    local sector = GetFinalStandSector(true)
    return sector.Side == "player1" or sector.Side == "player2"
end

--- @param asObject boolean
--- @return (string|FinalStandLengthDef)
function GetFinalStandLength(asObject)
    local length = GetFinalStandConfigValue('length')

    if asObject then
        return FinalStandLengths[length]
    end

    return length
end

--- @param value string
--- @param length (FinalStandLengthDef|string)
--- @return (table|string|number|boolean)
function GetFinalStandLengthValue(value, length)
    if not length then
        length = GetFinalStandLength(true)
    end

    if not IsKindOf(length, "FinalStandLengthDef") then
        length = FinalStandLengths[length]
    end

    if not length then
        return nil
    end

    return length:ResolveValue(value)
end

--- @return (number|boolean)
function GetFinalStandCurrentWave()
    if Game and Game.FinalStand then
        return Game.FinalStand.currentWave
    end

    return false
end

--- @return (number|boolean)
function GetFinalStandMaxWaves()
    if Game and Game.FinalStand then
        return GetFinalStandLengthValue('maxWaves')
    end

    return false
end

--- @param waveNumber (number|nil)
--- @return boolean
function HasFinalStandWaveScheduled(waveNumber)
    if not Game or not Game.FinalStand then
        return
    end

    local correctWaveNumber = true

    if type(waveNumber) == 'number' then
        correctWaveNumber = Game.FinalStand.currentWave == waveNumber
    end

    return correctWaveNumber and Game.FinalStand.scheduledStand > Game.CampaignTime
end

--- @param waveNumber (number|nil)
--- @return boolean
function HasFinalStandWaveStarted(waveNumber)
    if not Game or not Game.FinalStand then
        return
    end

    local correctWaveNumber = true

    if type(waveNumber) == 'number' then
        correctWaveNumber = Game.FinalStand.currentWave == waveNumber
    end

    return correctWaveNumber and Game.FinalStand.currentWaveStarted
end

--- @param waveNumber number
--- @return boolean
function HasFinalStandWaveEnded(waveNumber)
    if not Game or not Game.FinalStand then
        return
    end

    return GetFinalStandCurrentWave() > waveNumber
end
