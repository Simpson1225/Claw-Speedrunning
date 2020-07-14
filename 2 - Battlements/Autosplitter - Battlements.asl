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
		current.level == 2
		&& current.xPos <= 430
		&& current.xPos >= 410
	) {
		vars.split = 1;
		return true;
	}

}

/*
* When you return true in the split action, the timer will split
*/
split {
	// Started moving
	if (
		vars.split < 2
		&& old.xPos < 430
		&& current.xPos >= 430
	) {
		vars.split = 2;
		return true;
	}

	// Skip started
	if (
		vars.split < 3
		&& current.xPos < 3700
		&& current.xPos >= 3400
		&& old.yPos >= 3570
		&& current.yPos < 3570
	) {
		vars.split = 3;
		return true;
	}

	// Warp
	if (
		vars.split < 4
		&& current.xPos >= 5830
		&& current.xPos <= 5900 
		&& old.yPos < 2900
		&& current.yPos >= 2900
	) {
		vars.split = 4;
		return true;
	}

	// Skip completed
	if (
		vars.split < 5
		&& old.xPos < 17600
		&& current.xPos >= 17600 
		&& current.yPos >= 2300
		&& current.yPos <= 2700
	) {
		vars.split = 5;
		return true;
	}

	// Finish
	if (
		vars.split < 6
		&& old.xPos < 20230
		&& current.xPos >= 20230
	) {
		vars.split = 6;
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