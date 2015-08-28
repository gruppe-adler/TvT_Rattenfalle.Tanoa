// converts credits to creditstring

creditString = {
    _credits = _this select 0;

    _string = "<t align='center'>" + (str _credits) + "</t>";

    _string
};

// takes IDC, gives back selector
russian_IDC_to_selector = {
	_idc = _this select 0;
	_selector = 0;

	switch (_idc) do {

		case 1501: { _selector = 1; };
		case 1502: { _selector = 2; };
		case 1503: { _selector = 3; };
		case 1504: { _selector = 4; };
		case 1505: { _selector = 5; };
		default {};

	};

	_selector
	
};


// takes IDC , gives back classname
russian_IDC_to_classname = {
	_idc = _this select 0;
	_classname = "";

	switch (_idc) do {

		case 1501: { _classname = ((russianSupplies select 1) select 0); };
		case 1502: { _classname = ((russianSupplies select 2) select 0); };
		case 1503: { _classname = ((russianSupplies select 3) select 0); };
		case 1504: { _classname = ((russianSupplies select 4) select 0); };
		case 1505: { _classname = ((russianSupplies select 5) select 0); };
		default {};
	};

	_classname
};


// takes IDC , gives back displayname
russian_IDC_to_displayname = {
	_idc = _this select 0;
	_displayname = "";

	switch (_idc) do {

		case 1501: { _displayname = ((russianSupplies select 1) select 1); };
		case 1502: { _displayname = ((russianSupplies select 2) select 1); };
		case 1503: { _displayname = ((russianSupplies select 3) select 1); };
		case 1504: { _displayname = ((russianSupplies select 4) select 1); };
		case 1505: { _displayname = ((russianSupplies select 5) select 1); };
		default {};
	};

	_displayname
	
};


// takes IDC , gives back countleft
russian_IDC_to_countleft = {
	_idc = _this select 0;
	_countleft = 0;

	switch (_idc) do {

		case 1501: { _countleft = ((russianSupplies select 1) select 2); };
		case 1502: { _countleft = ((russianSupplies select 2) select 2); };
		case 1503: { _countleft = ((russianSupplies select 3) select 2); };
		case 1504: { _countleft = ((russianSupplies select 4) select 2); };
		case 1505: { _countleft = ((russianSupplies select 5) select 2); };
		default {};
	};

	_countleft
	
};

// takes IDC , gives back countleft IDC
russian_buttonIDC_to_countleftIDC = {
	_idc = _this select 0;
	_countleftIDC = 0;

	switch (_idc) do {

		case 1501: { _countleftIDC = 1201; };
		case 1502: { _countleftIDC = 1202; };
		case 1503: { _countleftIDC = 1203; };
		case 1504: { _countleftIDC = 1204; };
		case 1505: { _countleftIDC = 1205; };
		default {};
	};

	_countleftIDC
	
};

// takes IDC , gives back price number
russian_IDC_to_price = {
	_idc = _this select 0;
	_price = 0;

	switch (_idc) do {

		case 1501: { _price = ((russianSupplies select 1) select 3); };
		case 1502: { _price = ((russianSupplies select 2) select 3); };
		case 1503: { _price = ((russianSupplies select 3) select 3); };
		case 1504: { _price = ((russianSupplies select 4) select 3); };
		case 1505: { _price = ((russianSupplies select 5) select 3); };
		default {};
	};

	_price
	
};


// takes IDC , gives back pricedisplay string
russian_IDC_to_pricedisplay = {
	_idc = _this select 0;
	_pricedisplay = 0;

	switch (_idc) do {

		case 1501: { _pricedisplay = ((russianSupplies select 1) select 4); };
		case 1502: { _pricedisplay = ((russianSupplies select 2) select 4); };
		case 1503: { _pricedisplay = ((russianSupplies select 3) select 4); };
		case 1504: { _pricedisplay = ((russianSupplies select 4) select 4); };
		case 1505: { _pricedisplay = ((russianSupplies select 5) select 4); };
		default {};
	};

	_pricedisplaystring = [_pricedisplay] call creditString;

	_pricedisplaystring
	
};


// takes IDC, gives back ETA
russian_IDC_to_eta = {
	_idc = _this select 0;
	_eta = 0;

	switch (_idc) do {

		case 1501: { _eta = ((russianSupplies select 1) select 5); };
		case 1502: { _eta = ((russianSupplies select 2) select 5); };
		case 1503: { _eta = ((russianSupplies select 3) select 5); };
		case 1504: { _eta = ((russianSupplies select 4) select 5); };
		case 1505: { _eta = ((russianSupplies select 5) select 5); };
		default {};
	};

	_eta
};

// takes IDC, gives back extras
russian_IDC_to_extras = {
	_idc = _this select 0;
	_extras = 0;

	switch (_idc) do {

		case 1501: { _extras = ((russianSupplies select 1) select 6); };
		case 1502: { _extras = ((russianSupplies select 2) select 6); };
		case 1503: { _extras = ((russianSupplies select 3) select 6); };
		case 1504: { _extras = ((russianSupplies select 4) select 6); };
		case 1505: { _extras = ((russianSupplies select 5) select 6); };
		default {};
	};

	_extras
};

/*
checkForDisabledButtons = {
	_array = _this select 0;
	_source = _this select 1;

	[_array select 0] call russian_IDC_to_countleft;
};
*/


// checkVehiclesLeft

/*

ctrlSetText [1101, _namedisplay_1];
	ctrlSetText [1201, _countleft_1];
	ctrlSetText [1301, _pricedisplay_1];
	ctrlSetText [1401, _eta_1];
	ctrlSetText [1501, _button_1];

	*/
