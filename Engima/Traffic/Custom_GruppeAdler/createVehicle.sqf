createTakistaniVehicle = {
	_pos = _this select 0;
	_vehicleType = _this select 1;
	_side = _this select 2;

	_crewCount = floor (random 2);


	_createDriver = {
		_crewDriver = (_this select 0) createUnit ["C_man_1", _pos, [], 0, "NONE"];

		_crewDriver assignAsDriver (_this select 1);
		_crewDriver moveInDriver (_this select 1);

		[_crewDriver] call randomTakistani; // takistani loadout
	};

	_createCargo = {
		_crewCargo = (_this select 0) createUnit ["C_man_1", _pos, [], 0, "NONE"];

		_crewCargo assignAsCargo (_this select 1);
		_crewCargo moveInCargo (_this select 1);

		[_crewCargo] call randomTakistani; // takistani loadout
	};

	_veh = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
	sleep 0.01;

	_group = createGroup _side;


	[_group] call _createDriver;

	if (_vehicleType == "RDS_Ikarus_Civ_01" || _vehicleType == "RDS_Ikarus_Civ_02") exitWith {

		_crewCount = floor (random 15);

		for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
		[_group,_veh] call _createCargo;
		};
	};


	if (_crewCount > 0) then {
		for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
		[_group,_veh] call _createCargo;
		};
	};


	_veh 

};