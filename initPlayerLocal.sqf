//define the paths to your loadout init for each side (e.g. bluforLoadoutPath = "loadouts\bluforInit.sqf"; if you use one init for all sides, enter the same value for each variable)
//define params for loadout init for each side (e.g. "[roleDescription player]"; if you use one init for all sides, enter the same value for each variable)
//leave empty if you are not using custom loadouts
bluforLoadoutPath = "";
bluforLoadoutParams = "[]";
opforLoadoutPath = "";
opforLoadoutParams = "[]";
indepLoadoutPath = "";
indepLoadoutParams = "[]";



if (isMultiplayer) then {
	joinTime = serverTime;
} else {
	joinTime = time;
};

// exclude independents from wave respawn
if (side player != independent) then {
	[] execVM "initWaveRespawn.sqf";
} else {
	setplayerrespawntime 999999;
};


_loadout = player getVariable ["GRAD_loadout","none"];
if (_loadout != "none") then {
		_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
		diag_log format ["calling loadout %1",_stringLoadout];
		player setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
};


// _codeLoadout = compile _stringLoadout;
// call compile ("setUnitLoadout " + [_codeLoadout,true]);
//call compile format ["%2 call setUnitLoadout [GRAD_getUnitLoadout_%1,true]", _stringLoadout, player];
// player setUnitLoadout [_codeLoadout, true];

0 = execVM "player\animations\addWavingInteraction.sqf";
mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "loadouts\fnc_strToLoadout.sqf";

// for local execution of interrogation actions
GRAD_fnc_addQuestioningAction = {
	_id = _this addAction ["<t color='#F24F0F'>Verhören</t>",{
		[_this select 0, _this select 1] remoteExec ["GRAD_fnc_questionCiv", [2,0] select (isMultiplayer && isDedicated), false];
	[player] call ace_weaponselect_fnc_putWeaponAway;},
	0, 100, true, true, '',
	"player distance _target < 3 && !(_target getVariable ['civ_occupied',false]) && alive _target"];
	_this setUserActionText [_id, "<t color='#F24F0F'>Verhören</t>"];
};

GRAD_fnc_showQuestioningAnswer = {
		_pos = _this select 0;
		_answer = _this select 1;
		_markerPositionArray = _this select 2;

		if (count _markerPositionArray > 0) then {
				0 = [(_markerPositionArray select 0), 250] execVM "player\createPilotMarker.sqf";
		};

		// dont display if too far away
		if (position player distance _pos > 8) exitWith {};

		cutText [format ["%1",_answer],"PLAIN"];

};
