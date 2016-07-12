independent_pilot = {

	this = _this select 0;

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

	this forceAddUniform "rhs_uniform_g3_rgr";
	for "_i" from 1 to 8 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_atropine";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_morphine";};
	this addItemToUniform "ACE_SpraypaintRed";
	this addVest "V_PlateCarrier1_rgr_noflag_F";
	for "_i" from 1 to 3 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
	for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m18_yellow";};
	for "_i" from 1 to 2 do {this addItemToVest "ACE_HandFlare_Yellow";};
	this addHeadgear "rhsusf_hgu56p";

	comment "Add weapons";
	this addWeapon "rhsusf_weap_m9";

	this addWeapon "Binocular";
	this linkItem "ItemWatch";

};
