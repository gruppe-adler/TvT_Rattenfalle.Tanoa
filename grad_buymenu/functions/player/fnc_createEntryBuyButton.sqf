fnc_createEntryBuyButton = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;
	_menuEntryName = _this select 5;
	_supplies = _this select 6;
	_spawnMethod = _this select 7;
	_isDisabled = _this select 8;


	_btn =  _display ctrlCreate ["RscButton", _idc];

	_btn ctrlSetPosition [_xPos + (_width/4) - _width/16, safeZoneH/20*14, _width/2 + _width/8, safeZoneH/16];
	_btn ctrlSetBackgroundColor [0,0,0,0];
	_btn ctrlSetTextColor  [1,1,1,1];
	// _btn ctrlSetStructuredText parseText ("<t size='1'>" + _title + "</t>");
	_btn ctrlSetText _title;

	// diag_log format ["name is %1",_arrayDisplayName];

	buttonSetAction [_idc, format["['%1', '%2', %3] call fnc_manageOrder;", typeOf _supplies, _menuEntryName, _spawnMethod]];

	switch (_isDisabled) do {
		case 0: {ctrlEnable [_idc,true];};
		case 1: {ctrlEnable [_idc,false];	_btn ctrlSetText "Calling...";};
		case 2: {ctrlEnable [_idc,false];	_btn ctrlSetText "None available";};
		default {};
		};

	_btn ctrlCommit 0;
};
