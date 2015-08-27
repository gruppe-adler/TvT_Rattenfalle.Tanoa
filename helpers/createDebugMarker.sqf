_position = _this select 0;

_name = format ["mrk_%1",_position];

_inner_marker = createMarker [_name,_position];
_name setMarkerShape "ICON";
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorRed";
