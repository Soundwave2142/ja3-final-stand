--- ====================================================================================================
--- Holds all attire related definitions for the editor.
--- @author Soundwave2142
--- ====================================================================================================
local function GetEntityClassInherits(entity_class, skip_none, filter)
    local inherits = ClassLeafDescendantsList(entity_class, function(class)
        return not table.find(filter, class)
    end)

    if not skip_none then
        table.insert(inherits, 1, "")
    end

    return inherits
end

function GetFinalStandAttirePoolBody(gender)
    return GetEntityClassInherits("CharacterBody" .. gender)
end

function GetFinalStandAttirePoolPants(gender)
    return GetEntityClassInherits("CharacterPants" .. gender)
end

--- ====================================================================================================
--- @class FinalStandAttirePoolDef
--- ====================================================================================================
DefineClass.FinalStandAttirePoolDef = {
    __parents = { "Preset" },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Limits",
            id = "Specialization",
            name = "Specialization",
            editor = "combo",
            default = "",
            items = function(self) return PresetGroupCombo("MercSpecializations", "Default") end,
        },
        {
            category = "Attire",
            id = "Colors",
            name = "Colors",
            editor = "nested_list",
            default = false,
            base_class = "ColorizationPropSet",
        },
        {
            category = "Attire",
            id = "Hat",
            name = "Hats",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolHat",
        },
        {
            category = "Attire",
            id = "Body",
            name = "Body",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolBody",
        },
        {
            category = "Attire",
            id = "Pants",
            name = "Pants",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolPants",
        },
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandAttirePools",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Attire",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a attire definition to be used in factions for Final Stand game-mode.",
}

DefineModItemPreset(
    "FinalStandAttirePoolDef",
    { EditorName = "Final Stand Attire Pool", EditorSubmenu = "Final Stand" }
)

--- ====================================================================================================
--- @class FinalStandAttirePoolItem
--- ====================================================================================================
DefineClass.FinalStandAttirePoolItem = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "Colors",
            id = "Color",
            name = "Color",
            editor = "nested_list",
            default = false,
            base_class = "ColorizationPropSet",
        },
        {
            category = "Colors",
            id = "IgnoreFactionColorPool",
            name = "Ignore General Color Pool",
            editor = "bool",
            default = false
        },
        {
            category = "Limits",
            id = "Gender",
            name = "Gender",
            editor = "combo",
            default = "",
            items = function(self) return { "", "Male", "Female" } end,
        },
        {
            category = "Limits",
            id = "Waves",
            name = "Limit to waves",
            help = "You can limit this attire to certain waves, format should be like this:'5,6,7' ",
            editor = "text",
            default = "",
        }
    }
}

--- ====================================================================================================
--- @class FinalStandAttirePoolHat
--- ====================================================================================================
DefineClass.FinalStandAttirePoolHat = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "HideHair",
            name = "Hide Hair",
            editor = "bool",
            default = true
        },
        {
            id = "Hat",
            name = "Hat",
            editor = "combo",
            default = false,
            items = function(self) return GetCharacterHatComboItems() end,
        },
        {
            id = "HatSpot",
            name = "Hat Spot",
            help = "Where to attach the hat",
            editor = "combo",
            default = "Head",
            items = function(self) return { "Head", "Origin" } end,
        },
        {
            id = "HatAttachOffsetX",
            name = "Hat Attach Offset X",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "HatAttachOffsetY",
            name = "Hat Attach Offset Y",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "HatAttachOffsetZ",
            name = "Hat Attach Offset Z",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "HatAttachOffsetAngle",
            name = "Hat Attach Offset Angle",
            editor = "number",
            default = false,
            scale = "deg",
            slider = true,
            min = -18000,
            max = 10800,
        },
    },

    EditorView = Untranslated("<Hat>"),
}

--- ====================================================================================================
--- @class FinalStandAttirePoolBody
--- ====================================================================================================
DefineClass.FinalStandAttirePoolBody = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Body",
            name = "Body",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolBody(self:ResolveValue('Gender')) end,
        },
        {
            id = "BodyColorKey",
            name = "Body Color Key",
            editor = "combo",
            default = "",
            items = function(self) return { "", "EditableColor1", "EditableColor2", "EditableColor3" } end,
        },
    },

    EditorView = Untranslated("<Gender> - <Body>"),
}

--- ====================================================================================================
--- @class FinalStandAttirePoolPants
--- ====================================================================================================
DefineClass.FinalStandAttirePoolPants = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Pants",
            name = "Pants",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolPants(self:ResolveValue('Gender')) end,
        },
    },

    EditorView = Untranslated("<Gender> - <Pants>"),
}
