_unit = _this select 0;
_firer = _this select 1;

_surrenderAnimations = [
"AinvPknlMstpSnonWnonDnon_1"
];




sleep 0.5;

if ((vehicle _unit != _unit) || _unit distance _firer > 20) exitWith {}; // when unit in vehicle and > 20m away, just ignore any shooter
if (vehicle _unit != _unit) then {	dostop _unit; sleep 1;	(group _unit) leaveVehicle (vehicle _unit);}; // in close vehicle - exit
_unit removeAllEventHandlers "firedNear"; // EH cleanup

doStop _unit; _unit playMoveNow (_surrenderAnimations call BIS_fnc_selectRandom); // stop and surrender
sleep 0.5;
_unit disableAI "ANIM"; // stop running away

// shooting near the unit can improve negotiation skills
_unit addEventHandler ["FiredNear",{
	if ((_this select 0) distance (_this select 1) < 15) then {
	(_this select 0) setVariable ["questioned",
	((_this select 0) getVariable ["questioned",0]) + 0.1
	]};
}];
