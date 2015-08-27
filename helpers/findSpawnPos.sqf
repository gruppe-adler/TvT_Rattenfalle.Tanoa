findSpawnPos = {

_nearestPosition = [];
_center = _this select 0;
_max_distance = _this select 1;

// find a free spot
while{ count _nearestPosition < 1} do {

	_nearestPosition = [_center,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
	};

// found Position
_returnValue = _nearestPosition select 0;

// return
_returnValue
};