/*
by nomisum for tvt rattrap @ gruppe adler

should only be called from CLIENT!

*/

_markerName = (str LAST_PILOTS_POSITION) + "_marker";
_nil = createMarkerLocal [_markerName, [0, 0, 0]];
_markerName setMarkerShapeLocal "ELLIPSE";
_markerName setMarkerTypeLocal "mil_unknown";
_markerName setMarkerColorLocal "ColorOpfor";
_markerName setMarkerAlphaLocal 1;
_markerName setMarkerSizeLocal [1, 1];
_markerName setMarkerBrushLocal "SolidFull";


newSightingAlert = {
	playSound "beep";
	cutRsc ["gui_intel","PLAIN",0];
};


_listener = {
	_markerName setMarkerPosLocal (locationPosition (LAST_PILOTS_POSITION select 1));
	_markerName setMarkerSizeLocal [LAST_PILOTS_POSITION select 2,LAST_PILOTS_POSITION select 2];
	[] call newSightingAlert;
};

"LAST_PILOTS_POSITION" addPublicVariableEventHandler _listener;
