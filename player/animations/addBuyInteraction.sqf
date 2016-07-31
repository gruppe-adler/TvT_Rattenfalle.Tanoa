_allowedItems = _this;

GRAD_BuyAction =
[
	'Open Buy Menu','Open Buy Menu','',
	{0 = _allowedItems execVM "grad_buymenu\openMenu.sqf";},
	{alive player}
] call ace_interact_menu_fnc_createAction;

[
	player,
	1,
	["ACE_SelfActions"],
	GRAD_BuyAction
] call ace_interact_menu_fnc_addActionToObject;
