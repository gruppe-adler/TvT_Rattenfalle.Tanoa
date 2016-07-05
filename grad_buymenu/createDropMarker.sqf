_handler = _this select 0;

_coordsX = _handler select 3;
_coordsY = _handler select 4;

diag_log format ["creating marker.."];

_markerstr = createMarker ["markername", [_coordsX,_coordsY]];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "Parachute";

sleep 2;

closeDialog 0;
