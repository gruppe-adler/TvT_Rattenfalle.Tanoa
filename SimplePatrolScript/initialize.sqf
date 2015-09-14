if (!hasInterface && !isDedicated) then {
    // run spawn script
    _amount = _this select 0;
	_marker = _this select 1;
	_debug = _this select 2;
	_speed = "limited";
	_side = CIVILIAN;

	unit_fnc = compile preprocessfilelinenumbers "SimplePatrolScript\unit_pool.sqf";

	[_amount, _side , _marker, _speed, _debug] execVM "SimplePatrolScript\spawn.sqf";

} else {
	if (isServer) then {
     // run fallback for use without HC

	sleep 0.1;

	_amount = _this select 0;
	_marker = _this select 1;
	_debug = _this select 2;
	_speed = "limited";
	_side = CIVILIAN;

	unit_fnc = compile preprocessfilelinenumbers "SimplePatrolScript\unit_pool.sqf";

	[_amount, _side , _marker, _speed, _debug] execVM "SimplePatrolScript\spawn.sqf";

	};
};