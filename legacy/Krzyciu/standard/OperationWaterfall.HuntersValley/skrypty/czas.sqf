_playtime = _this;

_h = (_playtime-(_playtime % 1));
_m = ((_playtime % 1)*60)-((_playtime % 1)*60) % 1;
_s = (((_playtime % 1)*3600)-((_playtime % 1)*3600) % 1) - (_m*60);
_hh = "";
if (_h < 10) then {_hh = "0"};
_mm = "";
if (_m < 10) then {_mm = "0"};
_ss = "";
if (_s < 10) then {_ss = "0"};
_playtimeHMS = format ["%1%2:%3%4:%5%6",_hh,_h,_mm,_m,_ss,_s];
_playtimeHMS;