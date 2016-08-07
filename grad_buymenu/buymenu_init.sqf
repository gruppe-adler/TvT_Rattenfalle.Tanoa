/*
	buy menu for gruppe adler
	by nomisum
*/

// hide all markers

// global values
if (isServer) then {

	suppliesBlufor = "Flag_NATO_F" createVehicle [0, 1, 0];
	suppliesOpfor = "Flag_NATO_F" createVehicle [1, 0, 0];
	publicVariable "suppliesBlufor";
	publicVariable "suppliesOpfor";

	// initial money, also used for tracking money during game
	moneyBlufor = 4000; // initial money
	moneyOpfor = 4000;
	publicVariable "moneyBlufor";
	publicVariable "moneyOpfor";

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
	spawnArrayBluforPlane = [
		"mrk_spawn_blufor_plane_1",
		"mrk_spawn_blufor_plane_2",
		"mrk_spawn_blufor_plane_3",
		"mrk_spawn_blufor_plane_4"
		];
	spawnArrayBluforHelicopter = [
		"mrk_spawn_blufor_helicopter_1",
		"mrk_spawn_blufor_helicopter_2",
		"mrk_spawn_blufor_helicopter_3",
		"mrk_spawn_blufor_helicopter_4"
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
	spawnArrayOpforPlane = [
		"mrk_spawn_opfor_plane_1",
		"mrk_spawn_opfor_plane_2",
		"mrk_spawn_opfor_plane_3",
		"mrk_spawn_opfor_plane_4"
		];
	spawnArrayOpforHelicopter = [
		"mrk_spawn_opfor_helicopter_1",
		"mrk_spawn_opfor_helicopter_2",
		"mrk_spawn_opfor_helicopter_3",
		"mrk_spawn_opfor_helicopter_4"
		];

	civilianCarSupplier = "C_man_hunter_1_F"; // who will bring the cars if spawn method civilian is chosen

	spawnChuteVehicleClassBlufor = "RHS_C130J";
	spawnSlingLoadVehicleClassBlufor = "rhsusf_CH53E_USMC_D";

	spawnChuteVehicleClassOpfor = "RHS_C130J";
	spawnSlingLoadVehicleClassOpfor = "RHS_Mi8mt_Cargo_vdv";

	/// DO NOT EDIT BELOW ///

	_randBluInd = ceil (random 3);
	_randOpfInd = ceil (random 3);

	/*
	// delete bases not needed
	switch {_randBluInd} do {
		case 1: { {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 2: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 3: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 4: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; };
		default {};
	};

	switch {_randOpfInd} do {
		case 1: { {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 2: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 3: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 4: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; };
		default {};
	};*/
	

	spawnMarkerBluforLand = (spawnArrayBluforLand select _randBluInd);
	spawnMarkerBluforWater = (spawnArrayBluforWater select _randBluInd);
	spawnMarkerCivilianBlufor = (spawnArrayBluforCivilian select _randBluInd);
	spawnMarkerBluforPlane = (spawnArrayBluforPlane select _randBluInd);
	spawnMarkerBluforHelicopter = (spawnArrayBluforHelicopter select _randBluInd);

	spawnMarkerOpforLand = (spawnArrayOpforLand select _randOpfInd);
	spawnMarkerOpforWater = (spawnArrayOpforWater select _randOpfInd);
	spawnMarkerCivilianOpfor = (spawnArrayOpforCivilian select _randOpfInd);
	spawnMarkerOpforPlane = (spawnArrayOpforPlane select _randOpfInd);
	spawnMarkerOpforHelicopter = (spawnArrayOpforHelicopter select _randOpfInd);

	publicVariable "spawnMarkerBluforLand";
	publicVariable "spawnMarkerBluforWater";
	publicVariable "spawnMarkerCivilianBlufor";
	publicVariable "spawnMarkerBluforPlane";
	publicVariable "spawnMarkerBluforHelicopter";

	publicVariable "spawnMarkerOpforLand";
	publicVariable "spawnMarkerOpforWater";
	publicVariable "spawnMarkerCivilianOpfor";
	publicVariable "spawnMarkerOpforPlane";
	publicVariable "spawnMarkerOpforHelicopter";

	SPAWN_APPROACH_BLUFOR = "WEST";
	SPAWN_APPROACH_OPFOR = "EAST";

	publicVariable "SPAWN_APPROACH_BLUFOR";
	publicVariable "SPAWN_APPROACH_OPFOR";

	// broadcast supplies definitions
	0 = [] execVM "grad_buymenu\definitions\suppliesBlufor.sqf";
	0 = [] execVM "grad_buymenu\definitions\suppliesOpfor.sqf";

};


// arrays of menu content

if (hasInterface) then {
		buyMenuOpen = false; // checks if player has gui open

		_canBuy = [];
		if (playerSide == east) then {
			switch (rank player) do {
				case "CAPTAIN": { _canBuy = ['scooter', 'car', 'truck', 'uaz_dshkm', 'uaz_spg9', 'btr70', 'gaz66', 't55']; };
				default { _canBuy = ['scooter', 'car']; };
			};
			player setVariable ["GRAD_canBuy", _canBuy];

			player setVariable ['GRAD_buymenu_money', {moneyOpfor}, true];
			player setVariable ['GRAD_buymenu_money_name', "moneyOpfor", true];
			player setVariable ['GRAD_buymenu_supplies', {suppliesOpfor}, true];
			player setVariable ['GRAD_buymenu_supplies_name', "suppliesOpfor", true];
			player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerOpforWater}];
			player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerOpforLand}];
		};
		if (playerSide == west) then {
			switch (rank player) do {
				case "CAPTAIN": { _canBuy = ['boat','car','m1025','uh1y','lav','m109', 'ah1z']; };
				default { _canBuy = ['boat', 'car']; };
			};
			player setVariable ["GRAD_canBuy", _canBuy];

			player setVariable ['GRAD_buymenu_money', {moneyBlufor}, true];
			player setVariable ['GRAD_buymenu_money_name', "moneyBlufor", true];
			player setVariable ['GRAD_buymenu_supplies', {suppliesBlufor}, true];
			player setVariable ['GRAD_buymenu_supplies_name', "suppliesBlufor", true];

			player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerBluforWater}];
			player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerBluforLand}];
		};

		// G U I   f u n c t i o n s // do not edit below
        call compile preprocessFileLineNumbers "grad_buymenu\currentMenuIDCs.sqf";
        call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_getNextIDC.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_showMarkers.sqf";

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
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntrySpawnMethodMouseOverArea.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryBuyButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryAmount.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarExitButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarheadline.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarCredits.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_addOrder.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshCredits.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshGUI.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_moveFirstToLast.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_moveDropMarker.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_displayWindInfo.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\api\invalidateSupply.sqf";


		[] spawn fnc_showMarkers;
		[] spawn {
		waitUntil {!isnil "suppliesBlufor" && !isNil "suppliesOpfor" && time > 0 };
			0 = execVM "grad_buymenu\openMenu.sqf";
			waitUntil {buyMenuOpen};
			sleep 3;
			closeDialog 0;
		};
};


if (isServer) then {
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_raiseMoney.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnVehicleManager.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnChute.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnCiv.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSimple.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSlingLoad.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnWater.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_prepareAfterBuyRefresh.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\api\fnc_api_createOrder.sqf";

	[] spawn fnc_raiseBluforMoney;
	[] spawn fnc_raiseOpforMoney;
};
