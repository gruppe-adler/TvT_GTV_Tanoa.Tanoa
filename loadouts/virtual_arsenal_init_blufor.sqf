//Init stuff
_crate = _this select 0;

clearWeaponCargoGlobal _crate; clearItemCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearBackpackCargo _crate; 

removeAllActions _crate; //funzt nicht mit Inventar AddAction




_hasAction = _crate getVariable ["ArsenalPresent", false];


if (!_hasAction) then {
    
	   _crate addAction ['<t color=''#45B6EA''>Arsenal</t>',
	{
	_box = _this select 0;
	_unit = _this select 1;
	["Open",[nil,_box]] call bis_fnc_arsenal; 
	}];
};



_availableHeadgear = [
    "H_Cap_headphones",
    "ARC_GER_Tropentarn_booniehat",
    "ARC_GER_Flecktarn_booniehat",
    "ARC_GER_Tropentarn_Helmet",
    "ARC_GER_Flecktarn_Helmet",
    "ARC_GER_Flecktarn_Helmet_simple",
    "ARC_GER_Tropentarn_Helmet_simple",
    "ARC_GER_Tropentarn_Helmet_Light",
    "ARC_GER_Flecktarn_Helmet_Light"
];

_availableBackpacks = [
    "ARC_GER_Backpack_compact_Tropentarn",
    "ARC_GER_Backpack_compact_Flecktarn",
    "ARC_GER_Backpack_Carryall_Flecktarn"
];

_availableItems = [
    "AGM_Earbuds",
    "SMA_AIMPOINT",
    "optic_Holosight",
    "optic_ACO_grn",
    "optic_ACO_red",
    "tf_anprc152",
    "SMA_eotech552_3XDOWN",
    "SMA_eotech552_3XDOWN_des",
    "SMA_eotech552_3XDOWN_wdl",
    "FHQ_acc_LLM01L",
    "muzzle_snds_acp",
    "FHQ_optic_MicroCCO",
    "AGM_Morphine",
    "AGM_Bandage",
    "AGM_Epipen",
    "AGM_Bloodbag",
    "AGM_CableTie",
    "ItemMap",
    "ItemCompass",
    "AGM_CableTie",
    "AGM_MapTools",
    "AGM_DefusalKit",
    "NVGoggles_INDEP",
    "FHQ_acc_LLM01F",
	"FHQ_acc_ANPEQ15_black",
	"FHQ_acc_ANPEQ15",
	"FHQ_optic_AC11704",
	"FHQ_optic_AC11704_tan",
	"FHQ_optic_MARS",
	"SMA_supp2btanSCAR_556",
	"SMA_supp2bSCAR_556",
	"SMA_spSCARtan_762",
	"SMA_spSCAR_762",
	"SMA_supptan_762",
	"SMA_supp_762",
	"SMA_supp2btan_556",
	"SMA_supp1tan_556",
	"SMA_supp1b_556",
 	"SMA_Silencer_556",
 	"optic_Hamr",
 	"optic_Aco",
 	"bipod_01_F_blk",
 	"bipod_01_F_snd",
 	"optic_KHS_blk",
 	"optic_KHS_tan"
];

_availableVests = [
    "ARC_GER_Flecktarn_Plate_Carrier_H",
    "ARC_GER_Tropentarn_Plate_Carrier_H"
];

_availableUniforms = [
    "ARC_GER_Flecktarn_Uniform",
    "ARC_GER_Tropentarn_Uniform"
];

_availableWeapons = [
    "SMA_AUG_A3_F",
    "SMA_AUG_A3_MCAM_F",
    "SMA_AUG_A3_KRYPT_F",
    "hlc_rifle_M4",
    "SMA_HK416afg",
    "SMA_HK416vfg",
    "SMA_HK417afg",
    "SMA_HK417vfg",
    "SMA_HK417_tanafg",
    "SMA_HK417_tanvgf",
    "SMA_HK417_16in_afg",
    "SMA_HK417_16in_afg_tan",
    "SMA_MK16",
    "SMA_Mk16_black",
    "SMA_Mk17",
    "SMA_Mk17_black",
    "SMA_STG_E4_F",
    "SMA_STG_E4_BLACK_F",
    "arifle_MX_F",
    "arifle_MX_Black_F",
    "hgun_Pistol_heavy_01_F",
    "hgun_ACPC2_F",
    "hlc_smg_mp5a4",
    "hlc_smg_mp5n",
    "hlc_smg_mp5k_PDW",
    "SMG_01_F",
    "Rangefinder",
    "MMG_01_base_F",
	"MMG_01_hex_ACRO_LP_F",
	"MMG_01_hex_F",
	"MMG_01_tan_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_06_olive_F"
];

_magazineCargo = [
    "HandGrenade",
    "SmokeShellBlue"
];


//Populate with predefined items and whatever is already in the crate
[_crate,(_availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,(_availableHeadgear + _availableUniforms + _availableVests + _availableItems)] call BIS_fnc_addVirtualItemCargo;
[_crate,(magazineCargo _crate) + _magazineCargo] call BIS_fnc_addVirtualMagazineCargo;
[_crate,(_availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;