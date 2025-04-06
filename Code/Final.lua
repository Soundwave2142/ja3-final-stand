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
    elseif GetFinalStandCurrentWave() >= GetFinalStandMaxWaves() then
        -- if current wave is last wave, start good ending.
        FinalStandFinale:StartEnding()
    else
        -- else ensure it is not Final Chance
        FinalStandFinale:EndFinalChance()
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFinale
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFinale = {
    outroMsg = Untranslated(
        [[You survived your Final Stand, Congratulations!
        The locations is secured for now and you can rest, for now...]]
    ),
    gameOverMsg = Untranslated(
        [[You failed... The location was raised and captured...]]
    ),
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

    local duration = ReadDurationFromText(_InternalTranslate(self.outroMsg))

    g_DisclaimerSplashScreen = SplashText(self.outroMsg, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    CloseDialog(dlg)
    OpenPreGameMainMenu()
end

function FinalStandFinale:StartFinalChance()
    Game.FinalStand.finalChance = true

    local sector
    GetFinalStandSector(true)
    local message =
    "This is your <em>Last Chance</em>, gather all your mercs and resources and take <em><sector></em> back!"

    CombatLog("important", T { 156954263652, message, sector = sector })
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

    local duration = ReadDurationFromText(_InternalTranslate(self.gameOverMsg))

    g_DisclaimerSplashScreen = SplashText(self.gameOverMsg, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    CloseDialog(dlg)
    OpenPreGameMainMenu()
end
