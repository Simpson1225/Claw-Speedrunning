# Claw Speedrunning

Speedrunning is a great way to continue playing Claw after you have already played the game normally. This guide will explain how to get set up for speedrunning the game, and record your first run. It also contains tools for more advanced speedruns, such as automatic timers for each level. Everything used here is free and won’t take long to install.

## Quickstart guide

 - Install [Claw 1.4.4.4](https://captainclaw.net/dl/CLAW-1.4.4.4.zip) (Other versions may be compatible but haven't been tested)
 - Install [Livesplit](http://livesplit.org/downloads/) - for timing runs
 - Install [Autohotkey](https://www.autohotkey.com/) - For creating hotkeys and remapping buttons
 - Download [Basic Speedrun Hotkeys](https://www.speedrun.com/tools/Claw_Speedrun_Hotkeys_Basic_3y9m5.lss) - Hotkey to toggle in-game timer and FPS
 - Recommended: Join [Claw Discord](https://discord.gg/2GCj9hj) - Ask in the #speedrun channel for help
 - Recommended: Download [OBS Studio](https://obsproject.com/download) - to record runs
 
 Note that there are alternatives to some of these if you prefer, but this guide will assume usage of the software listed above.
 
 ### Timing runs
 
 Runs are timed using Livesplit, accurate to 1/100th of a second, so you should always have Livesplit timer running when recording runs. Open Livesplit, right click it and go to settings. Choose hotkeys for start/split and reset. For full game runs, timing starts when you select new game on La Roca, and ends when you touch the last Gem, on the Omar boss fight. For Individual Level (IL) runs, timing starts on the first frame that the screen goes black after the loading screen, and ends when you touch the end of level trigger, or the red boss warp if the level has one.
 
 The in game timer is not used for timing runs, because it is only accurate to 1 second and pauses in some situations, such as using warps, dying, when the game is paused. It is very helpful to have visible though during runs because you can use it to tell where elevators and ropes etc. will be even before they are on screen. While in a level, type MPSTOPWATCH to toggle the timer. Since you can't type this during a run, you need a hotkey to toggle it for you. With Autohotkey installed, run the `Claw_Speedrun_Hotkeys_Basic.lss` file downloaded above. Press CapsLock while in a level to toggle the timer and FPS. The best time to press this is just before Claw can move, at the start of your run.
 
### FPS

Your Frames per Second (FPS) in Claw can have a big effect on how the game feels to play - while in a level, type MPFPS to view framerate. A framerate of 60FPS is required in order for speedruns to be valid on the leaderboards, although if you are unable to achieve this framerate you can still have fun with more casual speedrunning. Lower framerates can slow movement and cut jumps short, higher framerate will speed up movement but slows down elevators and makes dynamite jumping harder. Since FPS is useful for run verification, the FPS counter is enabled with the in game timer using the CapsLock hotkey from the `Claw_Speedrun_Hotkeys_Basic.lss` file downloaded above.
 
### Recording a run

OBS Studio can be used to record speedruns, there are plenty of guides online for how to set this up, so it won't be covered in detail here. For an example very basic setup:

- Run OBS Studio, Claw and Livesplit
- In OBS, add a new 'Scene' called 'Claw', then select it
- In 'Sources', add a new game capture called 'Claw'. Choose mode 'Capture specific window' and select the claw window
- In 'Sources'. and a new window capture called 'Livesplit', and select the Livesplit window
- In OBS, rearange and resize Claw and Livesplit to how you want the layout to be in the recording
- Click 'Settings' and choose the recording settings you want

### First speedrun - La Roca

La Roca is a good first speedrun since it is short and the enemies die in one hit, an example run can be seen [here](https://www.youtube.com/watch?v=lQPaYqKf-6o), and there is also a [tutorial](https://www.youtube.com/watch?v=bqWTx-3ZFT4). There are two key cycles in the middle of the level that will make a big difference to your final time. Firstly there is the pair of elevators that go up and down, the fastest possible is to arrive at the left side of these at 0:37 on the in game timer, although this is quite advanced. For new speerunners a good target is to arrive at the right side at 0:40, we call this the 'second cycle'. The other key cycle is the three toggle pegs just after this. With perfect movement it is possible to reach these at 0:45, but this is very difficult. For a new speedrunner, a good target is 0:53, which is the third cycle. If you get these cycles, a good final time would be a 1:25 or 1:26 on the in game timer (about 1:28 on livesplit timer).

### Next steps

If you want to go further with Claw speedrunning, this repository contains more tools for speedrunning, including:

- Livesplit layout files so that it is more that just a basic timer
- Livesplit splits files for every level and the full game
- Livesplit autosplitters (so that the timer starts, stops and splits automatically) for every level and the full game
- A set of Claw icons, used in the livesplit splits files
- A more detailed Autohotkey file that includes hotkeys for some cheat codes that are useful for practicing
- Instructions on how to use the livesplit and autohotkey files

#### Useful links and resources

- [Full game speedrun leaderboard](https://www.speedrun.com/claw/full_game)
- [Individual level records](https://www.speedrun.com/claw/individual_levels)
- [Guides on speedrun.com](https://www.speedrun.com/claw/guides)
- [Nohboard](https://sourceforge.net/projects/nohboard/) - An option for recording keyboard inputs if you want

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
