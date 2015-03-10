/*
This script is used for randomizing headgear and facewear of a character.

If a character shall have randomized headgear and facewear, its class needs following parameters:

headgearProbability		number [0..100]		If one type of headgear is preferred, this is a probability of the preferred type of headgear to be selected. In case of no preference, use 100.
allowedHeadgear			array				List of (preferred) headgear to be randomized.
allowedHeadgearB		array				List of other headgear to be randomized in the case when the preferred type is not selected during randomization. In case of no preference, this parameter is not used.

The headgear used for randomization needs the following parameter in its class:

allowedFacewear			array				List of facewear which can be used with the particular headgear.

The script randomly decides which array of headgear is used. Then it randomly selects one of the headgear from previously selected array and gives it to the character class where the script is used.
Once the headgear is decided, the scripts randomly selects one of the compatible facewear and gives it to the character.
*/

 if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {}; // If the parameter is not true, the script won't run. This enables a possibility to disable randomization for mission characters.

_headgearProbability = getnumber (configFile >> "cfgvehicles" >> typeof _this >> "headgearProbability"); // Gets the number from headgearProbability parameter in a character class.

_headgearRandomize = floor random 100; // Gets a random number.

_headgear = {};

if (_headgearRandomize <= _headgearProbability) then
{
	_headgear = getarray (configFile >> "cfgvehicles" >> typeof _this >> "allowedheadgear"); // If the random number doesn't exceed headgearProbability, a character gets one of his dominant headgear.
}
else
{
	_headgear = getarray (configFile >> "cfgvehicles" >> typeof _this >> "allowedheadgearB"); // If the random number exceeds headgearProbability, one of the rest of the headgear is used.
}; // Both from above load an array of headgear classes into headgear variable.

_headCount = count _headgear; // Gets the number of headgear in the array.

if (isServer) then
{
	_headSelected = "";
	
	_rnd1 = random _headCount; // Gets a random number up to the number of headgear in the array. No floor here because it messes up the case with an array containing only one item.
	if (_rnd1 > 0) then
	{
		_headSelected = _headgear select floor _rnd1; // Selects a random headgear from the array.
		_this addHeadgear (_headSelected); // Adds selected headgear to a character.
	}
	else
	{
		_headSelected = "H_FakeHeadgear"; // Occasionally, no headgear is used.
		removeHeadgear _this; //Removes any headgear a character might have had defined in his class.
	};
	
	_facewear = getarray (configFile >> "cfgweapons" >> _headSelected >> "allowedfacewear"); // Loads an array of matching facewear defined in allowedFacewear parameter of previously selected headgear.
	_faceCount = count _facewear; // Gets the number of facewear in the array.
		
	_rnd2 = floor random _faceCount; // Gets a random number up to the number of facewear in the array.
		
	if (_rnd2 > 0) then
	{
		_this addGoggles (_facewear select _rnd2); // Selects a random facewear from the array and adds it to a character.
	}
	else
	{
		removeGoggles _this; // Occasionally, no facewear is used, so this removes any facewear a character might have had defined in his class.
	};
};