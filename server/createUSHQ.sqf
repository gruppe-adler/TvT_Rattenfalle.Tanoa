#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"



_USSpawnPos = _this select 0;

// trigger for pilot rescue area moved to right position
trg_pilots_rescued setPos _USSpawnPos;

_barracks = createVehicle ["TK_WarfareBBarracks_Base_EP1", _USSpawnPos, [], 0, "NONE"];
_veh2 = createVehicle ["FLAG_RED_F",  [_USSpawnPos select 0, (_USSpawnPos select 1) + 5,0], [], 0, "CAN_COLLIDE"];

_rusActionHelper = createVehicle ["Land_SatellitePhone_F", [getPos _barracks select 0, getPos _barracks select 1, 0], [], 0, "NONE"];
_rusActionHelper attachTo [_barracks, [-1,0,1.5]];
_rusActionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];
sleep 0.01;
_rusActionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];

_rusGrasscutter = createVehicle ["Land_ClutterCutter_large_F", _USSpawnPos, [], 0, "CAN_COLLIDE"];

[[_rusActionHelper,"<t color=""#93E352"">Nachschub anfordern</t>",{
	0 = createDialog "USSupplyGUI"; [USSupplies, false, 0, "","","",0] call refreshRussianUI;
}],"addactionMP",nil,false] spawn BIS_fnc_MP;

USSpawnPos = [_USSpawnPos,[10,70], random 360, 0, [0,0],[50,"Land_Dome_Small_F"]] call SHK_pos;

waitUntil {
  count USSpawnPos > 0
};



publicVariable "USSpawnPos";

_helipad = createVehicle ["Land_HelipadCivil_F", USSpawnPos, [], 0, "NONE"];
