findSpawnPos = {

	_nearestPosition = [];
	_center = _this select 0;
	_min_distance = _this select 1;
	_max_distance = _this select 2;

	_nearestPosition = [_center,_min_distance,_max_distance,11,0,0.2,0] call BIS_fnc_findSafePos;




	_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_returnValue]; };

	// return
	_returnValue
};