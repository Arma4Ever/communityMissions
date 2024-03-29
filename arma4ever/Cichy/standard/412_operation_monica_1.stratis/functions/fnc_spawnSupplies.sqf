#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns supplies boxes
 */

params ["_type"];

if !(_type in ["ammo", "medical","ammoMortar","ammoMortar120"]) exitWith {};

private _class = "";
private _items = [];

if (_type isEqualTo "ammo") then {
  _class = "Box_NATO_Ammo_F";
  _items = [
    ["BWA3_30Rnd_556x45_G36_Tracer", 40],
    ["BWA3_30Rnd_556x45_G36_AP", 40],
    ["BWA3_120Rnd_762x51_Tracer_soft", 10],
    ["BWA3_120Rnd_762x51_soft", 10],
    ["BWA3_200Rnd_556x45_Tracer", 15],
    ["1Rnd_SmokeYellow_Grenade_shell", 5],
    ["1Rnd_Smoke_Grenade_shell", 5],
    ["1Rnd_SmokeRed_Grenade_shell", 5],
    ["1Rnd_SmokeBlue_Grenade_shell", 5],
    ["HandGrenade", 10],
    ["SmokeShell", 10],
    ["SmokeShellGreen", 10],
    ["SmokeShellRed", 4],
    ["rhs_mag_M441_HE", 20],
    ["BWA3_PzF3_Tandem_Loaded", 2]
  ];
};
if (_type isEqualTo "medical") then {
  _class = "ACE_medicalSupplyCrate_advanced";
  _items = [
    ["ACE_fieldDressing", 100],
    ["ACE_packingBandage", 100],
    ["ACE_elasticBandage", 100],
    ["ACE_tourniquet", 15],
    ["ACE_splint", 15],
    ["ACE_morphine", 15],
    ["ACE_adenosine", 15],
    ["ACE_epinephrine", 15],
    ["ACE_salineIV", 8],
    ["ACE_salineIV_500", 8],
    ["ACE_quikclot", 20],
    ["ACE_personalAidKit", 8],
    ["ACE_bodyBag", 5],
    ["A4ES_painkillers", 50]
  ];
};
if (_type isEqualTo "ammoMortar") then {
  _class = "Box_NATO_Support_F";
  _items = [
    ["ACE_1Rnd_82mm_Mo_HE", 8],
    ["ACE_1Rnd_82mm_Mo_Smoke", 3]
  ];
};
if (_type isEqualTo "ammoMortar120") then {
  _class = "Box_NATO_Support_F";
  _items = [
    ["BWA3_1Rnd_120mm_Mo_shells", 8],
    ["BWA3_1Rnd_120mm_Mo_dpz_shells", 8],
    ["BWA3_1Rnd_120mm_Mo_Smoke_white", 3]
  ];
};

if (_class isEqualTo "") exitWith {};

private _box = _class createVehicle [6422.956,5393.491,0];

{
  _x addCuratorEditableObjects [[_box], true];
} forEach allCurators;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;
_box setMaxLoad 99999;

{_box addItemCargoGlobal _x} forEach _items;

[_box, 4] call ace_cargo_fnc_setSize;
