/*
spf_createRelPos.sqf

created by slimSpencer / v0.1
-
creates, for given unitTypes, relative positios (2D) around center (0, 0) (for use with BIS_fnc_spawnGroup, e.g.).
Size of each given unit will be considered in a simplified way (using parent-class). 

Creates a circle around center and tries to "place" actual unit there in fixed degree-steps (starting from North),
considerung minimun distance to every other already created unit-position. If not successful, circle-radius will be increased
in a slightly exponential way and search starts again from North.
If successful, circle-radius will be reset and next unit-position will be searched.

Please feel free to tweak search-parameters to your needs.
-
Returns an array with one or two elements:
(1) nested array with relative unit positons (2D)
(2 - optional) total free space needed to create the whole group (number - radius from center).
 (use it, e.g., with findEmptyPosition beforce calling your spawn-script.)
 -
Parameters:
_this select 0 (array) - array with unit/vehicle-types as string, e.g. ["USMC_Soldier", "USMC_Soldier", "M1A1", ...]
_this select 1 (bool) - (optional) if true, necessary minimum space for creating all given units will also be returned
_this select 2 (position) - (optional) if given, output of this function will be drawn at given position

todo: param-validation

*/

spf_createRelPos = {

	//search-params
	_dirStep = 20; // (20 = 18 steps per circle (360 / 20)
	_radAroundCenterIncMul = 1.35; //multiplier to increase circle after every non-successful pass - if too small, we will have MANY iterations
	_radAroundCenterStart = 3; //radius of first circle
	
	//init vars...
	_retFreeSpace = false;
	_greatestDistCenter = 0;
	_drawOutput = false;
	_drawCenter = [];
	_circles = [];
	_radAroundCenter = 0;
	
	_testPos = [];	
	_center = [0, 0];
	_posCol = []; //position-collector [x, y, <minDist from actual point to all other points>, direction]	
	_return = [];	
	
	//read function-params
	_unitArr = _this select 0;

	if ((count _this) > 1) then	{
		_retFreeSpace = _this select 1;		
	};
		
	if ((count _this) > 2) then	{
		_drawOutput = true;
		_drawCenter = _this select 2;
		_circles = [];
	};
		
	//go thru all units...
	{			
		//get minimum distance to other units for actual unit
		_class = getText(configFile >> "CfgVehicles" >> _x >> "simulation");
		//better: use true 3d-model-size... but don't know any method to read before model is spawned on map
				
		_dist = 2.5; //ok for men - for veh, we need larger dist...
		switch (_class) do
		{
			case "tank": {_dist = 12;};
			case "car": {_dist = 7;};			
			case "airplane": {_dist = 50;};
			case "helicopter": {_dist = 50;};
			case "ship": {_dist = 20;};
		};
		
		//reset radius & _posFound
		_radAroundCenter = _radAroundCenterStart;
		_posFound = false;

		//main search-loop for actual unit
		while {!_posFound} do {	
						
			//reset dir
			_dir = 0;			
						
			//circle-loop
			while {(!_posFound) and (_dir <= 360)} do {
			
				//if _drawOutput=true, collect actual circle for later marker creation
				if (_drawOutput) then {
					if (!(_radAroundCenter in _circles)) then {_circles = _circles + [_radAroundCenter];};
				};	
			
				//test _testPos against all created positions by now
				_testPos = [_center, _radAroundCenter, _dir] call BIS_fnc_relPos;				
								
				if (count _posCol == 0) then
				{
					//pos for first unit is allways ok
					_posFound = true;	
				}
				else
				{				 
					//set true first and then, if nothing found, break out & set back to false
					_posFound = true;					
					{					
						//step to next direction for given circle if no valid pos found
						_xCoord = [_x select 0, _x select 1];
						_xDist = _x select 2;
						if ((_xCoord distance _testPos) < ((_xDist / 2) + (_dist / 2)))	exitWith {
							//set _posFound back to false if no valid pos found
							_posFound = false;	
							_dir = _dir + _dirStep				
						};						
					} forEach _posCol;																
				};				
			};
			
			if (_posFound) then
			{
				_posCol = _posCol + [[_testPos select 0, _testPos select 1, _dist, _dir]];
			}
			else
			{				
				//increase circle-radius if no valid pos found on actual circle
				_radAroundCenter = _radAroundCenter * _radAroundCenterIncMul;
			};		
		};		
	} forEach _unitArr;
	
	
	//write rel. pos. in _return
	_tmpArr = [];
	{
		_tmpArr = _tmpArr + [[_x select 0, _x select 1]];
	} forEach _posCol;
	_return = _return + [_tmpArr];
	
	//if necessary free space should be returned, calc. & add it to _return
	if (_retFreeSpace) then {
	
		_greatestDistCenter = 0;
		{
			_oldPos = [_x select 0, _x select 1];
			_dist = (_x select 2) / 2;
			_dir = _x select 3;
			_testPos = [_oldPos, _dist, _dir] call BIS_fnc_relPos;
			
			_distCenter = (_testPos distance _center);
			if (_distCenter > _greatestDistCenter) then {_greatestDistCenter = _distCenter};		
		} forEach _posCol;
		_return = _return + [_greatestDistCenter];
	};

	//if test-draw-position was given, create markers...
	if (_drawOutput) then {
		
		//circles...
		{
			_tmp = createMarker [str((random 1) + (random 1)), _drawCenter];
			_rad = _x;
			_tmp setMarkerSize [_rad, _rad];
			_tmp setMarkerShape "ELLIPSE";
			_tmp setMarkerBrush "Border";
			_tmp setMarkerColor "ColorBlue";			
		} forEach _circles;	
		
		//unit-positions		
		{
			_newPos = [(_drawCenter select 0) + (_x select 0), (_drawCenter select 1) + (_x select 1)];
			_tmp = createMarker [str((random 1) + (random 1)), _newPos];
			_rad = (_x select 2) / 2;
			_tmp setMarkerSize [_rad, _rad];
			_tmp setMarkerShape "ELLIPSE";
			_tmp setMarkerBrush "Border";
			_tmp setMarkerColor "ColorRed";	

			_tmp = createMarker [str((random 1) + (random 1)), _newPos];
			_rad = 0.5;
			_tmp setMarkerSize [_rad, _rad];
			_tmp setMarkerShape "ELLIPSE";
			_tmp setMarkerBrush "Solid";
			_tmp setMarkerColor "ColorRed";				
		} forEach _posCol;

		//if calc. -> nec. free-space-area
		if (_retFreeSpace) then {
			_tmp = createMarker [str((random 1) * (random 1)), _drawCenter];
			_rad = _greatestDistCenter;
			_tmp setMarkerSize [_rad, _rad];
			_tmp setMarkerShape "ELLIPSE";
			_tmp setMarkerBrush "Border";
			_tmp setMarkerColor "ColorGreen";			
		};		
	};
	
	_return
};