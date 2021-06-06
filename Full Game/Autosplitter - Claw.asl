state("claw") {
	int xPos: 0x01365D4, 0x5C;
	int yPos: 0x01365D4, 0x60;
	int level: 0x1360AC;
	int paused: 0x135FE4;
	int loading: 0x136B60;
	int mainMenu: 0x1362A0;
	int playingLevel: 0x1365D4;
	int levelTime: 0x135928;
}

startup {
	refreshRate = 60;
	settings.Add("stopOnPause", false, "Pause timer when game is paused");
}

init {
	vars.isOnMainMenu = true;
	vars.isLoading = false;
	vars.isPaused = false;
	vars.isOnCutscene = false;
	vars.bossSplit = 0;
}

update {
	vars.isOnMainMenu = current.mainMenu != 0 && current.playingLevel == 0;
	vars.isPaused = current.paused != 0;
	vars.isLoading = current.loading == 0;
	vars.isOnCutscene = current.playingLevel == 0 && current.mainMenu == 0 && current.loading != 0;

	// print("xPos: " + current.xPos);
	// print("yPos: " + current.yPos);
	// print("level: " + current.level);
	// print("paused: " + current.paused);
	// print("loading: " + current.loading);
	// print("mainMenu: " + current.mainMenu);
	// print("playingLevel: " + current.playingLevel);
	// print("levelTime: " + current.levelTime);
	// print("vars.bossSplit: " + vars.bossSplit);

	if (current.level == 1) {
		vars.bossSplit = 0;
	}
}

split {
	if (old.playingLevel != 0 && current.playingLevel == 0 && current.mainMenu == 0 && current.loading != 0) {
		return true;
	}
	
	// Le Raux
	if (
		current.level == 2
		&& vars.bossSplit == 0
		&& current.xPos >= 23300 // Right of this
		&& current.xPos <= 24500 // Left of this
		&& current.yPos >= 3350 // Below this
		&& current.yPos <= 4400 // Above this
	) {
		vars.bossSplit = 1;
		return true;
	}

	// Katherine
	if (
		current.level == 4
		&& vars.bossSplit <= 1
		&& current.xPos >= 18200 // Right of this
		&& current.xPos <= 18860 // Left of this
		&& current.yPos >= 600 // Below this
		&& current.yPos <= 1950 // Above this
	) {
		vars.bossSplit = 2;
		return true;
	}

	// Wolvington
	if (
		current.level == 6
		&& vars.bossSplit <= 2
		&& current.xPos >= 34200 // Right of this
		&& current.xPos <= 36000 // Left of this
		&& current.yPos >= 3800 // Below this
		&& current.yPos <= 4800 // Above this

	) {
		vars.bossSplit = 3;
		return true;
	}

	// Gabriel
	if (
		current.level == 8
		&& vars.bossSplit <= 3
		&& current.xPos >= 42300 // Right of this
		&& current.xPos <= 43700 // Left of this
		&& current.yPos >= 4500 // Below this
		&& current.yPos <= 5500 // Above this
	) {
		vars.bossSplit = 4;
		return true;
	}

	// Marrow
	if (
		current.level == 10
		&& vars.bossSplit <= 4
		&& current.xPos >= 40300 // Right of this
		&& current.xPos <= 41400 // Left of this
		&& current.yPos >= 6700 // Below this
		&& current.yPos <= 7600 // Above this
	) {
		vars.bossSplit = 5;
		return true;
	}

	// Aquatis
	if (
		current.level == 12
		&& vars.bossSplit <= 5 
		&& current.xPos >= 37000 // Right of this
		&& current.xPos <= 38300 // Left of this
		&& current.yPos >= 3100 // Below this
		&& current.yPos <= 3800 // Above this
	) {
		vars.bossSplit = 6;
		return true;
	}

	// Red Tail
	if (
		current.level == 13
		&& vars.bossSplit <= 6
		&& current.xPos >= 36900 // Right of this
		&& current.xPos <= 38000 // Left of this
		&& current.yPos >= 1600 // Below this
		&& current.yPos <= 2300 // Above this
	) {
		vars.bossSplit = 7;
		return true;
	}

	// Omar
	if (
		current.level == 14
		&& vars.bossSplit <= 7
		&& current.xPos >= 39700 // Right of this
		&& current.xPos <= 44200 // Left of this
		&& current.yPos >= 500 // Below this
		&& current.yPos <= 3100 // Above this
	) {
		vars.bossSplit = 8;
		return true;
	}
}

isLoading {
	if (settings["stopOnPause"]) {
		return vars.isLoading || vars.isPaused;
	} else {
		return vars.isLoading;
	}
}