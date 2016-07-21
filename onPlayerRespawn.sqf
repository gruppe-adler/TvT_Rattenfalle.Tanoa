waitUntil {!isNil "originalSide"};

_loadout = player getVariable ["GRAD_loadout","none"];
if (_loadout != "none") then {
		_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
		diag_log format ["calling loadout %1",_stringLoadout];
		player setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
};

if (player getVariable ["GRAD_canBuy",false]) then {
		0 = execVM "player\animations\addBuyInteraction.sqf";
};

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};

//notify server
[profileName, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
