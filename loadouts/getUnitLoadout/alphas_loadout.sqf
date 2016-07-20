
comment "Version mit Gruppe-Adler-Standardzeug"
comment "Exported from Arsenal by Alpha-Kilo";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "ARC_GER_Flecktarn_Uniform";
this addItemToUniform "ACE_MapTools";
this addItemToUniform "ACE_DefusalKit";
for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
this addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 8 do {this addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {this addItemToUniform "ACE_epinephrine";};
this addItemToUniform "ACE_microDAGR";
this addItemToUniform "ACE_Flashlight_XL50";
this addItemToUniform "ACE_bloodIV_250";
this addItemToUniform "ACE_EntrenchingTool";
this addVest "ARC_GER_Flecktarn_Plate_Carrier";
this addItemToVest "SMA_supp2b_556";
this addItemToVest "ACE_NVG_Gen4";
this addItemToVest "optic_AMS";
for "_i" from 1 to 2 do {this addItemToVest "SmokeShell";};
this addItemToVest "rhs_mag_m18_red";
this addItemToVest "SmokeShellBlue";
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 8 do {this addItemToVest "SMA_30Rnd_556x45_M855A1_Tracer";};
this addItemToVest "30Rnd_9x21_Red_Mag";
this addBackpack "ARC_GER_Backpack_compact_Flecktarn";
this addHeadgear "H_HelmetB_camo";
this addGoggles "G_Balaclava_oli";

comment "Add weapons";
this addWeapon "SMA_HK416vfg";
this addPrimaryWeaponItem "SMA_SFPEQ_HKTOP_BLK";
this addPrimaryWeaponItem "FHQ_optic_HWS_G33";
this addPrimaryWeaponItem "SMA_Gripod_01";
this addWeapon "hgun_P07_F";
this addHandgunItem "muzzle_snds_L";
this addWeapon "Rangefinder";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "tf_anprc152_1";
this linkItem "ItemGPS";




comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "IP_U_B_ReconUniform_KSK_Tropic";
this addItemToUniform "ACE_MapTools";
this addItemToUniform "ACE_DefusalKit";
for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
this addItemToUniform "ACE_EarPlugs";
this addItemToUniform "ACE_microDAGR";
this addItemToUniform "ACE_Flashlight_XL50";
this addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {this addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
for "_i" from 1 to 8 do {this addItemToUniform "ACE_fieldDressing";};
this addItemToUniform "ACE_bloodIV_250";
this addVest "IP_V_PlateCarrier2_KSK_Fleck_Tropic";
this addItemToVest "optic_AMS";
this addItemToVest "rhsusf_acc_nt4_black";
this addItemToVest "ACE_NVG_Gen4";
for "_i" from 1 to 2 do {this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
this addItemToVest "SmokeShellBlue";
this addItemToVest "SmokeShellRed";
for "_i" from 1 to 8 do {this addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";};
this addItemToVest "30Rnd_9x21_Red_Mag";
this addBackpack "IP_B_AssaultPack_KSK_Tropic";
this addHeadgear "H_HelmetB_camo";
this addGoggles "G_Balaclava_TI_tna_F";

comment "Add weapons";
this addWeapon "rhs_weap_hk416d145_grip";
this addPrimaryWeaponItem "FHQ_acc_ANPEQ15_black";
this addPrimaryWeaponItem "FHQ_optic_HWS_G33";
this addPrimaryWeaponItem "rhsusf_acc_grip1";
this addWeapon "IP_hgun_P07_KSK_Tropic_F";
this addHandgunItem "muzzle_snds_L";
this addWeapon "Rangefinder";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "tf_anprc152_3";
this linkItem "ItemGPS";

comment "Set identity";
this setFace "PersianHead_A3_04_sa";
this setSpeaker "Male05ENGB";
