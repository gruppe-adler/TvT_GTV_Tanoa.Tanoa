CUL_fn_Equip = {
	removeHeadGear player;
	removeVest player;
	removeUniform player;
	player unassignItem "NVGoggles";
	player removeItem "NVGoggles";
	removeAllWeapons player;
	if (backpack player != "") then {removeBackPack player};
	switch (side player) do {
		case blufor: {
			"respawn_east" setmarkeralphalocal 0;
			if (str player != "vip") then {
				(group player) setGroupID  ["Team Shield"];

				if ((str player) in ["s1","s2","s3","s4","s5","s6"]) then {
					player linkItem "ItemGPS";

					player addUniform "rds_uniform_Functionary1";
					player addHeadGear "";
					player addVest "ARC_Common_Blk_PlateCarrier_1";
					player addMagazine "HandGrenade";
					player addWeapon "rhs_weap_hk416d10_grip3";
					player addPrimaryWeaponItem "ACE_muzzle_mzls_L";
					player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
					player addPrimaryWeaponItem "rhsusf_acc_grip3";
					for "_i" from 1 to 6 do {player additemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag"};


				}else{
					player addUniform "rds_uniform_Functionary1";
					player addHeadGear "";
					player addVest "ARC_Common_Blk_PlateCarrier_1";
					player addWeapon "rhs_weap_hk416d10_grip3";
					player addPrimaryWeaponItem "ACE_muzzle_mzls_L";
					player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
					player addPrimaryWeaponItem "rhsusf_acc_grip3";
					for "_i" from 1 to 6 do {player additemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag"};

				};
			}else{
					player linkItem "ItemGPS";

					player forceAddUniform "U_B_GEN_Commander_F";
					player addHeadGear "H_Beret_gen_F";
					player addVest "LOP_V_Carrier_BLK";
					for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};

					for "_i" from 1 to 4 do {player addItemToVest "AGM_Bandage";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_Morphine";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_Epipen";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_CableTie";};
					for "_i" from 1 to 8 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};

					player addGoggles "rhs_googles_black";
					player addWeapon "rhsusf_weap_glock17g4";
					player addWeapon "Binocular";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "tf_anprc152";
					player linkItem "ItemGPS";

					[] spawn {
					while {alive player} do {
							waitUntil {uniform player != "U_B_GEN_Commander_F" || headGear player != "H_Beret_gen_F" || vest player != "LOP_V_Carrier_BLK"};
							{deleteVehicle _x} forEach (nearestObjects[player,["WeaponHolder"],3]);
							removeHeadGear player;
							removeVest player;
							removeUniform player;
							player addUniform "U_B_GEN_Commander_F";
							player addHeadGear "H_Beret_gen_F";
							player addVest "LOP_V_Carrier_BLK";
							};
					};
			};
		};
		case opfor: {
			//"respawn_west" setmarkeralphalocal 0;
			{_x setMarkerColorLocal "ColorRed"; _x setMarkerTextLocal " VIP eliminieren"}forEach ["helimark","rogainmark","generalmark","dockmark"];
			{_x setMarkerTextLocal " VIP eliminieren"}forEach ["helimark","rogainmark"];
			player addUniform "U_I_C_Soldier_Bandit_5_F";
			player addVest "ARC_Common_OD_BandollierB_rgr";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "ItemGPS";
			player linkItem "ItemWatch";


		};
		default {};
	};



};
[] call CUL_fn_Equip;

player addEventHandler ["Respawn",{
	(_this select 1) spawn {
		sleep 3;
		hidebody _this;
		sleep 5;
		deleteVehicle _this;
	};
	[] spawn CUL_fn_Equip;
}];

waitUntil {time > 0};
player switchMove "amovpercmstpslowwrfldnon";

[] execVM "markAssassins.sqf";
[] execVM "markBlufor.sqf";