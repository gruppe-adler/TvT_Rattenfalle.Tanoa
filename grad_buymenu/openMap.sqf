//test.sqf
// https://forums.bistudio.com/topic/156858-dialogs-rsc-listbox-rsc-combo-box/
_method = _this select 0;

_side = str side player;
_marker = "";

if (_side == "west") then {
	switch (_method) do {
			case "plane": { _marker = spawnLocationBluforPlane;};
			case "slingload": { _marker = spawnLocationBluforHelicopter;};
			default {};
	};
} else {
	switch (_method) do {
			case "plane": { _marker = spawnLocationOpforPlane;};
			case "slingload": { _marker = spawnLocationOpforHelicopter;};
			default {};
	};
};

disableSerialization;

0 = createDialog "GRAD_buy_menu_select_airdrop";
waitUntil {dialog};

_createdGui = uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0];

//Define idc's for controls for easy access
_comboA = 2339;

{
	_index = lbAdd [_comboA, _x];
} forEach ["NORTH","EAST","SOUTH","WEST"];

(_createdGui displayCtrl _comboA) lbSetCurSel 0;

//set an event to fire when a selection is made in comboA
(_createdGui displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged","hintsilent format ['%1',(_this select 0) lbText (_this select 1)];"];

_createdGui displayCtrl 2338 ctrlMapCursor ["","HC_overFriendly"];

_createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonDown","0 = [_this] execVM 'grad_buymenu\createDropMarker.sqf'; "];

_createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonClick","0 = [_this] execVM 'grad_buymenu\createDropMarker.sqf'; "];
