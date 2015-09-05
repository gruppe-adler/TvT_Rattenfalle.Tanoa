/*	Spawns a civilian of a random type
/*
/*	Param0: Spawn Position
*/

private ["_spawnPos","_type","_grp","_civ"];
_spawnPos 	= _this select 0;
_type 		= L_civs_civClasses call BIS_fnc_selectRandom;
_grp 		= createGroup civilian;
_civ 		= _grp createUnit [_type, _spawnPos,[],0,""];

_civ addEventHandler ["Killed", {
    _unit   = _this select 0; // object, event owner
    _killer = _this select 1; // object, object that killed the unit,
                      // contains the unit itself in case of collisions.

    if (side _killer == west || side _killer == independent) then {
    	civiliansKilledByRussians = civiliansKilledByRussians + 1;	

    	null = [{[civiliansKilledByRussians,west] call adjustRespawnTime;}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;
    	
    	if (DEBUG) then {hintSilent "civilian killed by west"};
	};

	if (side _killer == east) then {
		civiliansKilledByMudschahedin = civiliansKilledByMudschahedin +1;

		null = [{[civiliansKilledByMudschahedin,east] call adjustRespawnTime;}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;

		[civiliansKilledByMudschahedin,east] call adjustRespawnTime;
		if (DEBUG) then {hintSilent "civilian killed by east"};
	};
    
}];

_civ allowDamage false;
_civ setBehaviour "safe";					
_civ setSkill 0;	// Set skill to 0, saves performance :)

L_civs_currentCivs = L_civs_currentCivs + 1;
[_civ] joinSilent grpNull;
deleteGroup _grp;
if (L_civs_debug == 2) then {hintSilent format ["Spawned a civilian \n Class: %1 \n Position: %2",_type,_spawnPos]};
_civ;