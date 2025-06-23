--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigSelector
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigSelector = {
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
function FinalStandConfigSelector:GetError()
    if not self:ResolveValue('Config') then
        return "Specify Final Stand Config"
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigDef
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigDef = {
    __parents = {
        "FinalStandCampaignSpecific",
        "MsgReactionsPreset",
        "DisplayPreset"
    },
    __generated_by_class = "PresetDef",

    properties = {
        -- category - General
        {
            category = "General",
            id = "AimGoldPrice",
            name = "A.I.M. Gold Price",
            editor = "number",
            default = 20000
        },
        -- category - Map and Length
        {
            category = "Map and Length",
            id = "Sectors",
            name = "Sectors",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandSectorSelector",
        },
        {
            category = "Map and Length",
            id = "Lengths",
            name = "Lengths",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandLengthSelector",
        },
        -- category - Factions
        {
            category = "Factions",
            id = "Factions",
            name = "Player Factions",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandFriendlyFactionSelect",
        },
        {
            category = "Factions",
            id = "EnemyFactions",
            name = "Enemy Factions",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandEnemyFactionSelector",
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
        },
        {
            category = "Rewards",
            id = "baseLoyalty",
            name = "Base Loyalty Reward",
            help =
            "Base Loyalty Reward for sector per wave, additional modifier applied to it such as: faction modifier and map modifier",
            editor = "number",
            default = 5
        },
        {
            category = "Rewards",
            id = "loyaltyIncreasesMoney",
            name = "Loyalty Increases Money",
            help =
            "Money reward will additionally be increased on current loyalty. Calculated before loyalty reward given to the player.",
            editor = "bool",
            default = true
        },
        {
            category = "Rewards",
            id = "loyaltyIncreasesXP",
            name = "Loyalty Increases XP",
            help =
            "XP reward will additionally be increased on current loyalty. Calculated before loyalty reward given to the player.",
            editor = "bool",
            default = true
        },
        {
            category = "Merc Stats Gaining System",
            id = "statSystemUseFinalStand",
            name = "Use Final Stand Stat System",
            help =
            "If ticked, stat gaining system will be calculated differently from the base game.",
            editor = "bool",
            default = true
        },
        {
            category = "Merc Stats Gaining System",
            id = "statSystemPerRollCooldown",
            name = "Per Roll Cooldown",
            help =
            "Amount of successful rolls that will be ignored until finally granting the stat gain.",
            editor = "number",
            default = 5
        },
        {
            category = "Merc Stats Gaining System",
            id = "statSystemPerWaveMax",
            name = "Per Wave Limit",
            help =
            "Amount of times stat can be gained per wave.",
            editor = "number",
            default = 10
        },
    },

    HasGroups = false,
    HasSortKey = true,
    HasParameters = true,
    GlobalMap = "FinalStandConfigs",
    PreGameObjectName = "finalStandConfig",
    EditorNestedObjCategory = "Final Stand",
    EditorMenubarName = "Final Stand Config",
    EditorIcon = "CommonAssets/UI/Icons/bullet list.png",
    EditorMenubar = "Editors.Lists",
    Documentation =
    "Creates a config definition for Final Stand gamemode. Configurations holds information or pointers to everything Final Stand.",
}

--- @return (string|void)
function FinalStandConfigDef:GetError()
    if #self:GetAllSectors() < 1 then
        return "Specify at least one Sector"
    end

    if #self:GetAllLengths() < 1 then
        return "Specify at least one Final Stand Length"
    end

    if #self:GetAllFriendlyFactions() < 1 then
        return "Specify at least one Final Stand Faction"
    end

    if #self:GetAllEnemyFactions() < 1 then
        return "Specify at least one Final Stand Enemy Faction"
    end

    if self:ResolveValue("attackTimeMin") > self:ResolveValue("attackTimeMax") then
        return "Minimum Attack Time cannot be bigger than Maximum Attack Time"
    end
end

--- @return boolean
function FinalStandConfigDef:IsValidConfig()
    return not self:GetError()
end

--- @param class string
--- @param asObjects boolean
--- @param configPropertyName string
--- @return table
function FinalStandConfigDef:GetAllRelated(class, asObjects, configPropertyName)
    local items = {}

    ForEachPreset(class, function(preset, preset_group, configId)
        if preset:IsRelatedToConfig(configId) then
            items[#items + 1] = asObjects and preset or preset.id
        end
    end, self.id)

    if configPropertyName then
        local relations = self:ResolveValue(configPropertyName)

        if relations and #relations > 0 then
            for _, relation in pairs(relations) do
                local related = relation:GetSelectorValue(asObjects)

                if related then
                    items[#items + 1] = relation:GetSelectorValue(asObjects)
                end
            end
        end
    end

    return asObjects and GetSortedCollection(items) or items
end

--- @param asObjects boolean
--- @return table
function FinalStandConfigDef:GetAllSectors(asObjects)
    return self:GetAllRelated("FinalStandSectorDef", asObjects, "Sectors")
end

--- @param asObjects boolean
--- @return table
function FinalStandConfigDef:GetAllLengths(asObjects)
    return self:GetAllRelated("FinalStandLengthDef", asObjects, "Lengths")
end

--- @param asObjects boolean
--- @return table
function FinalStandConfigDef:GetAllFriendlyFactions(asObjects)
    return self:GetAllRelated("FinalStandFriendlyFactionDef", asObjects, "Factions")
end

--- @param asObjects boolean
--- @return table
function FinalStandConfigDef:GetAllEnemyFactions(asObjects)
    return self:GetAllRelated("FinalStandEnemyFactionDef", asObjects, "EnemyFactions")
end

DefineModItemPreset(
    "FinalStandConfigDef",
    { EditorName = "Final Stand Config", EditorSubmenu = "Final Stand" }
)

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigSpecificPreset
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigSpecificPreset = {
    __parents = { "PropertyObject", },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "General",
            id = "FinalStandConfigs",
            name = "Configs",
            editor = "nested_list",
            default = false,
            base_class = "FinalStandConfigSelector",
            help = "Defines to which Final Stand configs this preset belongs to"
        },
    },
}

--- @return (string|void)
function FinalStandConfigSpecificPreset:GetError()
    local configs = self:ResolveValue("FinalStandConfigs")

    if #configs < 1 then
        return "At least one Final Stand Config is required"
    end
end

--- @param configId string
--- @return boolean
function FinalStandConfigSpecificPreset:IsRelatedToConfig(configId)
    local configs = self:ResolveValue("FinalStandConfigs")

    for _, supportedConfig in pairs(configs) do
        if configId == supportedConfig:ResolveValue("Config") then
            return true
        end
    end

    return false
end

--- @return boolean
function FinalStandConfigSpecificPreset:IsRelatedToCurrentConfig()
    local config = GetFinalStandConfig()

    if not config then
        return false
    end

    return self:IsRelatedToConfig(config.id)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandModifiersAwarePreset
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandModifiersAwarePreset = {
    __parents = { "Preset", },
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
            category = "Modifiers",
            id = "loyaltyModifier",
            name = "Loyalty Modifier",
            editor = "number",
            default = 0,
            scale = "%",
        }
    }
}

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandStarterLootAwarePreset
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandStarterLootAwarePreset = {
    __parents = { "Preset", },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Equipment",
            id = "StartingEquipmentGeneration",
            name = "Starting Equipment Generation",
            editor = "combo",
            default = "All",
            items = function(self) return { "All", "Random" } end,
            help = "Full list or random loot def from the list will be provided to player."
        },
        {
            category = "Equipment",
            id = "StartingEquipment",
            name = "Starting Equipment",
            editor = "preset_id_list",
            default = {},
            template = true,
            editor_preview = true,
            preset_class = "LootDef",
            item_default = "",
            help = "Will be generated for player squad upon start of the game."
        }
    }
}

--- @param list table
function FinalStandStarterLootAwarePreset:AppendStartingEquipmentToList(list)
    local startingEquipment = self:ResolveValue('StartingEquipment')
    local startingEquipmentGenMethod = self:ResolveValue('StartingEquipmentGeneration')

    if #startingEquipment < 1 then
        return
    end

    if startingEquipmentGenMethod == "Random" then
        local randomEquipmentId = startingEquipment[math.random(#startingEquipment)]

        if LootDefs[randomEquipmentId] then
            list[#list + 1] = LootDefs[randomEquipmentId]
        end
    else
        for _, startingEquipmentItem in ipairs(startingEquipment) do
            if LootDefs[startingEquipmentItem] then
                list[#list + 1] = LootDefs[startingEquipmentItem]
            end
        end
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandWaveLootAwarePreset
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandWaveLootAwarePreset = {
    __parents = { "Preset", },
    __generated_by_class = "PresetDef",

    properties = {
        {
            category = "Equipment",
            id = "WaveEquipmentGeneration",
            name = "Wave Completion Equipment Generation",
            editor = "combo",
            default = "All",
            items = function(self) return { "All", "Random" } end,
            help = "Full list or random loot def from the list will be provided to player."
        },
        {
            category = "Equipment",
            id = "WaveEquipment",
            name = "Wave Completion Equipment",
            editor = "preset_id_list",
            default = {},
            template = true,
            editor_preview = true,
            preset_class = "LootDef",
            item_default = "",
            help = "Will be generated for player upon beating a wave."
        }
    }
}

--- @param list table
function FinalStandWaveLootAwarePreset:AppendWaveEquipmentToList(list)
    local waveEquipment = self:ResolveValue('WaveEquipment')
    local waveEquipmentGenMethod = self:ResolveValue('WaveEquipmentGeneration')

    if #waveEquipment < 1 then
        return
    end

    if waveEquipmentGenMethod == "Random" then
        local randomEquipmentId = waveEquipment[math.random(#waveEquipment)]

        if LootDefs[randomEquipmentId] then
            list[#list + 1] = LootDefs[randomEquipmentId]
        end
    else
        for _, waveEquipmentItem in ipairs(waveEquipment) do
            if LootDefs[waveEquipmentItem] then
                list[#list + 1] = LootDefs[waveEquipmentItem]
            end
        end
    end
end

-- TODO: add FinalStandQuestLine with priority to trigger different quests depending on chose settings
