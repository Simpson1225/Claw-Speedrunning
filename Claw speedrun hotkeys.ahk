#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Global variables
pressDelay = 70 ; How long to wait before Menu inputs
smallLoadDelay = 400 ; How long to wait for menu page transitions
levelLoadDelay = 12000 ; Wait for a level to load for the first time
levelQuitDelay = 2500 ; How long to wait after quitting a level before the main menu can be used
bossWarpCheatDelay = 5500 ; How long to wait for mpskinner boss warp
aquatisCutsceneDelay = 16000 ; How long to wait for Aquatis cutscene

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

InitialiseForSpeedrun() {
    Send, mpfps
    Send, mpstopwatch
}

PrepareGameForRuns() {
    DisableFrontLayer()
    LoadingStorage()
}

; Disables the front layer in the options page.
; Start on 'Single Player' option of main menu
; Finishes on 'Single Player' option of main menu
DisableFrontLayer() {
    global pressDelay
    global smallLoadDelay

    ; Move Down to options
    Loop, 2 {
        MenuDown()
    }

    MenuSelectOption() ; Choose options

    ; Move to Display
    Loop, 2 {
        MenuDown()
    }

    MenuSelectOption() ; Choose Display
    MenuDown() ; Move to Front Layer
    MenuSelectOption() ; Disable front layer

    ; Return to main menu
    Loop, 2 {
        MenuBackOrOpen()
    }

    ; Move up to 'Single Player'
    Loop, 2 {
        MenuUp()
    }
}

; Start from main menu of Claw with 'Single Player' selected
LoadingStorage() {
    Loop, 11 {
        loadingStorageForLevel(A_Index)
    }

    TriggerAquatisCutscene()
    loadingStorageForLevel(13)
    loadingStorageForLevel(14)
}

; Loads the start of a level, and then quits to main menu
; Starts and finishes on 'Single Player' option of main menu
; The current player needs to have reached the level so that it is loadable
loadingStorageForLevel(targetLevel) {
    global levelLoadDelay
    global levelQuitDelay

    LoadLevel(targetLevel)
    Sleep, levelLoadDelay
    QuitToMainMenu()
    Sleep, levelQuitDelay
}

; Starts on 'Single Player' option of main menu
; The current player needs to have reached the level so that it is loadable
LoadLevel(targetLevel) {
    global pressDelay
    global smallLoadDelay

    MenuSelectOption() ; Choose single player
    MenuDown() ; Move to Load Game
    MenuSelectOption() ; Choose new game
    NavigateToLevelInMenu(targetLevel)
    MenuSelectOption() ; Choose selected level
    MenuSelectOption() ; Load from start
}

; Starts on the Level menu, with La Roca selected
; Uses arrow keys to move to the target level option
NavigateToLevelInMenu(targetLevel) {
    ; Move to correct column and calculate number of downward steps to take
    if (targetLevel >= 8) {
        MenuRight()

        downMovements := targetLevel - 8
    } else {
        downMovements := targetLevel - 1
    }

    ; Perform downward steps
    i := 0
    while (i < downMovements) {
        MenuDown()
        i := i + 1
    }
}

QuitToMainMenu() {
    global pressDelay
    global smallLoadDelay

    MenuBackOrOpen() ; Open menu
    MenuUp() ; Move to End Game option
    MenuSelectOption() ; Hit end game
    MenuSelectOption() ; Confirm end game
}

; Start from 'Single Player' on the main menu
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
    Sleep, pressDelay
}

; Presses Up to move up a menu option
MenuUp() {
    global pressDelay
    global smallLoadDelay

    Send, {Up down}
    Sleep, pressDelay
    Send, {Up up}
    Sleep, pressDelay
}

; Presses Down to move up a menu option
MenuDown() {
    global pressDelay
    global smallLoadDelay

    Send, {Down down}
    Sleep, pressDelay
    Send, {Down up}
    Sleep, pressDelay
}

; Presses Right to move up a menu option
MenuRight() {
    global pressDelay
    global smallLoadDelay

    Send, {Right down}
    Sleep, pressDelay
    Send, {Right up}
    Sleep, pressDelay
}
