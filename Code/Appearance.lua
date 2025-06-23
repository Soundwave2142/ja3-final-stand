--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

function OnMsg.PreGameMenuOpen()
    AppearanceHandler:ApplyToMainMenu()
end

function OnMsg.LoadSessionData()
    if not IsFinalStand() then
        return
    end

    AppearanceHandler:ApplyToTeam()
end

function OnMsg.ExplorationStart()
    if not IsFinalStand() then
        return
    end

    AppearanceHandler:ApplyToTeam()
end

function OnMsg.InventoryChange(unit)
    if not IsFinalStand() then
        return
    end

    AppearanceHandler:ApplyToUnit(unit)
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class AppearanceHandler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.AppearanceHandler = {
    DefaultOptions = {
        BodyColors = {
            -- white
            Default = {
                Color = RGBA(187, 64, 35, 255),
            },
            -- brown
            Brown = {
                Units = { 'Thor', 'Blood', 'Gus' },
                Color = RGBA(91, 28, 18, 255),
            },
            -- black
            Black = {
                Units = { 'Ice', 'Vicki', 'Magic', 'Len', 'PierreMerc', 'Pierre_FS' },
                Color = RGBA(20, 7, 5, 255),
            },
        },

        DefaultItemColors = PlaceObj('ColorizationPropSet', {
            'EditableColor1', RGBA(11, 19, 8, 255),
            'EditableColor2', RGBA(11, 19, 8, 255),
            'EditableColor3', RGBA(11, 19, 8, 255),
        }),

        -- Always Roll tables
        AlwaysRollForHat = { 'Mouse', 'Livewire' },
        AlwaysRollForHat2 = { 'Livewire' },
        AlwaysRollForHead = {},
        AlwaysRollForBody = {},
        AlwaysRollForShirt = {},
        AlwaysRollForArmor = {},
        AlwaysRollForChest = {},
        AlwaysRollForPants = {},
        AlwaysRollForHip = {},

        -- Never Roll tables
        NeverRollForHat = {},
        NeverRollForHat2 = {},
        NeverRollForHead = { 'Steroid', },
        NeverRollForBody = { 'Steroid', },
        NeverRollForShirt = { 'Steroid', },
        NeverRollForArmor = { 'Steroid', },
        NeverRollForChest = {},
        NeverRollForArmor = { 'Steroid', },
        NeverRollForPants = {},
        NeverRollForHip = {},
    },
    OptionsLoaded = false
}

--- Iterates over default options and assigns them to self.
--- Then takes values from current faction if possible.
--- The idea is to allow other mods to insert their own values.
function AppearanceHandler:LoadOptions()
    if self.OptionsLoaded then
        return
    end

    -- load default options first
    for key, value in pairs(self.DefaultOptions) do
        if type(value) == "table" then
            if type(value.class) == "string" and value.class then
                self[key] = value:Clone()
            else
                self[key] = table.copy(value)
            end
        else
            self[key] = value
        end
    end

    -- load faction values
    self.Pools = GetFinalStandFriendlyFactionValue('AttirePools') or {}
    self.ChanceToRollForHat = GetFinalStandFriendlyFactionValue('AttireChanceToRollForHat') or 80
    self.ChanceToRollForHat2 = GetFinalStandFriendlyFactionValue('AttireChanceToRollForHat2') or 60
    self.ChanceToRollForHead = GetFinalStandFriendlyFactionValue('AttireChanceToRollForHead') or 50
    self.ChanceToRollForBody = GetFinalStandFriendlyFactionValue('AttireChanceToRollForBody') or 100
    self.ChanceToRollForShirt = GetFinalStandFriendlyFactionValue('AttireChanceToRollForShirt') or 100
    self.ChanceToRollForArmor = GetFinalStandFriendlyFactionValue('AttireChanceToRollForArmor') or 60
    self.ChanceToRollForChest = GetFinalStandFriendlyFactionValue('AttireChanceToRollForChest') or 80
    self.ChanceToRollForPants = GetFinalStandFriendlyFactionValue('AttireChanceToRollForPants') or 100
    self.ChanceToRollForHip = GetFinalStandFriendlyFactionValue('AttireChanceToRollForHip') or 80

    Msg("FinalStandAppearanceOptionsLoaded", self)
    self.OptionsLoaded = true
end

--- Iterates the team members and calls for ApplyToUnit for each
function AppearanceHandler:ApplyToTeam()
    -- validate there's pools for current faction
    local pools = GetFinalStandFriendlyFactionValue('AttirePools')
    if #pools == 0 then
        return
    end

    local units = GetAllPlayerUnitsOnMap()
    for _, unit in ipairs(units) do
        self:ApplyToUnit(unit)
    end

    self:SaveToStorage()
end

--- Calls for Preset generation if possible, stops animations and applies preset.
--- @param unit table
--- @param presetId (string|nil)
function AppearanceHandler:ApplyToUnit(unit, presetId)
    if not self:canBeAppliedToUnit(unit) then
        return
    end

    unit:StopAnimMomentHook()
    local anim = unit:GetStateText()
    local phase = unit:GetAnimPhase()
    presetId = presetId or self:GeneratePreset(unit)

    unit:ApplyAppearance(presetId, true)
    unit:SetStateText(anim, const.eKeepComponentTargets)
    unit:SetAnimPhase(1, phase)
    unit:StartAnimMomentHook()
    unit:UpdateModifiedAnim()
    unit:UpdateMoveAnim()
end

--- Checks whatever Preset can be applied to unit. Currently only Mercs are supported.
--- @param unit table
function AppearanceHandler:canBeAppliedToUnit(unit)
    return unit and IsMerc(unit) and unit:GetGender()
end

--- Generated (or takes from Game) parts for preset and inserts into the game.
--- @param unit table
--- @return string id of generated preset
function AppearanceHandler:GeneratePreset(unit)
    local defaultLook = AppearancePresets[unit:ChooseAppearance()]
    local presetId = self:GenerateId(unit)

    if AppearancePresets[presetId] then
        return presetId
    end

    local pickedParts = self:GetPickedParts(unit, defaultLook, presetId)
    self:PlacePreset(presetId, pickedParts, defaultLook)

    return presetId
end

--- @param unit table
--- @return string id of generated preset
function AppearanceHandler:GenerateId(unit)
    return table.concat({
        'FinalStand', '_',
        Game.FinalStand.id, '_',
        GetFinalStandFriendlyFaction(), '_',
        unit:GetGender(), '_',
        unit.unitdatadef_id
    })
end

function AppearanceHandler:GetPickedParts(unit, defaultLook, presetId)
    if Game.FinalStand and Game.FinalStand.appearancePresets and Game.FinalStand.appearancePresets[presetId] then
        return Game.FinalStand.appearancePresets[presetId]
    end

    self:LoadOptions() -- despite being called multiple times, options are only loaded once

    local pickedParts = {
        NativePreset = defaultLook.id
    }

    self:PickHeadParts(unit, pickedParts)
    self:PickBodyParts(unit, pickedParts)
    self:PickPantsParts(unit, pickedParts)

    Game.FinalStand.appearancePresets[presetId] = pickedParts

    return pickedParts
end

--- Populates pickedParts param with head related items.
--- @param unit table
--- @param pickedParts table collection of all picked parts so far, these are passed to the preset object
function AppearanceHandler:PickHeadParts(unit, pickedParts)
    local Hat = false
    local Hat2 = false

    local shouldPickHat = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceHat', self.ChanceToRollForHat,
        self.AlwaysRollForHat, self.NeverRollForHat
    )
    local shouldPickHat2 = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceHat2', self.ChanceToRollForHat2,
        self.AlwaysRollForHat2, self.NeverRollForHat2
    )
    local shouldPickHead = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceHead', self.ChanceToRollForHead,
        self.AlwaysRollForHead, self.NeverRollForHead
    )

    if shouldPickHat then
        Hat = self:GetFromAllPools('Hat', 'HatColor', unit, pickedParts)
    end

    local canPickForHat2 = true
    if Hat and Hat:ResolveValue('RollForHat2') == false then
        canPickForHat2 = false
    end

    if shouldPickHat2 and canPickForHat2 then
        Hat2 = self:GetFromAllPools('Hat2', 'Hat2Color', unit, pickedParts)
    end

    if shouldPickHead then
        self:GetFromAllPools('Head', 'HeadColor', unit, pickedParts)
    end

    if Hat and Hat:ResolveValue('HideHair') then
        pickedParts['Hair'] = false
    end

    if Hat2 and Hat2:ResolveValue('HideHair') then
        pickedParts['Hair'] = false
    end
end

--- Populates pickedParts param with body related items.
--- @param unit table
--- @param pickedParts table collection of all picked parts so far, these are passed to the preset object
function AppearanceHandler:PickBodyParts(unit, pickedParts)
    local shouldPickBody = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceBody', self.ChanceToRollForBody,
        self.AlwaysRollForBody, self.NeverRollForBody
    )
    local shouldPickShirt = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceShirt', self.ChanceToRollForShirt,
        self.AlwaysRollForShirt, self.NeverRollForShirt
    )
    local shouldPickArmor = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceArmor', self.ChanceToRollForArmor,
        self.AlwaysRollForArmor, self.NeverRollForArmor
    )
    local shouldPickChest = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceChest', self.ChanceToRollForChest,
        self.AlwaysRollForChest, self.NeverRollForChest
    )

    if shouldPickBody then
        self:GetFromAllPools('Body', 'BodyColor', unit, pickedParts)
    end

    if shouldPickShirt then
        self:GetFromAllPools('Shirt', 'ShirtColor', unit, pickedParts)
    end

    if shouldPickArmor then
        self:GetFromAllPools('Armor', 'ArmorColor', unit, pickedParts)
    end

    -- TODO: add ChestAttachOffsetX to females if no armor
    if shouldPickChest then
        self:GetFromAllPools('Chest', 'ChestColor', unit, pickedParts)
    end
end

--- Populates pickedParts param with pants related items.
--- @param unit table
--- @param pickedParts table collection of all picked parts so far, these are passed to the preset object
function AppearanceHandler:PickPantsParts(unit, pickedParts)
    local shouldPickPants = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearancePants', self.ChanceToRollForPants,
        self.AlwaysRollForPants, self.NeverRollForPants
    )
    local shouldPickHip = self:ShouldPickPart(
        unit.unitdatadef_id, 'FSAppearanceHip', self.ChanceToRollForHip,
        self.AlwaysRollForHip, self.NeverRollForHip
    )

    if shouldPickPants then
        self:GetFromAllPools('Pants', 'PantsColor', unit, pickedParts)
    end

    if shouldPickHip then
        self:GetFromAllPools('Hip', 'HipColor', unit, pickedParts)
    end
end

--- Return boolean whatever part should be picked based on chances and possibilities.
--- @param currentUnitId string will be compared in the lists
--- @param randName string name for InteractionRand
--- @param chanceToRoll (number|nil) chance that anything for this part will be picked
--- @param alwaysRollTable (table|nil) list of mercs that this part should ALWAYS be rolled for
--- @param neverRollTable (table|nil) list of mercs that this part should NEVER be rolled for
--- @return boolean
function AppearanceHandler:ShouldPickPart(currentUnitId, randName, chanceToRoll, alwaysRollTable, neverRollTable)
    if alwaysRollTable then
        for _, unitId in pairs(alwaysRollTable) do
            if unitId == currentUnitId then
                return true
            end
        end
    end

    if neverRollTable then
        for _, unitId in pairs(neverRollTable) do
            if unitId == currentUnitId then
                return false
            end
        end
    end

    if not chanceToRoll then
        return true
    end

    return InteractionRand(100, randName) <= chanceToRoll
end

--- Gets a particular part of the preset and it's color (e.g. Armor, Body etc) from all available pools.
--- Returns FinalStandAttirePoolItem but still populates pickedParts with proper keys.
--- @param partKey string part name in the both appearance and attire pool, like "Hat'. These have to match.
--- @param partColorKey string color field name, like 'HatColor'. This one is needed because attire item doesn't share name.
--- @param unit table
--- @param pickedParts table table containing parts and to which part and related fields will be appended.
--- @return (FinalStandAttirePoolItem|nil)
function AppearanceHandler:GetFromAllPools(partKey, partColorKey, unit, pickedParts)
    local items = {}
    local colors = {}

    -- collect all items (for particular part, with matching gender) and colors of the item and pool
    for _, pool in pairs(self.Pools) do
        local poolObj = FinalStandAttirePools[pool:ResolveValue('AttirePool')]

        if poolObj:IsPoolAllowedForUnit(unit) then
            local poolItems = poolObj:ResolveValue(partKey)

            for _, item in pairs(poolItems) do
                if item:IsItemAllowedForUnit(unit) then
                    table.insert(items, item)
                end
            end

            local poolColors = poolObj:ResolveValue('Colors');

            for _, colorItem in pairs(poolColors) do
                table.insert(colors, colorItem)
            end
        end
    end

    if #items == 0 then
        return nil
    end

    local pickedItem = items[math.random(#items)]:Clone()

    for _, colorItem in pairs(pickedItem.Colors) do
        table.insert(colors, colorItem)
    end

    -- TODO: rework this, implement ResolveValues in
    for pickedItemValueKey, pickedItemValue in pairs(pickedItem) do
        if pickedItemValueKey == 'param_bindings' then
            -- TODO: get rid of this param_bindings
        else
            pickedParts[pickedItemValueKey] = pickedItemValue
        end
    end

    local pickedColor = #colors > 0 and colors[math.random(#colors)]:Clone() or self.DefaultItemColors:Clone()
    local bodyColorKey = pickedItem:ResolveValue('BodyColorKey')

    if bodyColorKey ~= nil and bodyColorKey ~= "" then
        pickedColor[bodyColorKey] = self:FindBodyColor(unit)
    end

    pickedParts[partColorKey] = pickedColor

    return pickedItem
end

--- Returns a body color of a unit. Currently only basic game mercs are supported.
--- @param unit table
function AppearanceHandler:FindBodyColor(unit)
    -- TODO: make support for modded mercs
    for _, color in pairs(self.BodyColors) do
        for _, unitId in pairs(color.Units) do
            if unitId == unit.unitdatadef_id then
                return color.Color
            end
        end
    end

    return self.BodyColors.Default.Color
end

--- Merges pickedParts and defaultLook and places a preset inside AppearancePreset collection.
--- @param presetId string
--- @param pickedParts table all previously picked parts for an attire.
--- @param defaultLook table a reference to units current/default look, this will be taken if nothing was picked.
function AppearanceHandler:PlacePreset(presetId, pickedParts, defaultLook)
    local preset = {
        group = "Mercs",
        id = presetId,
    }

    for partName, part in pairs(pickedParts) do
        preset[partName] = part
    end

    -- additionally, iterate over original preset and place items from it
    -- include item only if in new preset there's no mention of it (aka not false, but nil)
    for partName, defaultPart in pairs(defaultLook) do
        if preset[partName] == nil then
            preset[partName] = defaultPart
        end
    end

    PlaceObj('AppearancePreset', preset)
end

--- @param key string
--- @param value string
local function SaveFinalStandStorage(key, value)
    local storage = CurrentModStorageTable or {}

    if storage[key] == value then
        return
    end

    storage[key] = value
    WriteModPersistentStorageTable()
end

--- @param key string
local function GetFinalStandStorage(key)
    local storage = CurrentModStorageTable or {}
    return storage[key]
end

--- Saves currently loaded Final Stand appearance presets in storage, to be used in main menu.
function AppearanceHandler:SaveToStorage()
    local lastSavedPresets = GetFinalStandStorage("appearancePresets") or {}
    local lastSavedPresetsList = {}
    local presets = Game.FinalStand.appearancePresets or {}
    local presetsList = {}

    for preset, pickedItems in pairs(lastSavedPresets) do
        table.insert(lastSavedPresetsList, preset)
    end

    for preset, pickedItems in pairs(presets) do
        table.insert(presetsList, preset)
    end

    if not table.equal_values(lastSavedPresets, presetsList) then
        SaveFinalStandStorage("appearancePresets", presets)
    end
end

--- Applies unit presets to main menu DummyUnits if anything was saved in storage.
function AppearanceHandler:ApplyToMainMenu()
    local lastSavedPresets = GetFinalStandStorage("appearancePresets")

    if not lastSavedPresets then
        return
    end

    local availablePresets = {}

    for presetId, pickedParts in pairs(lastSavedPresets) do
        local defaultLook = AppearancePresets[pickedParts.NativePreset]

        if not AppearancePresets[presetId] then
            self:PlacePreset(presetId, pickedParts, defaultLook)
        end

        table.insert(availablePresets, presetId)
    end

    local presetPosition = 0
    MapForEach("map", "DummyUnit", function(unit)
        presetPosition = presetPosition + 1
        local preset = availablePresets[presetPosition]

        if preset then
            unit:ApplyAppearance(preset, true)
            unit:SetEnumFlags(const.efVisible)
        else
            unit:ClearEnumFlags(const.efVisible)
        end
    end)
end

--- Deletes Final Stand appearance presets in storage when new non-Final Stand set of mercs created in AccountStorage.
--- @param unit_data table
--- @param old_status string(?)
--- @param new_status string(?)
function OnMsg.MercHireStatusChanged(unit_data, old_status, new_status)
    if IsFinalStand() or not IsMerc(unit_data) then
        return
    end

    SaveFinalStandStorage("appearancePresets", nil)
end

--- Deletes Final Stand appearance presets in storage when new non-Final Stand set of mercs created in AccountStorage.
function OnMsg.EnterSector()
    if IsFinalStand() then
        return
    end

    local team = table.find_value(g_Teams, "control", "UI")

    if not team or not team.units then
        return
    end

    SaveFinalStandStorage("appearancePresets", nil)
end
