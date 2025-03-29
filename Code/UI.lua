--- ===================================================================================================================
--- Handles UI of the mod.
---
--- First thing it does is generated templates by looking at configs of FinalStandConfigDef instances.
--- Second thing, it listens to layout of the game and inserts those templates if needed.
---
--- @author Soundwave2142
--- ===================================================================================================================
print("Final Stand: UI file loaded")

--- This will trigger each DialogSetMode, this might be not the best solution, but it's good enough for me.
function OnMsg:DialogSetMode(mode, mode_param, old_mode)
    if mode == 'newgame02' and old_mode == 'newgame01' then
        FinalStandUIHandler:InsertIntoNewGame()
    end
end

FinalStandUiInserted = false

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandUIHandler
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandUIHandler = {}

function FinalStandUIHandler:InsertIntoNewGame()
    if not IsFinalStand() then
        -- ensure templates are not present in UI
        if FinalStandUiInserted == false then
            return
        end

        FinalStandUIHandler:Remove()
        return
    end

    Msg('FinalStandSelected', NewGameObj)

    --- @type string
    local config = NewGameObj['finalStandConfig']
    if not config then
        return
    end

    --- @type FinalStandConfigDef
    local configObject = FinalStandConfigs[config]
    Msg('FinalStandBeforeUIGenerate', configObject)
    FinalStandTemplatePresetsGenerator:GenerateEntryTemplates()
    local templateId = FinalStandTemplatePresetsGenerator:GenerateMainTemplate(configObject)

    if FinalStandUiInserted == true then
        return
    end

    Msg('FinalStandBeforeUIInsert')
    FinalStandUIHandler:Insert(templateId)
end

function FinalStandUIHandler:Insert(templateId)
    local _, parent1, idx1 = UIFindControl("MainMenu", {
        __template = "NewGameMenuGameRules",
    })

    if parent1 then
        table.insert(parent1, 2, PlaceObj('XTemplateTemplate', {
            'comment', "New Game Menu - Final Stand Config",
            '__context', function(parent, context) return context end,
            '__template', templateId,
            'IdNode', false,
        }))
    end

    FinalStandUiInserted = true
    Msg("FinalStandUIInserted")
end

--- Will supposedly remove the UI elements.
function FinalStandUIHandler:Remove()
    -- TODO UNTESTED
    local _, parent1, idx1 = UIFindControl("MainMenu", {
        __template = "NewGameMenuGameRules",
    })

    if parent1 then
        table.remove(parent1, 2)
    end

    FinalStandUiInserted = false
    Msg("FinalStandUIRemoved")
end
