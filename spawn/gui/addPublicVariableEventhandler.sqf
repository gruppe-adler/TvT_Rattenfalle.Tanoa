
/*
parameter

IS_BLOCKED,MONEY_LEFT
VEHICLE 1 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 2 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 3 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 4 (classname, namedisplay, countleft, price, pricedisplay, eta)

*/

_russianCredits = _this select 0;
_mudschahedinCredits = _this select 1;

fillRussianSupplies = {

     russianSupplies = [

        _this select 0,
        [
            ["RHS_Ural_MSV_01"],
            "Ural Truck",
            10,
            100,
            "<t align='center'>100 cr</t>",
            120,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ], 
        [
            ["rhs_uaz_dshkm_MSV_01"],
            "UAZ Dshkm",
            3,
            800,
            "<t align='center'>800 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["rhs_prp3_vdv"],
            "PRP-3",
            3,
            1200,
            "<t align='center'>1200 cr</t>",
            60,
            [],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["rhs_sprut_vdv"],
            "2S25 Sprut",
            2,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["RHS_Mi24Vt_vvs"],
            "Mi24VT",
            1,
            4000,
            "<t align='center'>4000 cr</t>",
            180,
            ["exhaust_hide", 1,"at_rack_hide", 0],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ]
    ];

    publicVariable "russianSupplies";



    "russianSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"","","",0] call refreshRussianUI;
    };

    "VEHICLE_ORDERED_WEST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshRussianOrder;
    };
};

fillMudschahedinSupplies = {

     mudschahedinSupplies = [

        _this select 0,
        [
            [            
            "RHS_Ural_Civ_01",
            "RHS_Ural_Civ_02",
            "RHS_Ural_Civ_03",
            "RHS_Ural_Open_Civ_01",
            "RHS_Ural_Open_Civ_02",
            "RHS_Ural_Open_Civ_03"
            ],
            "Civil Ural Truck",
            10,
            100,
            "<t align='center'>100 cr</t>",
            60,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["rhs_uaz_dshkm_chdkz"],
            "UAZ Dshkm",
            3,
            800,
            "<t align='center'>800 cr</t>",
            60,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["rhs_uaz_spg9_chdkz"],
            "UAZ SPG9",
            3,
            800,
            "<t align='center'>800 cr</t>",
            60,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            ["B_CargoNet_01_Ammo_F"],
            "10 RPG",
            2,
            500,
            "<t align='center'>500 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);  
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',3];
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',3];
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_OG7V_mag',4];
            }
        ],
        [
            ["Box_East_Wps_F"],
            "6 IED + Cellphones",
            1,
            1000,
            "<t align='center'>1000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0); 
            (_this select 0) addWeaponCargoGlobal ['IEDUrbanBig_F',2];  
            (_this select 0) addWeaponCargoGlobal ['IEDLandBig_F',2];
            (_this select 0) addWeaponCargoGlobal ['IEDLandSmall_F',1];
            (_this select 0) addWeaponCargoGlobal ['IEDUrbanSmall_F',1];
            (_this select 0) addItemCargoGlobal ['ACE_Cellphone',6];
            }
        ],
        [
            ["Box_East_WpsSpecial_F"],
            "2 FIM92 Stinger",
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addWeaponCargoGlobal ['rhs_weap_fim92',2];
            (_this select 0) addWeaponCargoGlobal ['rhs_fim92_mag',4];
            }
        ]
    ];

    publicVariable "mudschahedinSupplies";



    "mudschahedinSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"","","",0] call refreshMudschahedinUI;
    };

    "VEHICLE_ORDERED_EAST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshMudschahedinOrder;
    };
};

[_russianCredits] call fillRussianSupplies;
[_mudschahedinCredits] call fillMudschahedinSupplies;