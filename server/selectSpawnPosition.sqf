
// selectable teleport positions
possibleSpawnPositions = 
[
	"mrk_crash_site_01",
	"mrk_crash_site_02",
	"mrk_crash_site_03",
	"mrk_crash_site_04"
];


pilotTeleport = {
	CRASH_SITE = _this;
	publicVariableServer "CRASH_SITE";
	debugLog("pilot published crash site");

	CRASH_SITE_SELECTED = true;
	publicVariable "CRASH_SITE_SELECTED";
};

_selectedCrashSite = getMarkerPos (possibleSpawnPositions call BIS_fnc_selectRandom);
_selectedCrashSite call pilotTeleport;