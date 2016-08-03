fnc_api_createOrder = {
	_player = _this select 0;
	_neworder = _this select 1; // DO NOT PASS ON - WILL BE DELETED AT THE BOTTOM

	_supplyVar = _player getVariable "GRAD_buymenu_supplies_name";
	_supplies = missionNamespace getVariable _supplyVar;

	_moneyVar = player getVariable "GRAD_buymenu_money_name";
	_money = missionNamespace getVariable _moneyVar;

	_supplyItem = _supplies getVariable (_neworder getVariable 'selector');

	_amount = _supplyItem select 2;
	_cost = _supplyItem select 3;

	_newMoney = _money - _cost;
	if (_newMoney < 0) exitWith {};

	_newAvailableAmount = _amount - 1;
	if (_amount < 0) exitWith {};

	// validations fine.
	// we're good to go and actually register and execute the order.

	missionNamespace setVariable [_moneyVar, _newMoney, true];

	_supplyItem set [2, _newAvailableAmount];
	if (_newAvailableAmount == 0)  then {
		_supplyItem set [9, 2]; // block button forever
	} else {
		_supplyItem set [9, 1]; // block button for delivery
	};
	publicVariable _supplyVar;

	publicVariable "ordersBlufor";

	[
		_neworder getVariable 'position',
		_neworder getVariable 'classname',
		_neworder getVariable 'init',
		_neworder getVariable 'calls',
		_neworder getVariable 'method',
		_neworder getVariable 'selector',
		side _player
	] spawn fnc_spawnVehicleManager;

	if (!isMultiplayer) then {
		[] call fnc_refreshGUI; // should happen automatically later on
	};

	deleteVehicle _neworder;

};
