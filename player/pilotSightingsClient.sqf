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
	_location = _this select 0; // geht das hier? select 0 = variablenname, select 1 = variablenwert?!
        
	playSound "signal_lost";

	disableSerialization;
	1337 ctrlSetText (str _location); // todo : insert correct ID

	cutRsc ["gui_intel_pilotPaper","PLAIN",0];
};


_listener = {
	_markerName setMarkerPosLocal (locationPosition (_this select 1));
	_markerName setMarkerSizeLocal [(_this select 2),(_this select 2)];
	[(this select 1)] call newSightingAlert;
};

"LAST_PILOTS_POSITION" addPublicVariableEventHandler _listener;
