--- ===================================================================================================================
--- Responsible for start of the game and assignment of all correct values.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- @param newGameObj table
function OnMsg.FinalStandSelected(newGameObj)
    newGameObj.campaign_name = 'Final Stand'

    local campaign = CampaignPresets[newGameObj.campaignId]
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
end

--- @param game table
function OnMsg.NewGame(game)
    if not IsFinalStand() then
        return
    end

    local campaign = GetCurrentCampaignPreset()
    local newGameObj = NewGameObj or { finalStandFriendlyFaction = 'Rebels' }
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)

    local FinalStand = {
        -- player made choices
        config = newGameObj and newGameObj['finalStandConfig'] or 'Default',
        faction = newGameObj and newGameObj['finalStandFriendlyFaction'] or 'Mercs',
        enemyFaction = newGameObj and newGameObj['finalStandEnemyFaction'] or 'Legion',
        sector = newGameObj and newGameObj['finalStandSector'] or 'H4',
        length = newGameObj and newGameObj['finalStandLength'] or 'ThreeWaves',
        -- variables for tracking progress
        id = FinalStandConfigurator:GenerateFinalStandId(),
        currentWave = 0,
        currentWaveStarted = false,
        scheduledStand = false,
        scheduledGameOver = false,
        appearancePresets = {},
        finalChance = false
    }

    Msg("FinalStandGameConfigured", FinalStand)

    game["FinalStand"] = FinalStand
    campaign["InitialSector"] = GetFinalStandSector(true)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigurator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigurator = {}

--- @return string
function FinalStandConfigurator:GenerateFinalStandId()
    return random_encode64(48)
end

--- @param campaign CampaignPreset
--- @param newGameObj table
function FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
    local configCollection = GetRelationCollection(campaign, 'FinalStandConfigs', 'Config')
    local configFirstValue = GetFirstFromCollection(configCollection)

    newGameObj['finalStandConfig'] = configFirstValue
    local configObject = FinalStandConfigs[configFirstValue]

    for _, options in pairs(FinalStandTemplatePresetsGenerator.Structure) do
        local collection = GetRelationCollection(configObject, options.configRelationName, options.configRelationKey)
        local firstValue = GetFirstFromCollection(collection)

        if not newGameObj[options.gameObjName] then
            newGameObj[options.gameObjName] = firstValue
        end
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadScheduler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadScheduler = {}

function FinalStandSquadScheduler:Schedule()
    Game.FinalStand.currentWave = Game.FinalStand.currentWave + 1
    Game.FinalStand.scheduledStand = self:CalculateAttackTime()

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

    local sector = GetFinalStandSector(true);
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
