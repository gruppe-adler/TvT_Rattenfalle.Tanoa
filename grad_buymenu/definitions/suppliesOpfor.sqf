// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

suppliesOpfor = [
    "suppliesOpfor",
    [
      [
                "C_Scooter_Transport_01_F",
                [],
                14,
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
          ],
          [
                "C_Offroad_02_unarmed_F",
                [],
                14,
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
          ],
          [
                "rhsgref_cdf_reg_uaz_dshkm",
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
          ],
          [
                "rhsgref_cdf_reg_uaz_spg9",
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
          ],
          [
                "rhsgref_BRDM2_ins_g",
                [],
                3,
                1500,
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
          ],
          [
                "rhs_gaz66_zu23_vmf",
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
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format[''],
                2,
                0
          ]
    ]
];

publicVariable "suppliesOpfor";
