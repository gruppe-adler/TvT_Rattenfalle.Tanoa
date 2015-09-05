selectSpawnMarkerRussian = {

	_spawnList = getMarkerPos (spawn_sites_west call BIS_fnc_selectRandom);
	_crashPos = [CRASH_SITE select 0, CRASH_SITE select 1,0];
	
	while {true} do 
	{
		_spawnList = getMarkerPos (spawn_sites_west call BIS_fnc_selectRandom);
		
		if ((_spawnList distance _crashPos) > westMinSpawnDistance && 
			(_spawnList distance _crashPos) < westMaxSpawnDistance) exitWith {
				if (DEBUG) then { diag_log format ["checking marker: %1,%2,%3",_spawnList distance _crashPos,_spawnList distance _crashPos]; };
		};
		sleep 0.1;
	};

	_spawnList 
};

selectSpawnMarkerMudschahedin = {

	_spawnList = getMarkerPos (spawn_sites_east call BIS_fnc_selectRandom);
	_crashPos = [CRASH_SITE select 0, CRASH_SITE select 1,0];

	while {true} do 
	{
		_spawnList = getMarkerPos (spawn_sites_east call BIS_fnc_selectRandom);

		if ((_spawnList distance _crashPos) > eastMinSpawnDistance && 
			(_spawnList distance _crashPos) < eastMaxSpawnDistance &&
			(_spawnList distance westHQSpawnPos) > eastMinSpawnDistance) exitWith {
				if (DEBUG) then { diag_log format ["checking marker: %1,%2,%3",_spawnList distance _crashPos,_spawnList distance _crashPos,_spawnList distance westHQSpawnPos]; };
		};
		sleep 0.1;
	};

	_spawnList 
};