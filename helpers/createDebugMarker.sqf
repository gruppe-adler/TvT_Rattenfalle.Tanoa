if (isServer || !hasInterface) exitWith {};

_position_west = _this select 0;
_position_east = _this select 1;

_name_west = format ["%1",_position_west];

_western_marker = createMarker [_name_west,_position_west];
_name_west setMarkerShape "ICON";
_name_west setMarkerType "mil_dot";
_name_west setMarkerColor "ColorBlufor";


_name_east = format ["%1",_position_east];

_eastern_marker = createMarker [_name_east,_position_east];
_name_east setMarkerShape "ICON";
_name_east setMarkerType "mil_dot";
_name_east setMarkerColor "ColorOpfor";
