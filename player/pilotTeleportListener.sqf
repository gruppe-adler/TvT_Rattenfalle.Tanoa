#include "..\missionMacros.h"

createPilotMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorEast";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_CRASH_SITE_listener = {
	#include "\z\ace\addons\main\script_component.hpp"
	//debugLog("pilot teleport target listener running...");
	_pos = _this select 0;

	diag_log format ["pilot spawn is %1",_pos];

	["......"] call EFUNC(common,displayTextStructured);
	waituntil {CRASH_SITE select 0 != 0};
	["....."] call EFUNC(common,displayTextStructured);
	waituntil {REBEL_SPAWN select 0 != 0};
	["...."] call EFUNC(common,displayTextStructured);
	waituntil {US_SPAWN select 0 != 0};
	["..."] call EFUNC(common,displayTextStructured);

	[_pos, 50, player] execVM "player\teleportPlayer.sqf";

	_pos call createPilotMarker;


	closeDialog 0;
};

"CRASH_SITE" addPublicVariableEventHandler _CRASH_SITE_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_CRASH_SITE_listener spawn {
		waitUntil {CRASH_SITE select 0 != 0};
		[0, CRASH_SITE] call _this;
	};
};
