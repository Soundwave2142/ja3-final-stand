--- ====================================================================================================
--- Effects Definitions:
--- @class FinalStandSquadScheduler
--- ====================================================================================================
DefineClass.FinalStandSquadScheduler = {
    __parents = {
        "Effect",
    },
    __generated_by_class = "EffectDef",

    Documentation = "Schedules Final Stand enemy attack on player sector",
    EditorView = Untranslated("Schedules Final Stand enemy attack on player sector"),
    EditorNestedObjCategory = "Final Stand"
}

---@param obj table object executing the effect
---@param context nil
function FinalStandSquadScheduler:__exec(obj, context)
    if Game.FinalStand.currentWave >= Game.FinalStand.maxWaves then
        FinalStandFinale:StartEnding()
        return
    end

    Game.FinalStand.currentWave = Game.FinalStand.currentWave + 1
    Game.FinalStand.scheduledStand = self:calculateAttackTime()

    Msg('FinalStandWaveScheduled', Game.FinalStand.scheduledStand, Game.FinalStand.currentWave)

    self:scheduleTimeLineMarker()
end

function FinalStandSquadScheduler:scheduleTimeLineMarker()
    local sector = CampaignPresets["FinalStand"].InitialSector;
    local typ = "final-stand-squad-attack"
    if Game.FinalStand.currentWave == Game.FinalStand.maxWaves then
        typ = 'final-stand-squad-attack-final'
    end

    AddTimelineEvent("final-stand-squad-attack", Game.FinalStand.scheduledStand, typ, sector)
end

function FinalStandSquadScheduler:calculateAttackTime()
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

--- ====================================================================================================
--- SatelliteTimelineEvent Definitions: Regular Attack, Final Attack
--- ====================================================================================================
PlaceObj('SatelliteTimelineEventDef', {
    GetDescriptionText = function(self, eventCtx)
        return self.Text, self.Title, self.Hint
    end,
    GetIcon = function(self, eventCtx)
        local icon = "UI/Icons/SateliteView/icon_enemy"
        local innerIcon = "UI/Icons/SateliteView/enemy_logo"
        return icon, innerIcon
    end,
    GetTextContext = function(self, eventCtx)
        local sector = gv_Sectors[eventCtx]
        return sector and sector.XMapPosition
    end,
    GetTextContext = function(self, eventCtx)
        return { source = eventCtx }
    end,
    SortKey = 5,
    Text = Untranslated("The enemy outpost on sector will attack <em><SectorId(dest)></em>."),
    Title = Untranslated("Outpost Attack"),
    id = "final-stand-squad-attack",
})

PlaceObj('SatelliteTimelineEventDef', {
    GetDescriptionText = function(self, eventCtx)
        return self.Text, self.Title, self.Hint
    end,
    GetIcon = function(self, eventCtx)
        local icon = "UI/Icons/SateliteView/icon_enemy"
        local innerIcon = "UI/Icons/SateliteView/enemy_logo"
        return icon, innerIcon
    end,
    GetTextContext = function(self, eventCtx)
        local sector = gv_Sectors[eventCtx]
        return sector and sector.XMapPosition
    end,
    GetTextContext = function(self, eventCtx)
        return { source = eventCtx }
    end,
    SortKey = 5,
    Text = Untranslated("Enemy will attack <em><SectorId(dest)></em>. This is your final stand!"),
    Title = Untranslated("Final Stand!"),
    id = "final-stand-squad-attack-final",
})
