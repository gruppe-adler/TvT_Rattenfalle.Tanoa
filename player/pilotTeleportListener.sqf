#include "..\missionMacros.h"

createPilotMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorEast";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_CRASH_SITE_listener = {
	debugLog("pilot teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "helpers\teleportPlayer.sqf";
	
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
