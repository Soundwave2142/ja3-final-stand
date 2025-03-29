--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

function OnMsg.FinalStandSelected(newGameObj)
    local campaign = CampaignPresets[newGameObj.campaignId]
    FinalStandStarter:EnsureDefaultsAreAssigned(campaign, newGameObj)
end

--- @param game table
function OnMsg.NewGame(game)
    if not IsFinalStand() then
        return
    end

    if NewGameObj then
        local campaign = CampaignPresets[NewGameObj.campaignId]
        FinalStandStarter:EnsureDefaultsAreAssigned(campaign, NewGameObj)
    end

    local config = NewGameObj and NewGameObj['finalStandConfig'] or 'Default'
    local length = NewGameObj and NewGameObj['finalStandLength'] or 'ThreeWaves'
    local faction = NewGameObj and NewGameObj['finalStandFriendlyFaction'] or 'Rebels'
    local enemyFaction = NewGameObj and NewGameObj['finalStandEnemyFaction'] or 'Legion'

    game["FinalStand"] = {
        -- player made choices
        config = config,
        faction = faction,
        enemyFaction = enemyFaction,
        -- TODO: Adjust
        maxWaves = FinalStandLengths[length].maxWaves,
        -- variables for tracking progress
        currentWave = 0,
        currentWaveStarted = false,
        scheduledStand = false,
        appearancePresets = {}
    }
end

DefineClass.FinalStandStarter = {
    DefaultValuesToEnsure = {
        {
            relationName = 'Lengths',
            relationKey = 'Length',
            newGameObjKey = 'finalStandLength'
        },
        {
            relationName = 'Factions',
            relationKey = 'Faction',
            newGameObjKey = 'finalStandFriendlyFaction'
        },
        {
            relationName = 'EnemyFactions',
            relationKey = 'Faction',
            newGameObjKey = 'finalStandEnemyFaction'
        }
    }
}

function FinalStandStarter:EnsureDefaultsAreAssigned(campaign, newGameObj)
    local configCollection = GetRelationCollection(campaign, 'FinalStandConfigs', 'Config')
    local configFirstValue = GetFirstFromCollection(configCollection)

    newGameObj['finalStandConfig'] = configFirstValue
    local configObject = FinalStandConfigs[configFirstValue]

    for _, names in pairs(self.DefaultValuesToEnsure) do
        local collection = GetRelationCollection(configObject, names.relationName, names.relationKey)
        local firstValue = GetFirstFromCollection(collection)

        if not newGameObj[names.newGameObjKey] then
            newGameObj[names.newGameObjKey] = firstValue
        end
    end
end
