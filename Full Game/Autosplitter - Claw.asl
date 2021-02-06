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
}

start {
	return !vars.isOnMainMenu && vars.isLoading;
}

split {
	if (old.playingLevel != 0 && current.playingLevel == 0 && current.mainMenu == 0 && current.loading != 0) {
		return true;
	}
	
	// Le Raux
	if (
		current.level == 2
		&& vars.bossSplit == 0
		&& old.xPos < 20230
		&& current.xPos >= 20230
	) {
		vars.bossSplit = 1;
		return true;
	}

	// Katherine
	if (
		current.level == 4
		&& vars.bossSplit == 1
		&& current.xPos < 16170
		&& current.xPos >= 16050
		&& current.yPos < 1450
	) {
		vars.bossSplit = 2;
		return true;
	}

	// Wolvington
	if (
		current.level == 6
		&& vars.bossSplit == 2
		&& current.xPos >= 30624 // Right of this
		&& current.xPos <= 30752 // Left of this
		&& current.yPos >= 3996 // Below this
		&& current.yPos <= 4178 // Above this

	) {
		vars.bossSplit = 3;
		return true;
	}

	// Gabriel
	if (
		current.level == 8
		&& vars.bossSplit == 3
		&& current.xPos >= 31567 // Right of this
		&& current.xPos <= 31687 // Left of this
		&& current.yPos >= 5074 // Below this
		&& current.yPos <= 5250 // Above this
	) {
		vars.bossSplit = 4;
		return true;
	}

	// Marrow
	if (
		current.level == 10
		&& vars.bossSplit == 4
		&& current.xPos >= 32350 // Right of this
		&& current.xPos <= 32496 // Left of this
		&& current.yPos >= 7669 // Below this
		&& current.yPos <= 7861 // Above this
	) {
		vars.bossSplit = 5;
		return true;
	}

	// Aquatis
	if (
		current.level == 12
		&& vars.bossSplit == 5 
		&& current.xPos >= 36330 // Right of this
		&& current.yPos >= 2000 // Above this
	) {
		vars.bossSplit = 6;
		return true;
	}

	// Red Tail
	if (
		current.level == 13
		&& vars.bossSplit == 6
		&& current.xPos >= 32943 // Right of this
		&& current.xPos <= 33055 // Left of this
		&& current.yPos >= 2179 // Below this
		&& current.yPos <= 2363 // Above this
	) {
		vars.bossSplit = 7;
		return true;
	}

	// Omar
	if (
		current.level == 14
		&& vars.bossSplit == 7
		&& current.xPos >= 31110 // Right of this
		&& current.xPos <= 31230 // Left of this
		&& current.yPos >= 2100 // Below this
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