# Claw Speedrunning

This repo contains tools and guides for speedrunning the game Claw

## Livesplit and Autosplitter setup

 - Download this repository (Note: if you clone the repo, make a copy of the files and use those, to avoid having your splits data commited, or overwritten when you pull changes from the repo)
 - Recommended: Join [Claw Discord](https://discord.gg/2GCj9hj) (Ask here for help)

### Hotkeys

An [Autohotkey](https://www.autohotkey.com/docs/AutoHotkey.htm) file called `Claw speedrun hotkeys.ahk` is included in this repo, which adds some useful hotkeys while it is running:

 - CapsLock: `mpstopwatch` and `mpfps` to toggle ingame timer and FPS
 - 4: Maps onto the F1 help button to put this in a more helpful place
 - Numpad1: `mpfly` to make Claw fly
 - Numpad2: `mpkfa` to toggle god mode
 - Numpad3: `mpfreak` to add catnip

Only the first two are allowed during an actual run, obviously, and the ingame timer must be visible, although Livesplit does the actual run timing. Your FPS must be 60 for speedrunning Claw.

These hotkeys should be straightforward to customise by editing `Claw speedrun hotkeys.ahk` and using the [Autohotkey documentation](https://www.autohotkey.com/docs/AutoHotkey.htm). 

If you prefer not to use this, you can try `In game timer toggle trainer` on [Speedrun.com](https://www.speedrun.com/claw/resources) instead. 
 

### Start a Speedrun

These are the steps to set up livesplit with an autosplitter for the route to speedrun:

 - Run Claw
 - Run `Claw speedrun hotkeys.ahk` (or alternative)
 - Run Livesplit
   - In Livesplit, right click --> Open Layout --> From file
   - Select `Livesplit Layout - Single Level Runs.lsl` (or `Livesplit Layout - Full Game Runs.lsl`)
   - In Livesplit, right click --> Open Splits --> From file
   - Select The split (`.lss`) file for the route that you want to speedrun
   - In Livesplit, right click --> Edit Layout --> Layout Settings --> Scriptable Auto Splitter
   - Click `Browse...` for the script path, and select the autosplitter (`.asl`) file corresponding to the split file you selected
   - In Livesplit, right click --> Settings
   - Verify that settings are how you want them to be - the Reset hotkey is useful to know since the autosplitter files don't automatically reset
 - In game, start the level to speedrun
 - The livesplit timer should start automatically, split at certain points in the level, and stop at the end of the level
 - Check the hotkeys described in above section are working
 - Consider uploading your best times to [Speedrun.com](https://www.speedrun.com/claw/full_game)

### Changing to a different route

To set livesplit up for a different route:

- Change the Layout file if necessary (right click --> Open Layout --> From file)
- Open the new splits file (right click --> Open Splits --> From file)
- Select the autosplitter for the new route (right click --> Edit Layout --> Layout Settings --> Scriptable Auto Splitter --> Browse...)
