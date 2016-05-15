DEBUG = true;
//
// customizable variables
//

setViewDistance 3500;

// functional variables - do not change!
player_respawned = 0;
checkObjectives = true;

// selectable teleport positions
possibleSpawnPositions = 
[
	"mrk_crash_site_01",
	"mrk_crash_site_02",
	"mrk_crash_site_03",
	"mrk_crash_site_04"
];



call compile preprocessfile "Engima\Traffic\Custom_GruppeAdler\createVehicle.sqf";
call compile preprocessfile "civilianOutrage\randomTakistani.sqf";

[] execVM "Engima\Traffic\Init.sqf";

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "spawn\gui\initGUI.sqf";
[]execVM "spawn\supplyDropOnMarker.sqf";
[]execVM "helpers\addActionMP.sqf";



// driving AI
[] execVM "VCOM_Driving\init.sqf";


if (isServer) then {
	PILOTS_DEAD = false;
	publicVariable "PILOTS_DEAD";

	PILOTS_RESCUED = false;
	publicVariable "PILOTS_RESCUED";


	LAST_PILOTS_POSITION = ["irgendwo",[0,0]];
	publicVariable "LAST_PILOTS_POSITION";


	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0];
	publicVariable "CRASH_SITE";

	MUDSCHA_SPAWN = [0,0];
	publicVariable "MUDSCHA_SPAWN";

	RUSSIAN_SPAWN = [0,0];
	publicVariable "RUSSIAN_SPAWN";


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

	SIGHTING_DELAY = 120;
	CHANCE_TO_REVEAL = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL";

	jipTime = 60000;

	russianMinSpawnDistance = 5000;
	russianMaxSpawnDistance = 5500;

	mudschaMinSpawnDistance = 2500;
	mudschaMaxSpawnDistance = 3000;

	

	russianSpawnPos = [0,0];
	publicVariable "russianSpawnPos";

	mudschahedinSpawnPos = [0,0];
	publicVariable "mudschahedinSpawnPos";

	russianCredits = 1000;
	mudschahedinCredits = 1000;

	0 = [russianCredits,mudschahedinCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";
	0 = [] execVM "server\serverTeleportListener.sqf";
	0 = [] execVM "server\selectSpawnPosition.sqf";

	[] spawn {
		waitUntil {(mudschahedinSpawnPos select 0 != 0) && (russianSpawnPos select 0 != 0)}; // wait until everything is neatly set up

		SETUP_DONE = true;
		publicVariable "SETUP_DONE";
	};


	// loadout for AI units
	/* [] spawn {
 		{if (!isPlayer _x) then {sleep 0.5; [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 	};
 	*/
	
};



if (hasInterface) then {
	
	titleCut ["", "WHITE IN", 1];

	{_x setMarkerAlpha 0;} forEach possibleSpawnPositions;

	// for local execution of interrogation actions
	fnc_MPaddQuestioningAction = {
		_this addAction ["<t color='#F24F0F'>Verhören</t>",'civilianOutrage\questionCivilian.sqf',
		0, 100, true, true, '',
		"player distance _target < 4 && !(_target getVariable ['revealed',false])"];
	};

	// JIP handling
	checkJIP = {
		if ((CRASH_SITE select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
		} else {
			if (!didJIP) exitWith {[] call callIntro;};

			waitUntil {  
				(playerSide != civilian) && 
				(CRASH_SITE select 0 != 0) && 
				(MUDSCHA_SPAWN select 0 != 0) && 
				(RUSSIAN_SPAWN select 0 != 0)
			};

			if (playerSide == independent) then {
				[CRASH_SITE, 50] execVM "helpers\teleportPlayer.sqf";
			};
			if (playerSide == west) then {			
				[MUDSCHA_SPAWN, 50] execVM "helpers\teleportPlayer.sqf";
			};
			if (playerSide == east) then {		
				[RUSSIAN_SPAWN, 50] execVM "helpers\teleportPlayer.sqf";
			};
		};
	};


	callIntro = {		
		0 = [[worldSize/2,worldSize/2,0],"",2000] execVM "helpers\establishingShot.sqf";
	};

	waitUntil {!isNull player};

	// WEST is mudschahedin (!)
	if (playerSide == west) then {
		[] execVM "player\mudschahedinTeleportListener.sqf";
		[] spawn checkJIP;
		[] execVM  "player\pilotSightingsClient.sqf";
	};

	// EAST is russian
	if (playerSide == east) then {
		[] execVM "player\russianTeleportListener.sqf";
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
	};	

	if (playerSide == independent) then {
		[] execVM "player\pilotTeleportListener.sqf";
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
	};		
};
