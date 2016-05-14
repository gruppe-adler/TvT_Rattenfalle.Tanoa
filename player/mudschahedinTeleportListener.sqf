#include "..\missionMacros.h"

createMudschahedinMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorWEST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_MUDSCHA_SPAWN_listener = {
	debugLog("mudschahedin teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "helpers\teleportPlayer.sqf";
	
	_pos call createMudschahedinMarker;

	closeDialog 0;
};

"MUDSCHA_SPAWN" addPublicVariableEventHandler _MUDSCHA_SPAWN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_MUDSCHA_SPAWN_listener spawn {
		waitUntil {MUDSCHA_SPAWN select 0 != 0};
		[0, MUDSCHA_SPAWN] call _this;
	};
};
