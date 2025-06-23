function IsFinalStandDebugger()
    -- TODO: check if debugger present
    return IsFinalStand()
end

--- ====================================================================================================
--- New Game / Loading Game
--- ====================================================================================================
function OnMsg.NewGame(game)
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: New game values loaded. Values are:")
    for key, value in pairs(game.FinalStand) do
        print(key, ':', value)
    end
end

function OnMsg.CampaignStarted()
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Campaign Started in:", GetFinalStandSector())
    print("Bobby Restock Time:", BobbyRayShopGetRestockTime())
end

function OnMsg.EnterSector(enterSector)
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Entered Sector ", enterSector)
end

function OnMsg.LoadGame()
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Game Loaded, variables:", Game.FinalStandLengths)
end

--- ====================================================================================================
--- Combat / Attack Generations
--- ====================================================================================================
function OnMsg.FinalStandWaveScheduled(time, currentWave)
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Starting wave", currentWave, "at", time)
end

function OnMsg.FinalStandAttackSquadsPicked(squads)
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Attack Squad ", squads, " picked")
end

function OnMsg.FinalStandAttackSquadsSpawning(squads)
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Attack Squad ", squads, " spawned")
end

function OnMsg.FinalStandWaveEnded()
    if not IsFinalStandDebugger() then
        return
    end

    if GetFinalStandCurrentWave() >= GetFinalStandMaxWaves() then
        print("Final Stand: Wave", Game.FinalStand.currentWave, "ended, playing finale.")
    else
        print("Final Stand: Wave", Game.FinalStand.currentWave, "ended, starting next one.")
    end
end

function OnMsg.FinalStandCampaignEnding()
    if not IsFinalStandDebugger() then
        return
    end

    print("Final Stand: Game ended, playing finale.")
end
