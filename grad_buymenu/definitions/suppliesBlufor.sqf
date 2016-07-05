suppliesBlufor = [
      "suppliesBlufor",
      [
	      [
                  "rhs_gaz66o_vdv",
                  ["LKW GAZ66"],
                  3,
                  200,
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
                  format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                  0,
                  0
            ],
            [
                  "rhs_gaz66o_vdv",
                  [],
                  3,
                  200,
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
                  format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                  1,
                  0
            ],
            [
                  "rhs_gaz66o_vdv",
                  [],
                  3,
                  200,
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
                  format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                  2,
                  0
            ],
            [
                  "rhs_gaz66o_vdv",
                  [],
                  3,
                  200,
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
                  format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                  3,
                  0
            ],
            [
                  "rhs_gaz66o_vdv",
                  [],
                  3,
                  200,
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
                  format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS'],
                  4,
                  0
            ]
      ]
];

publicVariable "suppliesBlufor";
