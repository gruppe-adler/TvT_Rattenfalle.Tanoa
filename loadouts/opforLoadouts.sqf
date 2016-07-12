set_akm_ammo = {
	this = _this select 0;
	this addItemToVest "rhs_30Rnd_762x39mm";
	for "_i" from 1 to 4 do {this addItemToVest "rhs_30Rnd_762x39mm_U";};
	for "_i" from 1 to 4 do {this addItemToVest "rhs_30Rnd_762x39mm_89";};
};

set_uniform_items = {
	this = _this select 0;
	this addItemToUniform "rhs_acc_ekp1";
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_morphine";};
	for "_i" from 1 to 8 do {this addItemToUniform "ACE_elasticBandage";};
	this addItemToUniform "ACE_Flashlight_KSF1";
	this addItemToUniform "rhs_acc_perst1ik";
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_Cellphone";
	this addItemToUniform "rhs_30Rnd_762x39mm";
};

set_opfor_basics = {
		this = _this select 0;
		this addItemToUniform "ACE_NVG_Gen1";
		this linkItem "ItemWatch";
		this linkItem "tf_fadak";
		this linkItem "ItemMap";
		this linkItem "ItemCompass";
};


opfor_rifleman = {

	this = _this select 0;



	[this] call stripHimNaked;


this addWeapon "rhs_weap_akms";

	comment "Add containers";
	this forceAddUniform "U_I_C_Soldier_Camo_F";
	[this] call set_uniform_items;

	this addVest "V_TacVest_oli";

	for "_i" from 1 to 7 do {this addItemToVest "rhs_30Rnd_762x39mm";};
	sleep 1;
	for "_i" from 1 to 1 do {this addItemToVest "rhs_30Rnd_762x39mm";};

	this addHeadgear "H_Bandanna_khk_hs";

	this addPrimaryWeaponItem "rhs_acc_2dpZenit";

	[this] call set_opfor_basics;

};


/* DONE **/
opfor_sql = {

		this = _this select 0;

		[this] call stripHimNaked;

		comment "Add uniform";
		this forceAddUniform "U_I_C_Soldier_Camo_F";
		comment "Add vest";
		this addVest "V_TacChestrig_oli_F";
		[this] call set_akm_ammo;
		comment "Add LR";
		this addBackpack "tf_rt1523g_bwmod";

		for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rdg2_black";};
		for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rgd5";};

		this addHeadgear "rhsgref_fieldcap_ttsko_mountain";
		comment "Add weapons";
		this addWeapon "rhs_weap_akms";
		this addPrimaryWeaponItem "rhs_acc_2dpZenit";

		[this] call set_opfor_basics;

		0 = execVM "player\animations\addBuyInteraction.sqf";

};

opfor_ftl = {

	this = _this select 0;

	comment "Remove existing items";
	[this] call stripHimNaked;

	comment "Add containers";
	this addWeapon "rhs_weap_akms";

	this forceAddUniform "U_I_C_Soldier_Camo_F";

	[this] call set_uniform_items;
	this addVest "V_TacVest_camo";
	this addHeadgear "H_Watchcap_khk";
	this addBackpack "rhs_assault_umbts";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack;


	this addPrimaryWeaponItem "rhs_acc_2dpZenit";

	[this] call set_opfor_basics;
	0 = execVM "player\animations\addBuyInteraction.sqf";




};

opfor_medic = {

	this = _this select 0;

	[this] call stripHimNaked;
	this addWeapon "rhs_weap_akms";
		this addPrimaryWeaponItem "rhs_acc_2dpZenit";

	this forceAddUniform "U_I_C_Soldier_Camo_F";
	[this] call set_uniform_items;
	this addVest "V_TacVest_camo";
	this addHeadgear "rhs_beret_milp";
	this addBackpack "B_Carryall_oli";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	for "_i" from 1 to 40 do {this addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 40 do {this addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_bloodIV_250";};
	for "_i" from 1 to 3 do {this addItemToBackpack "ACE_bodyBag";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_atropine";};
	for "_i" from 1 to 15 do {this addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 30 do {this addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_personalAidKit";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_adenosine";};
	for "_i" from 1 to 6 do {this addItemToBackpack "ACE_plasmaIV_250";};
	for "_i" from 1 to 2 do {this addItemToBackpack "ACE_tourniquet";};

	[this] call set_opfor_basics;

};

opfor_marksman = {

	this = _this select 0;



	[this] call stripHimNaked;

this addWeapon "rhs_weap_m76";
	comment "Add containers";

	this forceAddUniform "U_I_C_Soldier_Para_1_F";
	[this] call set_uniform_items;

	this addBackpack "B_ViperHarness_blk_F";
	this addHeadgear "H_Booniehat_oli";

	for "_i" from 1 to 17 do {this addItemToBackpack "rhsgref_10Rnd_792x57_m76";};
	this addWeapon "Binocular";


	[this] call set_opfor_basics;

};

opfor_at = {

	this = _this select 0;

	[this] call stripHimNaked;

	this addWeapon "rhs_weap_akm";

	comment "Add containers";

	this forceAddUniform "U_I_C_Soldier_Camo_F";
	[this] call set_uniform_items;

	this addVest "V_TacVest_oli";
	this addHeadgear "H_Bandanna_sgg";
	this addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_rpg7_PG7VR_mag";};
	this addItemToBackpack "rhs_rpg7_OG7V_mag";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_rpg7_PG7VL_mag", 3] call addMagazinesToBackpack;



	this addWeapon "rhs_weap_rpg7";

	[this] call set_opfor_basics;


};

opfor_mg = {

	this = _this select 0;

	[this] call stripHimNaked;

	this addWeapon "rhs_weap_pkp";

	comment "Add containers";

	this forceAddUniform "U_I_C_Soldier_Camo_F";
	[this] call set_uniform_items;
	this addVest "V_Chestrig_blk";
	this addHeadgear "rhs_tsh4";
	this addBackpack "B_AssaultPack_khk";

	for "_i" from 1 to 3 do {this addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	sleep 1;
	for "_i" from 1 to 1 do {this addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	for "_i" from 1 to 1 do {this addItemToVest "rhs_100Rnd_762x54mmR_green";};


	[this] call set_opfor_basics;

};

// AA!
opfor_aa = {

	this = _this select 0;

	[this] call stripHimNaked;

	this addWeapon "rhs_weap_akm";

	comment "Add containers";

	this forceAddUniform "U_I_C_Soldier_Camo_F";
	this addItemToUniform "rhs_30Rnd_762x39mm";
	this addVest "V_TacVest_oli";
	this addBackpack "B_Carryall_oli";
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_9k38_rocket";};
	this addHeadgear "rhs_Booniehat_m81";

	[this] call set_akm_ammo;



	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addWeapon "rhs_weap_igla";
	[this] call set_opfor_basics;


};

opfor_crew = {

	this = _this select 0;

	[this] call stripHimNaked;

	comment "Add containers";

	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_headset";
	this addHeadgear "rhs_tsh4";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";



};

opfor_ammobearer = {
	this = _this select 0;

	[this] call stripHimNaked;

	comment "Add containers";

	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_headset";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;

	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_100Rnd_762x54mmR_green", 2] call addMagazinesToBackpack;
	[this, "rhs_100Rnd_762x54mmR", 6] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";


};
