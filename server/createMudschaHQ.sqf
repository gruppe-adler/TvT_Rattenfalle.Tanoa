#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"



_mudschahedinSpawnPos = _this select 0;

_muhaActionHelper = createVehicle ["Land_SatellitePhone_F", [_mudschahedinSpawnPos select 0, (_mudschahedinSpawnPos select 1) + 0.5, 0], [], 0, "NONE"];
[[_muhaActionHelper,"<t color=""#93E352"">Nachschub anfordern</t>",{
	0 = createDialog "mudschahedinSupplyGUI"; [mudschahedinSupplies, false, 0, "","","",0] call refreshMudschahedinUI;
}],"addactionMP",nil,false] spawn BIS_fnc_MP;
//_muhaSupplyAction = _muhaActionHelper addAction["<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "mudschahedinSupplyGUI"; [mudschahedinSupplies, false, 0, "","",""] call refreshMudschahedinUI; }, _Args, 1, true, true, "","_target distance _this < 6"];

_muhaGrasscutter = createVehicle ["Land_ClutterCutter_large_F", _mudschahedinSpawnPos, [], 0, "CAN_COLLIDE"];



createTents = {
	{
		_x = createVehicle ["Land_TentA_F", _mudschahedinSpawnPos, [], 15, "NONE"];
		_circlePos = [_mudschahedinSpawnPos,[5,6], random 360, 0, [0,0],[10,"Land_TentA_F"]] call SHK_pos;
		_x setPos _circlePos;
		_x setDir (([_x, (_this select 1)] call BIS_fnc_relativeDirTo)-180);
		_x setVectorUp surfaceNormal position _x; 
	} forEach (_this select 0);
};

_fire = createVehicle ["Land_Campfire_F", _mudschahedinSpawnPos, [], 5, "NONE"];
_fire setPos (getPos _fire);

[[0,1,2,3,4,5],_fire] call createTents;






mudschahedinSpawnPos = [_mudschahedinSpawnPos,[10,70], random 360, 0, [0,0],[50,"Land_Dome_Small_F"]] call SHK_pos;

waitUntil {
  count mudschahedinSpawnPos > 0
};

[".."] call EFUNC(common,displayTextStructured);


publicVariable "mudschahedinSpawnPos";

_helipad = createVehicle ["Land_HelipadCivil_F", mudschahedinSpawnPos, [], 0, "NONE"];