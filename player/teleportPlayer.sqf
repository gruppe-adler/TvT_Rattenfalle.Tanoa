#include "\z\ace\addons\main\script_component.hpp"
// takes location, distance

_location = _this select 0;
_distance = _this select 1;
_unit = _this select 2;

if (isMultiplayer) then { sleep (random 5);}; // balance teleport load in MP
["..."] call EFUNC(common,displayTextStructured);

_spawn = _location findEmptyPosition[2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", _unit, _location];

_nul = _unit setPos _spawn;
[".."] call EFUNC(common,displayTextStructured);

["."] call EFUNC(common,displayTextStructured);
// make _unit vulnerable again
_unit allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;
["+"] call EFUNC(common,displayTextStructured);
BIS_fnc_establishingShot_skip = true;
cutText ["", "PLAIN"];

["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>rat trap</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
