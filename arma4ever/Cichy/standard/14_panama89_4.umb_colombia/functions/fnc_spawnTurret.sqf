#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns static turrets
 */

params ["_type"];

if !(_type in [
  "RHS_M2StaticMG_MiniTripod_WD",
  "RHS_TOW_TriPod_WD",
  "RHS_M252_WD"

   
]) exitWith {};

private _turret = _type createVehicle [19650.668,10194,0];

