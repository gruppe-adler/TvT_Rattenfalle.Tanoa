// reset civ kill counter
civiliansKilledByRussians = 0;
civiliansKilledByMudschahedin = 0;

// function to adjust time on clients
adjustRespawnTime = {
	_count = _this select 0;
	_side = _this select 1;
	_modifier = 60;
	_currentRespawnTime = mudschahedinRespawnTime;

	if (_side == west && side player == east) exitWith {
		setPlayerRespawnTime (_currentRespawnTime - _modifier);
		mudschahedinRespawnTime = (_currentRespawnTime - _modifier);
		if (DEBUG) then { diag_log format ["Changed Respawn Time for EAST from %1 to %2",_currentRespawnTime, mudschahedinRespawnTime]; };
			
	};

	if (_side == east && side player == east) exitWith { 
		setPlayerRespawnTime (_currentRespawnTime + _modifier); 
		mudschahedinRespawnTime = (_currentRespawnTime + _modifier);
		if (DEBUG) then { diag_log format ["Changed Respawn Time for EAST from %1 to %2",_currentRespawnTime, mudschahedinRespawnTime]; };
	};
};

/*
if (isServer) then {

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

};
*/