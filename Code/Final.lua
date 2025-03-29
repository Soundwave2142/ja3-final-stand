function OnMsg.SatelliteTick()
    if not IsFinalStand() then
        return
    end

    if Game.FinalStand.currentWave >= Game.FinalStand.maxWaves then
        --- FinalStandFinale:StartEnding()
    end
end

DefineClass.FinalStandFinale = {
    outroMsg = Untranslated(
        "You survived your Final Stand, Congratulations! The locations is secured for now and you can rest, for now..."
    ),
}

function FinalStandFinale:StartEnding()
    if not CanYield() then
        CreateRealTimeThread(FinalStandFinale:StartEnding())
        return
    end

    Msg("FinalStandCampaignEnding")
    FinalStand:PlayOutro()
end

function FinalStandFinale:PlayOutro()
    Sleep(500)

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
