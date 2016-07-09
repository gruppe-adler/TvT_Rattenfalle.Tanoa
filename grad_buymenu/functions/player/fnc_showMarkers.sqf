fnc_showMarkers = {

	waitUntil {!isNil "spawnMarkerBluforLand"};

	diag_log "fnc show markers";

	if (playerside == west) then {
		{_x setMarkerAlphaLocal 1;} forEach [
			spawnMarkerBluforLand,
			spawnMarkerBluforWater,
			spawnMarkerBluforPlane,
			spawnMarkerBluforHelicopter
			];
	} else {
		{_x setMarkerAlphaLocal 1;} forEach [
		spawnMarkerOpforLand,
		spawnMarkerOpforWater,
		spawnMarkerOpforPlane,
		spawnMarkerOpforHelicopter
		];
	};
};
