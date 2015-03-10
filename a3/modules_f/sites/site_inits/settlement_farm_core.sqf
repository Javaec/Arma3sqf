_pos = position (_this select 0);
_activeSite = _this select 0;

_farmerMax = (floor random 2) + 1;
_activeSite setVariable ["farmers",_farmerMax];
_farmers = 0;
_dist = 40;

while {_farmerMax > _farmers} do {
	_posRandom = [((_pos select 0) - _dist/2) + random _dist,((_pos select 1) - _dist/2) + random _dist,0];
	_civPos = [_posRandom,_activeSite,"C_man_w_farmer_1_F"];
	BIS_siteCivPos = BIS_siteCivPos + [_civPos];
	_farmers = _farmers + 1;
};