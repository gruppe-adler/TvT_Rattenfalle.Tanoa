
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
            "rhs_tigr_ffv_3camo_vdv",
            "GAZ 233011",
            30,
            100,
            "<t align='center'>100 cr</t>",
            120,
            [[]],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "rhs_gaz66o_vdv",
            "GAZ 66",
            99,
            15,
            "<t align='center'>15 cr</t>",
            60,
            ["light_hide", 0 ],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "rhs_prp3_vdv",
            "PRP 3",
            2,
            1500,
            "<t align='center'>1500 cr</t>",
            180,
            [[]],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "rhs_brm1k_vdv",
            "BRM1K",
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "RHS_Mi24Vt_vvs",
            "Mi24VT",
            1,
            5000,
            "<t align='center'>4000 cr</t>",
            180,
            ["exhaust_hide", 1,"at_rack_hide", 0],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ]
    ];

    publicVariable "russianSupplies";



    "russianSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"",""] call refreshRussianUI;
    };

    "VEHICLE_ORDERED_WEST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshOrder;
    };
};

fillMudschahedinSupplies = {

     mudschahedinSupplies = [

        _this select 0,
        [
            "LOP_TAK_Civ_UAZ",
            "UAZ",
            30,
            50,
            "<t align='center'>50 cr</t>",
            120,
            [["light_hide", 0 ]],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "LOP_AM_Landrover_M2",
            "Landrover M2",
            99,
            200,
            "<t align='center'>200 cr</t>",
            60,
            [[]],
            "clearWeaponCargoGlobal this; clearItemCargoGlobal this; clearBackpackCargoGlobal this; clearMagazineCargoGlobal this;"
        ],
        [
            "Ammocrates_NoInteractive_Medium",
            "10 RPG",
            2,
            1500,
            "<t align='center'>1500 cr</t>",
            180,
            [[]],
            "
            clearWeaponCargoGlobal this; 
            clearItemCargoGlobal this; 
            clearBackpackCargoGlobal this; 
            clearMagazineCargoGlobal this; 
            this addWeaponCargoGlobal ['rhs_weap_rpg7',10];  
            this addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',4];
            this addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',4];
            this addMagazineCargoGlobal ['rhs_rpg7_OG7V_mag',4];
            " ;
        ],
        [
            "Ammocrates_NoInteractive_Small",
            "6 IED",
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            "
            clearWeaponCargoGlobal this; 
            clearItemCargoGlobal this; 
            clearBackpackCargoGlobal this; 
            clearMagazineCargoGlobal this; 
            this addMagazineCargoGlobal ['IEDUrbanBig_F',2];  
            this addMagazineCargoGlobal ['IEDLandBig_F',2];
            this addMagazineCargoGlobal ['IEDLandSmall_F',1];
            this addMagazineCargoGlobal ['IEDUrbanSmall_F',1];
            this addItemCargoGlobal ['ACE_Cellphone',4];
            " ;
        ],
        [
            "Ammocrates_NoInteractive_Large",
            "2 FIM92 Stinger",
            1,
            3000,
            "<t align='center'>3000 cr</t>",
            180,
            [[]],
            "
            clearWeaponCargoGlobal this; 
            clearItemCargoGlobal this; 
            clearBackpackCargoGlobal this; 
            clearMagazineCargoGlobal this;
            this addWeaponCargoGlobal ['rhs_weap_fim92',2];
            "
        ]
    ];

    publicVariable "mudschahedinSupplies";



    "mudschahedinSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"",""] call refreshRussianUI;
    };

    "VEHICLE_ORDERED_EAST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshOrder;
    };
};

[_russianCredits] call fillRussianSupplies;
[_mudschahedinCredits] call fillMudschahedinSupplies;