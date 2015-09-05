selectSpawnMarkerRussian = {

	_return = "mrk_crash_site_01";
	_target = [CRASH_SITE select 0, CRASH_SITE select 1,0];
	
	while {
		(_target distance (getMarkerPos _return)) < westMinSpawnDistance || 
		(_target distance (getMarkerPos _return)) > westMaxSpawnDistance
	} do 
	{
		_return = spawn_sites call BIS_fnc_selectRandom;
		if (DEBUG) then { diag_log format ["checking marker %1",_return]; };
		sleep 0.1;
	};

	_return = getMarkerPos _return;
	if (DEBUG) then { diag_log format ["took marker %1",_return]; };

	_return 
};

selectSpawnMarkerMudschahedin = {

	_return = "mrk_crash_site_01";
	_target = [CRASH_SITE select 0, CRASH_SITE select 1,0];
	
	while {
		(_target distance (getMarkerPos _return)) < eastMinSpawnDistance || 
		(_target distance (getMarkerPos _return)) > eastMaxSpawnDistance ||
		((getMarkerPos _return) distance westHQSpawnPos) < 1000
		
	} do 
	{
		_return = spawn_sites call BIS_fnc_selectRandom;
		if (DEBUG) then { diag_log format ["checking marker %1",_return]; };
		sleep 0.1;
	};

	_return = getMarkerPos _return;
	if (DEBUG) then { diag_log format ["took marker %1",_return]; };

	_return 
};