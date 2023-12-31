#include "script_component.hpp"
/*
 * XEH_postInit.sqf
 * Poniższy kod wykona się po starcie misji, gdy wykonają się już pozostałe inity.
 * Dokumentacja: https://community.bistudio.com/wiki/Arma_3:_Functions_Library#Pre_and_Post_Init
 */





  0 spawn {
      waitUntil {sleep 1; missionNamespace getVariable ["Ofensywa_rozpoczeta",false]};
      LOG("Widzialnosc 700");
        while {true} do {
          if (viewDistance > 700) then {
            setViewDistance 700;
          };
      sleep 5;
    };
  };

if (hasInterface) then {
  // Briefing
  #include "briefing.hpp"

  // Intro
  ["CBA_loadingScreenDone", {
    if (didJIP) exitWith {};
    0 spawn FUNC(intro);
  }] call CBA_fnc_addEventHandler;

  //Zmiana nazyw miasta
["1", "Sint-Niklaas"] spawn FUNC(changeCityName);
["2", "Bornem"] spawn FUNC(changeCityName);
};

// Kod wykonywany lokalnie u gracza, za każdym razem gdy dołączy do gry
if (hasInterface) then {

};

// Kod wykonywany wyłącznie na serwerze - wykonuje się tylko raz, na starcie misji
if (isServer) then {
      civilian setFriend [east, 1];
      civilian setFriend [west, 1];
};
