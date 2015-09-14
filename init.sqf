DEBUG = true;
//
// customizable variables
//
russianRespawnTime = 60;
mudschahedinRespawnTime = 60;

publicVariable "russianRespawnTime";
publicVariable "mudschahedinRespawnTime";

// functional variables - do not change!
player_respawned = 0;
checkObjectives = true;

0 = [] execVM "helpers\spawnSiteList.sqf";
0 = [] execVM "helpers\balancingPenalties.sqf";


If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "spawn\gui\initGUI.sqf";
[]execVM "spawn\supplyDropOnMarker.sqf";
[]execVM "helpers\addActionMP.sqf";
[]execVM "helpers\selectSpawnMarker.sqf";

null = [200,"CityMarker",1] execVM "SimplePatrolScript\initialize.sqf";
"CityMarker" setMarkerAlphaLocal 0;
// driving AI
//[] execVM "VCOM_Driving\init.sqf";


if (isServer) then {
	PILOTS_DEAD = false;
	publicVariable "PILOTS_DEAD";

	PILOTS_RESCUED = false;
	publicVariable "PILOTS_RESCUED";

	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0,0];
	publicVariable "CRASH_SITE";

	VEHICLE_SUPPORT_WEST = [0,0,0];
	publicVariable "VEHICLE_SUPPORT_WEST";

	VEHICLE_SUPPORT_EAST = [0,0,0];
	publicVariable "VEHICLE_SUPPORT_WEST";

	VEHICLE_ORDERED_WEST = [false,0];
	publicVariable "VEHICLE_ORDERED_WEST";

	VEHICLE_ORDERED_EAST = [false,0];
	publicVariable "VEHICLE_ORDERED_EAST";

	SETUP_DONE = false;
	publicVariable "SETUP_DONE";

	westMinSpawnDistance = 3500;
	westMaxSpawnDistance = 4500;

	eastMinSpawnDistance = 1500;
	eastMaxSpawnDistance = 2500;

	russianCredits = 5000;
	mudschahedinCredits = 5000;

	russianSpawnPos = [0,0,0];
	publicVariable "russianSpawnPos";

	mudschahedinSpawnPos = [0,0,0];
	publicVariable "mudschahedinSpawnPos";


	0 = [russianCredits,mudschahedinCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";
	
};

	// dont let west and east spawn too early
	//waitUntil {CRASH_SITE_SELECTED};

	

if (isServer) then {

	0 = [] execVM "spawn\addRespawnPositions.sqf";
	
	[crew1, CRASH_SITE] call BIS_fnc_addRespawnPosition;
	[crew2, CRASH_SITE] call BIS_fnc_addRespawnPosition;
	[crew3, CRASH_SITE] call BIS_fnc_addRespawnPosition;

};