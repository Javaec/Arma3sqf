/*
	Author: Karel Moricky

	Description:
	Generate Lat and Long fields from UTM Zone, Easting and Northing. It uses NAD83 constants.
	Author: Based on VBScript by Andrew Pratt

	Parameter(s):
	_this select 0: NUMBER - Northing
	_this select 1: NUMBER - Easting
	_this select 2: NUMBER - Zone
	_this select 3 (Optional): STRING - Hemisphere ("N" or "S")

	Returns:
	ARRAY - [longtitude,latitude]
*/
private ["_posX","_posY","_zone","_hemisphere","_a","_b","_f","_rm","_n","_K0","_e1","_C1","_C2","_C3","_C4","_A0","_B0","_C0","_D0","_H3","_I3","_J3","_K3","_K3sin","_L3","_L3sin","_M3","_N3","_O3","_P3","_Q3","_R3","_S3","_T3","_U3","_V3","_W3","_X3","_Y3","_Z3","_AA3","_lat","_lon"];

_posX =		[_this,0,0,[0]] call bis_fnc_param;
_posY =		[_this,1,0,[0]] call bis_fnc_param;
_zone =		[_this,2,0,[0]] call bis_fnc_param;
_hemisphere =	[_this,3,"N",[""]] call bis_fnc_param;

_a = 6378137;
_b = 6356752.3142;
_f = 1 / 298.257223563;
_rm = 6367435.68;
_n = (_a - _b) / (_a + _b);
_K0 = 0.9996;
_e = sqrt(1 - (_b / _a)^2);
_e1sq = 0.006739496756587;
_e2 = _e * _e / (1 - _e * _e);
_K0 = 0.9996;
_e1 = (1 - (1 - _e * _e)^(1 / 2)) / (1 + (1 - _e * _e)^(1 / 2));
_C1 = 3 * _e1 / 2 - 27 * _e1^3 / 32;
_C2 = 21 * _e1^2 / 16 - 55 * _e1^4 / 32;
_C3 = 151 * _e1^3 / 96;
_C4 = 1097 * _e1^4 / 512;
_A0 = _a * (1 - _n + (5 * _n * _n / 4) * (1 - _n)  + (81 * _n^4 / 64) * (1 - _n));
_B0 = (3 * _a * _n / 2) * (1  -  _n  -  (7 * _n * _n / 8) * (1 - _n)  +  55 * _n^4 / 64);
_C0 = (15 * _a * _n * _n / 16) * (1  -  _n  + (3 * _n * _n / 4) * (1 - _n));
_D0 = (35 * _a * n^3 / 48) * (1  -  _n  +  11 * _n * _n / 16);
_E0 = (315 * _a * _n^4 / 51) * (1 - _n);
_H3 = if (_hemisphere == "N") then {_posX} else {10000000 - _posX};
_I3 = 500000 - _posY;
_J3 = _posX / _k0;
_K3 = _J3 / (_a * (1 - _e^2 / 4 - 3 * _e^4 / 64 - 5 * _e^6 / 256));
_K3sin = _K3 / (pi / 180);
_L3 = _K3 + _C1 * SIN(2 * _K3sin) + _C2 * SIN(4 * _K3sin) + _C3 * SIN(6 * _K3sin) + _C4 * SIN(8 * _K3sin);
_L3sin = _L3 / (pi / 180);
_M3 = _e1sq * (COS(_L3sin)^2);

_N3 = TAN(_L3sin)^2;
_O3 = _a / (1 - (_e * SIN(_L3sin))^2)^(1 / 2);
_P3 = _a * (1 - _e * _e) / (1 - (_e * SIN(_L3sin))^2)^(3 / 2);
_Q3 = _I3 / (_O3 * _k0);
_R3 = _O3 * TAN(_L3sin) / _P3;
_S3 = _Q3 * _Q3 / 2;
_T3 = (5 + 3 * _N3 + 10 * _M3 - 4 * _M3 * _M3 - 9 * _e1sq) * _Q3^4 / 24;
_U3 = (61 + 90 * _N3 + 298 * _M3 + 45 * _N3 * _N3 - 252 * _e1sq - 3 * _M3 * _M3) * _Q3^6 / 720;
_V3 = _Q3;
_W3 = (1 + 2 * _N3 + _M3) * _Q3^3 / 6;
_X3 = (5 - 2 * _M3 + 28 * _N3 - 3 * _M3^2 + 8 * _e1sq + 24 * _N3^2) * _Q3^5 / 120;
_Y3 = (_V3 - _W3 + _X3) / COS(_L3sin);
_Z3 = 6 * _zone - 183;
_AA3 = 180 * (_L3 - _R3 * (_S3 + _T3 + _U3)) / pi;
_lat = if (_hemisphere == "N") then {_AA3} else {-_AA3};
_lon = _Z3 - _Y3 * 180 / pi;

[_lon,_lat];