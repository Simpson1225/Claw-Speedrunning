# Claw Speedrunning Guide

(In progress...)

This guide will cover Claw Speedrunning in detail, assumes that you have already read the [Quickstart Guide](./Quickstart Guide.md) and installed the software mentioned there. 

## Hotkeys

An [Autohotkey](https://www.autohotkey.com/docs/AutoHotkey.htm) file called `Claw speedrun hotkeys.ahk` is included in this repo, which adds some useful hotkeys while it is running:

 - CapsLock: `mpstopwatch` and `mpfps` to toggle ingame timer and FPS
 - 4: Maps onto the F1 help button to put this in a more helpful place
 - Ctrl+Numpad0: `mpartur` to allow buffering jump key for double jumps
 - Ctrl+Numpad1: `mpfly` to make Claw fly
 - Ctrl+Numpad2: `mpkfa` to toggle god mode
 - Ctrl+Numpad3: `mpfreak` to add catnip
 - Ctrl+Numpad4: `mpvader` to add invincibility
 - Ctrl+Numpad5: `mparmor` to disable death tiles
 - Ctrl+Numpad6: `mpskinner` to skip to end of level
 - Hotkeys for loading storage, see the section below on loading storage

Only the first two are allowed during an actual run, obviously, and the ingame timer must be visible, although Livesplit does the actual run timing. Your FPS must be 60 for speedrunning Claw. Autohotkey must already be installed for this file to be able to run. The cheat codes use `Ctrl+Numpad` rather than just `Numpad` to avoid pressing by accident.

These hotkeys should be straightforward to customise by editing `Claw speedrun hotkeys.ahk` and using the [Autohotkey documentation](https://www.autohotkey.com/docs/AutoHotkey.htm).

## Loading Storage

 (In Progress...)

### Loading Storage hotkeys

The `Claw speedrun hotkeys.ahk` file contains hotkeys that can automate loading storage and preparing the game for speedruns. These follow a script that navigates Claw's menus and loads each level for you. They work by waiting a certain amount of time for each level or menu page to load, and they wait a bit extra just to make sure. The script has no understanding of what it is doing, so if something goes wrong, it will simply continue following the script until it finishes or you stop it. The Ctrl+Numpad8 hotkey is used to kill the script if it goes wrong. While the script is running, do not do not press any buttons or move away from the Claw window, or it will break it. Each script starts from the 'Single Player' option of the main menu, if you start anywhere else, the script will press the wrong buttons and so do the wrong things without realising.

- Ctrl + Numpad9:
  - Run this when you first open Claw, it prepares the game for speedruns
  - Disables the Front Layer in 'Options menu'
  - Loads every level in the game for loading storage
  - Triggers Aquatis cutscene
  - Does not support RTG storage (yet...)
  - Takes just under 5 mins to run
- Ctrl + Numpad8:
  - Kill the `.ahk` script if the loading storage scripts go wrong
  - You must restart the `.ahk` script to use it again
- Ctrl + Numpad7:
  - Just performs Aquatis cutscene trigger
  - takes about 30 seconds to run