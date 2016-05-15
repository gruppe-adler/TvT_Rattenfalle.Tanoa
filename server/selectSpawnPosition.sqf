pilotTeleport = {
	CRASH_SITE = _this;
	publicVariableServer "CRASH_SITE";
	debugLog("pilot published crash site");

	CRASH_SITE_SELECTED = true;
	publicVariable "CRASH_SITE_SELECTED";
};

_selectedCrashSite = getMarkerPos (possibleSpawnPositions call BIS_fnc_selectRandom);
_selectedCrashSite call pilotTeleport;