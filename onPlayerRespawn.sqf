_identity = format ["%1",player];

// if player already spawned once, dont do anything
if (player_respawned) exitWith {};


// CRASHPILOT

if (_identity == "crashpilot") then {

	0 = [_identity] execVM "spawn\crashPilot.sqf";
};


// CREW OF CRASHPILOT

if (_identity == "crew1" || _identity == "crew2" || _identity == "crew3") then {

	0 = execVM "spawn\crew.sqf";
};



// INDEPENDENTS


if (side player == west || side player == east) then {
	[] execVM "spawn\checkPlayerClass.sqf";
};
// set respawn time for respawns
setPlayerRespawnTime customRespawnTime;

// check if script did run once on each client
player_respawned = true;