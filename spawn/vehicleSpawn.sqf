
// simple function checking for some objects on a position in diameter x
checkFreeSpaceSimple = {
	_point = _this select 0;
	_dist = _this select 1;
	_return = true;

	_nobs = nearestObjects [_point,["Static","House","Tank","Cars","Car","Trucks","Helicopter","StaticWeapon","Truck_F"],_dist];

	if (count _nobs > 0) then { _return = false; };

	_return
};


spawnVehicleSupportGround = {
	_type = _this select 0;
	_pos = _this select 1;



	if (!{[_pos,10] call checkFreeSpaceSimple}) exitWith {
		hint "Please remove object from spawn position and try again.";
	};

	_startingPosition = [_pos select 0, _pos select 1, -5];

	_veh = createVehicle [_type, _startingPosition, [], 0, "CAN_COLLIDE"];
	_veh enableSimulationGlobal false;

	// lift up
	while {(getPos _veh) select 2 < 0} do {
		_veh setVelocity [0,0,1];
		sleep 2;
		_veh say3D "bongs";
	};

	sleep 2;

	_veh enableSimulationGlobal true;
};

// todo: verknüpfen mit GUI
["",VEHICLE_SUPPORT_WEST] call spawnVehicleSupportGround;


WEST_VSPAWN_POINT_BLOCKED = true;
publicVariable "WEST_VSPAWN_POINT_BLOCKED";
sleep 60;

// while spawn point is blocked, you cant call another support
while {!{[_pos,10] call checkFreeSpaceSimple}} do {
	sleep 5;
};
WEST_VSPAWN_POINT_BLOCKED = false;
publicVariable "WEST_VSPAWN_POINT_BLOCKED";