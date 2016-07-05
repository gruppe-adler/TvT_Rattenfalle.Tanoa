#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"



_rebelsSpawnPos = _this select 0;

_rebelsActionHelper = createVehicle ["Land_SatellitePhone_F", [_rebelsSpawnPos select 0, (_rebelsSpawnPos select 1) + 0.5, 0], [], 0, "NONE"];
[[_rebelsActionHelper,"<t color=""#93E352"">Nachschub anfordern</t>",{
	0 = createDialog "rebelsSupplyGUI"; [rebelsSupplies, false, 0, "","","",0] call refreshMudschahedinUI;
}],"addactionMP",nil,false] spawn BIS_fnc_MP;
//_muhaSupplyAction = _rebelsActionHelper addAction["<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "rebelsSupplyGUI"; [rebelsSupplies, false, 0, "","",""] call refreshMudschahedinUI; }, _Args, 1, true, true, "","_target distance _this < 6"];

_rebelsGrasscutter = createVehicle ["Land_ClutterCutter_large_F", _rebelsSpawnPos, [], 0, "CAN_COLLIDE"];



createTents = {
	{
		_x = createVehicle ["Land_TentA_F", _rebelsSpawnPos, [], 15, "NONE"];
		_circlePos = [_rebelsSpawnPos,[5,6], random 360, 0, [0,0],[10,"Land_TentA_F"]] call SHK_pos;
		_x setPos _circlePos;
		_x setDir (([_x, (_this select 1)] call BIS_fnc_relativeDirTo)-180);
		_x setVectorUp surfaceNormal position _x;
	} forEach (_this select 0);
};

_fire = createVehicle ["Land_Campfire_F", _rebelsSpawnPos, [], 5, "NONE"];
_fire setPos (getPos _fire);

[[0,1,2,3,4,5],_fire] call createTents;






rebelsSpawnPos = [_rebelsSpawnPos,[10,70], random 360, 0, [0,0],[50,"Land_Dome_Small_F"]] call SHK_pos;

waitUntil {
  count rebelsSpawnPos > 0
};

[".."] call EFUNC(common,displayTextStructured);


publicVariable "rebelsSpawnPos";

_helipad = createVehicle ["Land_HelipadCivil_F", rebelsSpawnPos, [], 0, "NONE"];
