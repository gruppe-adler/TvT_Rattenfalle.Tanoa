suppliesOpfor = [
    "suppliesOpfor",
        [
    		[
                "rhs_tigr_m_vdv",
                ["GAZ-66 1"],
                3,
                200,
                5,
                ["light_hide", 1],
                {
                clearWeaponCargoGlobal (_this select 0);
                clearItemCargoGlobal (_this select 0);
                clearBackpackCargoGlobal (_this select 0);
                clearMagazineCargoGlobal (_this select 0);
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                0,
                0
            ],
            [
                "rhsgref_nat_uaz_dshkm",
                ["GAZ-66 1"],
                3,
                400,
                5,
                ["light_hide", 1],
                {
                clearWeaponCargoGlobal (_this select 0);
                clearItemCargoGlobal (_this select 0);
                clearBackpackCargoGlobal (_this select 0);
                clearMagazineCargoGlobal (_this select 0);
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                1,
                0
            ],
            [
                "rhs_btr60_vdv",
                ["GAZ-66 1"],
                3,
                500,
                5,
                [],
                {
                clearWeaponCargoGlobal (_this select 0);
                clearItemCargoGlobal (_this select 0);
                clearBackpackCargoGlobal (_this select 0);
                clearMagazineCargoGlobal (_this select 0);
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                2,
                0
            ],
            [
                "rhs_prp3_vdv",
                ["PRP-3"],
                3,
                500,
                5,
                [],
                {
                clearWeaponCargoGlobal (_this select 0);
                clearItemCargoGlobal (_this select 0);
                clearBackpackCargoGlobal (_this select 0);
                clearMagazineCargoGlobal (_this select 0);
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                3,
                0
            ],
            [
                "C_Boat_Civil_01_rescue_F",
                ["Sprut 2S25"],
                3,
                500,
                5,
                [],
                {
                clearWeaponCargoGlobal (_this select 0);
                clearItemCargoGlobal (_this select 0);
                clearBackpackCargoGlobal (_this select 0);
                clearMagazineCargoGlobal (_this select 0);
                (_this select 0) addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
                },
                format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                4,
                0
            ]
        ]
];
