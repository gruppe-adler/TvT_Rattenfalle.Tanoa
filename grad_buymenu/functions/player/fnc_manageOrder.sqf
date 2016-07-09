/* client prepares buy order for server */

// client

fnc_addBluforOrder = {

	_selector = _this select 0;

	_classname = suppliesBlufor select 1 select _selector select 0;
	_eta = suppliesBlufor select 1 select _selector select 4;
	_init = suppliesBlufor select 1 select _selector select 5;
	_calls = suppliesBlufor select 1 select _selector select 6;
	_method = suppliesBlufor select 1 select _selector select 8;

	diag_log format ["addorderblufor: %1",_classname];

	_neworder = [];
	if (_method != 4) then {
		_neworder = [_eta, getMarkerPos spawnMarkerBluforLand, _classname, _init, _calls, _method, _selector];
	} else {
		_neworder = [_eta, getMarkerPos spawnMarkerBluforWater, _classname, _init, _calls, _method, _selector];
	};

	ordersBlufor = ordersBlufor + [_neworder];
	publicVariableServer "ordersBlufor";


};

fnc_addOpforOrder = {

	_selector = _this select 0;

	_classname = suppliesOpfor select 1 select _selector select 0;
	_eta = suppliesOpfor select 1 select _selector select 4;
	_init = suppliesOpfor select 1 select _selector select 5;
	_calls = suppliesOpfor select 1 select _selector select 6;
	_method = suppliesOpfor select 1 select _selector select 8;

	diag_log format ["addorderOpfor: %1",_classname];

	_neworder = [];
	if (_method != 4) then {
		_neworder = [_eta, getMarkerPos spawnMarkerOpforLand, _classname, _init, _calls, _method, _selector];
	} else {
		_neworder = [_eta, getMarkerPos spawnMarkerOpforWater, _classname, _init, _calls, _method, _selector];
	};

	ordersOpfor = ordersOpfor + [_neworder];
	publicVariableServer "ordersOpfor";


};

fnc_manageBlufor = {
	_selector = _this select 0;
	_tmpmoney = _this select 1;
	_supplies = _this select 2;
	_method = _this select 3;

	_amount = _supplies select 1 select _selector select 2;
	_cost = _supplies select 1 select _selector select 3;
	_money = _tmpmoney - _cost;
	if (_money < 0) exitWith {publicVariableServer "moneyBlufor";};
	if (_amount < 1) exitWith {publicVariableServer "moneyBlufor";};

	(_supplies select 1 select _selector) set [2, _amount - 1]; // reduce amount of available cars
	(_supplies select 1 select _selector) set [9, 1]; // block buy button

	if (_amount == 1) then {
			(_supplies select 1 select _selector) set [9, 2]; // block buy button forever
	};

	moneyBlufor = _money;
	publicVariableServer "moneyBlufor";

	suppliesBlufor = _supplies;
	publicVariableServer "suppliesBlufor";

	if (!isMultiplayer) then {
		[_supplies,_money] call fnc_refreshGUI; // should happen automatically later on
	};

	[_selector] call fnc_addBluforOrder;
};

fnc_manageOpfor = {
	_selector = _this select 0;
	_tmpmoney = _this select 1;
	_supplies = _this select 2;
	_method = _this select 3;

	_amount = _supplies select 1 select _selector select 2;
	_cost = _supplies select 1 select _selector select 3;
	_money = _tmpmoney - _cost;
	if (_money < 0) exitWith {publicVariableServer "moneyOpfor";};
	if (_amount < 1) exitWith {publicVariableServer "moneyOpfor";};

	(_supplies select 1 select _selector) set [2, _amount - 1]; // reduce amount of available cars
	(_supplies select 1 select _selector) set [9, 1]; // block buy button

	if (_amount == 1) then {
			(_supplies select 1 select _selector) set [9, 2]; // block buy button forever
	};

	moneyOpfor = _money;
	publicVariableServer "moneyOpfor";

	suppliesOpfor = _supplies;
	publicVariableServer "suppliesOpfor";
	if (!isMultiplayer) then {
		[_supplies,_money] call fnc_refreshGUI; // should happen automatically later on
	};

	[_selector] call fnc_addOpforOrder;
};


fnc_manageOrder = {
	_suppliesName = _this select 0;
	_order = _this select 1;
	_spawnMethod = _this select 2;


	switch (_suppliesName) do {
		case "suppliesBlufor": {
			[_order,moneyBlufor,suppliesBlufor,_spawnMethod] call fnc_manageBlufor;
		};

		case "suppliesOpfor": {
			[_order,moneyOpfor,suppliesOpfor,_spawnMethod] call fnc_manageOpfor;
		};

		default {
			diag_log format ["MANAGE ORDER ERROR: %1",_suppliesName];
		}
	};
};
