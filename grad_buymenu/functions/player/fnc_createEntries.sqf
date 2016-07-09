fnc_createEntries = {
	_givenSuppliesArray = _this select 0;
	_displayName = _givenSuppliesArray select 0;
	_arrayEntries = _givenSuppliesArray select 1;

	0 = createDialog "GRAD_buy_menu";
	buyMenuOpen = true;

	_dummyPictureIDCs = [
		1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349
	];

	disableSerialization;
	_createdGui = uiNamespace getVariable ['GRAD_buy_menu_var',0];
	{ctrlShow [_x, false];} forEach _dummyPictureIDCs;


	// waitUntil {!isNull _createdGui};
	randIDC = 1000;
	randIDC = [randIDC] call fnc_getNextIDC;
	picIDC = 1338;
	allMouseOver = [];
	_amountOfVehicles = count _arrayEntries;

	[randIDC, _createdGui] call fnc_createKeys;

	{
			//diag_log format ["foreachindex: %1",_forEachIndex];
			_valueMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call fnc_calculateValuesColumn;
			_picMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call fnc_calculatePicturesColumn;

			_xCoord = _valueMeasurements select 0;
			_width = _valueMeasurements select 1;
			_picXCoord = _picMeasurements select 0;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _btn = [randIDC, _createdGui, _xCoord, _width] spawn fnc_createEntryMouseOverArea;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _pic = [picIDC, _createdGui, _picXCoord,_width, _x select 0,_amountOfVehicles] spawn fnc_createEntryPicture;
			 picIDC = [picIDC] call fnc_getNextIDC;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _title = [randIDC, _createdGui, _xCoord, _width,_x select 0, _forEachIndex] spawn fnc_createEntryTitle;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _btn = [randIDC, _createdGui, _xCoord, _width,_x select 7,_x select 0] spawn fnc_createEntryMouseOver;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _price = [randIDC, _createdGui, _xCoord, _width,_x select 3] spawn fnc_createEntryPrice;

			 randIDC = [randIDC] call fnc_getNextIDC;
			 _amount = [randIDC, _createdGui, _xCoord, _width,_x select 2] spawn fnc_createEntryAmount;


			 randIDC = [randIDC] call fnc_getNextIDC;
			 _amount = [randIDC, _createdGui, _xCoord, _width,_x select 8] spawn fnc_createEntrySpawnMethod;

			 randIDC = [randIDC] call fnc_getNextIDC;
			 _amount = [randIDC, _createdGui, _xCoord, _width,_x select 8] spawn fnc_createEntrySpawnMethodMouseOverArea;

			 // randIDC = [randIDC] call fnc_getNextIDC;
			 // _eta = [randIDC, _createdGui, _xCoord, _width,_x select 4] spawn fnc_createEntryETA;


			 randIDC = [randIDC] call fnc_getNextIDC;
	 		_btn = [randIDC, _createdGui, _xCoord, _width,"Order", _forEachIndex, _displayName, _x select 8, _x select 9] spawn fnc_createEntryBuyButton;



	} forEach _arrayEntries;

	_createdGui
};
