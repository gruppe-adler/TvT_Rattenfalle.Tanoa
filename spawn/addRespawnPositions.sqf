#include "\z\ace\addons\main\script_component.hpp"


_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

["Suche Startpositionen..."] call EFUNC(common,displayTextStructured);

// find positions on road for bases
_max_distance = 150;

_westSpawnPosition = [];
while{count _westSpawnPosition < 1} do {

	_westSpawnPosition = [CRASH_SITE,[westMinSpawnDistance,westMaxSpawnDistance], random 360,0,[2,_max_distance]] call SHK_pos;
		sleep 0.04;
		_max_distance = _max_distance + 100;

		// check if found position is out of boundary of map
		if (count _westSpawnPosition > 0) then {
			if ( _westSpawnPosition select 0 > _size || _westSpawnPosition select 1 > _size || _westSpawnPosition select 0 < 0 || _westSpawnPosition select 1 < 0) then { _westSpawnPosition = []; };
		};
	};

["westSpawnPosition gefunden."] call EFUNC(common,displayTextStructured);

_max_distance = 150;

_eastSpawnPosition = [];
while{count _eastSpawnPosition < 1} do {

	_eastSpawnPosition = [CRASH_SITE,[eastMinSpawnDistance,eastMaxSpawnDistance], random 360,0,[2,_max_distance]] call SHK_pos;
		sleep 0.04;
		_max_distance = _max_distance + 100;

		// check if found position is out of boundary of map
		if (count _eastSpawnPosition > 0) then {
			if ( _eastSpawnPosition select 0 > _size || _eastSpawnPosition select 1 > _size || _eastSpawnPosition select 0 < 0 || _eastSpawnPosition select 1 < 0) then { _eastSpawnPosition = []; };
		};
	};

["eastSpawnPosition gefunden."] call EFUNC(common,displayTextStructured);


// add respawn positions for selection screen
[west, _westSpawnPosition] call BIS_fnc_addRespawnPosition;
[east, _eastSpawnPosition] call BIS_fnc_addRespawnPosition;

// move fallback marker
"respawn_east" setMarkerPos _eastSpawnPosition;
"respawn_west" setMarkerPos _westSpawnPosition;


//_necessaryRadius = [["TK_WarfareBBarracks_Base_EP1","FLAG_RED_F","Bunker_PMC"], true] call spf_createRelPos;

// add HQ objects
// find a random position in circle


_randomNearPosition = [_westSpawnPosition,[10,80], random 360] call SHK_pos;

["_randomNearPosition gefunden."] call EFUNC(common,displayTextStructured);


// find a free spot
westHQSpawnPos = [_randomNearPosition,40] call findSpawnPos;

["Suche westHQSpawnPos"] call EFUNC(common,displayTextStructured);

waitUntil {
  count westHQSpawnPos > 0
};

["westHQSpawnPos gefunden."] call EFUNC(common,displayTextStructured);
if (DEBUG) then { diag_log format ["west spawn position %1 found", westHQSpawnPos]; };

_barracks = createVehicle ["TK_WarfareBBarracks_Base_EP1", westHQSpawnPos, [], 0, "NONE"];
_veh2 = createVehicle ["FLAG_RED_F",  [westHQSpawnPos select 0, (westHQSpawnPos select 1) + 5,0], [], 0, "CAN_COLLIDE"];

_actionHelper = createVehicle ["Land_SatellitePhone_F", [getPos _barracks select 0, getPos _barracks select 1, 1.5], [], 0, "NONE"];
_actionHelper attachTo [_barracks, [-1,0,1.5]];
_actionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];
sleep 0.01;
_actionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];


_russianSupplyAction = _actionHelper addAction["<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "russianSupplyGUI"; [russianSupplies, false, 0, "",""] call refreshUI; }, _Args, 1, true, true, "","_target distance _this < 6"];

russianSpawnPos = [westHQSpawnPos,40] call findSpawnPos;

waitUntil {
  count russianSpawnPos > 0
};
["russianSpawnPos gefunden."] call EFUNC(common,displayTextStructured);

if (DEBUG) then { diag_log format ["west vehicle spawn position %1 found", russianSpawnPos]; };

publicVariable "russianSpawnPos";

_helipad = createVehicle ["Land_HelipadCivil_F", russianSpawnPos, [], 0, "NONE"];


// find a random position in circle
_randomNearPosition = [_eastSpawnPosition,[20,30], random 360] call SHK_pos;

// find a free spot
eastHQSpawnPos = [_randomNearPosition,40] call findSpawnPos;

waitUntil {
  count eastHQSpawnPos > 0
};

["eastHQSpawnPos gefunden."] call EFUNC(common,displayTextStructured);
if (DEBUG) then { diag_log format ["east spawn position %1 found", eastHQSpawnPos]; };

publicVariable "eastHQSpawnPos";


null = [{[russianSpawnPos,eastHQSpawnPos] execVM "helpers\createDebugMarker.sqf";}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;


_fire = createVehicle ["Land_Campfire_F", eastHQSpawnPos, [], 5, "CAN_COLLIDE"];
_tent1 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "CAN_COLLIDE"];
_tent1 setDir (([_tent1, _fire] call BIS_fnc_relativeDirTo)-180);
_tent2 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "CAN_COLLIDE"];
_tent2 setDir (([_tent2, _fire] call BIS_fnc_relativeDirTo)-180);
_tent3 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "CAN_COLLIDE"];
_tent3 setDir (([_tent3, _fire] call BIS_fnc_relativeDirTo)-180);
_tent4 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "CAN_COLLIDE"];
_tent4 setDir (([_tent4, _fire] call BIS_fnc_relativeDirTo)-180);


["Missions-Setup abgeschlossen."] call EFUNC(common,displayTextStructured);