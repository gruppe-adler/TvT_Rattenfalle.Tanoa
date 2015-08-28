
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
            [[]]
        ],
        [
            "rhs_gaz66o_vdv",
            "GAZ 66",
            99,
            15,
            "<t align='center'>15 cr</t>",
            60,
            [["light_hide", 0 ]]
        ],
        [
            "rhs_prp3_vdv",
            "PRP 3",
            2,
            1500,
            "<t align='center'>1500 cr</t>",
            180,
            [[]]
        ],
        [
            "rhs_brm1k_vdv",
            "BRM1K",
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]]
        ],
        [
            "RHS_Mi24Vt_vvs",
            "Mi24VT",
            1,
            5000,
            "<t align='center'>4000 cr</t>",
            180,
            [["exhaust_hide", 1,"at_rack_hide", 0]]
        ]
    ];

    publicVariable "russianSupplies";



    "russianSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"",""] call refreshUI;
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

[_russianCredits] call fillRussianSupplies;