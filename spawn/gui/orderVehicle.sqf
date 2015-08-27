_idc = ctrlIDC  (_this select 0);

_tempRussian_1 = (russianSupplies select 1);
_tempRussian_2 = (russianSupplies select 2);
_tempRussian_3 = (russianSupplies select 3);
_tempRussian_4 = (russianSupplies select 4);

_oldMoney = (russianSupplies select 0);
_price = [_idc] call russian_IDC_to_price;

_newMoney = _oldMoney - _price;

// if (DEBUG) then { diag_log format ["_newMoney: %1, _price: %2",_newMoney,_price]; };


// dont fucking buy without money dude -> exit with hint
if (_newMoney < 0) exitWith { 
    [russianSupplies,true,0,""] call refreshUI;
};

_selector = [_idc] call russian_IDC_to_selector;

//if (DEBUG) then { diag_log format ["_idc: %1",_idc]; };

switch (_selector) do {
    
    case 1: { _tempRussian_1 = [_idc,_tempRussian_1] call calculateVehicleCall; };
    case 2: { _tempRussian_2 = [_idc,_tempRussian_2] call calculateVehicleCall; };
    case 3: { _tempRussian_3 = [_idc,_tempRussian_3] call calculateVehicleCall; };
    case 4: { _tempRussian_4 = [_idc,_tempRussian_4] call calculateVehicleCall; };

    default {};
};

// dont fucking buy without stock dude -> exit with hint
if (count _tempRussian_1 == 1 || count _tempRussian_2 == 1 || count _tempRussian_3 == 1 || count _tempRussian_4 == 1) exitWith { 
    [russianSupplies,false,_idc,""] call refreshUI;
};


// SUCCESS - VEHICLE WILL BE ORDERED!

_vehicleOrdered = [_idc] call russian_IDC_to_classname;

if (DEBUG) then { diag_log format ["_vehicleOrdered: %1",_vehicleOrdered]; };

_tempSupplies = 
    [
        _newMoney,
        _tempRussian_1,
        _tempRussian_2,
        _tempRussian_3,
        _tempRussian_4
    ];

[_tempSupplies,false,0,_vehicleOrdered] call refreshUI;

//if (DEBUG) then { diag_log format ["russianSupplies refreshed: %1",russianSupplies]; };
