_info = [player] call a3cs_nametag_fnc_getUnitData;
_imie = _info select 0;
_ranga = _info select 1;
sleep 0.5;
cutText ["", "BLACK FADED", 999];
playmusic "Track_P_03";
[0, 0] spawn BIS_fnc_cinemaBorder;
sleep 10;
titleText ["<t font='RobotoCondensedLight' size='2'>Rok 2022 był katastrofalny dla Regionu Nadboru. Susze doprowadziły do wymarcia większości zwierząt i porzucenia dotychczasowych domów przez ludzi.</t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 0.8;
sleep 3;
titleText ["<t font='RobotoCondensedLight' size='2'>Gdy wydawało się, że dzięki przekierowaniu rzeki z głębi kraju udało się rozwiązać problem susz i położyć kres problemom, doszło do awarii Elektrowni Jądrowej Wrzeszcz I. Radioaktywny opad skaził rzekę oraz okoliczne tereny. </t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 0.8;
sleep 3;
titleText ["<t font='RobotoCondensedLight' size='2'>Gdyby tego mało nad regionem zaczęły krążyć niezidefikowane obiekty, prawdopodobnie rosyjskie samoloty. W pewnych miejscach gwałtownie zaczęło rosnąć promieniowanie. Na miejsce zostaje wysłany wojskowy zespół mający zbadać anomalie. </t>", "PLAIN",3,true,true];
sleep 6;
titleFadeOut 0.8;
sleep 4;
titleText ["","BLACK OUT",2];
2 cutRsc ["RscLogoB","BLACK",0.01];
titleText ["","BLACK IN",2];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutRsc ["RscLogoA","BLACK",0.01];
titleText ["","BLACK IN",2];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 3;
2 cutFadeOut 0;
titleText ["","BLACK IN",2];
[["Livonian Light",2,3,4],["Region Nadboru",2,3,4],["25 Lipca 2022",2,3,4],[(_ranga + " " + _imie),2,3,4]] spawn BIS_fnc_EXP_camp_SITREP;

 titleCut ["", "BLACK IN", 8];
   a3cs_nametag_displayInterrupt = false;
 "dynamicBlur" ppEffectEnable true;
 "dynamicBlur" ppEffectAdjust [6];
 "dynamicBlur" ppEffectCommit 0;
 "dynamicBlur" ppEffectAdjust [0.0];
 "dynamicBlur" ppEffectCommit 5;
sleep 16;
[1, 1] spawn BIS_fnc_cinemaBorder;
sleep 10;
