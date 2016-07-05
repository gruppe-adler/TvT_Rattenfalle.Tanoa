
_victim = _this select 0;

_shooter = _victim getVariable ["ACE_medical_lastDamageSource",_victim];
diag_log format ["%1 killed by %2",_victim,_shooter];

reduceSightingDelay = {
	_curDelay = _this select 0;
	if (_curDelay > 60) then {
		_curDelay = _curDelay - 10; // reduce sighting delay 10secs
	};
	_curDelay
};

increaseSightingDelay = {
	_curDelay = _this select 0;
	_curDelay = _curDelay + 10; // increase sighting delay 10secs
	_curDelay
};


switch (side _shooter) do {

	case west: {
		SIGHTING_DELAY = [SIGHTING_DELAY] call reduceSightingDelay;

		diag_log format ["civilian %1 killed by US %2, increasing delay to %3",_victim,_shooter,SIGHTING_DELAY];
		publicVariable "SIGHTING_DELAY";
	};

	case east: {

		SIGHTING_DELAY = [SIGHTING_DELAY] call increaseSightingDelay;
		diag_log format ["civilian %1 killed by rebels %2, reducing delay to %3",_victim,_shooter,SIGHTING_DELAY];
		publicVariable "SIGHTING_DELAY";
	};

	case independent: {
		SIGHTING_DELAY = [SIGHTING_DELAY] call reduceSightingDelay;
		diag_log format ["civilian %1 killed by pilot %2, reducing delay to %3",_victim,_shooter,SIGHTING_DELAY];
		publicVariable "SIGHTING_DELAY";
	};

	case civilian: {
		diag_log format ["civilian %1 killed by civilian %2",_victim,_shooter];
	};

	default {};
};
