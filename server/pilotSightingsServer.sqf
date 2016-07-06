/*
by nomisum for tvt rattrap @ gruppe adler

should only be called from SERVER!

*/

if (!isServer) exitWith {}; // just to make sure!

_crashSitePos = _this select 0; // Helicopter crashSite Position
_maxDistance = _this select 1; // if Pilot is < maxDistance from any location, he will be spotted
_publicVariable = _this select 2; // publicVariable for this Pilot
_crashPilots = [];

waitUntil {time > 4};
{
   if ((side _x) == independent) then
   {
      _crashPilots = _crashPilots + [_x];
   };
} forEach allUnits;


/*

 SIGHTING_DELAY = e.g. 300, should globally balance friendly / civilian casualties.
 gives penalty to the faction killing innocents
 (russians kill civs = faster updates for taliban spotter, talis kill civs = slower updates for taliban spotter)

*/


while {true} do {
  for "_i" from 0 to 12 do {
	{
		if (alive _x) then {
			_nearbyLocations = (nearestLocations [getPos _x,
   			[
		    "NameCity",
		    "NameCityCapital",
		    "NameMarine",
		    "NameVillage",
		    "NameLocal"
		   ],_maxDistance]);

			if (count _nearbyLocations > 0) then {
				_text = text (_nearbyLocations select 0);
        _pos = locationPosition (_nearbyLocations select 0);
        _markerSize = ((getPos _x) distance _pos);

        CURRENT_PILOTS_POSITION = [_text, _pos, _markerSize];
				publicVariable "CURRENT_PILOTS_POSITION";
			};

		};
		sleep (random 10);
	} forEach _crashPilots;
	sleep 10;
  };
  LAST_PILOTS_POSITION = [_text, _pos, _markerSize];
  publicVariable "LAST_PILOTS_POSITION";
};
