_radio = _this select 0;



[_radio] spawn {

_obj = _this select 0;

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "ambient\Ambience.ogg";

while {alive _obj} do {    

        
    playSound3D [_soundToPlay, _obj, false, getPosASL _obj, 10, 1, 100];    
    sleep 155;   
};
};