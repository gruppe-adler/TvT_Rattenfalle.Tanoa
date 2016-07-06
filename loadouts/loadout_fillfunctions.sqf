addItemsToUniform = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToUniform _class;
    };
};

addMagazinesToVest = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToVest _class;
    };
};

addMagazinesToBackpack = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToBackpack _class;
    };
};

stripHimNaked = {
	_unit = _this select 0;
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
};
