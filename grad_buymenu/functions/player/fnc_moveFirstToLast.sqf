fnc_selectNextVehicleInArray = {

	_supplies = _this select 0;
	_vehicleIndex = _this select 1;

	_vehicleArray = _supplies select 1 select _vehicleIndex select 0;
	_vehicleArrayResorted = [_vehicleArray] call fnc_moveFirstToLast;

	((_supplies select 1) select _vehicleIndexset) set [0, _vehicleArrayResorted];
	publicVariableServer _supplies;

	diag_log format ["Resorting Array %1 to %2",_vehicleArray,_vehicleArrayResorted];
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