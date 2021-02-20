#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Global variables
pressDelay = 70 ; How long to wait before Menu inputs
smallLoadDelay = 200 ; How long to wait for menu page transitions
levelLoadDelay = 11000 ; Wait for a level to load for the first time
levelQuitDelay = 2500 ; How long to wait after quitting a level before the main menu can be used
bossWarpCheatDelay = 5000 ; How long to wait for mpskinner boss warp
aquatisCutsceneDelay = 15000 ; How long to wait for Aquatis cutscene

; Hotkey to reveal ingame timer and FPS
#IfWinActive Claw
CapsLock::
    InitialiseForSpeedrun()
    return

; Remap the F1 help key to something easier to press
#IfWinActive Claw
4::F1

; Hotkey to toggle flying
#IfWinActive Claw
Numpad1::
    Send, mpfly
    return

; Hotkey to toggle god mode
#IfWinActive Claw
Numpad2::
    Send, mpkfa
    return

; Hotkey to add catnip
#IfWinActive Claw
Numpad3::
    Send, mpfreak
    return

; Hotkey to run script that performs loading storage etc. automatically
#IfWinActive Claw
^Numpad9::
    PrepareGameForRuns()
    return

; Hotkey to quit this .ahk script if the loading storage script goes wrong
^Numpad8::
    ExitApp
    Return

; Hotkey to load level 12 and then trigger the Aquatis cutscene automatically
#IfWinActive Claw
^Numpad7::
    TriggerAquatisCutscene()
    return

class MainMenu {
    static SINGLE_PLAYER := "s"
    static NEW_GAME := "n"
    static REPLAY_MOVIES := "r"
    static OPTIONS := "o"
    static CREDITS := "c"
    static HELP := "h"
    static QUIT := "q"
}

class SinglePlayer {
    static NEW_GAME := "n"
    static LOAD_GAME := "l"
    static LOAD_CUSTOM_LEVEL := "c"
    static SAVE_GAME := "s"
    static UPLOAD_SCORES := "u"
    static BACK := "b"
}

class LevelMenu {
    static LA_ROCA := "r"
    static BATTLEMENTS := "a"
    static FOOTPATH := "f"
    static DARK_WOODS := "w"
    static TOWNSHIP := "o"
    static PUERTO_LOBOS := "l"
    static DOCKS := "d"
    static SHIPYARDS := "s"
    static PIRATES_COVE := "p"
    static CLIFFS := "c"
    static CAVERNS := "v"
    static UNDERSEA_CAVES := "u"
    static TIGER_ISLAND := "i"
    static TEMPLE := "t"
    static BACK := "b"
}

class LoadMenu {
    static START = "s"
    static SAVE_POINT_1 = "1"
    static SAVE_POINT_2 = "2"
    static BACK := "b"
}

class Options {
    static EDIT_PLAYERS = "e"
    static CONTROLS = "c"
    static DISPLAY = "i"
    static AUDIO = "a"
    static BACK = "b"
}

class Display { 
    static DETAIL = "d"
    static FRONT_LAYER = "f"
    static GAME_PLAY_AREA = "g"
    static MOVIES = "m"
    static BACK = "b"
}

class Audio {
    static SOUND = "s"
    static VOICE = "v"
    static AMBIENT = "a"
    static MUSIC = "m"
    static BACK = "b"
}

class GameMenu {
    static RESUME_GAME = "r"
    static END_LIFE = "l"
    static OPTIONS = "o"
    static HELP = "h"
    static END_GAME = "e"
}

class EndGameMenu {
    static YES = "y"
    static NO = "n"
}

InitialiseForSpeedrun() {
    Send, mpfps
    Send, mpstopwatch
}

PrepareGameForRuns() {
    DisableFrontLayer()
    LoadingStorage()
}

; Disables the front layer in the options page.
; Start on main menu page
DisableFrontLayer() {
    global pressDelay
    global smallLoadDelay

    PressMenuHotkey(MainMenu.OPTIONS)
    PressMenuHotkey(Options.DISPLAY)
    PressMenuHotkey(Display.FRONT_LAYER)
   
    ; Return to main menu
    MenuBackOrOpen()
    MenuBackOrOpen()
}

; Start from main menu
LoadingStorage() {
    Loop, 11 {
        loadingStorageForLevel(A_Index)
    }

    TriggerAquatisCutscene()
    loadingStorageForLevel(13)
    loadingStorageForLevel(14)
}

; Loads the start of a level, and then quits to main menu
; Starts and finishes on main menu
; The current player needs to have reached the level so that it is loadable
loadingStorageForLevel(targetLevel) {
    global levelLoadDelay
    global levelQuitDelay

    StartNewLevel(targetLevel)
    Sleep, levelLoadDelay
    QuitToMainMenu()
    Sleep, levelQuitDelay
}

; Starts on main menu
; The current player needs to have reached the level so that it is loadable
LoadLevel(targetLevel) {
    PressMenuHotkey(MainMenu.SINGLE_PLAYER)
    PressMenuHotkey(SinglePlayer.LOAD_GAME) 
    PressMenuHotkey(GetLevelHotkeyByLevelNumber(targetLevel))
    MenuSelectOption() ; hotkey for start doesn't seem to work 
}

StartNewLevel(targetLevel) {
    PressMenuHotkey(MainMenu.SINGLE_PLAYER)
    PressMenuHotkey(SinglePlayer.NEW_GAME) 
    PressMenuHotkey(GetLevelHotkeyByLevelNumber(targetLevel))
}

GetLevelHotkeyByLevelNumber(levelNumber) {
    if (levelNumber = 1) {
        return LevelMenu.LA_ROCA
    }
    else if (levelNumber = 2) { 
        return LevelMenu.BATTLEMENTS
    }
    else if (levelNumber = 3) { 
        return LevelMenu.FOOTPATH
    }
    else if (levelNumber = 4) { 
        return LevelMenu.DARK_WOODS
    }
    else if (levelNumber = 5) {
        return LevelMenu.TOWNSHIP
    }
    else if (levelNumber = 6) {
        return LevelMenu.PUERTO_LOBOS
    }
    else if (levelNumber = 7) {
        return LevelMenu.DOCKS
    }
    else if (levelNumber = 8) {
        return LevelMenu.SHIPYARDS
    }
    else if (levelNumber = 9) {
        return LevelMenu.PIRATES_COVE
    }
    else if (levelNumber = 10) {
        return LevelMenu.CLIFFS
    }
    else if (levelNumber = 11) {
        return LevelMenu.CAVERNS
    }
    else if (levelNumber = 12) {
        return LevelMenu.UNDERSEA_CAVES
    }
    else if (levelNumber = 13) {
        return LevelMenu.TIGER_ISLAND
    }
    else if (levelNumber = 14) {
        return LevelMenu.TEMPLE
    }
    else {
        return ""
    }
}

QuitToMainMenu() {
    global pressDelay
    global smallLoadDelay

    MenuBackOrOpen() ; Open menu
    PressMenuHotkey(GameMenu.END_GAME)
    PressMenuHotkey(EndGameMenu.YES)
}

; Start from main menu
TriggerAquatisCutscene() {
    global levelLoadDelay
    global levelQuitDelay
    global bossWarpCheatDelay
    global aquatisCutsceneDelay

    LoadLevel(12)
    Sleep, levelLoadDelay
    Send, mpskinner
    Sleep, bossWarpCheatDelay

    ; Enter Boss Warp
    Send, {Right down}
    Sleep, 1500
    Send, {Right up}

    ; Wait for Cutscene
    Sleep, aquatisCutsceneDelay

    QuitToMainMenu()
    Sleep, levelQuitDelay
}

PressMenuHotkey(menuHotkey) {
    global pressDelay
    global smallLoadDelay

    Send, {%menuHotkey% down}
    Sleep, pressDelay
    Send, {%menuHotkey% up}
    Sleep, smallLoadDelay
}

; Presses enter to select an option from the menu
MenuSelectOption() {
    global pressDelay
    global smallLoadDelay

    Send, {Enter down}
    Sleep, pressDelay
    Send, {Enter up}
    Sleep, smallLoadDelay
}

; Goes back to previous page in menu, or opens the menu if in game
MenuBackOrOpen() {
    global pressDelay
    global smallLoadDelay

    Send, {Esc down}
    Sleep, pressDelay
    Send, {Esc up}
    Sleep, smallLoadDelay
}
