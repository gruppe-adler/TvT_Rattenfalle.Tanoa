/*
		
		This script was created by [EVO] Dan, with help from [EVO] Curry, with snippets from the BIS module, this script creates a parachute and a box, then drops it. When it contacts the ground it will run VAS.
			
		modified by nomisum to his needs

		*/
		
		spawnSupplyDrop = {
			_vehicleType = _this select 0;	//ammocrate class for blufor, feel free to change to whichever box you desire
			_pos = _this select 1;
	        _chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively

	        _init = _this select 2;

	        

	        if (DEBUG) then { diag_log format ["Init Vehicle Spawn is %1",_init];};

	        _origWind = wind;
	        _origWindForce = windStr;

	        setWind [0, 0, true];
	        0 setWindForce 0;

			if (DEBUG) then {diag_log format ["%1",_pos]; };

			_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, "FLY"];
			
	        _chute setPos [_pos select 0, _pos select 1, 50];
	        _chute setVelocity [0,0,0];

	        [_chute] spawn {
	        	_chuty = _this select 0;

	        	while {!isNull _chuty} do {
	        		_chuty setVelocity [0,0,velocity _chuty select 2];
	        		sleep 0.1;
	        	};
	    	};

	       
			_vehicle = createVehicle [_vehicleType, position _chute, [], 0, "NONE"];

			// adjust vehicle (remove lamp covers and stuff)
			if (count _init > 0) then {
	     		[_vehicle,nil, _init] call BIS_fnc_initVehicle;
	    	};

	    	if (_vehicleType == "RHS_Mi24Vt_vvs") then {
	    		_vehicle setObjectTextureGlobal [0, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_001_camo2_co.paa"];
				_vehicle setObjectTextureGlobal [1, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_002_camo2_co.paa"];
				_vehicle setObjectTextureGlobal [2, "rhsafrf\addons\rhs_a2port_air\Mi17\data\camo\mi8_det_g_camo1_co.paa"];
	    	};
			

	        _vehicle attachTo [_chute, [0, 0, -1.5]];
	        waitUntil {position _vehicle select 2 < 0.7 || isNull _chute};
	        detach _vehicle;
	        _vehicle setPos [position _vehicle select 0, position _vehicle select 1, 0];

	        0 setWindForce _origWindForce;
	        setWind [_origWind select 0, _origWind select 1, true];
		};