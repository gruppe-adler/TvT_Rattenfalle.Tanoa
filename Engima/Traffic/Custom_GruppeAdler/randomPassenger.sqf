_count = 2;

_pos = _this select 0;
_vehicle = _this select 1;
_vehicleType = typeOf (_this select 1);
_vehicleGroup = _this select 2;

diag_log format ["randompassenger - vehicle: %1, group: %2",_vehicle,_vehicleGroup];

_createNewPassenger = {
	private ["_pas","_type"];
	_ps = _this select 0;
	_car = _this select 1;
	_grp = _this select 2;

	_newpas = _grp createUnit ["C_man_1", _ps, [], 0, "CARGO"];
	sleep 0.2;
	if (!isNull driver _car) then {
		_newpas assignAsDriver _car;
		_newpas moveInDriver _car;
	} else {
		_newpas assignAsCargo _car;
		_newpas moveInCargo _car;
	};
	0 = [_newpas] execVM 'Engima\Traffic\Custom_GruppeAdler\randomTakistani.sqf';

};





if (_vehicleType == "RDS_Ikarus_Civ_01" || _vehicleType == "RDS_Ikarus_Civ_02") then {
	_count = 13;
};

_upToCount = (1+(floor (random _count)));

for [{_i=0}, {_i<_upToCount}, {_i=_i+1}] do
{
	[_pos,_vehicle,_vehicleGroup] call _createNewPassenger;
};
