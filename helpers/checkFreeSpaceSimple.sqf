checkFreeSpaceSimple = {
	_point = _this select 0;
	_dist = _this select 1;
	_return = true;

	_nobs = nearestObjects [_point,["Static","House","Tank","Cars","Car","Trucks","Helicopter","StaticWeapon","Truck_F"],_dist];

	if (count _nobs > 0) then { _return = false; };

	_return
};