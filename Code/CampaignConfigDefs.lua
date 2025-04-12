--- ===================================================================================================================
--- This file extends default games CampaignPreset with a pointer to Final Stand config. This will allow the game code
--- to know exactly when to apply logic and what parameters to use.
---
--- CampaignPresetFinalStandConfig hold information about Factions, Enemy Factions, Lengths (Waves) and basic values
--- like baseMoney and baseXP rewards for the game, attackTimeMin + attackTimeMax and attackTimeIncludeMercArrivalTime
--- for defining how fast each wave will come.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- ===================================================================================================================
--- Extend CampaignPreset with additional FinalStand related parameters
--- ===================================================================================================================

AppendClass.CampaignPreset = {
    properties = {
        {
            category = "FinalStand",
            id = 'IsFinalStand',
            name = "Is Final Stand",
            editor = "bool",
            default = false,
            help = "Will define campaign as Final Stand and trigger all related functionality"
        },
        {
            category = "FinalStand",
            id = 'FinalStandConfigs',
            name = "Configs",
            editor = "nested_list",
            default = false,
            base_class = "CampaignPresetFinalStandConfig",
            help = "Will allow player to choose different types of configs altering the game"
        },
    }
}

--- @return (string|void)
function CampaignPreset:GetError()
    if self:ResolveValue('IsFinalStand') and #(self:ResolveValue('FinalStandConfigs')) < 1 then
        return "At least one Final Stand Config is required"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class CampaignPresetFinalStandConfig
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.CampaignPresetFinalStandConfig = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "General",
            id = "Config",
            name = "Config",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandConfigDef",
        }
    },

    EditorView = Untranslated("<Config>"),
}

--- @return (string|void)
function CampaignPresetFinalStandConfig:GetError()
    if not self:ResolveValue('Config') then
        return "Specify Final Stand Config"
    end
end

--- ===================================================================================================================
--- Describe base Final Stand Config definition and it's children.
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigDef = {
    __parents = { "MsgReactionsPreset", "DisplayPreset" },
    __generated_by_class = "PresetDef",

    properties = {
        -- category - Map and Length
        {
            category = "Map and Length",
            id = "Sectors",
            name = "Sectors",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandConfigSector",
        },
        {
            category = "Map and Length",
            id = "Lengths",
            name = "Lengths",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandConfigLength",
        },
        -- category - Factions
        {
            category = "Factions",
            id = "Factions",
            name = "Player Factions",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandConfigFaction",
        },
        {
            category = "Factions",
            id = "EnemyFactions",
            name = "Enemy Factions",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandConfigEnemyFaction",
        },
        -- category - Attack
        {
            category = "Attack",
            id = "attackTimeMin",
            name = "Minimum Attack Time",
            help = "Minimum Attack Time in between waves (in hours)",
            editor = "number",
            default = 2
        },
        {
            category = "Attack",
            id = "attackTimeMax",
            name = "Maximum Attack Time",
            help = "Maximum Attack Time in between waves (in hours)",
            editor = "number",
            default = 5
        },
        {
            category = "Attack",
            id = "attackTimeIncludeMercArrivalTime",
            name = "Include Merc arrival time for Attack Time",
            help =
            "If check, default Merc arrival time will be included in Attack Time in between waves calculation, this will ensure player can recruit more Mercs in time.",
            editor = "bool",
            default = true
        },
        -- category - Rewards
        {
            category = "Rewards",
            id = "baseMoney",
            name = "Base Money Reward",
            help =
            "Base Money Reward per wave, additional modifier applied to it such as: faction modifier and map modifier",
            editor = "number",
            default = 5000
        },
        {
            category = "Rewards",
            id = "baseXp",
            name = "Base XP Reward",
            help =
            "Base XP Reward for all squads per wave, additional modifier applied to it such as: faction modifier and map modifier",
            editor = "number",
            default = 5000
        }
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandConfigs",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Config",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation =
    "Creates a config definition for Final Stand gamemode. Configurations holds information or pointers to everything Final Stand.",
}

--- @return (string|void)
function FinalStandConfigDef:GetError()
    if #(self:ResolveValue('Sectors')) < 1 then
        return "Specify at least one Sector"
    end

    if #(self:ResolveValue('Lengths')) < 1 then
        return "Specify at least one Final Stand Length"
    end

    if #(self:ResolveValue('Factions')) < 1 then
        return "Specify at least one Final Stand Faction"
    end

    if #(self:ResolveValue('EnemyFactions')) < 1 then
        return "Specify at least one Final Stand Enemy Faction"
    end

    if self.attackTimeMin > self.attackTimeMax then
        return "Minimum Attack Time cannot be bigger than Maximum Attack Time"
    end
end

DefineModItemPreset("FinalStandConfigDef", { EditorName = "Final Stand Config", EditorSubmenu = "Final Stand" })

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigSector
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigSector = {
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
function FinalStandConfigSector:GetError()
    if not self:ResolveValue('Sector') then
        return "Specify Final Stand Sector"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigLength
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigLength = {
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
function FinalStandConfigLength:GetError()
    if not self:ResolveValue('Length') then
        return "Specify Final Stand Length"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigFaction
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigFaction = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            id = "Faction",
            name = "Faction",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandFriendlyFactionDef",
        }
    },

    EditorView = Untranslated("<Faction>"),
}

--- @return (string|void)
function FinalStandConfigFaction:GetError()
    if not self:ResolveValue('Faction') then
        return "Specify Final Stand Faction"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigEnemyFaction
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigEnemyFaction = {
    __parents = { "PropertyObject" },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "General",
            id = "Faction",
            name = "Faction",
            editor = "preset_id",
            default = false,
            template = true,
            preset_class = "FinalStandEnemyFactionDef",
        }
    },

    EditorView = Untranslated("<Faction>"),
}

--- @return (string|void)
function FinalStandConfigEnemyFaction:GetError()
    if not self:ResolveValue('Faction') then
        return "Specify Final Stand Enemy Faction"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandSectorDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandSectorDef = {
    __parents = { "MsgReactionsPreset", "DisplayPreset" },
    __generated_by_class = "PresetDef",

    properties = {
        {
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
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Sector",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation = "Creates a sector definition for Final Stand game-mode.",
}

DefineModItemPreset("FinalStandSectorDef", { EditorName = "Final Stand Sector", EditorSubmenu = "Final Stand" })

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandLengthDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandLengthDef = {
    __parents = { "MsgReactionsPreset", "DisplayPreset" },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Length",
            id = "maxWaves",
            name = "Waves",
            editor = "number",
            default = 3
        },
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandLengths",
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

    if maxWaves > 100 then
        return "You cannot define more than 100 waves"
    end
end

DefineModItemPreset("FinalStandLengthDef", { EditorName = "Final Stand Length", EditorSubmenu = "Final Stand" })
