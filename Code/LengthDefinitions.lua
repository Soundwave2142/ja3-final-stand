--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandLengthSelector
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandLengthSelector = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Length",
            name = "Length",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandLengthDef",
        }
    },

    EditorView = Untranslated("<Length>"),
}

--- @return (string|void)
function FinalStandLengthSelector:GetError()
    if not self:ResolveValue('Length') then
        return "Specify Final Stand Length"
    end
end

--- @param asObject boolean
--- @return (string|Preset|nil)
function FinalStandSectorSelector:GetSelectorValue(asObject)
    local value = self:ResolveValue('Length')

    if asObject then
        return FinalStandLengths[value]
    end

    return value
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandLengthDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandLengthDef = {
    __parents = {
        "MsgReactionsPreset",
        "DisplayPreset",
        "FinalStandConfigSpecificPreset",
        "FinalStandModifiersAwarePreset",
        "FinalStandStarterLootAwarePreset",
        "FinalStandWaveLootAwarePreset"
    },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "General",
            id = "endVictoryText",
            name = "End Victory Text",
            editor = "text",
            default = false,
            translate = true,
            lines = 3,
            max_lines = 20,
        },
        {
            category = "General",
            id = "endFailureText",
            name = "End Failure Text",
            editor = "text",
            default = false,
            translate = true,
            lines = 3,
            max_lines = 20,
        },
        {
            category = "Length",
            id = "maxWaves",
            name = "Waves",
            editor = "number",
            default = 3
        },
        {
            category = "Length",
            id = "tierModifier",
            name = "BobbyRays's Tier Modifier",
            editor = "number",
            default = 1,
            help = "Defines by how much BobbyRay's tier will be increased each wave."
        },
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandLengths",
    PreGameObjectName = "finalStandLength",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Wave",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a wave definition for Final Stand game-mode.",
}

--- @return (string|void)
function FinalStandLengthDef:GetError()
    local maxWaves = self:ResolveValue('maxWaves')

    if not maxWaves then
        return "Specify the waves amount"
    end

    if maxWaves < 1 then
        return "Wave amount needs to be bigger than 1"
    end

    if maxWaves > 255 then
        return "You cannot define more than 255 waves"
    end
end

DefineModItemPreset(
    "FinalStandLengthDef",
    { EditorName = "Final Stand Length", EditorSubmenu = "Final Stand" }
)
