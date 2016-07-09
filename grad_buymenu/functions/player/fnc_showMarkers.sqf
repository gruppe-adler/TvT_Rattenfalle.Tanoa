fnc_showMarkers = {
	sleep 5;

	diag_log "fnc show markers";

	if (playerside == west) then {
		{_x setMarkerAlphaLocal 1;} forEach ["spawnMarkerBluforLand","spawnMarkerBluforWater","spawnMarkerBluforPlane","spawnMarkerBluforHelicopter"];
	} else {
		{_x setMarkerAlphaLocal 1;} forEach ["spawnMarkerOpforLand","spawnMarkerOpforWater","spawnMarkerOpforPlane","spawnMarkerOpforHelicopter"];
	};
};
