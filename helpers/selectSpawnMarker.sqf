selectSpawnMarkerRussian = {

	_possibleSpawn = getMarkerPos (spawn_sites_west call BIS_fnc_selectRandom);
	_crashPos = [CRASH_SITE select 0, CRASH_SITE select 1,0];
	
	while {true} do 
	{
		_possibleSpawn = getMarkerPos (spawn_sites_west call BIS_fnc_selectRandom);

		if ((_possibleSpawn distance _crashPos) > westMinSpawnDistance && 
			(_possibleSpawn distance _crashPos) < westMaxSpawnDistance) exitWith {
				if (DEBUG) then { diag_log format ["checking marker: %1,%2,%3",_possibleSpawn distance _crashPos,_possibleSpawn distance _crashPos]; };
					_possibleSpawn 
		};


		sleep 0.1;
	};
 
};

selectSpawnMarkerMudschahedin = {
	_westHQSpawnPos = _this select 0;
	_possibleSpawn = getMarkerPos (spawn_sites_east call BIS_fnc_selectRandom);
	_crashPos = [CRASH_SITE select 0, CRASH_SITE select 1,0];

	while {true} do 
	{
		_possibleSpawn = getMarkerPos (spawn_sites_east call BIS_fnc_selectRandom);

		if ((_possibleSpawn distance _crashPos) > eastMinSpawnDistance && 
			(_possibleSpawn distance _crashPos) < eastMaxSpawnDistance &&
			(_possibleSpawn distance _westHQSpawnPos) > eastMinSpawnDistance) exitWith {
				if (DEBUG) then { diag_log format ["checking marker: %1,%2,%3",_possibleSpawn distance _crashPos,_possibleSpawn distance _crashPos,_possibleSpawn distance _westHQSpawnPos]; };
					_possibleSpawn 
		};
		sleep 0.1;
	};
 
};