--- ===================================================================================================================
--- Holds campaign effects.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSquadScheduleAttack
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSquadScheduleAttack = {
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
function FinalStandSquadScheduleAttack:__exec(obj, context)
    FinalStandSquadScheduler:Schedule()
end

--- ====================================================================================================
--- SatelliteTimelineEvent Definitions: First Attack, Regular Attack, Final Attack
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
    id = "final-stand-squad-attack-first",
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
