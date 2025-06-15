--- ===================================================================================================================
--- Handles UI of the mod. Currently main menu only.
---
--- First thing it does is generated templates by looking at configs of FinalStandConfigDef instances.
--- Second thing, it inserts main template of each final stand campaign config into menu layout.
--- Those templates are shown depending on currently selected items.
---
--- @author Soundwave2142
--- ===================================================================================================================

if FirstLoad then
    local FinalStandTemplateCreated = false

    function OnMsg.ModsReloaded()
        if FinalStandTemplateCreated then
            return
        end

        -- first, we need to generate basic templates that will be used in main
        FinalStandTemplatePresetsGenerator:GenerateEntryTemplates()

        -- second, we generate main template for each of the configs of final stand campaigns
        for id, campaign in pairs(CampaignPresets) do
            if campaign:ResolveValue('IsFinalStand') then
                FinalStandTemplatePresetsGenerator:GenerateForCampaign(campaign)
            end
        end

        FinalStandTemplateCreated = true
    end
end

--- @return boolean
function IsFinalStandSelected()
    return CampaignPresets[NewGameObj.campaignId]:ResolveValue('IsFinalStand')
end

--- @param mode string
--- @param mode_param table(?)
--- @param old_mode string
function OnMsg:DialogSetMode(mode, mode_param, old_mode)
    if mode == 'newgame02' and old_mode == 'newgame01' and IsFinalStandSelected() then
        Msg('FinalStandSelected', NewGameObj)
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandTemplatePresetsGenerator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandTemplatePresetsGenerator = {
    Structure = {
        {
            class = 'FinalStandSectorDef',
            globalName = 'FinalStandSectors',

            configRelationName = 'Sectors',
            configRelationKey = 'Sector',

            displayName = T(214200001000, "Final Stand - Sector"),
            gameObjName = 'finalStandSector'
        },
        {
            class = 'FinalStandLengthDef',
            globalName = 'FinalStandLengths',

            configRelationName = 'Lengths',
            configRelationKey = 'Length',

            displayName = T(214200001001, "Final Stand - Length"),
            gameObjName = 'finalStandLength'
        },
        {
            class = 'FinalStandFriendlyFactionDef',
            globalName = 'FinalStandFriendlyFactions',

            configRelationName = 'Factions',
            configRelationKey = 'Faction',

            displayName = T(214200001002, "Final Stand - Player Faction"),
            gameObjName = 'finalStandFriendlyFaction'
        },
        {
            class = 'FinalStandEnemyFactionDef',
            globalName = 'FinalStandEnemyFactions',

            configRelationName = 'EnemyFactions',
            configRelationKey = 'Faction',

            displayName = T(214200001003, "Final Stand - Enemy Faction"),
            gameObjName = 'finalStandEnemyFaction'
        }
    },
    FinalStandCommentId = 'New Game Menu - Final Stand Config'
}

--- @return table
function FinalStandTemplatePresetsGenerator:GetStructure()
    return self.Structure
end

--- @param campaign CampaignPreset
function FinalStandTemplatePresetsGenerator:GenerateForCampaign(campaign)
    for _, configRef in pairs(campaign:ResolveValue('FinalStandConfigs')) do
        local config = FinalStandConfigs[configRef:ResolveValue('Config')]
        local templateId = FinalStandTemplatePresetsGenerator:GenerateMainTemplate(config)

        if templateId then
            self:InsertIntoNewGame(templateId)
        end
    end
end

function FinalStandTemplatePresetsGenerator:InsertIntoNewGame(templateId)
    Msg('FinalStandBeforeUIInsert', templateId)

    local _, parent1, idx1 = UIFindControl("MainMenu", { __template = "NewGameMenuGameRules" })

    if parent1 then
        table.insert(parent1, 2, PlaceObj('XTemplateTemplate', {
            'comment', self.FinalStandCommentId,
            '__context', function(parent, context) return context end,
            '__template', templateId,
            '__condition', function(parent, context) return IsFinalStandSelected() end,
            'IdNode', false,
        }))
    end

    Msg("FinalStandUIInserted", parent1, templateId)
end

--- Generates a set of Entry XTemplate elements to be used in FinalStandTemplatePresetsGenerator:GenerateMainTemplates.
function FinalStandTemplatePresetsGenerator:GenerateEntryTemplates()
    for _, options in pairs(self.Structure) do
        local template = FinalStandTemplatePresetsGenerator:GenerateEntryTemplate(options.class, options.gameObjName)

        if not XTemplates[template.id] then
            PlaceObj('ModItemXTemplate', template)
        end
    end
end

--- Generates one Entry XTemplate elements to be used in FinalStandTemplatePresetsGenerator:GenerateMainTemplates.
--- @param class string
--- @param gameObjName string
function FinalStandTemplatePresetsGenerator:GenerateEntryTemplate(class, gameObjName)
    local onContextUpdate = self:GenerateOnContentUpdate(class, gameObjName)
    local onPress = self:GenerateOnPress(class, gameObjName)
    local id = "NewGameMenu" .. class .. "Entry"

    return {
        __is_kind_of = "XButton",
        comment = "Generated by UI handler - DO NOT EDIT!",
        group = "Zulu",
        id = id,
        PlaceObj('XTemplateWindow', {
            '__class', "XButton",
            'RolloverTemplate', "RolloverGenericFixedL",
            'RolloverAnchor', "right",
            'RolloverText', T(914391830806, --[[ModItemXTemplate NewGameMenuFinalStandEntry RolloverText]]
            "<description>"),
            'RolloverOffset', box(25, 0, 0, 0),
            'RolloverTitle', T(939410163843, --[[ModItemXTemplate NewGameMenuFinalStandEntry RolloverTitle]]
            "<display_name>"),
            'UIEffectModifierId', "MainMenuMainBar",
            'MinHeight', 64,
            'MaxHeight', 64,
            'LayoutMethod', "HList",
            'BorderColor', RGBA(0, 0, 0, 0),
            'Background', RGBA(255, 255, 255, 0),
            'OnContextUpdate', onContextUpdate,
            'FXPress', "CheckBoxClick",
            'FXPressDisabled', "activityAssignSelectDisabled",
            'FocusedBorderColor', RGBA(0, 0, 0, 0),
            'FocusedBackground', RGBA(128, 128, 128, 0),
            'DisabledBorderColor', RGBA(0, 0, 0, 0),
            'OnPress', onPress,
            'RolloverBackground', RGBA(255, 255, 255, 0),
            'PressedBackground', RGBA(255, 255, 255, 0),
        }, {
            PlaceObj('XTemplateWindow', {
                '__class', "XBlurRect",
                'Margins', box(0, 5, 0, 5),
                'Dock', "box",
                'BlurRadius', 10,
                'Mask', "UI/Common/mm_panel",
                'FrameLeft', 15,
                'FrameRight', 10,
            }),
            PlaceObj('XTemplateWindow', {
                '__class', "XFrame",
                'Id', "idEffect",
                'Margins', box(5, 5, 5, 5),
                'Dock', "box",
                'Transparency', 179,
                'HandleKeyboard', false,
                'DisabledBackground', RGBA(255, 255, 255, 255),
                'Image', "UI/Common/screen_effect",
                'ImageScale', point(100000, 1000),
                'TileFrame', true,
                'SqueezeX', false,
                'SqueezeY', false,
            }),
            PlaceObj('XTemplateWindow', {
                '__class', "XFrame",
                'UIEffectModifierId', "MainMenuMainBar",
                'Id', "idImg",
                'Dock', "box",
                'Transparency', 64,
                'HandleKeyboard', false,
                'DisabledBackground', RGBA(255, 255, 255, 255),
                'Image', "UI/Common/mm_panel",
                'SqueezeX', false,
                'SqueezeY', false,
            }),
            PlaceObj('XTemplateWindow', {
                '__class', "XFrame",
                'UIEffectModifierId', "MainMenuHighlight",
                'Id', "idImgBcgr",
                'Dock', "box",
                'Transparency', 255,
                'HandleKeyboard', false,
                'DisabledBackground', RGBA(255, 255, 255, 255),
                'Image', "UI/Common/mm_panel_selected",
                'SqueezeX', false,
                'SqueezeY', false,
            }),
            PlaceObj('XTemplateWindow', {
                '__class', "AutoFitText",
                'Id', "idName",
                'Margins', box(20, 0, 0, 0),
                'HAlign', "left",
                'VAlign', "center",
                'MinWidth', 300,
                'MaxWidth', 300,
                'HandleKeyboard', false,
                'HandleMouse', false,
                'FocusedBorderColor', RGBA(0, 0, 0, 0),
                'DisabledBorderColor', RGBA(0, 0, 0, 0),
                'TextStyle', "MMOptionEntry",
                'Translate', true,
                'Text', T(543433418361, --[[ModItemXTemplate NewGameMenuFinalStandEntry Text]] "<display_name>"),
                'TextVAlign', "center",
                'SafeSpace', 10,
            }),
            PlaceObj('XTemplateWindow', {
                '__class', "XImage",
                'Id', "idCheckmark",
                'Margins', box(0, 0, 50, 0),
                'Dock', "right",
                'HAlign', "center",
                'VAlign', "center",
                'MinWidth', 50,
                'FoldWhenHidden', true,
                'HandleKeyboard', false,
                'Image', "UI/Hud/checkmark",
                'Columns', 2,
            }),
            PlaceObj('XTemplateFunc', {
                'name', "OnSetRollover(self, rollover)",
                'func', function(self, rollover)
                self.idName:SetTextStyle(rollover and "MMOptionEntryHighlight" or "MMOptionEntry")
                if rollover then
                    self.idCheckmark:SetImage("UI/Hud/checkmark_rollover")
                else
                    self.idCheckmark:SetImage("UI/Hud/checkmark")
                end
                if rollover then
                    PlayFX("MainMenuButtonRollover")
                    self.idImgBcgr:SetTransparency(0, 150)
                else
                    self.idImgBcgr:SetTransparency(255, 150)
                end
            end,
            }),
            PlaceObj('XTemplateFunc', {
                'name', "OnShortcut(self, shortcut, source, ...)",
                'func', function(self, shortcut, source, ...)
                if shortcut == "ButtonA" then
                    self:Press()
                end
            end,
            }),
            PlaceObj('XTemplateFunc', {
                'name', "SetSelected(self, selected)",
                'func', function(self, selected)
                self:SetFocus(selected)
            end,
            }),
            PlaceObj('XTemplateFunc', {
                'name', "Open(self)",
                'func', function(self)
                XButton.Open(self)
            end,
            }),
        }),
        PlaceObj('XTemplateProperty', {
            'category', "General",
            'id', "Name",
            'editor', "text",
            'Set', function(self, value)
            self.idName:SetText(value)
        end,
            'Get', function(self)
            return self.idName:GetText()
        end,
            'name', T(897564294510, --[[ModItemXTemplate NewGameMenuFinalStandEntry name]] "Name"),
        }),
    }
end

--- Generates OnContentUpdate function to be used in template.
--- @param class string
--- @param gameObjName string
function FinalStandTemplatePresetsGenerator:GenerateOnContentUpdate(class, gameObjName)
    return function(self, context, ...)
        if IsKindOf(self.context, class) then
            if not NewGameObj then return end

            if self.context.id == NewGameObj[gameObjName] then
                self.idCheckmark:SetColumn(2)
            else
                self.idCheckmark:SetColumn(1)
            end
        end
    end
end

--- Generates OnPress function to be used in template.
--- @param class string
--- @param gameObjName string
--- @return function
function FinalStandTemplatePresetsGenerator:GenerateOnPress(class, gameObjName)
    return function(self, gamepad)
        if not GetUIStyleGamepad() then
            self.parent:SetFocus(true)
        end

        for _, obj in ipairs(self.parent) do
            if IsKindOf(obj, "XButton") and obj == self then
                self.idCheckmark:SetColumn(2)
                NewGameObj[gameObjName] = self.context.id

                if netInGame and NetIsHost() then
                    local context = GetDialog(self):ResolveId("node").idSubMenu.context
                    local netCallFunc = function(invited_player_id)
                        NetCall(
                            "rfnPlayerMessage",
                            invited_player_id, "lobby-info",
                            { start_info = NewGameObj, no_scroll = true }
                        )
                    end

                    if context and context.invited_player_id then
                        CreateRealTimeThread(netCallFunc, context.invited_player_id)
                    end
                end
            elseif IsKindOf(obj, "XButton") and IsKindOf(obj.context, class) then
                obj.idCheckmark:SetColumn(1)
            end
        end
    end
end

--- Generates a template to be inserted into UI by going over supported configs and using previously generated
--- XTemplate entries.
--- @param config FinalStandConfigDef
--- @return function
function FinalStandTemplatePresetsGenerator:GenerateMainTemplate(config)
    if not config then
        return nil
    end

    local template = self:GetMainTemplate(config.id)

    for _, options in pairs(self.Structure) do
        -- First, insert category
        table.insert(template, PlaceObj('XTemplateTemplate', self:GetMainTemplateCategory(options)))

        -- Then, get the list of items and generate each as entry
        for _, object in pairs(self:GetCollectionFromOptions(config, options)) do
            local entry = self:GetMainTemplateEntry(options, object)
            table.insert(template, PlaceObj('XTemplateTemplate', entry))
        end
    end

    if not XTemplates[template.id] then
        PlaceObj('ModItemXTemplate', template)
    end

    return template.id
end

--- Simply returns a collection from the config object based on the passed options (one of the self.Structure elements)
--- @param config FinalStandConfigDef
--- @param options table collection of items (their keys)
function FinalStandTemplatePresetsGenerator:GetCollectionFromOptions(config, options)
    return GetRelationCollection(
        config,
        options.configRelationName,
        options.configRelationKey,
        options.globalName
    )
end

--- Creates main template basic values as table.
--- @param configId string
--- @return table
function FinalStandTemplatePresetsGenerator:GetMainTemplate(configId)
    return {
        __is_kind_of = "NewGameCategory", -- TODO: Change
        comment = configId .. " - Generated by UI handler - DO NOT EDIT!",
        group = "Zulu",
        id = "NewGameMenuFinalStand" .. configId,
    }
end

--- Creates main template category basic values as table
--- @param options table one of the self.Structure elements
--- @return table
function FinalStandTemplatePresetsGenerator:GetMainTemplateCategory(options)
    return {
        'comment', options.gameObjName,
        '__template', "NewGameCategory",
        'IdNode', false,
        'Name', options.displayName,
    }
end

--- Creates main template category basic values as table.
--- @param options table one of the self.Structure elements.
--- @param object Preset object that this entry is for.
--- @return table
function FinalStandTemplatePresetsGenerator:GetMainTemplateEntry(options, object)
    return {
        '__context', function(parent, context) return _G[options.globalName][object.id] end,
        '__template', "NewGameMenu" .. options.class .. "Entry",
        'Id', "id" .. object.id,
        'IdNode', false,
        'OnContextUpdate', FinalStandTemplatePresetsGenerator:GenerateOnContentUpdate(options.class, options.gameObjName),
        'OnPress', FinalStandTemplatePresetsGenerator:GenerateOnPress(options.class, options.gameObjName),
        'Name', object.display_name,
    }
end
