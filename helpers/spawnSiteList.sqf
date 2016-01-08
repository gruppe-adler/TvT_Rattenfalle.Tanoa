// possible crash site markerlist
crash_sites = [
		"mrk_crash_site_01",
		"mrk_crash_site_02",
		"mrk_crash_site_03",
		"mrk_crash_site_04",
		"mrk_crash_site_05",
		"mrk_crash_site_06",
		"mrk_crash_site_07",
		"mrk_crash_site_08",
		"mrk_crash_site_09",
		"mrk_crash_site_10",
		"mrk_crash_site_11",
		"mrk_crash_site_12",
		"mrk_crash_site_13",
		"mrk_crash_site_14"
];


{_x setMarkerAlpha 0;} forEach crash_sites;

if (isServer) then {

	// add crash sites to respawn positions of independents
	for [{_i=0}, {_i<count crash_sites}, {_i=_i+1}] do
	{
		[crashpilot, (crash_sites select _i)] call BIS_fnc_addRespawnPosition;
	};
	
};
