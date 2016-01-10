/*
by nomisum for tvt rattrap @ gruppe adler

should only be called from SERVER!

*/

if (!isServer) exitWith {}; // just to make sure!

_crashSitePos = _this select 0; // Helicopter crashSite Position
_maxDistance = _this select 1; // if Pilot is < maxDistance from any location, he will be spotted
_publicVariable = _this select 2; // publicVariable for this Pilot
_crashPilots = [];


{
   if ((side _x) == independent) then
   {
      _crashPilots = _crashPilots + _x;
   };
} forEach allUnits;


/*

 SIGHTING_DELAY = e.g. 300, should globally balance friendly / civilian casualties. 
 gives penalty to the faction killing innocents 
 (russians kill civs = faster updates for taliban spotter, talis kill civs = slower updates for taliban spotter)

*/

setPilotPosition = {
	_prev = _this select 0;
	_pv = _this select 1;
	if (_prev != _pv) then {
		publicVariable _pv;
	};
};

while {true} do {

	{
		if (alive _x && {_crashSitePos distance _x > _maxDistance}) then {
			_nearbyLocations = nearestLocations [getPos _x, 
			[
				"NameCity",
				"NameCityCapital",
				"NameMarine",
				"NameVillage",
				"NameLocal"
			],300 + (random 200)];

			if (count _nearbyLocations > 0) then {
				[_nearbyLocations select 0, _publicVariable] call setPilotPosition;
			};
		};
		sleep (random 30);
	} forEach _crashPilots;
	sleep SIGHTING_DELAY;
};