// server

fnc_prepareAfterBuyRefresh = {
    _side = _this select 0;
    _selector = _this select 1;
    // hintsilent format ["side %1",_side];

    if (_side == west) then {
      if (suppliesBlufor select 1 select _selector select 2 == 0) then {
      (suppliesBlufor select 1 select _selector) set [9, 2]; // block buy button forever
        } else {
      (suppliesBlufor select 1 select _selector) set [9, 0]; // unblock buy button
      };
    publicVariable "suppliesBlufor";

    // todo shouldnt be necessary anymore
    // [suppliesBlufor,moneyBlufor] call fnc_refreshGUI;
  } else {
    if (suppliesOpfor select 1 select _selector select 2 == 0) then {
    (suppliesOpfor select 1 select _selector) set [9, 2]; // block buy button forever
      } else {
    (suppliesOpfor select 1 select _selector) set [9, 0]; // unblock buy button
    };
    publicVariable "suppliesOpfor";
  };
};
