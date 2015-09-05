// L_Civs /////////////////////////////////////////
#include "L_Civs\functions.sqf";
#include "L_Civs\classes.sqf";
#include "L_Civs\blacklist.sqf";

/////////////////////////////////////				
//	Param0: Max civilians	 	    /
//	Param1: Min. spawndistance	    /
//	Param2: Max. distance to players/
/////////////////////////////////////	
L_civs_debug = 1;

[5, 1500, 2400] spawn L_fnc_civs_spawnCivs;
//////////////////////////////////////////////////