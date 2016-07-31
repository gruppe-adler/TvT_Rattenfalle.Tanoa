if (playerSide == west) then {
  0 = [suppliesblufor, moneyblufor] execVM "grad_buymenu\functions\player\fnc_createGUI.sqf";
  } else {
  0 = [suppliesopfor, moneyopfor] execVM "grad_buymenu\functions\player\fnc_createGUI.sqf";
};
