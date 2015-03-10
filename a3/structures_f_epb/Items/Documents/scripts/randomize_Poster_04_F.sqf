// Load a random color version for Poster_04_F

// Generate random number 0-4
if (isServer) then {
	_rnd1 = floor random 5;
	_this setVariable ["BIS_randomSeed1", _rnd1, TRUE];
};

// Once the variable is available...
waitUntil {!(isNil {_this getVariable "BIS_randomSeed1"})};
_randomSeed1 = _this getVariable "BIS_randomSeed1";

// ...load the generated version
_this setObjectTexture [0, ["\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v1_CO.paa", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v2_CO.paa", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v3_CO.paa", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v4_CO.paa", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v5_CO.paa"] select _randomSeed1];
_this setObjectMaterial [0, ["\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v1.rvmat", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v2.rvmat", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v3.rvmat", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v4.rvmat", "\a3\Structures_F_EPB\Items\Documents\Data\Poster_04_v5.rvmat"] select _randomSeed1];