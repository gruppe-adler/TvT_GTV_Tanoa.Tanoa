

[radio] execVM "ambient\sound.sqf";
[radio2] execVM "ambient\sound2.sqf";

enableSaving [false,false];

firstspawn = false;
[arsenal_blufor] execVM "loadouts\virtual_arsenal_init_blufor.sqf";
[arsenal_opfor] execVM "loadouts\virtual_arsenal_init_opfor.sqf";
cameraOldPimped = compile preprocessFile "spectator\cameraOld_rip.sqf";

[] execVM "CSSA3\CSSA3_init.sqf";
call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
//Execute scripts




[[
  ["rogaintask","Kraftwerk besichtigen","Unser Auftraggeber möchte die neue Kraftwerk besichtigen.",blufor],
  ["generaltask","Bürgermeister besuchen","Der Bürgermeister der Insel soll im Kampf gegen die Rebellen unterstürzt werden. Unser Auftraggeber möchte Ihn besuchen.",blufor],
  ["docktask","Dialog auf Friedhof","Der VIP möchte mit Angehörigen der Opfer des Drogenkrieges sprechen.",blufor],
  ["helitask","Plantage besichtigen","Die Zielperson möchte eine örtliche Maisplantage begutachten",blufor],
  ["killviptask","Eliminiert den Polizeipräsidenten","Unser Auftrag ist den Präsidenten auszuschalten.",opfor]
],[
  ["Credits","Mission by XiviD
  <br />SHK_TASKMASTER 2 Made by: Shuko of LDD Kyllikki"]
]] execvm "shk_taskmaster.sqf";


CUL_fn_end = {
	// called with 0 = [[[WEST],"END1","END MESSAGE"],"CUL_fn_end"] spawn	BIS_fnc_MP
	private ["_type","_win"];
	if (!isDedicated) then {
		player addEventHandler ["Fired",{deleteVehicle (_this select 6)}];
		_win = ((side player) in (_this select 0));
		_type = (_this select 1);
		player switchMove "amovpercmstpslowwrfldnon";
		cutText [(_this select 2),"PLAIN DOWN"];
	}else {_win = true; _type = _this select 1};
	 [_type,_win,[true,10]] call BIS_fnc_endMission;
};

waitUntil {isDedicated || !isNull player};

if (!isDedicated) then {
	[] execVM "initplayer.sqf";
};

if (isServer) then {
	[] execVM "initserver.sqf";
};



	// Intro Gruppe Adler

	titleCut ["", "BLACK FADED", 999];
	[] Spawn {

	titleText ["","PLAIN"];
	titleFadeOut 1;
	sleep 2;

	titleCut ["", "BLACK IN", 1];

	waitUntil {time > 3};
		["<img size= '6' shadow='false' image='Pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Guard the VIP</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
	};



