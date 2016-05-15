#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"


createCrashSite=  {
	// find a random position in circle
	crashSpawnPos = [CRASH_SITE,[20,70], random 360] call SHK_pos;

	// find a spawn pos on given position
	_veh1 = createVehicle ["RHS_Mi24Vt_vvs", crashSpawnPos, [], 0, "NONE"];
	[_veh1,	nil,["exhaust_hide", 1,	"at_rack_hide", 0]] call BIS_fnc_initVehicle;

	_veh1 setObjectTextureGlobal [0, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_001_camo2_co.paa"];
	_veh1 setObjectTextureGlobal [1, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_002_camo2_co.paa"];
	_veh1 setObjectTextureGlobal [2, "rhsafrf\addons\rhs_a2port_air\Mi17\data\camo\mi8_det_g_camo1_co.paa"];

	_veh1 allowDamage false;
	_veh1 setDamage 0.95;
	_veh1 setFuel 0.01;
	clearItemCargoGlobal _veh1;
	clearWeaponCargoGlobal _veh1;
	clearMagazineCargoGlobal _veh1;
	clearWeaponCargoGlobal _veh1;
	sleep 0.1;
	_veh2 = createVehicle ["CraterLong", getPos _veh1, [], 0, "CAN_COLLIDE"];
	_smoke = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";
	_smoke2 = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";

	null = [{[[west,east,independent],crashSpawnPos] execVM "helpers\createMarkerForSides.sqf";}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;
};


checkInsideMap = {
	// 0 = mapsize
	// 1 = spawnpos
	_maximumX = worldSize;
	_maximumY = worldSize;
	_positionX = (_this select 0) select 0;
	_positionY = (_this select 0) select 1;
	_resultInsideMap = true;

	// diag_log format ["MapsizeX: %1, MapsizeY: %2, PositionX: %3, PositionY: %4",_maximumX,_maximumY,_positionX,_positionY];

	if (_positionX < 0 || _positionX > _maximumX) then {_resultInsideMap = false;};
	if (_positionY < 0 || _positionY > _maximumY) then {_resultInsideMap = false;};

	if (!_resultInsideMap) then {
		diag_log format ["Mapsize: Out of bounds."];
	};
	_resultInsideMap
};


createMudschaSpawn = {
	_center = _this select 0;
	_newPos = [];

	while {(count _newPos) < 1} do { //Loop the following code so long as isFlatEmpty cannot find a valid position near the current _pos.
		_pos = [_center,[mudschaMinSpawnDistance,mudschaMaxSpawnDistance], random 360, 0, [0,0],[100,"Land_Dome_Small_F"]] call SHK_pos;
		_newPos = _pos isFlatEmpty[50, -1, 0.3, 40, 0, false, objNull];
		if (count _newPos > 0) then {
			if (!([_newPos] call checkInsideMap)) then {_newPos = [];}; // should be inside map
		};
		if (count _newPos > 0) then {
			if (count (_newPos nearRoads 10) > 0) then {_newPos = [];}; 
		};		
	};

	MUDSCHA_SPAWN = _newPos;
	publicVariable "MUDSCHA_SPAWN";

	respawn_mudscha setPos [MUDSCHA_SPAWN select 0, MUDSCHA_SPAWN select 1, 0];

	[{0 = [MUDSCHA_SPAWN,"MUDSCHA_SPAWN"] execVM "player\createLocalDebugMarker.sqf";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};

createRussianSpawn = {
	_center = _this select 0;
	_newPos = [];

	while {(count _newPos) < 1} do { //Loop the following code so long as isFlatEmpty cannot find a valid position near the current _pos.
		_pos = [_center,[russianMinSpawnDistance,russianMaxSpawnDistance], random 360, 0, [0,0],[100,"Land_Dome_Small_F"]] call SHK_pos;
		_newPos = _pos isFlatEmpty[50, -1, 0.3, 40, 0, false, objNull];
		if (count _newPos > 0) then {
			if (!([_newPos] call checkInsideMap)) then {_newPos = [];}; // should be inside map
		};
		if (count _newPos > 0) then {
			if (count (_newPos nearRoads 10) > 0) then {_newPos = [];}; 
		};
	};

	RUSSIAN_SPAWN = _newPos;
	publicVariable "RUSSIAN_SPAWN";

	respawn_russian setPos [RUSSIAN_SPAWN select 0, RUSSIAN_SPAWN select 1, 0];

	[{0 = [RUSSIAN_SPAWN,"RUSSIAN_SPAWN"] execVM "player\createLocalDebugMarker.sqf";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};



_CRASH_SITE_listener = {
	_pos = _this select 1;
	

	publicVariable "CRASH_SITE";
	[] call createCrashSite;
	
	["."] call EFUNC(common,displayTextStructured);

	[_pos] call createMudschaSpawn;
	_creatingMudschaSpawnHandle = [_pos] execVM "server\createMudschaHQ.sqf";
	waitUntil { scriptDone _creatingMudschaSpawnHandle };

	[".."] call EFUNC(common,displayTextStructured);

	[_pos] call createRussianSpawn;
	createRussianSpawnHandle = [_pos] execVM "server\createRussianHQ.sqf";
	waitUntil { scriptDone createRussianSpawnHandle };
	
	["..."] call EFUNC(common,displayTextStructured);

	0 = [_pos,1000,LAST_PILOTS_POSITION] execVM "server\pilotSightingsServer.sqf";
	0 = [] execVM "server\raiseMoneyCount.sqf";
	
	/*
	_crashSitePos = _this select 0; // Helicopter crashSite Position
	_maxDistance = _this select 1; // if Pilot is < maxDistance from any location, he will be spotted
	_publicVariable = _this select 2; // publicVariable for this Pilot
	*/
};




"CRASH_SITE" addPublicVariableEventHandler _CRASH_SITE_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_CRASH_SITE_listener spawn {
		waitUntil {CRASH_SITE select 0 != 0};
		[0, CRASH_SITE] call _this;
	};
};
