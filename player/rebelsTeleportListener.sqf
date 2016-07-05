#include "..\missionMacros.h"

createRebelsMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorEAST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_REBEL_SPAWN_listener = {
	debugLog("rebels teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "helpers\teleportPlayer.sqf";

	_pos call createRebelsMarker;

	closeDialog 0;
};

"REBEL_SPAWN" addPublicVariableEventHandler _REBEL_SPAWN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_REBEL_SPAWN_listener spawn {
		waitUntil {REBEL_SPAWN select 0 != 0};
		[0, REBEL_SPAWN] call _this;
	};
};
