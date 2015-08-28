/*	Tracks the players and sets the variables accordingly
/*
/*  No Params
*/

private ["_i","_bla"];
_i= 28; // Start with a high value for initial check
for "_bla" from 0 to 1 step 0 do { // Infinite Loop
	sleep 2;
	_i = _i + 2;
	if (_i >= 30) then {
		L_civs_allInBlacklist = true;
		{
			if ([_x] call L_fnc_civs_blackListCheckPlayers) exitWith {
				L_civs_allInBlacklist = false;
			};
		} forEach allPlayers;
		_i = 0;
	};
};