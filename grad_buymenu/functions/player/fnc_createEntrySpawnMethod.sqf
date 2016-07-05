fnc_createEntrySpawnMethod = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_method  = _this select 4;

	_ctrlMethod =  _display ctrlCreate ["RscStructuredText", _idc];

	_ctrlMethod ctrlSetPosition [_xPos, safeZoneH/20*11, _width, safeZoneH/10];
	_ctrlMethod ctrlSetBackgroundColor [0,0,0,0];

  _title = "";
  // 0 spawn at ground,
  // 1 spawn with chute,
  // 2 spawn with heli carrier,
  // 3 spawn with civilian driving it
  // 4 spawn at water marker

  switch (_method) do {
      //cases (insertable by snippet)
      case 0: { _title = "Ground"};
      case 1: { _title = "Paradrop"};
      case 2: { _title = "Slingload"};
      case 3: { _title = "Civ Support"};
      case 4: { _title = "Water"};
      default {};
  };

	_ctrlMethod ctrlSetStructuredText parseText ("<t color='#c0c0c0'  shadow='0' align='center'>" + _title + "</t>");
	_ctrlMethod ctrlSetTextColor [1,1,1,1];
	_ctrlMethod ctrlCommit 0;
};
