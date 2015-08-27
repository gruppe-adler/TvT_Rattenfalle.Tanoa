/*

[west, "Russian_Rifleman"] call BIS_fnc_addRespawnInventory;
[west, "Russian_Medic"] call BIS_fnc_addRespawnInventory;
[west, "Russian_Marksman"] call BIS_fnc_addRespawnInventory;
[west, "Russian_AT"] call BIS_fnc_addRespawnInventory;
[west, "Russian_MG"] call BIS_fnc_addRespawnInventory;

[east, "Taliban_Rifleman"] call BIS_fnc_addRespawnInventory;
[east, "Taliban_Medic"] call BIS_fnc_addRespawnInventory;
[east, "Taliban_Marksman"] call BIS_fnc_addRespawnInventory;
[east, "Taliban_AT"] call BIS_fnc_addRespawnInventory;
[east, "Taliban_MG"] call BIS_fnc_addRespawnInventory;

[crashpilot, "Russian_Pilot"] call BIS_fnc_addRespawnInventory;
[crew1, "Russian_Crew"] call BIS_fnc_addRespawnInventory;
[crew2, "Russian_Crew"] call BIS_fnc_addRespawnInventory;
[crew3, "Russian_Crew"] call BIS_fnc_addRespawnInventory; 

*/

USED_LOADOUT_RUSSIAN_RIFLEMAN = 0;
USED_LOADOUT_RUSSIAN_MEDIC = 0;
USED_LOADOUT_RUSSIAN_MARKSMAN = 0;
USED_LOADOUT_RUSSIAN_AT = 0;
USED_LOADOUT_RUSSIAN_MG = 0;

// can be local
MAX_LOADOUT_RUSSIAN_RIFLEMAN = 999;
MAX_LOADOUT_RUSSIAN_MEDIC = 6;
MAX_LOADOUT_RUSSIAN_MARKSMAN = 2;
MAX_LOADOUT_RUSSIAN_AT = 4;
MAX_LOADOUT_RUSSIAN_MG = 4;


publicVariable "LOADOUT_RUSSIAN_RIFLEMAN_USED";

[] spawn {
	while {true} do {

		[USED_LOADOUT_RUSSIAN_RIFLEMAN,MAX_LOADOUT_RUSSIAN_RIFLEMAN,west,"Russian_Rifleman"] call checkRespawnInventory;
		sleep 1;
	};
};

/*
adjustRespawnManager = {
	_ind = _this select 0;
	_bool = _this select 1;	

	limitHandler setVariable [_ind,_bool];
};*/

// takes Type, Limit, Index
checkRespawnInventory = {
	_type = _this select 0;
	_limit = _this select 1;
	_side = _this select 2;
	_index = _this select 3;

	if (_type >= _limit) then {
		[_side,_index] call BIS_fnc_removeRespawnInventory;
		//[_index,false] call adjustRespawnManager;
	};

	// TODO CHECK GETVARIABLE STUFF
	//if (_type < _limit && limitHandler getVariable [_index] == false) then {[_side,_index] call BIS_fnc_addRespawnInventory;};
};

