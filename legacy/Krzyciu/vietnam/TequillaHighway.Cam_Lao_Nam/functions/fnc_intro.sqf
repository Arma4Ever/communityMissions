#include "script_component.hpp"

LOG("intro");

[false] call a3cs_ui_fnc_toggleScreenshotMode;
0 fadeSound 0;

with localNamespace do
{
   private _ctrl = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", -1];
   _ctrl ctrlSetPosition [(safeZoneX + (safeZoneWAbs/ 2)- 1.22),(safeZoneY + (safeZoneH/2)+0.835),0.07,0.07];
   _ctrl ctrlSetText "data\loadingCircle.paa";
   _ctrl ctrlCommit 0;
   _ctrl spawn {
     params ["_ctrl"];
     sleep 32;
     ctrlDelete _ctrl;
   };
   localNamespace setVariable ["Krzyc_angle", 0];
   localNamespace setVariable ["Krzyc_ctrl", _ctrl];
   onEachFrame
   {
    with localNamespace do
    {
     if (Krzyc_angle > 359) then {Krzyc_angle = 0};
     Krzyc_ctrl ctrlSetAngle [Krzyc_angle, 0.5, 0.5];
     Krzyc_angle = Krzyc_angle + 0.5;
    };
   };
};

cutText ["", "BLACK FADED", 999];
sleep 4;
// Ekran tworzenia obiektów mapy
titleText ["<t size='1.4' color='#9abf9a'>Wczytywanie...</t>", "PLAIN DOWN", -1, false, true];
waitUntil {
  sleep 0.1;
  private _status = missionNamespace getVariable ["a3cs_modules_3DENCompObjectsSpawn", [false]];
  _status # 0
};
waitUntil {
  sleep 0.25;
  private _status = missionNamespace getVariable ["a3cs_modules_3DENCompObjectsSpawn", [false, 0, 0, false]];
  private _counter = _status # 1;
  private _count = _status # 2;
  if (_count > 0) then {
    private _percent = floor ((_counter / _count) * 100);
    titleText [format [
      "<t color='#9abf9a'><t size='1.4'>%5</t><br/><t size='1.6'>%1%2</t><br/>%3/%4</t>",
      _percent,
      "%",
      _counter,
      _count,
      LLSTRING(Intro_CreatingObjs)
    ], "PLAIN DOWN", 0.001, false, true];
    titleFadeOut 9999;
  };
  _status # 3
};

titleText ["<t size='1.4' color='#9abf9a'>Synchronizacja...</t>", "PLAIN DOWN", -1, false, true];
sleep 5;
//2x wyświetlenie tekstu na środku ekranu//
titleText [LLSTRING(Intro_2), "PLAIN",-1,true,true];
sleep 5;
titleFadeOut 2;
sleep 3;
titleText [LLSTRING(Intro_3), "PLAIN",-1,true,true];
sleep 5;
playMusic "vn_trippin";
10 fadeSound 1;
titleFadeOut 2;
sleep 2;
//Wyświetlenie loga army/a3c//
titleText ["","BLACK OUT",2];
2 cutRsc ["SplashArma3","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutRsc ["RscLogoA","BLACK",0.01];
titleText ["","BLACK IN",3];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 2;
2 cutFadeOut 0;
titleText ["","BLACK IN",10];
sleep 3;
onEachFrame{};
0 spawn {
    private _w = 2.42;
    private _h = 0.25;
    private _unitData = [player, false] call a3cs_nametags_fnc_getUnitData;
    date params ["", "", "", "_hour", "_minute"];

    [
        [
            [(_unitData #2 + " " + _unitData #1)],
            [LLSTRING(Intro_4)],
            [format ["%1  %2%3%4:%5",LLSTRING(Intro_5), ["0", ""] select (_hour >= 10), _hour, ["0", ""] select (_minute >= 10), _minute]],
            [LLSTRING(Intro_6)]
        ],
        [safeZoneX + safeZoneW - _w, _w],
        [safeZoneY + safeZoneH - _h - 0.05, _h]
    ] spawn FUNC(typeText);
};

sleep 12;
cutText ["","BLACK IN", 18];
