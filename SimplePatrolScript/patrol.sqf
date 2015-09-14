_unit = _this select 0;
_marker = _this select 1;
_speed = _this select 2;
_behaviour = _this select 3;
_formation = _this select 4;
_debug = _this select 5;
_type = "move";
_pos = getMarkerPos _marker;
_marker setMarkerAlpha 0; 
_sizemarker = getMarkerSize _marker;
_sizeX = _sizemarker select 0;
_sizeY = _sizemarker select 1;
_size = (_sizeX + _sizeY)/2;
_range = (_size)/2;
_grp = group _unit;


sleep 0.1;

/*
if (_debug == 1) then {
hint "Patrol script initialized!";
};*/



deleteWaypoint [_grp,0];



_wp1 = _grp addWaypoint [_pos, _size,0];
_wp1 setWaypointType _type;
_wp1 setWaypointSpeed _speed;
_wp1 setWaypointBehaviour _behaviour;
_wp1 setWaypointFormation _formation;
_wp1 setWaypointTimeout [0,5,60];
_wp1pos = getWPPos _wp1;

_wp2 = _grp addWaypoint [_pos, _size,1];
_wp2 setWaypointType _type;
_wp2 setWaypointSpeed _speed;
_wp2 setWaypointBehaviour _behaviour;
_wp2 setWaypointFormation _formation;
_wp2 setWaypointTimeout [0,5,60];
_wp2pos = getWPPos _wp2;


//distance 1-2
_distance1 = _wp1pos distance _wp2pos;
_counter = 0;
	
while {_distance1 < _range} do 	{

_wp2 setWaypointPosition [_pos, _size]; 
_wp2pos = getWPPos _wp2;
_distance1 = _wp1pos distance _wp2pos;
_range = _range -1;

};






_wp3 = _grp addWaypoint [_pos, _size,2];
_wp3 setWaypointType _type;
_wp3 setWaypointSpeed _speed;
_wp3 setWaypointBehaviour _behaviour;
_wp3 setWaypointFormation _formation;
_wp3 setWaypointTimeout [0,5,60];
_wp3pos = getWPPos _wp3;


//distance 1-2-3
_distance1 = _wp1pos distance _wp3pos;
_distance2 = _wp2pos distance _wp3pos;
	
while {_distance1 < _range || _distance2 < _range} do 	{

_wp3 setWaypointPosition [_pos, _size]; 
_wp3pos = getWPPos _wp3;
_distance1 = _wp1pos distance _wp3pos;
_distance2 = _wp2pos distance _wp3pos;
_range = _range -1;

};

_wp4 = _grp addWaypoint [_pos, _size,3];
_wp4 setWaypointType _type;
_wp4 setWaypointSpeed _speed;
_wp4 setWaypointBehaviour _behaviour;
_wp4 setWaypointFormation _formation;
_wp4 setWaypointTimeout [0,5,60];
_wp4pos = getWPPos _wp4;


//distance 1-2-3-4
_distance1 = _wp1pos distance _wp4pos;
_distance2 = _wp2pos distance _wp4pos;
_distance3 = _wp3pos distance _wp4pos;
	
while {_distance1 < _range || _distance2 < _range || _distance3 < _range} do 	{

_wp4 setWaypointPosition [_pos, _size]; 
_wp4pos = getWPPos _wp4;
_distance1 = _wp1pos distance _wp4pos;
_distance2 = _wp2pos distance _wp4pos;
_distance3 = _wp3pos distance _wp4pos;
_range = _range -1;

};


_wp5 = _grp addWaypoint [_wp1pos, 0,4];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointSpeed _speed;
_wp5 setWaypointBehaviour _behaviour;
_wp5 setWaypointFormation _formation;
_wp5 setWaypointTimeout [0,5,60];



				




