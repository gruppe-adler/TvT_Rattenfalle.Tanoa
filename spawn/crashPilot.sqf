
// CRASHPILOT
_identity = _this select 0;

// reduce range of radio to 20%
player setVariable ["tf_sendingDistanceMultiplicator", 0.2];

_currentPosition = getPos player;
_closest = [crash_sites, _currentPosition] call BIS_fnc_nearestPosition;

if (DEBUG) then {diag_log format ["Closest Marker of %2 is %1",_closest,_identity];};

CRASH_SITE = getMarkerPos _closest;
publicVariable "CRASH_SITE";

CRASH_SITE_SELECTED = true;
publicVariable "CRASH_SITE_SELECTED";

// find a random position in circle
_randomNearPosition = [getMarkerPos _closest,[50,80], random 360] call SHK_pos;

waitUntil {
  count _randomNearPosition > 0
};

// find a spawn pos on given position
crashSpawnPos = [_randomNearPosition,50] call findSpawnPos;

waitUntil {
  count crashSpawnPos > 0
};

_veh1 = createVehicle [(possibleWrecks call BIS_fnc_selectRandom), crashSpawnPos, [], 0, "NONE"];
_veh1 allowDamage false;
_veh1 setDamage 0.95;
_veh1 setFuel 0.01;
clearItemCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
clearMagazineCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
sleep 0.1;
_veh2 = createVehicle [(possibleCrater call BIS_fnc_selectRandom), getPos _veh1, [], 0, "CAN_COLLIDE"];
_smoke = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";
_smoke2 = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";

null = [{[[west,east,independent],crashSpawnPos] execVM "helpers\createMarkerForSides.sqf";}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;