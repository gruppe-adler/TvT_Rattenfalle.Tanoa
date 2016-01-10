DEBUG_MODE = true;
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



call compile preprocessfile "Engima\Traffic\Custom_GruppeAdler\createVehicle.sqf";
call compile preprocessfile "Engima\Traffic\Custom_GruppeAdler\randomTakistani.sqf";

[] execVM "Engima\Traffic\Init.sqf";

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "spawn\gui\initGUI.sqf";
[]execVM "spawn\supplyDropOnMarker.sqf";
[]execVM "helpers\addActionMP.sqf";



// driving AI
//[] execVM "VCOM_Driving\init.sqf";


if (isServer) then {
	PILOTS_DEAD = false;
	publicVariable "PILOTS_DEAD";

	PILOTS_RESCUED = false;
	publicVariable "PILOTS_RESCUED";

	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0];
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

	SIGHTING_DELAY = 10;
	jipTime = 60000;

	westMinSpawnDistance = 3500;
	westMaxSpawnDistance = 4500;

	eastMinSpawnDistance = 1500;
	eastMaxSpawnDistance = 2500;

	

	russianSpawnPos = [0,0];
	publicVariable "russianSpawnPos";

	mudschahedinSpawnPos = [0,0];
	publicVariable "mudschahedinSpawnPos";

	russianCredits = 5000;
	mudschahedinCredits = 5000;

	0 = [russianCredits,mudschahedinCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";
	0 = [] execVM "server\serverTeleportListener.sqf";

	// loadout for AI units
	[] spawn {
 		{if (!isPlayer _x) then {sleep 0.5; [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 	};
	
};

	// dont let west and east spawn too early
	//waitUntil {CRASH_SITE_SELECTED};

if (hasInterface) then {
	

	checkJIP = {
		if ((CRASH_SITE select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
			["forced"] spawn CSSA3_fnc_createSpectateDialog;
		} else {
		if (!didJIP) exitWith {[] call checkSpawnButton;};
			if (playerSide == east) then {
			[CRASH_SITE, 50] execVM "helpers\teleportPlayer.sqf";
			} else {
			[BLUFOR_TELEPORT_TARGET, 50] execVM "helpers\teleportPlayer.sqf";
			};
		};
	};


	checkSpawnButton = {
		
		if (player != pilot) then {
			0 = [[worldSize/2,worldSize/2,0],"",3000] execVM "helpers\establishingShot.sqf";
		} else {
		disableSerialization;
		waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
			cheffeKeyEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
				"KeyDown",
				format ["	
						if (CRASH_SITE select 0 != 0) then {
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
							
							playSound ['click', true];
							

						};

						if (_this select 1 == 57) then {0 = createDialog 'gui_spawn_pilot'; true};
					"]
			];
			0 = createDialog "gui_spawn_pilot";
			waitUntil {(CRASH_SITE select 0 != 0)};
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
		};
	};

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
