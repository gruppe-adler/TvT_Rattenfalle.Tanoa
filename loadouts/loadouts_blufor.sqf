

// woodland camo?
blufor_random_helmet = [
	"rhsusf_opscore_fg",
	"rhsusf_opscore_fg",
	"rhsusf_opscore_fg_pelt_cam"
];

blufor_random_goggles = [
	"G_Balaclava_TI_blk_F",
	"G_Balaclava_TI_tna_F",
	"rhs_balaclava"
];


blufor_random_primaryweapon = [
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10"
];


blufor_random_mg = [
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg"
];

blufor_vest_random = [
	"V_TacChestrig_oli_F",
	"V_TacChestrig_grn_F",
	"V_TacChestrig_grn_F"
];

blufor_basic = {
	this = _this select 0;

	this forceAddUniform "rhs_uniform_g3_rgr";
	this addVest (selectRandom blufor_vest_random);

	[this, "rhsusf_mag_15Rnd_9x19_JHP", 3] call addItemsToUniform;

	this addBackpack "B_ViperLightHarness_oli_F";
	[this, "30Rnd_556x45_Stanag_Tracer_Red", 10] call addMagazinesToBackpack;
	[this, "rhs_mag_30Rnd_556x45_Mk262_Stanag", 10] call addMagazinesToBackpack;

	this addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
	this addPrimaryWeaponItem "rhsusf_acc_compm4";
	this addWeapon "rhsusf_weap_m9";

	this addItemToUniform "ACE_microDAGR";


	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_elasticBandage";};
	this addItemToBackpack "ACE_bloodIV_250";
	for "_i" from 1 to 3 do {this addItemToBackpack "ACE_CableTie";};
	for "_i" from 1 to 3 do {this addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 4 do {this addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_quikclot";};
	this addItemToBackpack "ACE_DefusalKit";
	this addItemToBackpack "ACE_Flashlight_MX991";
	for "_i" from 1 to 10 do {this addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 10 do {this addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhsusf_mag_15Rnd_9x19_JHP";};
	for "_i" from 1 to 2 do {this addItemToBackpack "B_IR_Grenade";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_m67";};
	this addItemToBackpack "SmokeShellRed";
	for "_i" from 1 to 4 do {this addItemToBackpack "SmokeShell";};
	this addItemToBackpack "ACE_HandFlare_Red";

	if (random 2 > 1) then {
		this addHeadgear (selectRandom blufor_random_helmet);
	};
	if (random 2 > 1) then {
			this addGoggles (selectRandom blufor_random_goggles);
	};


	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";
	this linkItem "ACE_NVG_Gen1";
	this linkItem "itemGPS";
};

blufor_default = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

};

blufor_sql = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

	removeBackpack this;
	this addBackpack "tf_rt1523g_big_bwmod";

	[this, "30Rnd_556x45_Stanag_Tracer_Red", 5] call addMagazinesToVest;
	[this, "rhs_mag_30Rnd_556x45_Mk262_Stanag", 5] call addMagazinesToVest;

	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_m67";};
	this addItemToBackpack "SmokeShellRed";
	for "_i" from 1 to 4 do {this addItemToBackpack "SmokeShell";};
	this addItemToBackpack "ACE_HandFlare_Red";

	player addAction["Open Buy Menu", {		0 = [] execVM "grad_buymenu\openMenu.sqf";	}];
};

blufor_ftl = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

};

blufor_medic = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

};

blufor_marksman = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";


};

blufor_AT = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

	this addWeapon "rhs_weap_m72a7";

};

blufor_MG = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";


	[this, "rhs_200rnd_556x45_T_SAW", 1] call addMagazinesToVest;
	[this, "rhs_200rnd_556x45_M_SAW", 2] call addMagazinesToBackpack;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;


	this addWeapon "Binocular";
	this addWeapon (blufor_random_mg call BIS_fnc_selectRandom);

	[this, "rhs_200rnd_556x45_T_SAW", 1] call addMagazinesToBackpack;

};



blufor_engineer = {

	this = _this select 0;

	[this] call stripHimNaked;
	[this] call blufor_basic;
	comment "Add containers";

};

blufor_crew = {

	this = _this select 0;

	[this] call stripHimNaked;
[this] call blufor_basic;
	comment "Add containers";


	this addVest "rhsusf_spc_crewman";
	this addHeadgear blufor_crew_helmet;
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";




};


blufor_ammobearer = {
	this = _this select 0;

	[this] call stripHimNaked;
[this] call blufor_basic;
	comment "Add containers";


	this addVest "rhsusf_spc_crewman";
	if (random 2 > 1) then {
		this addHeadgear (selectRandom blufor_random_helmet);
	};
	this addBackpack "B_Carryall_khk";


	[this] call set_akm_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "HandGrenade", 1] call addMagazinesToVest;

	[this, "rhs_200rnd_556x45_T_SAW", 2] call addMagazinesToBackpack;
	[this, "rhs_200rnd_556x45_M_SAW", 6] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addPrimaryWeaponItem "optic_Aco";



};
