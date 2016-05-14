#include "..\missionMacros.h"

createRussianMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorEast";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_RUSSIAN_SPAWN_listener = {
	debugLog("opfor teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "helpers\teleportPlayer.sqf";
	
	_pos call createRussianMarker;

	closeDialog 0;
};

"RUSSIAN_SPAWN" addPublicVariableEventHandler _RUSSIAN_SPAWN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_RUSSIAN_SPAWN_listener spawn {
		waitUntil {RUSSIAN_SPAWN select 0 != 0};
		[0, RUSSIAN_SPAWN] call _this;
	};
};
