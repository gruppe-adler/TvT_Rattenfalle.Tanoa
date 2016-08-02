// server

fnc_prepareAfterBuyRefresh = {
    _side = _this select 0;
    _selector = _this select 1;
    // hintsilent format ["side %1",_side];

    if (_side == west) then {
        _supplyItem = suppliesBlufor getVariable _selector;
        if (_supplyItem select 2 == 0) then {
            _supplyItem set [9, 2]; // block buy button forever
        } else {
            _supplyItem set [9, 0]; // unblock buy button
        };
        publicVariable "suppliesBlufor";
    } else {
        _supplyItem = suppliesOpfor getVariable _selector;
        if (_supplyItem select 2 == 0) then {
            _supplyItem set [9, 2]; // block buy button forever
        } else {
            _supplyItem set [9, 0]; // unblock buy button
        };
        publicVariable "suppliesOpfor";
  };
};
