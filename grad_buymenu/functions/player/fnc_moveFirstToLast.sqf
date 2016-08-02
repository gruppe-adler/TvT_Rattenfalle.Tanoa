fnc_selectNextVehicleInArray = {

	if (DEBUG) then {
		diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY : %1", (_this select 0) select 0];
	};

	_supplies = (_this select 0) select 0 getVariable ["GRAD_supplyArray","ERROR"];
	_vehicleIndex = (_this select 0) select 0 getVariable ["GRAD_vehicleIndex",0];

	if (DEBUG) then {
		diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY: supplyarray is %1, vehicle index is %2", _supplies, _vehicleIndex];
	};

	_supplies = 0 call (player getVariable ['GRAD_buymenu_supplies', {nil}]);
	if (isNil _supplies) then {
		diag_log format ["player does not have access to supplies"];
	} else {
		_supplyItem = (_supplies getVariable _vehicleIndex);

		_vehicleArray = _supplyItem select 0;
		_vehicleArrayResorted = [_vehicleArray] call fnc_moveFirstToLast;
		_supplyItem set [0, _vehicleArrayResorted];

		diag_log format ["%1 ..... supplies are now %2", _x, _vehicleArrayResorted select 0];
	};
};

fnc_moveFirstToLast = {
 _array = _this select 0;

 if (count _array > 1) then {
  _first = _array select 0;
  _next = _array select 1;
  _last = _array select (count _array -1);

  {
   if (_foreachindex < (count _array) -1) then {
    _array set [_foreachindex,_array select (_foreachindex + 1)]
   };
  } forEach _array;
  _array set [(count _array) - 1,_first];
 };

 _array
};
