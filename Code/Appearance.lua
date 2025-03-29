DefineClass.AppearanceHandler = {
    SupportedParts = {
        Hat = 'HatColor',
        Body = 'BodyColor',
        Pants = 'PantsColor'
    },
    AlwaysRollForHats = {
        'Mouse', 'Livewire'
    },
    BodyColors = {
        Default = {

        },
    }
}

function AppearanceHandler:ApplyToTeam()
    local units = GetAllPlayerUnitsOnMap()
    for _, unit in ipairs(units) do
        self:ApplyToUnit(unit)
    end
end

--- @param unit table
function AppearanceHandler:ApplyToUnit(unit)
    if not self:canBeAppliedToUnit(unit) then
        return
    end

    unit:StopAnimMomentHook()
    local anim = unit:GetStateText()
    local phase = unit:GetAnimPhase()

    local presetId = self:GeneratePreset(unit)
    AppearanceObject.ApplyAppearance(unit, presetId)

    unit:SetStateText(anim, const.eKeepComponentTargets)
    unit:SetAnimPhase(1, phase)
    unit:StartAnimMomentHook()
    unit:UpdateModifiedAnim()
    unit:UpdateMoveAnim()
end

--- @param unit table
function AppearanceHandler:canBeAppliedToUnit(unit)
    if not IsMerc(unit) then
        return false
    end

    if not unit:GetGender() then
        return false
    end

    return true
end

--- @param unit table
--- @return string id of generated preset
function AppearanceHandler:GeneratePreset(unit)
    local defaultLook = AppearancePresets[unit:ChooseAppearance()]
    local presetId = self:GenerateId(unit)

    if AppearancePresets[presetId] then
        return presetId
    end

    local pickedParts = {}
    if Game.FinalStand and Game.FinalStand.appearancePresets and Game.FinalStand.appearancePresets[presetId] then
        -- lead preset from saved game otherwise create a new one
        pickedParts = Game.FinalStand.appearancePresets[presetId]
    else
        local gender = unit:GetGender()

        -- iterate each of the supported items, and put it inside
        for presetItemName, presetColorName in pairs(self.SupportedParts) do
            self:GetFromAllPools(presetItemName, presetColorName, gender, pickedParts)
        end

        Game.FinalStand.appearancePresets[presetId] = pickedParts
    end

    self:PlacePreset(presetId, pickedParts, defaultLook)

    return presetId
end

--- @param unit table
--- @return string id of generated preset
function AppearanceHandler:GenerateId(unit)
    return table.concat({
        'FinalStand', '_',
        Game.save_id, '_',
        GetFinalStandFriendlyFaction(true), '_',
        unit:GetGender(), '_',
        unit.unitdatadef_id
    })
end

--- @param partKey string part name in the both appearance and attire pool, like "Hat'. These have to match.
--- @param partColorKey string color field name, like 'HatColor'. This one is needed because attire item doesn't share name.
--- @param gender string gender of the unit.
--- @param pickedParts table table containing parts and to which part and related fields will be appended.
function AppearanceHandler:GetFromAllPools(partKey, partColorKey, gender, pickedParts)
    local pools = GetFinalStandFriendlyFactionValue('AttirePools')
    local items = {}
    local colors = {}

    -- collect all items (for particular part, with matching gender) and colors of the item and pool
    for _, pool in pairs(pools) do
        local poolObj = FinalStandAttirePools[pool.AttirePool]

        for _, item in pairs(poolObj[partKey]) do
            if not item.Gender or item.Gender == gender then
                table.insert(items, item)
            end
        end

        for _, colorItem in pairs(poolObj.Colors) do
            table.insert(colors, colorItem)
        end
    end

    if #items == 0 then
        return
    end

    local pickedItem = items[math.random(#items)]:Clone()
    local pickedColor = colors[math.random(#colors)]:Clone()

    for pickedItemValueKey, pickedItemValue in pairs(pickedItem) do
        if pickedItemValueKey == 'param_bindings' then
            -- TODO: get rid of this param_bindings
        else
            pickedParts[pickedItemValueKey] = pickedItemValue
        end
    end

    pickedParts[partColorKey] = pickedColor
end

--- @param presetId string
--- @param pickedParts table all previously picked parts for an attire.
--- @param defaultLook table a reference to units current/default look, this will be taken if nothing was picked.
function AppearanceHandler:PlacePreset(presetId, pickedParts, defaultLook)
    local preset = {
        group = "Mercs",
        id = presetId,
    }

    for _, part in pairs(pickedParts) do
        preset[_] = part
    end

    for _, defaultPart in pairs(defaultLook) do
        if not preset[_] then
            preset[_] = defaultPart
        end
    end

    -- ensure the skin color is passed
    print(pickedParts, pickedParts['BodyColorKey'])
    if pickedParts['BodyColorKey'] then
        --local bodyColor = defaultLook['Head']['EditableColor1']:Clone()
        --preset['BodyColor'][pickedParts['BodyColorKey']] = bodyColor
    end

    PlaceObj('AppearancePreset', preset)
end

function OnMsg.LoadSessionData()
    AppearanceHandler:ApplyToTeam()
end

function OnMsg.ExplorationStart()
    AppearanceHandler:ApplyToTeam()
end
