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
function IsFinalStand()
    local isFinalStandChecks = {}
    Msg('isFinalStand', isFinalStandChecks)

    for key, value in pairs(isFinalStandChecks) do
        if value == true then
            return true
        end
    end

    return false
end

--- Add check to identify basic Final Stand campaign
--- @param isFinalStandChecks table
function OnMsg.isFinalStand(isFinalStandChecks)
    local campaign = GetCampaign()
    if campaign and campaign:ResolveValue('IsFinalStand') then
        isFinalStandChecks[campaign.id] = true
    end
end

--- @param object table
--- @param relationName string
--- @param relationKey string
--- @param globalPresetCollection (table|nil)
--- @return table
function GetRelationCollection(object, relationName, relationKey, globalPresetCollection)
    local collection = {}

    for _, relation in pairs(object[relationName]) do
        local presetId = relation[relationKey]

        if globalPresetCollection then
            table.insert(collection, _G[globalPresetCollection][presetId])
        else
            table.insert(collection, presetId)
        end
    end

    return collection
end

--- @param collection table
--- @return table
function GetFirstFromCollection(collection)
    for _, item in pairs(collection) do
        return item
    end

    return false
end

--- @return FinalStandConfigDef
function GetFinalStandConfig()
    if Game and Game.FinalStand and Game.FinalStand.config then
        return FinalStandConfigs[Game.FinalStand.config]
    end

    for _, config in pairs(FinalStandConfigs) do
        return config
    end

    return FinalStandConfigDef
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
function GetFinalStandSector(asObject)
    local sector = GetFinalStandConfigValue('sector')

    if asObject then
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
