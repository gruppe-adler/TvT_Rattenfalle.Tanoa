DEBUG = true;
//
// customizable variables
//

setViewDistance 3500;

// functional variables - do not change!
// player_respawned = 0;
checkObjectives = false; // false is debug for playing without pilot

{_x setMarkerAlphaLocal 0;} forEach allMapMarkers;

0 = [] execVM "grad_buymenu\buymenu_init.sqf";
call compile preprocessfile "Engima\Traffic\Custom_GruppeAdler\createVehicle.sqf";
call compile preprocessfile "civilianOutrage\randomRebel.sqf";

[] execVM "Engima\Traffic\Init.sqf";

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "helpers\addActionMP.sqf";



if (isServer) then {

	possibleCrashPositions =  [
		"mrk_crash_site_01",
		"mrk_crash_site_02",
		"mrk_crash_site_03",
		"mrk_crash_site_04",
		"mrk_crash_site_05",
		"mrk_crash_site_06",
		"mrk_crash_site_07"
	];


	PILOTS_DEAD = false;
	publicVariable "PILOTS_DEAD";

	PILOTS_RESCUED = false;
	publicVariable "PILOTS_RESCUED";


	LAST_PILOTS_POSITION = ["irgendwo",[0,0],0]; // name of nearest location, position of pilot, distance to location (becomes radius of marker)
	publicVariable "LAST_PILOTS_POSITION";

	CURRENT_PILOTS_POSITION = ["irgendwo",[0,0],0]; // name of nearest location, position of pilot, distance to location (becomes radius of marker)
	publicVariable "CURRENT_PILOTS_POSITION";

	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0];
	publicVariable "CRASH_SITE";

	REBEL_SPAWN = [0,0];
	publicVariable "REBEL_SPAWN";

	US_SPAWN = [0,0];
	publicVariable "US_SPAWN";


	SETUP_DONE = false;
	publicVariable "SETUP_DONE";

	SIGHTING_DELAY = 120;
	CHANCE_TO_REVEAL = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL";

	jipTime = 60000;

	0 = [] execVM "server\serverTeleportListener.sqf";
	0 = [] execVM "server\selectSpawnPosition.sqf";

	[] spawn {
		waitUntil {(REBEL_SPAWN select 0 != 0) && (US_SPAWN select 0 != 0)}; // wait until everything is neatly set up

		SETUP_DONE = true;
		publicVariable "SETUP_DONE";
	};


	// loadout for AI units
	if (!isMultiplayer) then {
	 	[] spawn {
			sleep 10; // dont equip player multiple times
 			{if (!isPlayer _x) then {0 = [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 		};
	} else {
			{if (!isPlayer _x) then {sleep 0.5; 0 = [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
	};


};



if (hasInterface) then {

	titleCut ["", "WHITE IN", 1];

	// for local execution of interrogation actions
	fnc_MPaddQuestioningAction = {
		_this addAction ["<t color='#F24F0F'>Verhören</t>",'civilianOutrage\questionCivilian.sqf',
		0, 100, true, true, '',
		"player distance _target < 3.5 && !(_target getVariable ['civ_occupied',false])"];
	};



	0 = [] execVM "player\createWeaponOnCivilianPointer.sqf";

	// JIP handling
	checkJIP = {
		if ((CRASH_SITE select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
		} else {
			if (!didJIP) exitWith {[] call callIntro;};

			waitUntil {
				(playerSide != civilian) &&
				(CRASH_SITE select 0 != 0) &&
				(REBEL_SPAWN select 0 != 0) &&
				(US_SPAWN select 0 != 0)
			};

			if (playerSide == independent) then {
				[CRASH_SITE, 50] execVM "helpers\teleportPlayer.sqf";
			};
			if (playerSide == west) then {
				[REBEL_SPAWN, 50] execVM "helpers\teleportPlayer.sqf";
			};
			if (playerSide == east) then {
				[US_SPAWN, 50] execVM "helpers\teleportPlayer.sqf";
			};
		};
	};


	callIntro = {
		waitUntil {CRASH_SITE select 0 != 0};
		0 = [CRASH_SITE,"",1000] execVM "helpers\establishingShot.sqf";
	};

	waitUntil {playerSide == west || playerSide == east || playerSide == independent};

	// WEST is US
	if (playerSide == west) then {
		[] execVM "player\USTeleportListener.sqf";
		[] spawn checkJIP;

	};

	// EAST is rebels
	if (playerSide == east) then {
		[] execVM "player\rebelsTeleportListener.sqf";
		[] spawn checkJIP;
		["CRASH_SITE"] execVM  "player\pilotSightingsClient.sqf";

	};

	if (playerSide == independent) then {
		[] execVM "player\pilotTeleportListener.sqf";
		[] spawn checkJIP;

	};
};
