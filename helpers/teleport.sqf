#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

checkWater = {
	if (surfaceIsWater _this) then {
		_string = localize "str_GRAD_spawn_on_water";
		[_string] call EFUNC(common,displayTextStructured); // 
	};
};

if (str player == str pilot) then {
	[
		"teleportClickOpf",
		"onMapSingleClick",
		{
			debugLog("pilot clicked on map");
			try {
				_pos call checkWater;
				["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				_pos call pilotTeleport;
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler;
};


pilotTeleport = {
	CRASH_SITE = _this;
	publicVariableServer "CRASH_SITE";
	debugLog("pilot published crash site");

	CRASH_SITE_SELECTED = true;
	publicVariable "CRASH_SITE_SELECTED";
};