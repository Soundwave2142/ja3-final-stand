--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @EXTEND CampaignPreset
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
AppendClass.CampaignPreset = {
    properties = {
        {
            category = "FinalStand",
            id = 'IsFinalStand',
            name = "Is Final Stand",
            editor = "bool",
            default = false,
            help = "Will define campaign as Final Stand and trigger all related functionality"
        }
    }
}

--- @return (string|void)
function CampaignPreset:GetError()
    local configs = self:GetFinalStandConfigs()

    if #configs < 1 then
        return "At least one Final Stand Config is required"
    end
end

--- @return table
function CampaignPreset:GetFinalStandConfigs()
    local configs = {}

    ForEachPreset("FinalStandConfigDef", function(preset, preset_group, campaignId)
        if preset:IsRelatedToCampaign(campaignId) then
            configs[#configs + 1] = preset
        end
    end, self.id)

    return GetSortedCollection(configs)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandCampaignSpecific
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandCampaignSpecific = {
    __parents = { "PropertyObject", },
    __generated_by_class = "ClassDef",

    properties = {
        {
            category = "General",
            id = "Campaign",
            name = "Campaign",
            help = "The relevant Final Stand campaign for this preset.",
            editor = "choice",
            default = "FinalStand",
            items = function(self)
                local items = { "<all>" }

                ForEachPreset("CampaignPreset", function(preset, preset_group, presets)
                    if preset:ResolveValue("IsFinalStand") then
                        presets[#presets + 1] = preset.id
                    end
                end, items)

                return items
            end,
        }
    },
}

--- @return (string|boolean)
function FinalStandCampaignSpecific:GetError()
    if not self:ResolveValue('Campaign') then
        return "Specify Final Stand Config"
    end
end

--- @return boolean
function FinalStandCampaignSpecific:IsRelatedToCampaign(campaign)
    local presetCampaign = self:ResolveValue('Campaign')
    return presetCampaign == "<all>" or presetCampaign == campaign
end

--- @return boolean
function FinalStandCampaignSpecific:IsRelatedToCurrentCampaign()
    return self:IsRelatedToCampaign(GetCurrentCampaignPreset().id)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @EXTEND UnitProperties
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
AppendClass.UnitProperties = {
    properties = {
        {
            category = "General",
            id = 'IsFinalStandOnly',
            name = "Is Final Stand Only",
            editor = "bool",
            default = false,
            template = true,
            help = "Will define merc as Final Stand only and will not appear in other campaigns."
        }
    }
}

local BaseIsMetAIMMerc = IsMetAIMMerc

--- Overriden in order to hide duplicated+altered versions of Secret Mercs for FS in Non-FS campaigns.
--- @param merc table
function IsMetAIMMerc(merc)
    local showMerc = BaseIsMetAIMMerc(merc)

    if not IsFinalStand() and showMerc then
        return merc:ResolveValue('IsFinalStandOnly') ~= true
    end

    return showMerc
end
