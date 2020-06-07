#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

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


InitialiseForSpeedrun() {
    Send, mpfps
    Send, mpstopwatch
}
