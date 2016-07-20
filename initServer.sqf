[] execVM "server\civPointedAtListener.sqf";
[] execVM "server\civQuestioning.sqf";
[] execVM "initWaveRespawn.sqf";
mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "loadouts\fnc_strToLoadout.sqf";

// description.ext parameters
_timeOfDay = "TimeOfDay" call BIS_fnc_getParamValue;
_weatherSetting = "WeatherSetting" call BIS_fnc_getParamValue;



setCustomWeather = {
	skipTime -24;
	0 setOvercast (_this select 0);
	0 setRain 0;
	if ((_this select 0) > 0.5) then {
		_fogDensity = 0.2;
		_fogFalloff = 0;
		0 setFog [_fogDensity, _fogFalloff, 0];
	};
	if (_this select 1 && (_this select 0) > 0.7) then {
		0 setRain 1;
		_fogDensity = 0.4;
		_fogFalloff = 0;
		0 setFog [_fogDensity, _fogFalloff, 1];
	};

	forceWeatherChange;
	skipTime 24;
};


// allow view distance to be up to 10k

// set to full moon date
setDate [2015, 2, 5, _timeOfDay, 1]; // set to 5:00 for perfect full moon

switch (_weatherSetting) do {
    case 0: {[0,false] call setCustomWeather;};
    case 1: {[0.65,false] call setCustomWeather;};
    case 2: {[1,true] call setCustomWeather;};
    case 3: {[random 1,true] call setCustomWeather;};
    default {[0,false] call setCustomWeather;};
};
