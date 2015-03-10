// Hotfix to disable loading/restarting if required by BIS_fnc_cinemaBorder
onPauseScript[] = {BIS_fnc_disableLoading};

class CfgFunctions
{
	class A3_Bootcamp
	{
		tag = "BIS";
		class Conversations
		{
			file = "A3\Missions_F_Bootcamp\Campaign\Functions\Conversations";
			
			class kbTellSync	{};
		};
		
		class GUI
		{
			file = "A3\Missions_F_Bootcamp\Campaign\Functions\GUI";
			
			class SITREP		{};
		};
		
		class Init
		{
			file = "A3\Missions_F_Bootcamp\Campaign\Functions\Init";
			
			class initFF		{postInit = 1;};
			class initInsignias	{postInit = 1;};
			class initKilled	{postInit = 1;};
			class initMarkers	{preInit = 1;};
		};
		
		class Scenes
		{
			file = "A3\Missions_F_Bootcamp\Campaign\Functions\Scenes";
			
			class deleteScene	{};
			class loadScene		{};
			class saveScene		{};
			class setSceneInit	{};
		};
		
		class Zone_Restriction
		{
			file = "A3\Missions_F_Bootcamp\Campaign\Functions\Zone_Restriction";
			
			class ZR		{postInit = 1;};
			class ZRPunish		{};
			class ZRWarn		{};
		};
	};
};