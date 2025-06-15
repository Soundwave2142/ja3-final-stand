--- ===================================================================================================================
--- Holds all faction related definitions for the editor.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFactionDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFactionDef = {
    __parents = {
        "MsgReactionsPreset",
        "DisplayPreset",
        "FinalStandModifiersAwarePreset",
        "FinalStandStarterLootAwarePreset"
    },
    __generated_by_class = "PresetDef",

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandFriendlyFactions",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Faction",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a friendly faction definition for Final Stand game-mode.",
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFriendlyFactionDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFriendlyFactionDef = {
    __parents = { "FinalStandFactionDef" },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Attire",
            id = "AttirePools",
            name = "Attire Pools",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandFactionAttire",
        }
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandFriendlyFactions",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Friendly Faction",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a friendly faction definition for Final Stand game-mode.",
}

DefineModItemPreset(
    "FinalStandFriendlyFactionDef",
    { EditorName = "Final Stand Friendly Faction", EditorSubmenu = "Final Stand" }
)

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFactionAttire
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFactionAttire = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "AttirePool",
            name = "Attire Pool",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandAttirePoolDef",
        }
    },

    EditorView = Untranslated("<AttirePool>"),
}

--- @return (string|void)
function FinalStandFactionAttire:GetError()
    if not self:ResolveValue('AttirePool') then
        return "Specify the pool"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandEnemyFactionDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandEnemyFactionDef = {
    __parents = { "FinalStandFactionDef" },
    __generated_by_class = "PresetDef",

    properties = {
        {
            id = "Squads",
            name = "Squads",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandEnemyFactionSquad",
        },
        {
            id = "ExtraSquads",
            name = "Extra Squads",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandEnemyFactionSquad",
        },
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandEnemyFactions",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Enemy Faction",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates an enemy faction definition for Final Stand game-mode.",
}

--- @return (string|void)
function FinalStandEnemyFactionDef:GetError()
    if #self:ResolveValue('Squads') == 0 then
        return "Specify at least one squad"
    end
end

--- @param wave number
--- @param isFromExtraPool boolean
--- @return table
function FinalStandEnemyFactionDef:GetPoolForWave(wave, isFromExtraPool)
    local pool = {}

    local enemySquads = self:ResolveValue('Squads')
    if isFromExtraPool then
        enemySquads = self:ResolveValue('ExtraSquads')
    end

    --- @param squad FinalStandEnemyFactionSquad
    for _, squad in pairs(enemySquads) do
        local isAllowed = squad:IsAllowedForWave(wave)

        if isAllowed then
            table.insert(pool, squad.Squad)
        end
    end

    return pool
end

DefineModItemPreset(
    "FinalStandEnemyFactionDef",
    { EditorName = "Final Stand Enemy Faction", EditorSubmenu = "Final Stand" }
)

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandEnemyFactionSquad
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandEnemyFactionSquad = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Squad",
            name = "Squad ID",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "EnemySquads",
        },
        {
            category = "Limits",
            id = "Waves",
            name = "Limit to waves",
            help = "You can limit these units to spawn only in certain waves, format should be like this:'5,6,7' ",
            editor = "text",
            default = "",
        }
    }
}

--- @return string
function FinalStandEnemyFactionSquad:GetEditorView()
    local power = self.Squad and EnemySquadDefs[self.Squad]:ResolveValue('SquadPowerRange') or ""
    return string.format("%s | %s | %s", power, self.Waves, self.Squad)
end

--- @return (string|void)
function FinalStandEnemyFactionSquad:GetError()
    if not self:ResolveValue('Squad') then
        return "Specify the squad"
    end
end

--- @param wave number
--- @return boolean
function FinalStandEnemyFactionSquad:IsAllowedForWave(wave)
    return self:GetAllowedWaves()[tostring(wave)]
end

--- @return table
function FinalStandEnemyFactionSquad:GetAllowedWaves()
    local limit = {}
    local waves = string.split(self.Waves, ',')

    for _, wave in pairs(waves) do
        limit[tostring(wave)] = true
    end

    return limit
end
