
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

sleep (random 5);

_spawn = _location findEmptyPosition[1, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _location];
playSound "beam";
cutText ["", "BLACK OUT", 0.1];

[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];

_nul = player setPos _spawn;
sleep 2;
openMap [false, false];
hintSilent "";
cutText ["", "BLACK IN", 1];

// make player vulnerable again
player allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;
sleep 1;
cutText ["", "PLAIN"];