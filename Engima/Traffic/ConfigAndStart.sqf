/*
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of
 * how to customize and use Engima's Traffic.
 */

 private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", [
	"C_Offroad_01_F",
	"C_Offroad_01_repair_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",


	"RDS_Gaz24_Civ_01",
	"RDS_Gaz24_Civ_02",
	"RDS_Gaz24_Civ_03",
	"RDS_Gaz24_Civ_01",
	"RDS_Gaz24_Civ_02",
	"RDS_Gaz24_Civ_03",
	"RDS_Gaz24_Civ_01",
	"RDS_Gaz24_Civ_02",
	"RDS_Gaz24_Civ_03",

	"RDS_Ikarus_Civ_01",
	"RDS_Ikarus_Civ_02",
	"RDS_Ikarus_Civ_02",

	"RDS_S1203_Civ_01",
	"RDS_S1203_Civ_02",
	"RDS_S1203_Civ_03",

	"RDS_Octavia_Civ_01",

	"RDS_Lada_Civ_01",
	"RDS_Lada_Civ_02",
	"RDS_Lada_Civ_03",

	"RDS_Lada_Civ_05",
	"RDS_Lada_Civ_01",
	"RDS_Lada_Civ_02",
	"RDS_Lada_Civ_03",



	"RHS_Ural_Civ_01",
	"RHS_Ural_Civ_02",
	"RHS_Ural_Civ_03",
	"RHS_Ural_Open_Civ_01",
	"RHS_Ural_Open_Civ_02",
	"RHS_Ural_Open_Civ_03"
	]],
	["VEHICLES_COUNT", 10],
	["MIN_SPAWN_DISTANCE", 800],
	["MAX_SPAWN_DISTANCE", 2000],
	["MIN_SKILL", 0.4],
	["MAX_SKILL", 0.6],
  ["AREA_MARKER", "mrk_drive_area"],
	["DEBUG", DEBUG]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
