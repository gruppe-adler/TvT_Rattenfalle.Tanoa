/*
by nomisum for tvt rattrap @ gruppe adler

should only be called from CLIENT!

*/

// not in use 


GRAD_last_pilots_position = (str LAST_PILOTS_POSITION) + "_marker";
_nil = createMarkerLocal [GRAD_last_pilots_position, [0, 0, 0]];
GRAD_last_pilots_position setMarkerShapeLocal "ELLIPSE";
GRAD_last_pilots_position setMarkerTypeLocal "mil_unknown";
GRAD_last_pilots_position setMarkerColorLocal "ColorOpfor";
GRAD_last_pilots_position setMarkerAlphaLocal 0.3;
GRAD_last_pilots_position setMarkerSizeLocal [1, 1];
GRAD_last_pilots_position setMarkerBrushLocal "SolidFull";


newSightingAlert = {
	playSound "beep";
	cutRsc ["gui_intel","PLAIN",0];
};


_listener = {
	GRAD_last_pilots_position setMarkerPosLocal (LAST_PILOTS_POSITION select 1);
	GRAD_last_pilots_position setMarkerSizeLocal [LAST_PILOTS_POSITION select 2,LAST_PILOTS_POSITION select 2];
	[] call newSightingAlert;
};

"LAST_PILOTS_POSITION" addPublicVariableEventHandler _listener;
