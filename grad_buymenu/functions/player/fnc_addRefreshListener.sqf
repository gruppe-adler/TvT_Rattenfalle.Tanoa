/* client side */

// money
_moneyBluforListener = {
	if (buyMenuOpen) then {
		// diag_log format ["money blufor listener triggered"];
		[_this select 1] spawn fnc_refreshCredits;
	};
};

"moneyBlufor" addPublicVariableEventHandler _moneyBluforListener;

_moneyOpforListener = {
	if (buyMenuOpen) then {
		// diag_log format ["money opfor listener triggered"];
			[_this select 1] spawn fnc_refreshCredits;
	};
};

"moneyOpfor" addPublicVariableEventHandler _moneyOpforListener;


// supplies
_suppliesBluforListener = {
	if (buyMenuOpen) then {
		diag_log format ["supplies blufor listener triggered"];
		[suppliesBlufor, moneyBlufor] call fnc_refreshGUI;
	};
};
"suppliesBlufor" addPublicVariableEventHandler _suppliesBluforListener;

_suppliesOpforListener = {
	if (buyMenuOpen) then {
		diag_log format ["supplies opfor listener triggered"];
		[suppliesOpfor, moneyOpfor] call fnc_refreshGUI;
	};
};
"suppliesOpfor" addPublicVariableEventHandler _suppliesOpforListener;


/* E M U L A T I O N  for singleplayer tests */
// MONEY
if (isMultiplayer) exitWith {};
waitUntil {!isNil "suppliesOpfor" && !isNil "suppliesBlufor"};

diag_log "entering singleplayer PVEH emulation";

_moneyBluforListener spawn {
		_tempmoneyBlufor = moneyBlufor;
		waitUntil {[moneyBlufor, _tempmoneyBlufor] call BIS_fnc_areEqual};
		[moneyBlufor] call _this;
};

_moneyOpforListener spawn {
		_tempmoneyOpfor = moneyOpfor;
		waitUntil {[moneyOpfor, _tempmoneyOpfor] call BIS_fnc_areEqual};
		[moneyOpfor] call _this;
};


// SUPPLIES
_suppliesBluforListener spawn {
		_tempSuppliesBlufor = suppliesBlufor;
		waitUntil {[suppliesBlufor, _tempSuppliesBlufor] call BIS_fnc_areEqual};
		[suppliesBlufor] call _this;
};

_suppliesOpforListener spawn {
		_tempSuppliesOpfor = suppliesOpfor;
		waitUntil {[suppliesOpfor, _tempSuppliesOpfor] call BIS_fnc_areEqual};
		[suppliesOpfor] call _this;
};
