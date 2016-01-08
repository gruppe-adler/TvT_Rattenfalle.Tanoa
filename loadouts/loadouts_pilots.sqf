pilots = {

	_vests = ["rhs_vest_commander","rhs_vydra_3m"] call BIS_fnc_selectRandom;
	_headgear = ["rhs_zsh7a_mike","rhs_gssh18"] call BIS_fnc_selectRandom;
	
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
	
	this forceAddUniform "rhs_uniform_m88_patchless";
	this addVest _vests;
	this addHeadgear _headgear;
	

	[this, "rhs_30Rnd_762x39mm", 14] call addMagazinesToBackpack;
	
	[this, "16Rnd_9x21_Mag", 1] call addMagazinesToVest;
	[this, "SmokeShellRed", 1] call addMagazinesToVest;
	[this, "ACE_Earplugs", 1] call addMagazinesToVest;
	[this, "ACE_fieldDressing", 6] call addMagazinesToVest;
	[this, "ACE_Morphine", 2] call addMagazinesToVest;
	[this, "ACE_Epipen", 2] call addMagazinesToVest;
	[this, "ACE_HandFlare_Red", 1] call addMagazinesToVest;
	[this, "ACE_HandFlare_White", 1] call addMagazinesToVest;
	[this, "Chemlight_blue", 1] call addMagazinesToVest;
	

	this addWeapon "Binocular";
	this addWeapon "hgun_P07_F";

	this linkItem "ItemWatch";
	

};
