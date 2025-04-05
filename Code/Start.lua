--- ===================================================================================================================
--- Responsible for start of the game and assignment of all correct values.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- @param newGameObj table
function OnMsg.FinalStandSelected(newGameObj)
    local campaign = CampaignPresets[newGameObj.campaignId]
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
end

--- @param game table
function OnMsg.NewGame(game)
    if not IsFinalStand() then
        return
    end

    if NewGameObj then
        local campaign = CampaignPresets[NewGameObj.campaignId]
        FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, NewGameObj)
    end

    local FinalStand = {
        -- player made choices
        config = NewGameObj and NewGameObj['finalStandConfig'] or 'Default',
        faction = NewGameObj and NewGameObj['finalStandFriendlyFaction'] or 'Rebels',
        enemyFaction = NewGameObj and NewGameObj['finalStandEnemyFaction'] or 'Legion',
        -- TODO: Adjust
        length = NewGameObj and NewGameObj['finalStandLength'] or 'ThreeWaves',
        -- variables for tracking progress
        currentWave = 0,
        currentWaveStarted = false,
        scheduledStand = false,
        appearancePresets = {}
    }

    Msg("FinalStandGameConfigured", FinalStand)
    game["FinalStand"] = FinalStand
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigurator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigurator = {
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

--- @param campaign CampaignPreset
--- @param newGameObj table
function FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
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

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadScheduler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadScheduler = {}

function FinalStandSquadScheduler:Schedule()
    if GetFinalStandCurrentWave() >= GetFinalStandMaxWaves() then
        FinalStandFinale:StartEnding()
        return
    end

    Game.FinalStand.currentWave = Game.FinalStand.currentWave + 1
    Game.FinalStand.scheduledStand = self:CalculateAttackTime()

    Msg('FinalStandWaveScheduled', Game.FinalStand.scheduledStand, Game.FinalStand.currentWave)

    self:ScheduleTimeLineMarker()
end

function FinalStandSquadScheduler:ScheduleTimeLineMarker()
    local sector = CampaignPresets["FinalStand"].InitialSector;

    local typ = "final-stand-squad-attack"
    if GetFinalStandCurrentWave() == 1 then
        typ = 'final-stand-squad-attack-first'
    elseif GetFinalStandCurrentWave() == GetFinalStandMaxWaves() then
        typ = 'final-stand-squad-attack-final'
    end

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
