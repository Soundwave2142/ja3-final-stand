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

--- ===================================================================================================================
--- SatelliteTimelineEvent Definitions: First Attack, Regular Attack, Final Attack, Game Over
--- ===================================================================================================================

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
    SortKey = 1,
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
    SortKey = 2,
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
    SortKey = 3,
    Text = Untranslated("Enemy will attack <em><SectorId(dest)></em>. This is your Final Stand!"),
    Title = Untranslated("Final Stand"),
    id = "final-stand-squad-attack-final",
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
    SortKey = 4,
    Text = Untranslated("Enemies has taken the sector, if you don't get boots on the ground - it's game over!"),
    Title = Untranslated("Game Over"),
    id = "final-stand-game-over",
})

--- ===================================================================================================================
--- Make vanilla operations work in Final Stand and make the trigger certain events for modifications.
--- ===================================================================================================================

--- Make that the game detects vanilla operations.
local SharePresetsWithBase = { SectorOperation = true }
local BaseForEachPresetInCampaign = ForEachPresetInCampaign

--- @param class string
--- @param func function
function ForEachPresetInCampaign(class, func, ...)
    if not IsFinalStand() or not SharePresetsWithBase[class] then
        return BaseForEachPresetInCampaign(class, func, ...)
    end

    class = g_Classes[class] or class
    class = class.PresetClass or class.class

    for group_index, group in ipairs(Presets[class]) do
        for preset_index, preset in ipairs(group) do
            local id = preset.id
            local presetCampaign = preset.campaign

            if not presetCampaign then
                assert(presetCampaign, "Do not use this function for non-campaign related presets.")
                return ...
            end

            local campaignRelated = preset.campaign == "<all>"
                or GetCurrentCampaignPreset().id == preset.campaign
                or preset.campaign == "HotDiamonds"

            if (id == "" or group[id] == preset) and not preset.Obsolete and campaignRelated then
                if func(preset, group, ...) == "break" then
                    return ...
                end
            end
        end
    end

    return ...
end

--- Next elements should only be loaded once upon initial load.
if not FirstLoad then
    return
end

local SectorOperationEventsLoaded = false

--- Make vanilla operations trigger events
function OnMsg.ModsReloaded()
    if SectorOperationEventsLoaded then
        return
    end

    ForEachPresetInCampaign("SectorOperation", function(preset, group, ...)
        local BaseProgressPerTick = preset:ResolveValue("ProgressPerTick")

        --- @param self SectorOperation
        --- @param merc table(?)
        --- @param prediction boolean(?)
        preset.ProgressPerTick = function(self, merc, prediction)
            local progresses = { base = BaseProgressPerTick(self, merc, prediction) }
            Msg("OperationProgressPerTick", self, progresses)

            local totalProgress = 0
            for _, progress in pairs(progresses) do
                if type(progress) == 'number' then
                    totalProgress = totalProgress + progress
                end
            end

            return totalProgress
        end

        local BaseIsEnabled = preset:ResolveValue("IsEnabled")

        --- @param self SectorOperation
        --- @param sector string(?)
        preset.IsEnabled = function(self, sector)
            local base_enabled, base_message = BaseIsEnabled(self, sector)
            local reasons = { base = { enabled = base_enabled, message = base_message } }
            Msg("OperationIsEnabled", self, reasons)

            for _, reason in pairs(reasons) do
                if not reason.enabled then
                    return false, reason.message
                end
            end

            return true
        end
    end)

    SectorOperationEventsLoaded = true
end
