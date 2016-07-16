#include "..\missionMacros.h"

createUSMarker = {
	_opfor_marker = createMarker ["blufor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorWEST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_US_SPAWN_listener = {
	#include "\z\ace\addons\main\script_component.hpp"
	//debugLog("opfor teleport target listener running...");
	_pos = _this select 1;

	["......"] call EFUNC(common,displayTextStructured);
	waituntil {CRASH_SITE select 0 != 0};
	["....."] call EFUNC(common,displayTextStructured);
	waituntil {REBEL_SPAWN select 0 != 0};
	["...."] call EFUNC(common,displayTextStructured);
	waituntil {US_SPAWN select 0 != 0};
	["..."] call EFUNC(common,displayTextStructured);

	[_pos, 50] execVM "player\teleportPlayer.sqf";

	_pos call createUSMarker;

	closeDialog 0;
};

"US_SPAWN" addPublicVariableEventHandler _US_SPAWN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_US_SPAWN_listener spawn {
		waitUntil {US_SPAWN select 0 != 0};
		[0, US_SPAWN] call _this;
	};
};
