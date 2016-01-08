
_victim = _this select 0;
_shooter = _this select 1;

diag_log format ["%1 killed by %2",_victim,_shooter];

switch (side _shooter) do {

	case west: {
		diag_log format ["civilian %1 killed by mudschahedin %2",_victim,_shooter];
	};

	case east: {
		diag_log format ["civilian %1 killed by russians %2",_victim,_shooter];
	};

	case independent: {
		diag_log format ["civilian %1 killed by pilot %2",_victim,_shooter];
	};

	case civilian: {
		diag_log format ["civilian %1 killed by civilian %2",_victim,_shooter];
	};

	default {};
};



