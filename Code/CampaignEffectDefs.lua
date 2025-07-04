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
    Text = T(214200002000,
        "Sector <em><SectorId(source)></em> will be attacked by enemy troops. Prepare for the first wave!"),
    Title = T(214200002001, "Initial Enemy Attack"),
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
        return { source = eventCtx, currentWave = GetFinalStandCurrentWave() }
    end,
    SortKey = 2,
    Text = T(214200002002,
        "Sector <em><SectorId(source)></em> will be attacked by enemy troops. Prepare for the wave <currentWave>!"),
    Title = T(214200002003, "Enemy Attack"),
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
    Text = T(214200002004, "Last wave, enemy will throw everything they've got. This is your Final Stand!"),
    Title = T(214200002005, "Final Stand"),
    id = "final-stand-squad-attack-final",
})

--- ===================================================================================================================
--- Make vanilla operations work in Final Stand and make the trigger certain events for modifications.
--- ===================================================================================================================

local SharePresetsWithBase = { SectorOperation = true }
local BaseForEachPresetInCampaign = ForEachPresetInCampaign

--- Overriden to make the game detect vanilla operations.
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

function IsFinalStandOperationSpeedUpAllowed(operationId)
    if not IsFinalStand() then return false end

    local notAllowed = { Arriving = true, Traveling = true, Idle = true }
    return notAllowed[operationId] ~= true
end

local BaseCompleteCurrentMilitiaTraining = CompleteCurrentMilitiaTraining

--- Overriden to show that militia can only be trained once.
--- @param sector table
--- @param mercs table
function CompleteCurrentMilitiaTraining(sector, mercs)
    if not IsFinalStand() then
        return BaseCompleteCurrentMilitiaTraining(sector, mercs)
    end

    NetUpdateHash("CompleteCurrentMilitiaTraining")
    g_MilitiaTrainingCompleteCounter = g_MilitiaTrainingCompleteCounter + 1

    CreateMapRealTimeThread(function()
        local militia_squad, count_trained = SpawnMilitia(const.Satellite.MilitiaUnitsPerTraining, sector, "operation")
        sector.militia_training = false

        local militia_types = { MilitiaRookie = 0, MilitiaElite = 0, MilitiaVeteran = 0 }
        for _, unit_id in ipairs(militia_squad.units) do
            local unit = gv_UnitData[unit_id]
            militia_types[unit.class] = militia_types[unit.class] + 1
        end

        local popupHost = GetDialog("PDADialogSatellite")
        popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")

        local dlg = CreateMessageBox(
            popupHost,
            T(295710973806, "Militia Training"),
            T { 522643975325, "Militia training is finished - trained <militia_trained> defenders.<newline><GameColorD>(<sectorName>)</GameColorD>",
                sectorName = GetSectorName(sector),
                militia_trained = count_trained } ..
            "\n\n" ..
            T(214200002006,
                "You can only train militia once per wave. Victories in combat can advance militia soldiers to Elite levels.")
        )
        dlg:Wait()
    end)
end

--- Next elements should only be loaded once upon initial load.
if not FirstLoad then
    return
end

local SectorOperationEventsLoaded = false

--- Make operations trigger events
function OnMsg.ModsReloaded()
    if SectorOperationEventsLoaded then
        return
    end

    ForEachPreset("SectorOperation", function(preset, group, ...)
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
