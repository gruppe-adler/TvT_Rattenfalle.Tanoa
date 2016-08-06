_pos = _this select 0;
_trackingPrecision = _this select 1;

_pos = CURRENT_PILOTS_POSITION select 1;
_trackingPrecision = CURRENT_PILOTS_POSITION select 2;

randomize_coord = {
	_this + random(trackingPrecision * 2) - trackingPrecision
};

randomize_pos =
{
	private ["_randomizedPos", "_trueX", "_trueY"];
	_trueX = _this select 0;
	_trueY = _this select 1;
	_randomizedPos = [
	_trueX call randomize_coord,
	_trueY call randomize_coord,
	_this select 2
	];
	_randomizedPos
};


_markerPos = _pos;
// _markerPos = _pos call randomize_pos;

_marker = createMarkerLocal [format ["pilotmarker_%1", _markerPos],_markerPos];
_marker setMarkerTypeLocal "mil_unknown";
_marker setMarkerColorLocal "ColorBlufor";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [_trackingPrecision, _trackingPrecision];
_marker setMarkerBrushLocal "Solid";
_marker setMarkerAlphaLocal 0.5;

_marker2 = createMarkerLocal [format["pilotmarker_icon_%1",_markerPos],_markerPos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerColorLocal "ColorBlufor";
