/*
* update will always be run first. There are no conditions on the execution of this action.
* If update did not explicitly return false and the timer is currently either running or paused, then the isLoading, gameTime, and reset actions will be run.
* If reset does not explicitly return true, then the split action will be run.
* If update did not explicitly return false and the timer is currently not running (and not paused), then the start action will be run.
 */

state("Claw") {
	int xPos: 0x01365D4, 0x5C;
	int yPos: 0x01365D4, 0x60;
	int level: 0x1360AC;
	int paused: 0x135FE4;
	int loading: 0x136B60;
	int mainMenu: 0x1362A0;
	int playingLevel: 0x1365D4;
	int levelTime: 0x135928;
}

/*
* Startup is triggered when the script first loads. In startup you can put things that don't
* rely on your game's process. This is the only part of the script where you can add custom
* options
 */
startup {
	refreshRate = 60;
	settings.Add("stopOnPause", false, "Pause timer when game is paused");
	settings.Add("debugInfo", false, "Print autosplitter debug info that can be viewed with DebugView");
}

/* Init is triggered whenever game has been found by using state descriptors */
init {
	vars.split = 0;
}

/* 
* In each update iteration, this is run before the timer control actions,
* which e.g. means if you set a value in vars in update you can then access it in start on the same update cycle.
* Update is useful for checking values and changing variables based on those values
* Update happens even when the timer is not running
* happens 60 times per second, due to refresh rate
* Explicitly returning false will prevent the actions isLoading, gameTime, reset, split, and start from being run. This can be useful if you want to entirely disable the script under some conditions (e.g. for incompatible game versions)
*/
update {
	if (settings["debugInfo"]) {
		print("X Pos: " + current.xPos);
		print("Y Pos: " + current.yPos);
		print("Current level: " + current.level);
		print("vars.split: " + vars.split);
	}

}

start {
	if (
		current.level == 11
		&& current.xPos >= 3390
		&& current.xPos <= 3400
	) {
		vars.split = 1;
		return true;
	}

}

/*
* When you return true in the split action, the timer will split
*/
split {
	/*
	Split template

	// 
	if (
		vars.split < 
		&& current.xPos >=  // Right of this
		&& current.xPos <=  // Left of this
		&& current.yPos >=  // Below this
		&& current.yPos <=  // Above this
	) {
		vars.split = ;
		return true;
	}
	*/

	// Started moving
	if (
		vars.split < 2
		&& current.xPos >= 3400  // Right of this
	) {
		vars.split = 2;
		return true;
	}

	// Ladder drop
	// Score: 137300 (Before killing the siren by the flag)
	if (
		vars.split < 3
		&& current.xPos >= 6550 // Right of this
		&& current.yPos <= 1500 // Above this
	) {
		vars.split = 3;
		return true;
	}

	// After toggle pegs
	// Score: 207200 (After the last coin on the peg, before collecting scepters or treasure around the flag)
	if (
		vars.split < 4
		&& current.xPos >= 8950 // Right of this
		&& current.yPos <= 1530 // Above this
	) {
		vars.split = 4;
		return true;
	}

	// Flag after 4 pegs
	// Score: 346000 (After last toggle peg but before any treasure on the ground)
	if (
		vars.split < 5
		&& current.xPos >= 12360 // Right of this
		&& current.yPos <= 1600 // Above this
	) {
		vars.split = 5;
		return true;
	}

	// After Warp area
	// Score: 418600 (Before any treasure or enemies around the flag)
	if (
		vars.split < 6
		&& current.xPos >= 14550 // Right of this
		&& current.yPos >= 1100 // Below this
		&& current.yPos <= 1400 // Above this
	) {
		vars.split = 6;
		return true;
	}

	// Checkpoint 1
	// Score: 508900 (There is time to check the score here so worth displaying this score in the split title)
	if (
		vars.split < 7
		&& current.xPos >= 17151 // Right of this
		&& current.yPos <= 1600 // Above this
	) {
		vars.split = 7;
		return true;
	}

	// Left Arrow
	// Score depends very much on the order in which things are done
	if (
		vars.split < 8
		&& current.xPos >= 15000 // Right of this
		&& current.xPos <= 15160 // Left of this
		&& current.yPos >= 3550 // Below this
		&& current.yPos <= 3900 // Above this
	) {
		vars.split = 8;
		return true;
	}

	// Checkpoint 2
	// Score: 839200 (There is time to check the score here so worth displaying this score in the split title)
	if (
		vars.split < 9
		&& current.xPos >= 10800 // Right of this
		&& current.xPos <= 11120 // Left of this
		&& current.yPos >= 3440 // Below this
		&& current.yPos <= 4100 // Above this
	) {
		vars.split = 9;
		return true;
	}

	// Above Warp
	// Score: 933500
	if (
		vars.split < 10
		&& current.xPos >= 8000 // Right of this
		&& current.xPos <= 8380 // Left of this
		&& current.yPos >= 2200 // Below this
		&& current.yPos <= 3000 // Above this
	) {
		vars.split = 10;
		return true;
	}

	// Frost Sword Section
	// Score: 1055600 (Before collecting any coins on the crumble blocks)
	if (
		vars.split < 11
		&& current.xPos >= 3500 // Right of this
		&& current.xPos <= 4000 // Left of this
		&& current.yPos >= 2250 // Below this
		&& current.yPos <= 2800 // Above this
	) {
		vars.split = 11;
		return true;
	}

	// Finish
	// Score: 1122400
	if (
		vars.split < 12
		&& current.xPos >= 3350 // Right of this
		&& current.xPos <= 3500 // Left of this
		&& current.yPos >= 1300 // Below this
		&& current.yPos <= 1423 // Above this
	) {
		vars.split = 12;
		return true;
	}
}

/*
* Pauses game time whenever this returns true, game time continues while this returns false
* Doesn't affect Real Time Attack (RTA) at all
*/
isLoading {
	return false;
}
