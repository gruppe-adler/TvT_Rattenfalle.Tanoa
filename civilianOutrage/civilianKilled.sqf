
_victim = _this select 0;

_shooter = _victim getVariable ["ACE_medical_lastDamageSource",_victim];
diag_log format ["%1 killed by %2",_victim,_shooter];

reduceChanceToReveal = {
	_curChance = _this select 0;
	if (_curChance > 0.1) then {
		_curChance = _curChance - 0.1; // reduce ChanceToReveal 0.1
	};
	_curChance
};

increaseChanceToReveal = {
	_curChance = _this select 0;
	if (_curChance < 0.9) then {
		_curChance = _curChance + 0.1; // increase ChanceToReveal 0.1
	};
	_curChance
};


switch (str (side _shooter)) do {

	case "WEST": {
		CHANCE_TO_REVEAL_BLUFOR = [CHANCE_TO_REVEAL_BLUFOR] call reduceChanceToReveal;
		CHANCE_TO_REVEAL_OPFOR = [CHANCE_TO_REVEAL_OPFOR] call increaseChanceToReveal;

		diag_log format ["civilian %1 killed by US %2, reducing chance to %3",_victim,_shooter,CHANCE_TO_REVEAL_BLUFOR];
		publicVariable "CHANCE_TO_REVEAL_BLUFOR";
	};

	case "EAST": {
		CHANCE_TO_REVEAL_OPFOR = [CHANCE_TO_REVEAL_OPFOR] call reduceChanceToReveal;
		CHANCE_TO_REVEAL_BLUFOR = [CHANCE_TO_REVEAL_BLUFOR] call increaseChanceToReveal;

		diag_log format ["civilian %1 killed by rebels %2, reducing delay to %3",_victim,_shooter,CHANCE_TO_REVEAL_OPFOR];
		publicVariable "CHANCE_TO_REVEAL_OPFOR";
	};

	case "INDEPENDENT": {
		CHANCE_TO_REVEAL_OPFOR = [CHANCE_TO_REVEAL_OPFOR] call reduceChanceToReveal;
		CHANCE_TO_REVEAL_BLUFOR = [CHANCE_TO_REVEAL_BLUFOR] call increaseChanceToReveal;
		
		diag_log format ["civilian %1 killed by pilot %2, reducing delay to %3",_victim,_shooter,CHANCE_TO_REVEAL_OPFOR];
		publicVariable "CHANCE_TO_REVEAL_OPFOR";
	};

	case "CIVILIAN": {
		diag_log format ["civilian %1 killed by civilian %2",_victim,_shooter];
	};

	default { 	diag_log format ["str side shooter is %1, penalty not executed",str (side _shooter)]; };
};
