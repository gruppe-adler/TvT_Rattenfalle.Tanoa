// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

_boat = [
    ["I_C_Boat_Transport_02_F"],
    [],
    30,
    100,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ["U_B_Wetsuit",6];
        (_this select 0) addItemCargoGlobal ["V_RebreatherB",6];
        (_this select 0) addItemCargoGlobal ["G_B_Diving",6];
    },
    format[''],
    4,
    0
];

_car = [
      ["B_T_LSV_01_unarmed_F"],
      [],
      20,
      200,
      1,
      [],
      {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
      },
      format[''],
      2,
      0
];

_m1025 = [
      ["rhsusf_m1025_w_m2"],
      [],
      6,
      1000,
      1,
      [],
      {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
      (_this select 0) addItemCargoGlobal ['ItemGPS',1];
      ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
      },
      format[''],
      2,
      0
];

_uh1y = [
      ["RHS_UH1Y_UNARMED"],
      [],
      4,
      2500,
      1,
      ["DoorRB",0,"DoorLB",0,"hide_mg",1,"mainRotor_folded",0],
      {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
      (_this select 0) addItemCargoGlobal ['ItemGPS',1];
      [(_this select 0)] call ace_fastroping_fnc_equipFRIES;
      (_this select 0) disableTIEquipment true;
      (_this select 0) addItemCargoGlobal ["ACE_NVG_Wide",2];
      },
      format[''],
      2,
      0
];
_lav25 = [
      ["CUP_B_LAV25M240_USMC"],
      [],
      3,
      2000,
      1,
      [],
      {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
	  (_this select 0) disableTIEquipment true;
	  (_this select 0) removeMagazinesTurret ["CUP_210Rnd_TE1_Red_Tracer_25mm_M242_HE",[0]];
      (_this select 0) addItemCargoGlobal ['ItemGPS',1];
      ['AddCargoByClass', _this select 0, ['ACE_track', _this select 0, 2]] call ace_common_fnc_targetEvent;
      },
      format[''],
      2,
      0
];
_m109 = [
      ["rhsusf_m109_usarmy"],
      [],
      1,
      2500,
      1,
      [],
      {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
	  (_this select 0) disableTIEquipment true;
      (_this select 0) addItemCargoGlobal ['ItemGPS',1];
      ['AddCargoByClass', _this select 0, ['ACE_track', _this select 0, 2]] call ace_common_fnc_targetEvent;
      },
      format[''],
      2,
      0
];
_ah1z = [
    ["RHS_AH1Z_wd_CS"],
    [],
    2,
    3000,
    1,
    ["mainRotor_folded", 0],
    {
        _helicopter = _this select 0;

        clearWeaponCargoGlobal _helicopter;
        clearItemCargoGlobal _helicopter;
        clearBackpackCargoGlobal _helicopter;
        clearMagazineCargoGlobal _helicopter;

        _helicopter addItemCargoGlobal ["ACE_NVG_Wide", 2];
        _helicopter disableTIEquipment true;

        _helicopter removeWeapon "rhs_weap_SidewinderLauncher";
        _helicopter removeWeapon "rhs_weap_HellfireLauncher";

        _helicopter removeMagazine "rhs_mag_Hellfire_16";
        _helicopter removeMagazine "rhs_mag_Sidewinder_heli_2";
    },
    format [''],
    2,
    0
];

suppliesBlufor setVariable['boat', _boat, true];
suppliesBlufor setVariable['car', _car, true];
suppliesBlufor setVariable['m1025', _m1025, true];
suppliesBlufor setVariable['uh1y', _uh1y, true];
suppliesBlufor setVariable['lav25', _lav25, true];
suppliesBlufor setVariable['m109', _m109, true];
suppliesBlufor setVariable['ah1z', _ah1z, true];

publicVariable "suppliesBlufor";
