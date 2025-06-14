--- ===================================================================================================================
--- Responsible for start of the game and assignment of all correct values.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- @param newGameObj table
function OnMsg.FinalStandSelected(newGameObj)
    newGameObj.campaign_name = 'Final Stand'

    local campaign = CampaignPresets[newGameObj.campaignId]
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
end

--- @param game table
function OnMsg.NewGame(game)
    if not IsFinalStand() then
        return
    end

    local campaign = GetCurrentCampaignPreset()
    local finalStandConfig = FinalStandConfigurator:CreateFinalStandConfig(campaign)
    Msg("FinalStandGameConfigured", finalStandConfig)

    game["FinalStand"] = finalStandConfig
    campaign["InitialSector"] = GetFinalStandSector()
end

function OnMsg.StartSatelliteGameplay()
    if not IsFinalStand() then
        return
    end

    FinalStandStarterGearGenerator:GiveStarterGear()
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandConfigurator
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandConfigurator = {
    PerWaveFlags = {
        currentWaveStarted = false,
        finalChance = false,
    }
}

--- @param campaign Campaign
--- @return table
function FinalStandConfigurator:CreateFinalStandConfig(campaign)
    local newGameObj = NewGameObj or {}
    FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)

    local config = {
        -- player made choices
        config = newGameObj['finalStandConfig'],
        faction = newGameObj['finalStandFriendlyFaction'],
        enemyFaction = newGameObj['finalStandEnemyFaction'],
        sector = newGameObj['finalStandSector'],
        length = newGameObj['finalStandLength'],
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

--- @param campaign CampaignPreset
--- @param newGameObj table
function FinalStandConfigurator:EnsureDefaultsAreAssigned(campaign, newGameObj)
    local configCollection = GetRelationCollection(campaign, 'FinalStandConfigs', 'Config')
    local configFirstValue = GetFirstFromCollection(configCollection)

    newGameObj['finalStandConfig'] = configFirstValue
    local configObject = FinalStandConfigs[configFirstValue]

    for _, options in pairs(FinalStandTemplatePresetsGenerator.Structure) do
        local collection = GetRelationCollection(configObject, options.configRelationName, options.configRelationKey)
        local firstValue = GetFirstFromCollection(collection)

        if not newGameObj[options.gameObjName] then
            newGameObj[options.gameObjName] = firstValue
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
