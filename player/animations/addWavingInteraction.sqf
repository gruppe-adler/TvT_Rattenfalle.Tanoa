grad_player_waving = false;

GRAD_fnc_waveLoop = {
	grad_player_waving = true;
	while {grad_player_waving} do {
		[player] call ace_weaponselect_fnc_putWeaponAway;
		player playMove "Acts_PercMstpSlowWrflDnon_handup2";
		sleep 4.5;
	};
	player playMoveNow "";
};

_waveAction =
[
	'Wave both arms','Wave both arms','',
	{[] spawn GRAD_fnc_waveLoop;},
	{!grad_player_waving}
] call ace_interact_menu_fnc_createAction;
[
	player,
	1,
	["ACE_SelfActions"],
	_waveAction
] call ace_interact_menu_fnc_addActionToObject;

_stopWaveAction =
[
	'Stop waving','Stop waving','',
	{grad_player_waving = false;},
	{grad_player_waving}
] call ace_interact_menu_fnc_createAction;
[
	player,
	1,
	["ACE_SelfActions"],
	_stopWaveAction
] call ace_interact_menu_fnc_addActionToObject;

diag_log "add waving interaction";
