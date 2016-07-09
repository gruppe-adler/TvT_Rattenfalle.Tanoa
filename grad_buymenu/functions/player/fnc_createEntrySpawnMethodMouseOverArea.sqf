fnc_createEntrySpawnMethodMouseOverArea = {

  disableSerialization;

  _idc = _this select 0;
  _display = _this select 1;
  _xPos = _this select 2;
  _width = _this select 3;
  _method  = _this select 4;
  _skip = false;

  switch (_method) do {
      //cases (insertable by snippet)
      case 0: { _skip = true;};
      case 1: {}; // plane
      case 2: {}; // sling
      case 3: {_skip = true;};
      case 4: {_skip = true;};
      default {_skip = true;};
  };
  if (_skip) exitWith {};


  _ctrlMethodMouseOverArea =  _display ctrlCreate ["RscStructuredText", _idc];

  _ctrlMethodMouseOverArea ctrlSetPosition [_xPos, safeZoneH/20*11, _width, safeZoneH/30];
  _ctrlMethodMouseOverArea ctrlSetBackgroundColor [0,1,0,0.5];

  _ctrlMethodMouseOverArea ctrlAddEventHandler ["MouseEnter",{
     findDisplay 1337 displayCtrl (ctrlidc (_this select 0)) + 1) ctrlSetTextColor [0.756,0.643,0.243,1];
  	 findDisplay 1337 displayCtrl (ctrlidc (_this select 0)) + 1) ctrlCommit 0;
  	 diag_log format ["mouse entered"];
  	 false
  }];

  _ctrlMethodMouseOverArea ctrlAddEventHandler ["MouseExit",{
    findDisplay 1337 displayCtrl (ctrlidc (_this select 0)) + 1) ctrlSetTextColor [0.2,0.2,0.2,1];
    findDisplay 1337 displayCtrl (ctrlidc (_this select 0)) + 1) ctrlCommit 0;
  	diag_log format ["mouse left"];
  	false
  }];

  if (_method == 1) then {
    _ctrlMethodMouseOverArea ctrlAddEventHandler ["onMouseButtonClick",{
    			0 = ["plane"] execVM "grad_buymenu\openMap.sqf";
          diag_log format ["mouse click"];
          false
    }];
    _ctrlMethodMouseOverArea ctrlAddEventHandler ["onMouseButtonDown",{
    			0 = ["plane"] execVM "grad_buymenu\openMap.sqf";
          diag_log format ["mouse click"];
          false
    }];
  } else {
    _ctrlMethodMouseOverArea ctrlAddEventHandler ["onMouseButtonClick",{
    			0 = ["slingload"] execVM "grad_buymenu\openMap.sqf";
          diag_log format ["mouse click"];
          false
    }];
    _ctrlMethodMouseOverArea ctrlAddEventHandler ["onSetFocus",{
    			0 = ["slingload"] execVM "grad_buymenu\openMap.sqf";
          diag_log format ["mouse focus"];
          false
    }];
  };

  _ctrlMethodMouseOverArea ctrlCommit 0;

  // ctrlidc (_this select 0) + 3

};
