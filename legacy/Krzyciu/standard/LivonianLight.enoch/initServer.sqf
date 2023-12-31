CIVILIAN setFriend [WEST , 1];
CIVILIAN setFriend [EAST , 1];
CIVILIAN setFriend [INDEPENDENT , 1];



[getMarkerPos "marker_low_1", 1, 25, 75] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_1", 3, 25, 75] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_2", 3.5, 35, 65] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_1", 3.7, 3, 15] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_2", 3.7, 3, 15] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_3", 3.7, 10, 40] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_4", 3.7, 30, 120] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_5", 3.7, 200, 200] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_6", 3.7, 10, 50] call cbrn_fnc_createZone;
[getMarkerPos "marker_hard_7", 3.7, 5, 20] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_3", 2, 25, 75] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_5", 2.8, 200, 300] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_6", 2.6, 200, 300] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_7", 2.5, 200, 300] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_8", 2.8, 200, 300] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_9", 2.7, 200, 200] call cbrn_fnc_createZone;
[getMarkerPos "marker_med_10", 2.5, 60, 40] call cbrn_fnc_createZone;
[getMarkerPos "marker_low_2", 2, 200, 300] call cbrn_fnc_createZone;
[getMarkerPos "marker_low_6", 1.5, 150, 250] call cbrn_fnc_createZone;
[getMarkerPos "marker_low_7", 2.5, 25, 65] call cbrn_fnc_createZone;

{
    _x addEventHandler ["FiredNear", {
        params ["_nest"];
        if !(_nest getVariable ["active", false]) then {
            _nest setVariable ["active", true];
            _nest removeEventHandler ["FiredNear", _thisEventhandler];
            ["kruki_spawn", ["Crowe", getpos _nest,1 + (ceil random 5), 0, 29, _nest]] call CBA_fnc_globalevent;
            [{deleteVehicle _this}, _nest, 60*5] call CBA_fnc_waitAndExecute;
        };
    }];
// } forEach [crows_1,crows_2,crows_3,crows_4,crows_5,crows_6,crows_7,crows_8,crows_9,crows_10,crows_11,crows_12];
} forEach ((getMissionLayerEntities "Crow Nests")#0);

private _ambient_snds = [];
      for "_i" from 0 to 27 do {
        _ambient_snds pushback format["ambient%1",_i];
      };
      for "_i" from 0 to 10 do {
          _ambient_snds pushBack "ambient12";
          _ambient_snds pushBack "ambient13";
          _ambient_snds pushBack "ambient14";
          _ambient_snds pushBack "ambient15";
          _ambient_snds pushBack "ambient16";
          _ambient_snds pushBack "ambient17";
          _ambient_snds pushBack "ambient18";
      };
      [_ambient_snds] call Mission_fnc_ambientSounds;
