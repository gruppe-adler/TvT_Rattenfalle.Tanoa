_supplies = _this select 0;
_money = _this select 1;

fnc_getNextIDC = {
	_idc = _this select 0;
	_idc = _idc + 1;
	_idc
};

fnc_createToolbar = {

	disableSerialization;

	_tgui = _this select 0;
	_tmoney = _this select 1;

	 _credits_x = safeZoneX + (safeZoneW/10);
	 _exitbtn_x =  safeZoneX + safeZoneW - (safeZoneW/10);
	 _credits_width = (safeZoneX + safeZoneW)/8;
	 _exit_width = (safeZoneX + safeZoneW)/10;

	 _credits = [2001, _tgui, _credits_x, _credits_width, _tmoney] spawn fnc_createToolbarCredits;
	 _headline = [2002, _tgui, "Buy vehicles"] spawn fnc_createToolbarHeadline;
	 _exitbtn = [2003, _tgui, _exitbtn_x, _exit_width,"Close"] spawn fnc_createToolbarExitButton;

};

fnc_refreshGUI = {
	if (!dialog) exitWith {};
	closeDialog 0;
	_supplies = _this select 0;
	diag_log format ["refreshing gui with %1",_this select 0];
	_gui = [_supplies] call fnc_createEntries;
	_toolbar = [_gui,_this select 1] spawn fnc_createToolbar;
};



_gui = [_supplies] call fnc_createEntries;
_toolbar = [_gui,_money] spawn fnc_createToolbar;
