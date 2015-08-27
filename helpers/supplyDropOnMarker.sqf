/*
		
		This script was created by [EVO] Dan, with help from [EVO] Curry, with snippets from the BIS module, this script creates a parachute and a box, then drops it. When it contacts the ground it will run VAS.
			
		modified by nomisum to his needs

		*/
		
		spawnSupplyDrop = {
			_crateType = _this select 0;	//ammocrate class for blufor, feel free to change to whichever box you desire
			_pos = _this select 1;
	        _chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
	        
			
			hintSilent format ["%1",_pos];

			if (DEBUG) then {diag_log format ["%1",_pos]; };

			_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, "FLY"];
			
	        _chute setPos [_pos select 0, _pos select 1, 200];

			_crate = createVehicle [_crateType, position _chute, [], 0, "NONE"];
	        _crate attachTo [_chute, [0, 0, -2]];
	        waitUntil {position _crate select 2 < 0.5 || isNull _chute};
	        detach _crate;
	        _crate setPos [position _crate select 0, position _crate select 1, 0];
		};