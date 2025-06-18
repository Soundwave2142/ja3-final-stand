--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

if FirstLoad then
    local FinalStandTemplateCreated = false

    function OnMsg.ModsReloaded()
        if FinalStandTemplateCreated then
            return
        end

        FinalStandMainMenuUIHandler:InsertIntoNewGame("NewGameMenuFinalStandEntries")
        FinalStandTemplateCreated = true
    end
end

--- @return boolean
function IsFinalStandSelectedInMainMenu()
    return CampaignPresets[NewGameObj.campaignId]:ResolveValue('IsFinalStand')
end

--- @param mode string
--- @param mode_param table(?)
--- @param old_mode string
function OnMsg:DialogSetMode(mode, mode_param, old_mode)
    if mode == 'newgame02' and old_mode == 'newgame01' and IsFinalStandSelectedInMainMenu() then
        Msg('FinalStandSelected', NewGameObj)
    end
end

--- @param newGameObj table
function OnMsg.FinalStandSelected(newGameObj)
    newGameObj.campaign_name = 'Final Stand'

    local campaign = CampaignPresets[newGameObj.campaignId]
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
end

--- @param parent table
--- @param config FinalStandConfigDef
function OnMsg.PreGameMenuFinalStandConfigChanged(parent, config)
    FinalStandMainMenuUIHandler:HandleConfigChanged(parent, config)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandMainMenuUIHandler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandMainMenuUIHandler = {
    KnownFinalStandMainMenuClasses = {
        "FinalStandSectorDef",
        "FinalStandLengthDef",
        "FinalStandFriendlyFactionDef",
        "FinalStandEnemyFactionDef"
    }
}

--- @param templateId string
function FinalStandMainMenuUIHandler:InsertIntoNewGame(templateId)
    Msg('FinalStandBeforeUIInsert', templateId)

    local _, parent1, idx1 = UIFindControl("MainMenu", { __template = "NewGameMenuGameRules" })

    if parent1 then
        table.insert(parent1, 2, PlaceObj('XTemplateTemplate', {
            '__context', function(parent, context) return context end,
            '__template', templateId,
            '__condition', function(parent, context) return IsFinalStandSelectedInMainMenu() end,
            'IdNode', false,
        }))
    end

    Msg("FinalStandUIInserted", parent1, templateId)
end

--- @param context
--- @return boolean
function FinalStandMainMenuUIHandler:IsContextFinalStandObject(context)
    if not context then
        return
    end

    for _, class in ipairs(self.KnownFinalStandMainMenuClasses) do
        if IsKindOf(context, class) then
            return true
        end
    end

    return false;
end

--- @return table
function FinalStandMainMenuUIHandler:GetFinalStandConfigs()
    local campaign = CampaignPresets[NewGameObj.campaignId]
    local configs = campaign:GetFinalStandConfigs()
    local validConfigs = {}

    for _, config in ipairs(configs) do
        if config:IsValidConfig() then
            validConfigs[#validConfigs + 1] = config
        end
    end

    return validConfigs
end

--- @param parent table
--- @param config FinalStandConfigDef
function FinalStandMainMenuUIHandler:HandleConfigChanged(parent, config)
    for _, obj in ipairs(parent) do
        if self:IsContextFinalStandObject(obj.context) then
            local visibility = obj.context:IsRelatedToConfig(config.id)
            obj:SetVisible(visibility)
        end
    end

    local newGameObj = NewGameObj

    if newGameObj then
        local campaign = CampaignPresets[NewGameObj.campaignId]
        FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
    end

    self:EnsureCorrectOptionsAreChecked(parent)
end

--- @param parent table
function FinalStandMainMenuUIHandler:EnsureCorrectOptionsAreChecked(parent)
    for _, obj in ipairs(parent) do
        if self:IsContextFinalStandObject(obj.context) and obj.context:HasMember("PreGameObjectName") then
            local newGameObjValue = NewGameObj[obj.context.PreGameObjectName]

            if newGameObjValue == obj.context.id then
                obj:OnPress()
            end
        end
    end
end

--- @param game table
function OnMsg.NewGame(game)
    if not IsFinalStand() then
        return
    end

    local newGameObj = NewGameObj or {}
    local campaign = GetCurrentCampaignPreset()
    local finalStandConfig = FinalStandConfigurator:CreateFinalStandConfig(campaign, newGameObj)

    Msg("FinalStandGameConfigured", finalStandConfig)

    game["FinalStand"] = finalStandConfig
    campaign["InitialSector"] = GetFinalStandSector()
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigurator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigurator = {
    PerWaveFlags = {
        currentWaveStarted = false,
        finalChance = false,
        finalChancePopup = false,
    }
}

--- @param campaign Campaign
--- @return table
function FinalStandConfigurator:CreateFinalStandConfig(campaign, newGameObj)
    if not self:AreDefaultsAssigned(newGameObj) then
        self:EnsureDefaultsAreAssigned(campaign, newGameObj)
    end

    local config = {
        -- player made choices
        config = newGameObj[FinalStandConfigDef.PreGameObjectName],
        sector = newGameObj[FinalStandSectorDef.PreGameObjectName],
        length = newGameObj[FinalStandLengthDef.PreGameObjectName],
        faction = newGameObj[FinalStandFriendlyFactionDef.PreGameObjectName],
        enemyFaction = newGameObj[FinalStandEnemyFactionDef.PreGameObjectName],
        -- variables for tracking progress
        id = FinalStandConfigurator:GenerateFinalStandId(),
        currentWave = 0,
        scheduledStand = false,
        appearancePresets = {},
        boostedUnits = {}
    }

    self:ResetPerWaveFlags(config)

    return config
end

--- @return string
function FinalStandConfigurator:GenerateFinalStandId()
    return random_encode64(48)
end

--- @param newGameObj table
--- @return boolean
function FinalStandConfigurator:AreDefaultsAssigned(newGameObj)
    local requiredDefaults = {
        FinalStandConfigDef.PreGameObjectName,
        FinalStandSectorDef.PreGameObjectName,
        FinalStandLengthDef.PreGameObjectName,
        FinalStandFriendlyFactionDef.PreGameObjectName,
        FinalStandEnemyFactionDef.PreGameObjectName
    }

    for _, newGameObjectName in pairs(requiredDefaults) do
        if not newGameObj[newGameObjectName] then
            return false
        end
    end

    return true
end

--- @param campaign CampaignPreset
--- @param newGameObj table
function FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
    local configs = campaign:GetFinalStandConfigs()

    if configs and #configs > 0 then
        local config = configs[1];
        local configId = config.id

        if newGameObj[FinalStandConfigDef.PreGameObjectName] then
            local newGameConfig = FinalStandConfigs[newGameObj[FinalStandConfigDef.PreGameObjectName]]

            if newGameConfig and newGameConfig:IsRelatedToCampaign(newGameObj.campaignId) then
                config = FinalStandConfigs[newGameObj[FinalStandConfigDef.PreGameObjectName]]
                configId = newGameObj[FinalStandConfigDef.PreGameObjectName]
            end
        end

        newGameObj[FinalStandConfigDef.PreGameObjectName] = configId;

        local sectors = config:GetAllSectors(true)
        if sectors and #sectors > 0 then
            newGameObj[FinalStandSectorDef.PreGameObjectName] = sectors[1].id
        end

        local lengths = config:GetAllLengths(true)
        if lengths and #lengths > 0 then
            newGameObj[FinalStandLengthDef.PreGameObjectName] = lengths[1].id
        end

        local factions = config:GetAllFriendlyFactions(true)
        if factions and #factions > 0 then
            newGameObj[FinalStandFriendlyFactionDef.PreGameObjectName] = factions[1].id
        end

        local enemyFactions = config:GetAllEnemyFactions(true)
        if enemyFactions and #enemyFactions > 0 then
            newGameObj[FinalStandEnemyFactionDef.PreGameObjectName] = enemyFactions[1].id
        end
    end
end

--- @param config (table|nil)
function FinalStandConfigurator:ResetPerWaveFlags(config)
    config = config or Game.FinalStand

    for flag, defaultState in pairs(self.PerWaveFlags) do
        config[flag] = defaultState
    end

    Msg("FinalStandGamePerWaveFlagsReset", config)
end

function OnMsg.StartSatelliteGameplay()
    if not IsFinalStand() then
        return
    end

    FinalStandStarterGearGenerator:GiveStarterGear()
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandStarterGearGenerator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandStarterGearGenerator = {}

function FinalStandStarterGearGenerator:GiveStarterGear()
    if Game.FinalStand.starterGearGiven then
        return;
    end

    local lootDefs = self:GatherLootDefs()

    for _, lootDef in ipairs(lootDefs) do
        local items = {}
        lootDef:GenerateLoot(nil, {}, InteractionRand(nil, "FinalStandStartingGear"), items)

        local squadsOnMap = GetSquadsOnMap("references")

        for _, squad in ipairs(squadsOnMap) do
            AddItemsToSquadBag(squad.UniqueId, items)

            for _, unit in ipairs(squad.units) do
                if #items > 0 then
                    unit = gv_UnitData[unit]
                    unit:AddItemsToInventory(items)
                end
            end
        end

        if #items > 0 then
            local stash = GetFinalStandSectorStash()

            if stash then
                AddItemsToInventory(stash, items, true)
            end
        end
    end

    Game.FinalStand.starterGearGiven = true
end

--- @return table
function FinalStandStarterGearGenerator:GatherLootDefs()
    local lootDefIds = {}

    GetFinalStandFriendlyFaction(true):AppendStartingEquipmentToList(lootDefIds)
    GetFinalStandEnemyFaction(true):AppendStartingEquipmentToList(lootDefIds)

    local lootDefs = {}

    for _, lootDefId in ipairs(lootDefIds) do
        if LootDefs[lootDefId] then
            lootDefs[#lootDefs + 1] = LootDefs[lootDefId]
        end
    end

    return lootDefs
end

local BasePremiumPopupLogic = PremiumPopupLogic

--- Overriden to change price of AIM Premium as well as avoid showing dialog when not needed.
function PremiumPopupLogic()
    if not IsFinalStand() then
        return BasePremiumPopupLogic()
    end

    local popupHost = GetDialog("PDADialog")
    popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")

    local premiumPrice = GetFinalStandConfigValue('AimGoldPrice')

    if AIMPremium == "unoffered" then
        CreateRealTimeThread(function()
            local aimPrem = CreateMessageBox(
                popupHost,
                T(361843368664, "A.I.M. Gold"),
                T(615566544023, "You need an A.I.M. Gold account to contact this merc."),
                T(175313021861, "Close"))
            aimPrem:Wait()
            return
        end)
        return true
    elseif AIMPremium == "offer" then
        -- no need to offer anything, users know at this point.
        NetSyncEvent("ChangeAIMPremiumState", "offered")

        return true
    elseif AIMPremium == "offered" then
        CreateRealTimeThread(function()
            local aimPrem = CreateQuestionBox(
                popupHost,
                T(361843368664, "A.I.M. Gold"),
                T(548407393248,
                    "Congratulations - you are eligible for an account upgrade! Gain FULL ACCESS to the A.I.M. site right now with our one-time exclusive offer. Purchase NOW! "),
                T { 138562752874, "Buy (<money(AIMCost)>)",
                    AIMCost = premiumPrice }, T(175313021861, "Close"),
                premiumPrice,
                function(premiumPrice) if Game.Money < premiumPrice then return "disabled" else return "enabled" end end)

            local resp = aimPrem:Wait()
            if resp ~= "ok" then
                return
            else
                NetSyncEvent("ChangeAIMPremiumState", "active", premiumPrice)
            end
        end)
        return true
    elseif AIMPremium == "grant" then
        CreateRealTimeThread(function()
            local aimPrem = CreateMessageBox(
                popupHost,
                T(361843368664, "A.I.M. Gold"),
                T(419850567943,
                    "CONGRATULATIONS! As a loyal and valued A.I.M. partner we would like to present you with exclusive access to A.I.M. Gold. You will be able contact our best mercenaries at NO EXTRA COST."),
                T(413525748743, "Ok"))
            aimPrem:Wait()
            NetSyncEvent("ChangeAIMPremiumState", "active")
            return
        end)
        return true
    end

    return false
end
