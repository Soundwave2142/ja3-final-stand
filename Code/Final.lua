--- ===================================================================================================================
--- Responsible for all ending related functionality.
---
--- @author Soundwave2142
--- ===================================================================================================================

--- If on conflict end player does not control the sector:
--- A) Initiate Final Chance.
--- B) Initiate bad ending if Final Chance was previously initiated.
function OnMsg.ConflictEnd()
    if not IsFinalStand() then
        return
    end

    if IsFinalStandSectorPlayerControlled() then
        return
    end

    if not FinalStandFinale:IsFinalChance() then
        FinalStandFinale:StartFinalChance()
    else
        FinalStandFinale:StartGameOver()
    end
end

--- If player opens SatView and has previously entered Final Chance, then show popup but only once per Final Chance.
function OnMsg.StartSatelliteGameplay()
    if FinalStandFinale:IsFinalChance() and not Game.FinalStand.finalChancePopup then
        CreateRealTimeThread(FinalStandFinale.ShowFinalChancePopup)
        Game.FinalStand.finalChancePopup = true
    end
end

--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- @class FinalStandFinale
--- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
DefineClass.FinalStandFinale = {
    OutroMsg = T(214200009901, "You survived your Final Stand. The locations is secured and you can rest, for now..."),
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
    Sleep(2000)

    local dlg = OpenDialog("Fade")
    dlg.idFade:SetVisible(true, true)

    Sleep(2000)

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
end

function FinalStandFinale:ShowFinalChancePopup()
    local popupHost = GetDialog("PDADialogSatellite")
    popupHost = popupHost and popupHost:ResolveId("idDisplayPopupHost")

    local dlg = CreateMessageBox(
        popupHost,
        T(214200009900, "Last Chance"),
        T(214200009901, "Your mercs have perished and you have lost the sector!") .. '\n\n' ..
        T(214200009902,
            "This is your <em>Last Chance</em>, gather all your resources and create a new squad. Take that sector back at all cost!")
    )
    dlg:Wait()
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
    Sleep(2000)

    local dlg = OpenDialog("Fade")
    dlg.idFade:SetVisible(true, true)

    Sleep(2000)

    local duration = ReadDurationFromText(_InternalTranslate(self.GameOverMsg))

    g_DisclaimerSplashScreen = SplashText(self.GameOverMsg, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    CloseDialog(dlg)
    OpenPreGameMainMenu()
end
