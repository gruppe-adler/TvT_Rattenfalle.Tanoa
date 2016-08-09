waitUntil {!isNil "originalSide"};

_loadout = player getVariable ["GRAD_loadout","none"];
if (_loadout != "none") then {
		_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
		diag_log format ["calling loadout %1",_stringLoadout];
		player setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
};
[player, false] call TFAR_fnc_forceSpectator;
/*
if (player getVariable ["GRAD_canBuy",false]) then {
		0 = execVM "player\animations\addBuyInteraction.sqf";
};
*/

//make sure this is not respawn on first join
if (serverTime-joinTime < 30) exitWith {diag_log "Player just joined, not executing mcd_fnc_handleRespawned"};
[profileName, originalSide, player] remoteExec ["mcd_fnc_handleRespawned",2,false];
