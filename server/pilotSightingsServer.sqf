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
				LAST_PILOTS_POSITION = [_text, getPos _x, getPos _x distance getPos (_nearbyLocations select 0)];
				publicVariable "LAST_PILOTS_POSITION";
			};
			
		};
		sleep (random 30);
	} forEach _crashPilots;
	sleep SIGHTING_DELAY;
};
