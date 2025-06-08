--- ===================================================================================================================
--- This file holds defs and functions for the editor. Based on these defs Appearance.lua generates presets for
--- characters to use.
---
--- @author Soundwave2142
--- ===================================================================================================================

local function GetEntityClassInherits(entity_class, skip_none, filter)
    local inherits = ClassLeafDescendantsList(entity_class, function(class)
        return not table.find(filter, class)
    end)

    if not skip_none then
        table.insert(inherits, 1, "")
    end

    return inherits
end

function GetFinalStandAttirePoolItems(part, gender)
    return GetEntityClassInherits(part .. gender)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolDef = {
    __parents = { "Preset" },
    __generated_by_class = "PresetDef",

    properties = {
        -- Group - Limits
        {
            category = "Limits",
            id = "Specialization",
            name = "Specialization",
            editor = "combo",
            default = "",
            items = function(self) return PresetGroupCombo("MercSpecializations", "Default") end,
        },
        {
            category = "Limits",
            id = "ChanceToRollForHead",
            name = "Chance to roll for head item",
            editor = "number",
            default = 0,
            scale = "%",
            min = 0,
            max = 100
        },
        -- Group - Attire - Head
        {
            category = "Attire",
            id = "Colors",
            name = "Colors",
            editor = "nested_list",
            default = false,
            base_class = "ColorizationPropSet",
        },
        {
            category = "Attire - Head",
            id = "Hat",
            name = "Hats",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolHat",
        },
        {
            category = "Attire - Head",
            id = "Hat2",
            name = "Hats2",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolHat2",
        },
        {
            category = "Attire - Head",
            id = "Head",
            name = "Heads",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolHead",
        },
        {
            category = "Attire - Body",
            id = "Body",
            name = "Bodies",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolBody",
        },
        {
            category = "Attire - Body",
            id = "Shirt",
            name = "Shirts",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolShirt",
        },
        {
            category = "Attire - Body",
            id = "Armor",
            name = "Armors",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolArmor",
        },
        {
            category = "Attire - Body",
            id = "Chest",
            name = "Chests",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolChest",
        },
        {
            category = "Attire - Pants",
            id = "Hip",
            name = "Hips",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolHip",
        },
        {
            category = "Attire - Pants",
            id = "Pants",
            name = "Pants",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandAttirePoolPants",
        },
    },

    HasGroups = true,
    HasSortKey = false,
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

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolItem
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolItem = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "Colors",
            id = "Colors",
            name = "Colors",
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
        }
    }
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolHat
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
            id = "RollForHat2",
            name = "Allow to Roll for Hat2",
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

    EditorView = Untranslated("<Gender> - <Hat>"),
}

function FinalStandAttirePoolHat:GetEditorView()
    local view = ' - <Hat>'

    local gender = self:ResolveValue('Gender')
    view = (gender ~= '' and '<Gender>' or 'No Gender') .. view
    view = view .. (self:ResolveValue('HideHair') and ' - Hides Hair' or '')
    local hatSpot = self:ResolveValue('HatSpot')
    view = view .. (hatSpot and ' - ' .. hatSpot or '')

    return Untranslated(view)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolHat2
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolHat2 = {
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
            id = "Hat2",
            name = "Hat2",
            editor = "combo",
            default = false,
            items = function(self) return GetCharacterHatComboItems() end,
        },
        {
            id = "Hat2Spot",
            name = "Hat2 Spot",
            help = "Where to attach the hat",
            editor = "combo",
            default = "Head",
            items = function(self) return { "Head", "Origin" } end,
        },
        {
            id = "Hat2AttachOffsetX",
            name = "Hat2 Attach Offset X",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "Hat2AttachOffsetY",
            name = "Hat2 Attach Offset Y",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "Hat2AttachOffsetZ",
            name = "Hat2 Attach Offset Z",
            editor = "number",
            default = false,
            scale = "cm",
            slider = true,
            min = -50,
            max = 50,
        },
        {
            id = "Hat2AttachOffsetAngle",
            name = "Hat2 Attach Offset Angle",
            editor = "number",
            default = false,
            scale = "deg",
            slider = true,
            min = -18000,
            max = 10800,
        },
    },

    EditorView = Untranslated("<Gender> - <Hat>"),
}

function FinalStandAttirePoolHat2:GetEditorView()
    local view = ' - <Hat2>'

    local gender = self:ResolveValue('Gender')
    view = (gender ~= '' and '<Gender>' or 'No Gender') .. view
    view = view .. (self:ResolveValue('HideHair') and ' - Hides Hair' or '')
    local hatSpot = self:ResolveValue('Hat2Spot')
    view = view .. (hatSpot and ' - ' .. hatSpot or '')

    return Untranslated(view)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolHead
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolHead = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Head",
            name = "Head",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterHead', self:ResolveValue('Gender')) end,
        },
    },

    EditorView = Untranslated("<Gender> - <Head>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolBody
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolBody = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Body",
            name = "Body",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterBody', self:ResolveValue('Gender')) end,
        },
        {
            id = "BodyColorKey",
            name = "Body Color",
            editor = "combo",
            default = "",
            items = function(self) return { "", "EditableColor1", "EditableColor2", "EditableColor3" } end,
        },
    },

    EditorView = Untranslated("<Gender> - <Body>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolShirt
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolShirt = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Shirt",
            name = "Shirt",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterShirts', self:ResolveValue('Gender')) end,
        },
        {
            id = "BodyColorKey",
            name = "Body Color Key",
            editor = "combo",
            default = "",
            items = function(self) return { "", "EditableColor1", "EditableColor2", "EditableColor3" } end,
        },
    },

    EditorView = Untranslated("<Gender> - <Shirt>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolArmor
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolArmor = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Armor",
            name = "Armor",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterArmor', self:ResolveValue('Gender')) end,
        }
    },

    EditorView = Untranslated("<Gender> - <Armor>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolChest
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolChest = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Chest",
            name = "Chest",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterChest', self:ResolveValue('Gender')) end,
        },
        {
            id = "ChestSpot",
            name = "Chest Spot",
            help = "Where to attach the chest",
            editor = "combo",
            default = "Torso",
            items = function(self) return { "Torso", "Origin" } end,
        },
    },

    EditorView = Untranslated("<Gender> - <Chest>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolHip
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolHip = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Hip",
            name = "Hip",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterHip', self:ResolveValue('Gender')) end,
        },
        {
            id = "HipSpot",
            name = "Hip Spot",
            help = "Where to attach the hat",
            editor = "combo",
            default = "Groin",
            items = function(self) return { "Groin", "Origin" } end,
        },
    },

    EditorView = Untranslated("<Gender> - <Hip>"),
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandAttirePoolPants
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandAttirePoolPants = {
    __parents = { "FinalStandAttirePoolItem" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Pants",
            name = "Pants",
            editor = "combo",
            default = false,
            items = function(self) return GetFinalStandAttirePoolItems('CharacterPants', self:ResolveValue('Gender')) end,
        },
    },

    EditorView = Untranslated("<Gender> - <Pants>"),
}
