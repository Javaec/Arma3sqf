if (isserver) then {
	if (isnil "bis_genericSentenceChannel") then {
		bis_genericSentenceChannel = radioChannelCreate [
			[0.8,0.8,0.8,0.8],
			"Generic Sentence",
			"%UNIT_NAME",
			[]
		];
		publicvariable "bis_genericSentenceChannel";
	};

	if (isnil "bis_genericSentenceMode") then {
		bis_genericSentenceMode = 1;
		publicvariable "bis_genericSentenceMode";
	};
};