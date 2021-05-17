private _objects = 
[
	["M113Wreck",[5.0705,7.10547,0],321.661],
	["CDF_WarfareBAntiAirRadar",[8.93323,-4.03662,-5.72205e-006],0],
	["GUE_WarfareBUAVterminal",[20.0742,-7.18018,0],104.384],
	["Misc_Backpackheap",[16.3987,8.97168,0],0],
	["CampEastC",[-16.1379,-5.8501,0],90.0571],
	["CampEastC",[-16.0746,2.12109,0],90.0571],
	["CampEastC",[-16.0345,10.1299,0],90.0571],
	["Land_Wreck_T72_hull_F",[-1.40204,-13.6064,0],0]
];

{
    if (isClass (configFile >> "CfgVehicles" >> (_x select 0) )) then {
    
        _object = create3DENEntity ["Object", _x select 0, [0,0,0], true];
        _object set3DENAttribute ["position", _x select 1 ];
        _object setDir ( _x select 2 );
        _pitch_bank = _object call BIS_fnc_getPitchBank;
        _dir = getDir _object;
        _object set3DENAttribute ["rotation", [_pitch_bank select 0, _pitch_bank select 1, _dir]];

        
    }else{
    
        _object = create3DENEntity ["Object", "Sign_Arrow_Green_F", [0,0,0], true];
        _object set3DENAttribute ["position", _x select 1 ];
        _object setDir ( _x select 2 );
        _pitch_bank = _object call BIS_fnc_getPitchBank;
        _dir = getDir _object;
        _object set3DENAttribute ["rotation", [_pitch_bank select 0, _pitch_bank select 1, _dir]];
    
        _marker = create3DENEntity ["Marker","mil_dot",[(_x select 1 ) select 0,(_x select 1 ) select 1,0]];
        _marker set3DENAttribute ["Text", (_x select 0) ];
        _marker set3DENAttribute ["a", "0" ];
        _marker set3DENAttribute ["b", "0" ];
        _marker set3DENAttribute ["baseColor", "colorGreen"];
        
    
    };
} forEach _objects; 
