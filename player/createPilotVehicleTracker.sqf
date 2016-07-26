
{
    _name = format ["pilotmarker_%1",[(getPosATL _x select 0),(getPosATL _x select 1)];
    _vipmark = createMarkerLocal [_name,[(getPosATL _x select 0),(getPosATL _x select 1)];
    _vipmark setMarkerShapeLocal "ICON";
    _vipmark setMarkerTypeLocal "mil_box";
    _vipmark setMarkerColorLocal "ColorBlufor";
    _vipmark spawn { while {alive _x} do {
        _this setMarkerPosLocal (getPos _x);
        sleep 5;
        if (vehicle _x == _x) then {_this setMarkerAlphaLocal 0;} else {_this setMarkerAlphaLocal 1;};
        };
    };
} forEach CRASH_PILOTS;
