_allowedItems = _this;

if (playerSide == west) then {
  0 = [suppliesblufor, moneyblufor, _allowedItems] execVM "grad_buymenu\functions\player\fnc_createGUI.sqf";
  } else {
  0 = [suppliesopfor, moneyopfor, _allowedItems] execVM "grad_buymenu\functions\player\fnc_createGUI.sqf";
};
