if (isMultiplayer) exitWith {};

_pos = _this select 0;
_text = _this select 1;
_local_marker = createMarker [format["%1",_pos],_pos];
_local_marker setMarkerType "hd_objective";
_local_marker setMarkerColor "ColorGreen";
_local_marker setMarkerText _text;
