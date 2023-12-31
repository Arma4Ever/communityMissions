// by ALIAS

private ["_leak_obj","_damag","_unghi","_gas_pressure","_press_implicit_x","_press_implicit_y","_gas_pressure","_eco_obj","_radius"];

if (!hasInterface) exitWith {};

private _leak_obj	= _this select 0;
private _unghi		= _this select 1;
private _damag		= _this select 2;
private _color 		= _this select 3;
// teak the array below to change the color of the smoke [R,G,B]

_gas_pressure = 0.1;
_radius = 5;

_unghi_x_waterfall = getdir _leak_obj;

if (_unghi_x_waterfall<=90) then {_press_implicit_x = linearConversion [0, 90,_unghi_x_waterfall, 0, 1, true];_press_implicit_y = 1-_press_implicit_x};
if ((_unghi_x_waterfall>90)and(_unghi_x_waterfall<180)) then {_unghi_x_waterfall = _unghi_x_waterfall-90;_press_implicit_x = linearConversion [0, 90,_unghi_x_waterfall, 1, 0, true];_press_implicit_y = _press_implicit_x-1};
if ((_unghi_x_waterfall>180)and(_unghi_x_waterfall<270)) then {_unghi_x_waterfall = _unghi_x_waterfall-180;_press_implicit_x = linearConversion [0, 90,_unghi_x_waterfall, 0, -1, true];_press_implicit_y = (-1*_press_implicit_x)-1};
if ((_unghi_x_waterfall>270)and(_unghi_x_waterfall<360)) then {_unghi_x_waterfall = _unghi_x_waterfall-270;_press_implicit_x = linearConversion [0, 90,_unghi_x_waterfall, -1, 0, true];_press_implicit_y = 1+_press_implicit_x};

while {!isNull _leak_obj} do
{
	waitUntil {sleep 2; (player distance _leak_obj < 1000)};
	enableCamShake true;
	_eco_obj  =  "Land_HelipadEmpty_F" createVehiclelocal (getposasl _leak_obj);
	_gas_leak = "#particlesource" createVehicleLocal (getPos _leak_obj);
	_gas_leak setParticleCircle [0, [0, 0, 0]];
	_gas_leak setParticleRandom [0.1, [0.01, 0.01, 0.01], [0, 0, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
	_gas_leak setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 0.3, [0, 0, 0],[_press_implicit_x*_gas_pressure,_press_implicit_y*_gas_pressure,_unghi], 3, 10, 7.9, 0, [0.2, 0.5, 1], [[_color select 0,_color select 1,_color select 2,1], [_color select 0,_color select 1,_color select 2, 1], [_color select 0,_color select 1,_color select 2, 0]], [0.08], 0, 0, "", "", _leak_obj];
	_gas_leak setDropInterval 0.1;

	_cloud_gas = "#particlesource" createVehicleLocal (getPos _leak_obj);
	_cloud_gas setParticleCircle [0, [0, 0, 0]];
	_cloud_gas setParticleRandom [1,[0.5,0.5,0.5],[0,0,0],0,0.5,[0,0,0,0.1],1,0];
	_cloud_gas setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,10, [0, 0, 0],[_press_implicit_x*1.5,_press_implicit_y*1.5,0],3,10,7.9,1,[1,3,5], [[_color select 0,_color select 1,_color select 2, 0], [_color select 0,_color select 1,_color select 2,0.3], [_color select 0,_color select 1,_color select 2,0]], [0.08], 0, 0, "", "", _leak_obj];
	_cloud_gas setDropInterval 0.5;


	_hiss_sound = ["gas_1","gas_2","gas_3","gas_4","gas_9"] call BIS_fnc_selectRandom;
	while {player distance _leak_obj < 150} do
	{
		_leak_obj say3D [_hiss_sound, 100];
		_eco_obj say3D ["fundal_gas",50];
		sleep 6;
	};
	deleteVehicle _gas_leak;
	deleteVehicle _cloud_gas;
	deleteVehicle _eco_obj;
};
