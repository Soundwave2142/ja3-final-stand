--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSectorSelector
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSectorSelector = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Sector",
            name = "Sector",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandSectorDef",
        }
    },

    EditorView = Untranslated("<Sector>"),
}

--- @return (string|void)
function FinalStandSectorSelector:GetError()
    if not self:ResolveValue('Sector') then
        return "Specify Final Stand Sector"
    end
end

--- @param asObject boolean
--- @return (string|Preset|nil)
function FinalStandSectorSelector:GetSelectorValue(asObject)
    local value = self:ResolveValue('Sector')

    if asObject then
        return FinalStandSectors[value]
    end

    return value
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSectorDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSectorDef = {
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
            id = "Sector",
            name = "Sector",
            help = "The sector in which the player can choose to start a campaign",
            editor = "text",
            default = "A1",
        }
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandSectors",
    PreGameObjectName = "finalStandSector",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Sector",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a sector definition for Final Stand game-mode.",
}

DefineModItemPreset("FinalStandSectorDef", { EditorName = "Final Stand Sector", EditorSubmenu = "Final Stand" })
