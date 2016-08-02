// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

_x = [
    ["C_Scooter_Transport_01_F"],
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
    },
    format[''],
    4,
    0
];
suppliesOpfor setVariable ['scooter', _x, true];

_x = [
    [
        "C_Offroad_02_unarmed_F",
        "RDS_Lada_Civ_02",
        "RDS_Lada_Civ_03",
        "RDS_Lada_Civ_04",
        "C_SUV_01_F",
        "C_Offroad_01_repair_F",
        "B_G_Offroad_01_repair_F",
        "C_Offroad_01_F"
    ],
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
    3,
    0
];
suppliesOpfor setVariable ['car', _x, true];

_x = [
    ["RHS_Ural_Open_Civ_01",
    "RHS_Ural_Open_Civ_02",
    "RHS_Ural_Open_Civ_03",
    "RHS_Ural_Civ_01",
    "RHS_Ural_Civ_02",
    "RHS_Ural_Civ_03",
    "C_Van_01_transport_F"],
    [],
    10,
    250,
    1,
    [],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    },
    format[''],
    3,
    0
];
suppliesOpfor setVariable ['truck', _x, true];

_x = [
    ["rhsgref_cdf_reg_uaz_dshkm"],
    [],
    10,
    1000,
    1,
    ["light_hide", 1],
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
suppliesOpfor setVariable ['uaz_dshkm', _x, true];

_x = [
    ["rhsgref_cdf_reg_uaz_spg9"],
    [],
    10,
    1000,
    1,
    ["light_hide", 1],
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
suppliesOpfor setVariable ['uaz_spg9', _x, true];

_x = [
    ["rhsgref_nat_btr70"],
    [],
    3,
    1500,
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
suppliesOpfor setVariable ['btr70', _x, true];

_x = [
    ["rhsgref_cdf_gaz66_zu23"],
    [],
    3,
    3000,
    1,
    ["light_hide", 1],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_gaz66\data\gaz66ru_co.paa"];
    (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"];
    (_this select 0) setObjectTextureGlobal [2,"rhsafrf\addons\rhs_decals\data\numbers\boldred\1_ca.paa"];
    (_this select 0) setObjectTextureGlobal [3,"rhsafrf\addons\rhs_decals\data\numbers\boldred\3_ca.paa"];
    (_this select 0) setObjectTextureGlobal [4,"rhsafrf\addons\rhs_decals\data\numbers\boldred\3_ca.paa"];
    (_this select 0) setObjectTextureGlobal [5,"rhsafrf\addons\rhs_decals\data\numbers\boldred\7_ca.paa"];
    (_this select 0) setVehicleLock 'UNLOCKED';
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
    },
    format[''],
    2,
    0
];
suppliesOpfor setVariable ['gaz66', _x, true];
