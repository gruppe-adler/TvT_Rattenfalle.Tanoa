DEBUG = true;
//
// customizable variables
//
customRespawnTime = 10;


// functional variables - do not change!
player_respawned = false;

if (isServer) then {

	// possible crash site markerlist
	crash_sites = [
			"mrk_crash_site_01",
			"mrk_crash_site_02",
			"mrk_crash_site_03",
			"mrk_crash_site_04",
			"mrk_crash_site_05",
			"mrk_crash_site_06",
			"mrk_crash_site_07",
			"mrk_crash_site_08",
			"mrk_crash_site_09",
			"mrk_crash_site_10"
	];
	0 = [] execVM "spawn\addRespawnLoadouts.sqf";

	// add crash sites to respawn positions of independents
	for [{_i=0}, {_i<count crash_sites}, {_i=_i+1}] do
	{
		[crashpilot, (crash_sites select _i)] call BIS_fnc_addRespawnPosition;
	};
	
};

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "vehicle_definitions\wrecks.sqf";
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "spawn\gui\initGUI.sqf";
[]execVM "helpers\supplyDropOnMarker.sqf";


if (isServer) then {
	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0,0];
	publicVariable "CRASH_SITE";

	VEHICLE_SUPPORT_WEST = [0,0,0];
	publicVariable "VEHICLE_SUPPORT_WEST";

	VEHICLE_SUPPORT_EAST = [0,0,0];
	publicVariable "VEHICLE_SUPPORT_WEST";

	VEHICLE_ORDERED_WEST = false;
	publicVariable "VEHICLE_ORDERED_WEST";

	westMinSpawnDistance = 6000;
	westMaxSpawnDistance = 7000;

	eastMinSpawnDistance = 1500;
	eastMaxSpawnDistance = 2500;

	russianCredits = 4000;
	mudschahedinCredits = 3000;

	russianSpawnPos = [0,0,0];
	publicVariable "russianSpawnPos";

	0 = [russianCredits,mudschahedinCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";
	
};

	// dont let west and east spawn too early
	waitUntil {(CRASH_SITE_SELECTED)};

	

if (isServer) then {

	0 = [] execVM "spawn\addRespawnPositions.sqf";
	
	[crew1, CRASH_SITE] call BIS_fnc_addRespawnPosition;
	[crew2, CRASH_SITE] call BIS_fnc_addRespawnPosition;
	[crew3, CRASH_SITE] call BIS_fnc_addRespawnPosition;

	"respawn_independent" setMarkerPos CRASH_SITE;
};