--- ===================================================================================================================
--- Responsible for all ending related functionality.
---
--- @author Soundwave2142
--- ===================================================================================================================

function OnMsg.ConflictEnd()
    if not IsFinalStand() then
        return
    end

    if not IsFinalStandSectorPlayerControlled() and not FinalStandFinale:IsFinalChance() then
        -- if player lost sector, and still has one chance, initiate that last chance.
        FinalStandFinale:StartFinalChance()
    elseif not IsFinalStandSectorPlayerControlled() and FinalStandFinale:IsFinalChance() then
        -- if player lost sector, and doesn't have last chance, start bad ending.
        FinalStandFinale:StartGameOver()
    else
        -- else ensure it is not Final Chance
        FinalStandFinale:EndFinalChance()
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFinale
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFinale = {
    OutroMsg = T(214200009901,
        "You survived your Final Stand. The locations is secured for now and you can rest, for now..."),
    GameOverMsg = T(214200009902, "You failed... The location was captured and raised..."),
}

function FinalStandFinale:StartEnding()
    if not CanYield() then
        CreateRealTimeThread(FinalStandFinale.StartEnding)
        return
    end

    Msg("FinalStandCampaignEnding")
    FinalStandFinale:PlayOutro()
end

function FinalStandFinale:PlayOutro()
    Sleep(4500)

    local dlg = OpenDialog("Fade")
    dlg.idFade:SetVisible(true, true)

    Sleep(4500)

    local duration = ReadDurationFromText(_InternalTranslate(self.OutroMsg))

    g_DisclaimerSplashScreen = SplashText(self.OutroMsg, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    CloseDialog(dlg)
    OpenPreGameMainMenu()
end

function FinalStandFinale:StartFinalChance()
    Game.FinalStand.finalChance = true

    CombatLog("important",
        T(214200009900,
            "This is your <em>Last Chance</em>, gather all your mercs and resources and take the sector back at any cost!"))
end

function FinalStandFinale:EndFinalChance()
    Game.FinalStand.finalChance = false
end

function FinalStandFinale:IsFinalChance()
    return Game.FinalStand.finalChance
end

function FinalStandFinale:StartGameOver()
    if not CanYield() then
        CreateRealTimeThread(FinalStandFinale.StartGameOver)
        return
    end

    Msg("FinalStandCampaignEnding")
    FinalStandFinale:PlayGameOverOutro()
end

function FinalStandFinale:PlayGameOverOutro()
    Sleep(4500)

    local dlg = OpenDialog("Fade")
    dlg.idFade:SetVisible(true, true)

    Sleep(4500)

    local duration = ReadDurationFromText(_InternalTranslate(self.GameOverMsg))

    g_DisclaimerSplashScreen = SplashText(self.GameOverMsg, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    CloseDialog(dlg)
    OpenPreGameMainMenu()
end
