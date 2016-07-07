fnc_createEntrySpawnMethod = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_method  = _this select 4;

	_ctrlMethod =  _display ctrlCreate ["RscPicture", _idc];

	_width = safeZoneH/30;
	_height = _width * 4 / 3;

	_ctrlMethod ctrlSetPosition [_xPos - _width/2, safeZoneH/20*11, _width, _height];
	_ctrlMethod ctrlSetBackgroundColor [0,0,0,0];

  _title = "";
  // 0 spawn at ground,
  // 1 spawn with chute,
  // 2 spawn with heli carrier,
  // 3 spawn with civilian driving it
  // 4 spawn at water marker
// \A3\ui_f\data\map\markers\nato\c_car.paa
	_prefix = "\A3\ui_f\data\map\markers\nato\";
  switch (_method) do {
      //cases (insertable by snippet)
      case 0: { _title = _prefix + "c_car.paa";};
      case 1: { _title = _prefix + "c_plane.paa"; _ctrlMethod ctrlSetTextColor [0.756,0.643,0.243,1]; };
      case 2: { _title = _prefix + "c_air.paa"; _ctrlMethod ctrlSetTextColor [0.756,0.643,0.243,1]; };
      case 3: { _title = _prefix + "c_civ.paa";};
      case 4: { _title = _prefix + "c_ship.paa";};
      default {};
  };



	_ctrlMethod ctrlsetText _title;

	_ctrlMethod ctrlCommit 0;
};
