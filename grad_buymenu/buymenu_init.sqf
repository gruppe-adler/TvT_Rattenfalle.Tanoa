/*
	buy menu for gruppe adler
	by nomisum
*/

// hide all markers

// global values
if (isServer) then {

	// initial money, also used for tracking money during game
	moneyBlufor = 4000; // initial money
	moneyOpfor = 4000;

	moneyGainBlufor = 5; // credits added every interval
	moneyGainOpfor = 5;

	moneyGainIntervalBlufor = 2.5; // interval in seconds
	moneyGainIntervalOpfor = 2.5;

	spawnArrayBluforLand = [
		"mrk_spawn_blufor_land_1",
		"mrk_spawn_blufor_land_2",
		"mrk_spawn_blufor_land_3",
		"mrk_spawn_blufor_land_4"
		];
	spawnArrayBluforCivilian = [
		"mrk_spawn_blufor_civilian_1",
		"mrk_spawn_blufor_civilian_2",
		"mrk_spawn_blufor_civilian_3",
		"mrk_spawn_blufor_civilian_4"
		];
	spawnArrayBluforWater = [
		"mrk_spawn_blufor_water_1",
		"mrk_spawn_blufor_water_2",
		"mrk_spawn_blufor_water_3",
		"mrk_spawn_blufor_water_4"
		];
	spawnArrayOpforLand = [
		"mrk_spawn_opfor_land_1",
		"mrk_spawn_opfor_land_2",
		"mrk_spawn_opfor_land_3",
		"mrk_spawn_opfor_land_4"
	];
	spawnArrayOpforWater = [
		"mrk_spawn_opfor_water_1",
		"mrk_spawn_opfor_water_2",
		"mrk_spawn_opfor_water_3",
		"mrk_spawn_opfor_water_4"
	];
	spawnArrayOpforCivilian = [
		"mrk_spawn_opfor_civilian_1",
		"mrk_spawn_opfor_civilian_2",
		"mrk_spawn_opfor_civilian_3",
		"mrk_spawn_opfor_civilian_4"
	];

	civilianCarSupplier = "C_man_hunter_1_F"; // who will bring the cars if spawn method civilian is chosen

	spawnChuteVehicleClassBlufor = "RHS_C130J";
	spawnSlingLoadVehicleClassBlufor = "RHS_CH_47F_light";

	spawnChuteVehicleClassOpfor = "RHS_C130J";
	spawnSlingLoadVehicleClassOpfor = "RHS_Mi8mt_Cargo_vdv";


	/// DO NOT EDIT BELOW ///

	ordersBlufor = [];
	ordersOpfor = [];

	publicVariable "moneyBlufor";
	publicVariable "moneyOpfor";
	publicVariable "ordersBlufor";
	publicVariable "ordersOpfor";

	_randBluInd = ceil (random 3);
	_randOpfInd = ceil (random 3);

	spawnLocationBluforLand = getMarkerPos (spawnArrayBluforLand select _randBluInd);
	spawnLocationBluforWater = getMarkerPos (spawnArrayBluforWater select _randBluInd);
	spawnLocationCivilianBlufor = getMarkerPos (spawnArrayBluforCivilian select _randBluInd);

	spawnLocationOpforLand = getMarkerPos (spawnArrayOpforLand select _randOpfInd);
	spawnLocationOpforWater = getMarkerPos (spawnArrayOpforWater select _randOpfInd);
	spawnLocationCivilianOpfor = getMarkerPos (spawnArrayOpforCivilian select _randOpfInd);

	publicVariable "spawnLocationBluforLand";
	publicVariable "spawnLocationBluforWater";
	publicVariable "spawnLocationCivilianBlufor";
	publicVariable "spawnLocationOpforLand";
	publicVariable "spawnLocationOpforWater";
	publicVariable "spawnLocationCivilianOpfor";

};


// arrays of menu content

0 = [] execVM "grad_buymenu\definitions\suppliesBlufor.sqf";
0 = [] execVM "grad_buymenu\definitions\suppliesOpfor.sqf";

if (!isServer) then {
		buyMenuOpen = false; // checks if player has gui open

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_addRefreshListener.sqf";

		// G U I   f u n c t i o n s // do not edit below
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_hideMarkers.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_SetModelPitchBankYaw.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_calculateValuesColumn.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_calculatePicturesColumn.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntries.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createKeys.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryPicture.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryTitle.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryPrice.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryMouseOver.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryMouseOverArea.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryETA.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntrySpawnMethod.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryBuyButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryAmount.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarExitButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarheadline.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarCredits.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_manageOrder.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshCredits.sqf";

		[] spawn fnc_hideMarkers;
};


if (isServer) then {
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_raiseMoney.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_orderListener.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnVehicleManager.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnChute.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnCiv.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSimple.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSlingLoad.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnWater.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_addRefreshListenerServer.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_prepareAfterBuyRefresh.sqf";

	[] spawn fnc_raiseBluforMoney;
	[] spawn fnc_raiseOpforMoney;
	[] spawn fnc_addOrderListener;

};
