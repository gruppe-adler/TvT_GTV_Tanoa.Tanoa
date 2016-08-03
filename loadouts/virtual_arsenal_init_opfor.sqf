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
	"H_CAF_AG_TURBAN",
	"H_CAF_AG_PAKTOL",
	"H_CAF_AG_PAKTOL_01",
	"H_CAF_AG_PAKTOL_02",
	"H_CAF_AG_PAKTOL_03",
	"H_CAF_AG_WRAP",
	"H_CAF_AG_FUR",
	"H_CAF_AG_FUR2",
	"H_CAF_AG_BEANIE",
	"H_CAF_AG_BOONIE_01",
	"H_CAF_AG_BOONIE_02",
	"H_Watchcap_cbr",
	"H_Shemag_olive_hs",
	"H_Hat_camo",
	"H_Watchcap_blk"
];



_availableItems = [
	"AGM_Earbuds",
	"tf_fadak",
	"G_Squares_Tinted",
	"G_Aviator",
	"G_Spectacles_Tinted",
	"G_Spectacles",
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"G_Bandanna_tan",
	"G_Bandanna_oli",
	"SMA_eotech552_3XDOWN",
	"SMA_eotech552_3XDOWN_des",
	"SMA_eotech552_3XDOWN_wdl",
	"FHQ_acc_LLM01L",
	"AGM_Morphine",
	"AGM_Bandage",
	"AGM_Epipen",
	"AGM_Bloodbag",
	"AGM_CableTie",
	"ItemMap",
	"ItemCompass",
	"AGM_CableTie",
	"AGM_MapTools",
	"HandGrenade",
	"SmokeShellBlue",
	"SmokeShellRed",
	"AGM_Clacker",
	"AGM_DefusalKit"

];

_availableBackpacks = [
	"B_Carryall_mcamo",
	"B_AssaultPack_dgtl",
	"B_Carryall_cbr",
	"B_AssaultPack_khk"
];

_availableVests = [
    "V_TacVest_khk",
    "V_TacVest_oli",
    "V_I_G_resistanceLeader_F"
];

_availableUniforms = [
	"U_CAF_AG_EEUR_FATIGUES_01",
	"U_CAF_AG_EEUR_FATIGUES_01a",
	"U_CAF_AG_EEUR_FATIGUES_02",
	"U_CAF_AG_EEUR_FATIGUES_02a",
	"U_CAF_AG_EEUR_FATIGUES_03",
	"U_CAF_AG_EEUR_FATIGUES_03a",
	"U_CAF_AG_EEUR_FATIGUES_03b",
	"U_CAF_AG_EEUR_FATIGUES_03c",
	"U_OG_Guerilla1_1",
	"U_OG_Guerilla2_1",
	"U_OG_Guerilla2_3",
	"U_OG_Guerilla3_1",
	"U_OG_Guerilla3_2",
	"U_OG_leader",
    "U_CAF_AG_ME_ROBES_01",
	"U_CAF_AG_ME_ROBES_01a",
	"U_CAF_AG_ME_ROBES_01b",
	"U_CAF_AG_ME_ROBES_01c",
	"U_CAF_AG_ME_ROBES_01d",
	"U_CAF_AG_ME_ROBES_02",
	"U_CAF_AG_ME_ROBES_02a",
	"U_CAF_AG_ME_ROBES_02b",
	"U_CAF_AG_ME_ROBES_02c",
	"U_CAF_AG_ME_ROBES_02d",
	"U_CAF_AG_ME_ROBES_03",
	"U_CAF_AG_ME_ROBES_03a",
	"U_CAF_AG_ME_ROBES_03b",
	"U_CAF_AG_ME_ROBES_03c",
	"U_CAF_AG_ME_ROBES_03d",
	"U_CAF_AG_ME_ROBES_04",
	"U_CAF_AG_ME_ROBES_04a",
	"U_CAF_AG_ME_ROBES_04b",
	"U_CAF_AG_ME_ROBES_04c",
	"U_CAF_AG_ME_ROBES_04d",
	"U_CAF_AG_ME_ROBES_mil_01",
	"U_CAF_AG_ME_ROBES_mil_01a"
];

_availableWeapons = [
	"hlc_rifle_ak12",
	"hlc_rifle_aku12",
	"hlc_rifle_ak47",
	"hlc_rifle_ak74",
	"hlc_rifle_ak74_dirty",
	"hlc_rifle_akm",
	"hlc_rifle_aks74",
	"hlc_rifle_aks74u",
	"hlc_rifle_aek971",
	"Binocular",
	"hgun_P07_F",
	"hgun_Rook40_F",
	"srifle_DMR_06_olive_F",
	"hgun_PDW2000_F"
];

_magazineCargo = [
    "HandGrenade",
    "SmokeShellRed"
];

[_crate,(_availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,(_availableHeadgear + _availableUniforms + _availableVests + _availableItems)] call BIS_fnc_addVirtualItemCargo;
[_crate,(magazineCargo _crate) + _magazineCargo] call BIS_fnc_addVirtualMagazineCargo;
[_crate,(_availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;
