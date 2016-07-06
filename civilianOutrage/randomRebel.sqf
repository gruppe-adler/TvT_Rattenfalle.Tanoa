/*
rebel civ units made from thai warfare mod
*/

randomRebel = {
_unit = _this select 0;

_uniforms = [
"U_C_Man_casual_1_F",
"U_C_Man_casual_2_F",
"U_C_Man_casual_3_F",
"U_C_Man_casual_4_F",
"U_C_Man_casual_5_F",
"U_C_man_sport_1_F",
"U_C_man_sport_2_F",
"U_C_man_sport_3_F",
"U_I_C_Soldier_Bandit_1_F",
"U_I_C_Soldier_Bandit_2_F",
"U_I_C_Soldier_Bandit_3_F",
"U_I_C_Soldier_Bandit_4_F",
"U_I_C_Soldier_Bandit_5_F",
"U_B_GEN_Soldier_F",
"U_B_GEN_Commander_F",
"U_Marshal"
] call BIS_fnc_selectRandom;

_vanillaHeadGear = [
"H_Booniehat_tna_F",
"H_Cap_blk",
"H_Cap_red",
"H_Cap_surfer",
"H_Cap_tan",
"H_Hat_blue",
"H_Hat_brown",
"H_Hat_checker",
"H_Hat_tan",
"H_Hat_grey",
"H_StrawHat",
"H_StrawHat_dark",
"H_Bandanna_gry",
"H_Bandanna_blu",
"H_Bandanna_cbr",
"H_Bandanna_surfer",
"H_Bandanna_surfer_blk",
"H_Bandanna_surfer_grn",
"H_Booniehat_tan"
] call BIS_fnc_selectRandom;

_taliFaces = [
"PersianHead_A3_01",
"PersianHead_A3_02",
"PersianHead_A3_03",
"PersianHead_A3_01",
"PersianHead_A3_02",
"PersianHead_A3_03",
"PersianHead_A3_01",
"PersianHead_A3_02",
"PersianHead_A3_03",
"WhiteHead_08",
"WhiteHead_16",
"GreekHead_A3_01",
"GreekHead_A3_02",
"GreekHead_A3_03",
"GreekHead_A3_04"
] call BIS_fnc_selectRandom;

_taliBeards = [
"TRYK_Beard_BK","TRYK_Beard_BK","TRYK_Beard_BK","TRYK_Beard_BK",
"TRYK_Beard_BK2","TRYK_Beard_BK2","TRYK_Beard_BK2","TRYK_Beard_BK2",
"TRYK_Beard_BK3","TRYK_Beard_BK3","TRYK_Beard_BK3","TRYK_Beard_BK3",
"TRYK_Beard_BK4","TRYK_Beard_BK4","TRYK_Beard_BK4","TRYK_Beard_BK4",
"TRYK_Beard_Gr",
"TRYK_Beard_Gr2",
"TRYK_Beard_Gr3",
"TRYK_Beard_Gr4"
] call BIS_fnc_selectRandom;


_stripHim = {
	_it = _this select 0;
		removeAllWeapons _it;
		removeAllItems _it;
		removeAllAssignedItems _it;
		removeUniform _it;
		removeVest _it;
		removeBackpack _it;
		removeHeadgear _it;
		removeGoggles _it;
};

_reclotheHim = {
	_guy = _this select 0;
	_guy forceAddUniform _uniforms;
	_guy addHeadgear _vanillaHeadGear;

	// [[_guy,_taliFaces], "setCustomFace"] call BIS_fnc_MP;

	if (isClass (configFile >> "CfgGlasses" >> "TRYK_Beard_BK")) then {
		if (random 10 > 9) then {
			_guy addGoggles _taliBeards;
		};
	};
};

_addFleeingBehaviour = {

};

[_unit] call _stripHim;
sleep 0.1;
[_unit] call _reclotheHim;

_unit addEventHandler ["killed", {_this execVM 'civilianOutrage\civilianKilled.sqf'}];

_unit setVariable ["questioned",0];
_unit setVariable ["revealed",false];

if (random 1 < 0.8) then {
	_unit setVariable ["knowsSomething",true];
} else {
	_unit setVariable ["knowsSomething",false];
};

_unit addEventHandler ["FiredNear", {
		_this execVM 'civilianOutrage\civilianFiredNear.sqf';
}];

_unit addEventHandler ["Hit", {
		_questioned = (_this select 0) getVariable ["questioned",0];
		(_this select 0) setVariable ["questioned",_questioned + 0.4];
}];



[_unit,"fnc_MPaddQuestioningAction",nil,true] spawn BIS_fnc_MP;

};
