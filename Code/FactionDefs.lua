--- ====================================================================================================
--- Holds all faction related definitions for the editor.
--- @author Soundwave2142
--- ====================================================================================================

--- ====================================================================================================
--- @class FinalStandFactionDef
--- ====================================================================================================
DefineClass.FinalStandFactionDef = {
    __parents = { "MsgReactionsPreset", "DisplayPreset" },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Modifiers",
            id = "moneyModifier",
            name = "Money Modifier",
            editor = "number",
            default = 0,
            scale = "%",
        },
        {
            category = "Modifiers",
            id = "xpModifier",
            name = "XP Modifier",
            editor = "number",
            default = 0,
            scale = "%",
        },
        {
            category = "Attire",
            id = "AttirePools",
            name = "Attire Pools",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandFactionAttire",
        },
    },

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

--- ====================================================================================================
--- @class FinalStandFactionAttire
--- ====================================================================================================

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

--- ====================================================================================================
--- @class FinalStandFriendlyFactionDef
--- ====================================================================================================
DefineClass.FinalStandFriendlyFactionDef = {
    __parents = { "FinalStandFactionDef" },
    __generated_by_class = "PresetDef",

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

--- ====================================================================================================
--- @class FinalStandEnemyFactionDef
--- ====================================================================================================
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

        print('checking for squad ', squad.Squad, isAllowed)
    end

    return pool
end

DefineModItemPreset(
    "FinalStandEnemyFactionDef",
    { EditorName = "Final Stand Enemy Faction", EditorSubmenu = "Final Stand" }
)

--- ====================================================================================================
--- @class FinalStandEnemyFactionSquad
--- ====================================================================================================
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
    },

    EditorView = Untranslated("<Squad> (<Waves>)"),
}

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
    for _, wave in pairs(split(self.Waves, ',')) do
        limit[tostring(wave)] = true
    end

    return limit
end

function split(inputstr, sep)
    sep = sep or '%s'
    local t = {}
    for field, s in string.gmatch(inputstr, "([^" .. sep .. "]*)(" .. sep .. "?)") do
        table.insert(t, field)
        if s == "" then return t end
    end
end
