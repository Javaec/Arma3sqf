/*
	Author: Karel Moricky

	Description:
	Generate a UTM Zone, Easting and Northing from lat and long fields. It uses NAD83 constants.
	Author: Based on VBScript by Andrew Pratt

	Parameter(s):
	_this select 0: NUMBER - longtitude (X)
	_this select 1: NUMBER - latitude (Y)
	_this select 2 (Optional): NUMBER - forced zone

	Returns:
	ARRAY - [easting,northing,zone]
*/

private ["_lat","_lon","_zone","_sin1","_a","_b","_f","_rm","_n","_k0","_e1sq","_e","_e2","_a0","_b0","_c0","_d0","_e0","_o2","_p2","_q2","_r2","_s2","_t2","_v2","_x2","_y2","_z2","_aa2","_ab2","_ac2","_ad2","_northing","_easting","_zone"];

//--- Input
_lon = [_this,0,0,[0]] call bis_fnc_param;
_lat = [_this,1,0,[0]] call bis_fnc_param;
_zone = [_this,2,31 + floor(_lon / 6),[0]] call bis_fnc_param;

//--- Constants
_sin1 = pi / (180 * 3600);
_a = 6378137;
_b = 6356752.314;
_f = 0.003352811;
_rm = 6367435.68;
_n = (_a - _b) / (_a + _b);
_K0 = 0.9996;
_e1sq = 0.006739497;
_e = sqrt(1 - (_b / _a)^2);
_e2 = _e * _e / (1 - _e * _e);
_A0 = _a * (1 - _n + (5 * _n * _n / 4) * (1 - _n) + (81 * _n^4 / 64) * (1 - _n));
_B0 = (3 * _a * _n / 2) * (1 - _n - (7 * _n * _n / 8) * (1 - _n) + 55 * _n^4 / 64);
_C0 = (15 * _a * _n * _n / 16) * (1 - _n + (3 * _n * _n / 4) * (1 - _n));
_D0 = (35 * _a * _n^3 / 48) * (1 - _n + 11 * _n * _n / 16);
_E0 = (315 * _a * _n^4 / 51) * (1 - _n);

//--- Calculate
_O2 = (6 * _zone) - 183;
_P2 = (_lon - _O2) * 3600 / 10000;
_Q2 = _lat;// * pi / 180;
_R2 = _lon;// * pi / 180;
_S2 = _a * (1 - _e * _e) / ((1 - (_e * sin(_Q2))^2)^(3 / 2));
_T2 = _a / ((1 - (_e * sin(_Q2))^2)^(1 / 2));
_V2 = _A0 * (_Q2 * pi / 180) - _B0 * sin(2 * _Q2) + _C0 * sin(4 * _Q2) - _D0 * sin(6 * _Q2) + _E0 * sin(8 * _Q2);
_X2 = _V2 * _k0;
_Y2 = _T2 * sin(_Q2) * cos(_Q2) * _sin1^2 * _k0 * (100000000) / 2;
_Z2 = ((_sin1^4 * _T2 * sin(_Q2) * cos(_Q2)^3) / 24) * (5 - tan(_Q2)^2 + 9 * _e1sq * cos(_Q2)^2 + 4 * _e1sq^2 * cos(_Q2)^4) * _k0 * (10000000000000000);
_AA2 = _T2 * cos(_Q2) * _sin1 * _k0 * 10000;
_AB2 = (_sin1 * cos(_Q2))^3 * (_T2 / 6) * (1 - tan(_Q2)^2 + _e1sq * cos(_Q2)^2) * _k0 * (1000000000000);
_AC2 = ((_P2 * _sin1)^6 * _T2 * sin(_Q2) * cos(_Q2)^5 / 720) * (61 - 58 * tan(_Q2)^2 + tan(_Q2)^4 + 270 * _e1sq * cos(_Q2)^2 - 330 * _e1sq * sin(_Q2)^2) * _k0 * (1E+24);
_AD2 = (_X2 + _Y2 * _P2 * _P2 + _Z2 * _P2^4);

//--- Result
_Northing = If (_AD2 < 0) then {
	10000000 + _AD2;
} else {
	_AD2;
};
_Easting = 500000 + (_AA2 * _P2 + _AB2 * _P2^3);
_Zone = _zone;

[_Easting,_Northing,_Zone]