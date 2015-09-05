// reset civ kill counter
civiliansKilledByRussians = 0;
civiliansKilledByMudschahedin = 0;


// function to adjust time on clients
adjustRespawnTime = {
	_count = _this select 0;
	_side = _this select 1;
	_modifier = 60;

	if (side player != east) exitWith {};
	_currentRespawnTime = playerRespawnTime;

	if (_side == west) then {
		setPlayerRespawnTime (_currentRespawnTime - _modifier);
		if (DEBUG) then { diag_log format ["Changed Respawn Time for EAST from %1 to %2",_currentRespawnTime, playerRespawnTime]; };
	};
	if (_side == east) then { 
		setPlayerRespawnTime (_currentRespawnTime + _modifier);
		if (DEBUG) then { diag_log format ["Changed Respawn Time for EAST from %1 to %2",_currentRespawnTime, playerRespawnTime]; };
	};
};

if (!isServer) exitWith {};

"civiliansKilledByRussians" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,west] call adjustRespawnTime;
};

"civiliansKilledByMudschahedin" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,east] call adjustRespawnTime;
};