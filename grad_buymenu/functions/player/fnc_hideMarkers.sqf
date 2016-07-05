/*
fnc_hideMarkers = {
	if (playerside == west) then {
		{_x setMarkerAlphaLocal 0;} forEach [spawnArrayBluforLand,spawnArrayBluforCivilian,spawnArrayBluforWater,spawnArrayOpforLand,spawnArrayOpforWater,spawnArrayOpforCivilian]; {_x setMarkerAlphaLocal 1; } forEach [spawnArrayBluforLand,spawnArrayBluforWater];
	} else {
		{_x setMarkerAlphaLocal 0;} forEach [spawnArrayBluforLand,spawnArrayBluforCivilian,spawnArrayBluforWater,spawnArrayOpforLand,spawnArrayOpforWater,spawnArrayOpforCivilian]; {_x setMarkerAlphaLocal 1; } forEach [spawnArrayOpforLand,spawnArrayOpforWater];
	};
};
*/
