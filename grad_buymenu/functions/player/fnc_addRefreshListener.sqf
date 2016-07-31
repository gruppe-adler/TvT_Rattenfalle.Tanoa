/* client side */

// money
_moneyBluforListener = {
	if (buyMenuOpen) then {
		[_this select 1] spawn fnc_refreshCredits;
	};
};

_moneyOpforListener = {
	if (buyMenuOpen) then {
			[_this select 1] spawn fnc_refreshCredits;
	};
};

// supplies
_suppliesBluforListener = {
	if (buyMenuOpen) then {
		diag_log format ["supplies blufor listener triggered"];
		[suppliesBlufor, moneyBlufor] call fnc_refreshGUI;
	};
};

_suppliesOpforListener = {
	if (buyMenuOpen) then {
		diag_log format ["supplies opfor listener triggered"];
		[suppliesOpfor, moneyOpfor] call fnc_refreshGUI;
	};
};

if (side player == west) then {
			"moneyBlufor" addPublicVariableEventHandler _moneyBluforListener;
			"suppliesBlufor" addPublicVariableEventHandler _suppliesBluforListener;
};

if (side player == east) then {
		"moneyOpfor" addPublicVariableEventHandler _moneyOpforListener;
		"suppliesOpfor" addPublicVariableEventHandler _suppliesOpforListener;
};


/* E M U L A T I O N  for singleplayer tests */
// MONEY
if (isMultiplayer) exitWith {};
waitUntil {!isNil "suppliesOpfor" && !isNil "suppliesBlufor"};

diag_log "entering singleplayer PVEH emulation";

_moneyBluforListener spawn {
	waitUntil {
		[0, moneyBlufor] call _this;
		sleep 20;
	}
};

_moneyOpforListener spawn {
	waitUntil {
		[0, moneyOpfor] call _this;
		sleep 20;
	}
};


// SUPPLIES
_suppliesBluforListener spawn {
	waitUntil {
		[0, suppliesBlufor] call _this;
		sleep 20;
	}
};

_suppliesOpforListener spawn {
	waitUntil {
		[0, suppliesOpfor] call _this;
		sleep 20;
	}
};
