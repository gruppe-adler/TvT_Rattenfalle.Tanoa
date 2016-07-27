
{
    _name = format ["pilotmarker_%1",[(getPosATL _x select 0),(getPosATL _x select 1)]];
    _vipmark = createMarkerLocal [_name,[(getPosATL _x select 0),(getPosATL _x select 1)]];
    _vipmark setMarkerShapeLocal "ICON";
    _vipmark setMarkerTypeLocal "mil_box";
    _vipmark setMarkerColorLocal "ColorBlufor";
    [_vipmark, _x] spawn {
        _mrk = (_this select 0);
        _unit = (_this select 1);
        _currentlyOn = false;
        while {alive _unit} do {
            _mrk setMarkerPosLocal (getPos _unit);
            sleep 5;
            if (vehicle _unit == _unit) then {
                if (_currentlyOn) then { hintsilent format ["Pilot exited Vehicle"];};
                _mrk setMarkerAlphaLocal 0;
                _currentlyOn = false;
            } else {
                if (!_currentlyOn) then { hintsilent format ["Pilot entered Vehicle"];};
                _mrk setMarkerAlphaLocal 1;
                _currentlyOn = true;

            };
        };
    };
} forEach CRASH_PILOTS;
