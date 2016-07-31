grad_player_waving = false;

GRAD_fnc_waveNow = {
	grad_player_waving = true;
	player playMove "Acts_PercMstpSlowWrflDnon_handup2";
	sleep 4.5;
	grad_player_waving = false;
};

_waveAction =
[
	'Wave both arms','Wave both arms','',
	{[] spawn GRAD_fnc_waveNow;},
	{!grad_player_waving}
] call ace_interact_menu_fnc_createAction;
[
	player,
	1,
	["ACE_SelfActions"],
	_waveAction
] call ace_interact_menu_fnc_addActionToObject;
