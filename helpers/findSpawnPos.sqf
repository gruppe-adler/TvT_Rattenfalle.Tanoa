findSpawnPos = {

	_nearestPosition = [];

	_center = _this select 0;
	_min_distance = _this select 1;
	_max_distance = _this select 2;

	_distanceToSearch = 150;

	while {count _nearestPosition < 1} do {
		_nearestPosition = [_center,[_min_distance,_max_distance], random 360,0,[0,200],[_distanceToSearch,"TK_WarfareBBarracks_Base_EP1"]] call SHK_pos;
		_distanceToSearch = _distanceToSearch + 50;
		if (!isNull ([_nearestPosition,10] call BIS_fnc_nearestRoad)) then {_nearestPosition = [];};
	};

	// return
	_nearestPosition
};