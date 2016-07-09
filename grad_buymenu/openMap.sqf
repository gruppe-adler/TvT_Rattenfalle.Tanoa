//test.sqf
// https://forums.bistudio.com/topic/156858-dialogs-rsc-listbox-rsc-combo-box/
_method = _this select 0;

_side = str side player;
_marker = "";

if (_side == "west") then {
	switch (_method) do {
			case "plane": { _marker = spawnMarkerBluforPlane;};
			case "slingload": { _marker = spawnMarkerBluforHelicopter;};
			default {};
	};
} else {
	switch (_method) do {
			case "plane": { _marker = spawnMarkerOpforPlane;};
			case "slingload": { _marker = spawnMarkerOpforHelicopter;};
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
if (side player == west) then {
	(_createdGui displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged",{
	SPAWN_APPROACH_BLUFOR = (_this select 1);
	publicVariable "SPAWN_APPROACH_BLUFOR";
	}];
} else {
	(_createdGui displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged",{
	SPAWN_APPROACH_OPFOR = (_this select 1);
	publicVariable "SPAWN_APPROACH_OPFOR";
	}];
};
//"hintsilent format ['%1',(_this select 0) lbText (_this select 1)];

_createdGui displayCtrl 2338 ctrlMapCursor ["","HC_overFriendly"];

// _createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonDown","0 = [_this] execVM 'grad_buymenu\createDropMarker.sqf'; "];
// onMapSingleClick "0 = [_pos,_marker] execVM 'grad_buymenu\moveDropMarker.sqf;'";
onMapSingleClick "
		hint 'click';
";

/*
_createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonClick",{
		0 = [_this] execVM "grad_buymenu\moveDropMarker.sqf";
		uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0] displayCtrl 2338 ctrlMapCursor ["","Arrow"];
		diag_log "added EH click for map";
}];*/
