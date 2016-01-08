_pos = _this select 0;
_vehicleType = _this select 1;
_side = _this select 2;

_crewCount = floor (random 2);


_createDriver = {
	_crewDriver = (_this select 0) createUnit ["C_man_1", _pos, [], 0, "NONE"];

	_crewDriver assignAsDriver _vehicle;
	_crewDriver moveInDriver _vehicle;

	[_crewDriver] execVM "Engima\Traffic\Custom_GruppeAdler\randomTakistani.sqf";
};

_createCargo = {
	_crewCargo = (_this select 0) createUnit ["C_man_1", _pos, [], 0, "NONE"];

	_crewCargo assignAsCargo _vehicle;
	_crewCargo moveInCargo _vehicle;	
};

_vehicle = createVehicle [_vehicleType, _pos, [], 0, "NONE"];

_group = createGroup _side;


[_group] call _createDriver;

if (_vehicleType == "" || _vehicleType == "") exitWith {

	_crewCount = floor (random 15);

	for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
	[_group] call _createCargo;
	};
};


if (_crewCount > 0) then {
	for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
	[_group] call _createCargo;
	};
};






_vehicle 