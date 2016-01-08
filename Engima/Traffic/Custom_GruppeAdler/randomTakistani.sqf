/*
takistani civ units made from thai warfare mod
*/

randomTakistani = {
_unit = _this select 0;

_uniforms = [
"U_CivilianCoat_D",
"U_CivilianCoat_B",
"U_CivilianCoat_C",
"U_DressTKLocalUni_A_A",
"U_DressTKLocalUni_A_B",
"U_DressTKLocalUni_A_C",
"U_DressTKLocalUni_A_D",
"U_DressTKLocalUni_A_E",
"U_DressTKLocalUni_B_A",
"U_DressTKLocalUni_B_B",
"U_DressTKLocalUni_B_C",
"U_DressTKLocalUni_B_D",
"U_DressTKLocalUni_B_E",
"U_DressTKLocalUni_C_A",
"U_DressTKLocalUni_C_B",
"U_DressTKLocalUni_C_C",
"U_DressTKLocalUni_C_D",
"U_DressTKLocalUni_C_E",
"U_DressTKLocalUni_D_A",
"U_DressTKLocalUni_D_B",
"U_DressTKLocalUni_D_C",
"U_DressTKLocalUni_D_D",
"U_DressTKLocalUni_D_E",
"U_DressTKLocalUni_E_A",
"U_DressTKLocalUni_E_B",
"U_DressTKLocalUni_E_C",
"U_DressTKLocalUni_E_D",
"U_DressTKLocalUni_E_E",
"U_TKLocalUni_A",
"U_TKLocalUni_B",
"U_TKLocalUni_C",
"U_TKLocalUni_D",
"U_TKLocalUni_E",
"U_TKLocalUni_F",
"U_TKLocalCombat_A",
"U_TKLocalCombat_B",
"U_TKLocalCombat_C",
"U_TKLocalCombat_D",
"U_TKLocalCombat_E",
"U_CivilianSuit_A",
"U_CivilianSuit_B",
"U_CivilianSuit_C",
"U_Office_A",
"U_Office_B",
"U_Office_C"
] call BIS_fnc_selectRandom;

_thaiHeadGear = [
"H_Hat_Face_Wrap_Black",
"H_Hat_Taqiyah_A",
"H_Hat_Taqiyah_B",
"H_Hat_Taqiyah_C",
"H_Hat_Taqiyah_D",
"H_Hat_Taqiyah_E",
"H_Hat_Pagri",
"H_Hat_Pagri_B",
"H_Hat_Pagri_C",
"H_Hat_Turban_A",
"H_Hat_Turban_B",
"H_Hat_Turban_C",
"H_Hat_Turban_D",
"H_Hat_Turban_E",
"H_Hat_Pakol","H_Hat_Pakol","H_Hat_Pakol","H_Hat_Pakol","H_Hat_Pakol","H_Hat_Pakol"
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
	_guy addHeadgear _thaiHeadGear;

	[[_guy,_taliFaces], "setCustomFace"] call BIS_fnc_MP;
	
	if (isClass (configFile >> "CfgGlasses" >> "TRYK_Beard_BK")) then {
		_guy addGoggles _taliBeards;
	};
};

[_unit] call _stripHim;
sleep 0.1;
[_unit] call _reclotheHim;

};