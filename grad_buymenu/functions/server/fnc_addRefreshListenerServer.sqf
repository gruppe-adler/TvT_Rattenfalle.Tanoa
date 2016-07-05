// server listens publicvariableservers and broadcasts back
if (!isServer) exitWith {};

// money
_moneyBluforListener = {
	publicVariable "moneyBlufor";
};

_moneyOpforListener = {
	publicVariable "moneyOpfor";
};

// supplieslistener
_suppliesBluforListener = {
	publicVariable "suppliesBlufor";
};

_suppliesOpforListener = {
	publicVariable "suppliesOpfor";
};

"moneyBlufor" addPublicVariableEventHandler _moneyBluforListener;
"moneyOpfor" addPublicVariableEventHandler _moneyOpforListener;
"suppliesBlufor" addPublicVariableEventHandler _suppliesBluforListener;
"suppliesOpfor" addPublicVariableEventHandler _suppliesOpforListener;
