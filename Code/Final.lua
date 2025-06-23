--- ===================================================================================================================
--- @author Soundwave2142
--- ===================================================================================================================

local ShowFinalChancePopup = false
local ShowPostGameVictoryPopup = false
local ShowPostGameFailurePopup = false

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

    if not FinalStandFinale:IsFinalChance() and FinalStandFinale:CanStartFinalChance() then
        FinalStandFinale:StartFinalChance()
    else
        FinalStandFinale:StartGameOver()
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

    local text = GetFinalStandLengthValue("endVictoryText") or self.OutroMsg
    local duration = ReadDurationFromText(_InternalTranslate(text))

    g_DisclaimerSplashScreen = SplashText(text, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    ShowPostGameVictoryPopup = true
    CloseDialog(dlg)
    OpenPreGameMainMenu()
end

--- @return boolean
function FinalStandFinale:IsFinalChance()
    return Game.FinalStand.finalChance
end

--- @return boolean
function FinalStandFinale:CanStartFinalChance()
    -- GetMercPrice(unitData, 1)
end

function FinalStandFinale:StartFinalChance()
    ShowFinalChancePopup = true
    Game.FinalStand.finalChance = true
end

--- If player opens SatView and has previously entered Final Chance, then show popup but only once per Final Chance.
function OnMsg.StartSatelliteGameplay()
    if not IsFinalStand() then
        return
    end

    if FinalStandFinale:IsFinalChance() and ShowFinalChancePopup then
        CreateRealTimeThread(FinalStandFinale.ShowFinalChancePopup)
        ShowFinalChancePopup = false
    end
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

    local text = GetFinalStandLengthValue("endFailureText") or self.OutroMsg
    local duration = ReadDurationFromText(_InternalTranslate(text))

    g_DisclaimerSplashScreen = SplashText(text, "DisclaimerOnStart", 600, 1500, duration * 4)
    g_DisclaimerSplashScreen:SetMouseCursor("UI/Cursors/Hand.tga")

    local res = g_DisclaimerSplashScreen:Wait()
    g_DisclaimerSplashScreen = false

    Msg("CampaignEnd", "FinalStand")

    ShowPostGameFailurePopup = true
    CloseDialog(dlg)
    OpenPreGameMainMenu()
end

function OnMsg.PreGameMenuOpen()
    if ShowPostGameVictoryPopup or ShowPostGameFailurePopup then
        if not CanYield() then
            CreateRealTimeThread(FinalStandFinale.ShowPostGamePopup, ShowPostGameVictoryPopup)
        end

        ShowPostGameVictoryPopup = false
        ShowPostGameFailurePopup = false
    end
end

--- @param isSuccess boolean
function FinalStandFinale:ShowPostGamePopup(isSuccess)
    local dlg = GetPreGameMainMenu()

    if dlg then
        local title = T(214200009905, "Final Stand Game Completed!")
        local text = isSuccess
            and T(214200009906, "It would be greatly appreciated if you liked the mod")
            or T(214200009907, "You might have failed, but do not give up, try again!")

        WaitMessage(dlg, title, text, T(6900, "OK"))
    end
end
