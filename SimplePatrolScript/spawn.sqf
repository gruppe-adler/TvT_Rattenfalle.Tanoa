_amount = _this select 0;
_side = _this select 1;
_marker = _this select 2;
_speed = _this select 3;
_debug = _this select 4;
_type = "move";
_count = 0;
_sizemarker = getMarkerSize _marker;
_sizeX = _sizemarker select 0;
_sizeY = _sizemarker select 1;
_size = (_sizeX + _sizeY)/4;


sleep 0.1;


createCenter _side;

/*
if (_debug == 1) then {
hint "Civilians initialized!";
};*/


while {_count < _amount} do {

_grp = createGroup _side;
_unit = [] call unit_fnc;
_this = _grp createUnit [_unit,markerpos _marker,[],_size, "NONE"];
_this setskill ["GENERAL",0];
_this setVariable ["fleeing", "false"];
_this disableAI "FSM";

_this addEventHandler ["FiredNear", {

	if ((_this select 0) getVariable "fleeing" == "true") exitWith {};

	if (count (weapons (_this select 0)) == 0) then {
	 	[_this select 0, _this select 1] spawn {

	 	_thisUnit = _this select 0;		 	
	 	_thisShooter = _this select 1;

	 	deleteWaypoint [group _thisUnit, all];

	 	hintSilent format ["%1",_thisShooter];

		 	sleep ((random 0.5) + 0.25);

		 	_relDir = [_thisUnit,_thisShooter] call BIS_fnc_relativeDirTo;
			_bla = ((nearestBuilding _thisUnit) call BIS_fnc_buildingPositions);

		 	_rand = random 2;
		 	if (_rand < 1) exitWith {
		 		
				//hintSilent format ["%1",_bla select 0];
				if (count _bla > 1) then {
					_thisUnit setBehaviour "SAFE";
					_pos = _bla select 1;
					_thisUnit doMove _pos;
					_thisUnit setSpeedMode "FULL";
					_thisUnit forceSpeed 25;
					_thisUnit playMove "AmovPercMevaSnonWnonDf";				
					_thisUnit setVariable ["fleeing", "true"];
					waitUntil {
					  _thisUnit distance _pos < 2
					};
					_thisUnit setVariable ["fleeing", "false"];
					_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
				 	_thisUnit stop true;
				 	_thisUnit removeEventHandler ["firedNear", 0];
				};
				
				if (count _bla < 1) then {
					_pos = [_thisUnit,[300,800],_relDir-180] call SHK_pos;
					_thisUnit doMove _pos;
					_thisUnit setSpeedMode "FULL";
					_thisUnit forceSpeed 20;
					_thisUnit playMove "AmovPercMevaSnonWnonDf";				
					_thisUnit setVariable ["fleeing", "true"];
					waitUntil {
					  _thisUnit distance _pos < 2
					};
					_thisUnit setVariable ["fleeing", "false"];
					0 = [_this, "CityMarker","limited","","",0] execVM "SimplePatrolScript\patrol.sqf";
				};
			};
			/*
		 	if (_rand > 1 && _rand < 2) exitWith {
		 		_thisUnit setBehaviour "SAFE";
		 		_thisUnit setSpeedMode "FULL";
		 		_thisUnit setVariable ["fleeing", "true"];
			 	_thisUnit playMoveNow 'AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon';
			 	_thisUnit stop true;
			 	_thisUnit removeEventHandler ["firedNear", 0];
		 	};*/
		 	if (_rand > 1) exitWith
		 	{
		 		_thisUnit setBehaviour "SAFE";
		 		_thisUnit setSpeedMode "FULL";
		 		_thisUnit setVariable ["fleeing", "true"];

		 		_newPos = [((getPos _thisShooter) select 0)-(random 10)*sin(_relDir - 180),((getPos _thisShooter) select 1)-(random 10)*cos(_relDir - 180),0];
		 		_thisUnit doMove _newPos;
		 		_thisUnit playMove "AmovPercMevaSnonWnonDf";
					sleep 0.6;
		 		waitUntil {
		 		  _thisUnit distance _newPos < 2 		   
		 		};
			 	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
			 	_thisUnit stop true;
			 	_thisUnit removeEventHandler ["firedNear", 0];
		 	};
			


			
		 	/*
			_this playMoveNow "AinvPknlMstpSnonWnonDnon_healed_2";
			sleep 5.882;
			doStop _this;
			_movePos = [_this,[500,1000],random 360] call SHK_pos;
			_this doMove _movePos;
			_this forceSpeed 6;
			*/
		};
	} else {
		(_this select 0) spawn {
			_this setBehaviour "AWARE";
		};
	};

}];

0 = [_this, _marker,_speed,"","",_debug] execVM "SimplePatrolScript\patrol.sqf";
_count = _count + 1; 

//_random = random 10;
sleep 0.1;


};

if (_debug == 1) then {
hintSilent format ["%1 Units created", _amount];
};