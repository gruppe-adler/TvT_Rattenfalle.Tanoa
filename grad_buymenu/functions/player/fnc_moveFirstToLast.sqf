fnc_selectNextVehicleInArray = {

	if (DEBUG) then {
		diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY : %1", (_this select 0) select 0];
	};

	_supplies = (_this select 0) select 0 getVariable ["GRAD_supplyArray","ERROR"];
	_vehicleIndex = (_this select 0) select 0 getVariable ["GRAD_vehicleIndex",0];
	
	if (DEBUG) then {
		diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY: supplyarray is %1, vehicle index is %2", _supplies, _vehicleIndex];
	};

	switch (_supplies) do {
		case "suppliesBlufor": {
			_vehicleArray = suppliesBlufor select 1 select _vehicleIndex select 0;
			_vehicleArrayResorted = [_vehicleArray] call fnc_moveFirstToLast;

			((suppliesBlufor select 1) select _vehicleIndexset) set [0, _vehicleArrayResorted];
			publicVariableServer "suppliesBlufor";

			// diag_log format ["Resorting Array %1 to %2",_vehicleArray,_vehicleArrayResorted];
			{ 
				diag_log format ["%1 ..... supplies are now %2",_forEachIndex,_x];
			} forEach (suppliesBlufor select 1);
		};

		case "suppliesOpfor": {
			_vehicleArray = suppliesOpfor select 1 select _vehicleIndex select 0;
			_vehicleArrayResorted = [_vehicleArray] call fnc_moveFirstToLast;

			((suppliesOpfor select 1) select _vehicleIndexset) set [0, _vehicleArrayResorted];
			publicVariableServer "suppliesOpfor";

			// diag_log format ["Resorting Array %1 to %2",_vehicleArray,_vehicleArrayResorted];
			{ 
				diag_log format ["%1 ..... supplies are now %2",_forEachIndex,_x];
			} forEach (suppliesBlufor select 1);
		};

		default {
			diag_log format ["_supplies is neither opfor nor blufor"];
		}
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
