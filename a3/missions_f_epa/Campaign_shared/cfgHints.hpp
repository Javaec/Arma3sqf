class CfgHints
{
	class Hub
	{
		// Topic title (displayed only in topic listbox)
		displayName = $STR_A3_cfggroups_empty_guerrilla_camps;						//"Camps"

		/*
		class Default
		{
			// Hint title (displayed also in items listbox), filled by arguments from 'arguments' param
			displayName = "Stepping over obstacles";
                        // Optional hint subtitle, filled by arguments from 'arguments' param
			displayNameShort = "Stepping over obstacles";
			// Structured text, filled by arguments from 'arguments' param
			description = "Press %1 to step over low obstacle. Your %2 is %3";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %5, see notes bellow), grey color of text
                        tip = "The free look represents turning the head sideways and up or down.";
			arguments[] = {
				{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
                                {{2}}, // Double nested array without quotation marks means number or shortcut for key (will be specially formatted). You can use also {{DIK_W}}
                                {"name"}, // Nested array means element (specially formatted part of text)
				"name player" // Simple string will be simply compiled and called
			};
			// Optional image (most likely to be displayed between title and content, TBC)
			image = "\path\image_ca.paa";
		};
		*/

		class RequiredGear
		{
			displayName = $STR_A3_RequiredGear_Hint_displayName;
			displayNameShort = "";
			description = $STR_A3_RequiredGear_Hint_description;
                        tip = $STR_A3_RequiredGear_Hint_tip;
			arguments[] =
			{
				"[[BIS_selectedMission] call BIS_fnc_camp_getMissionDesc,'name'] call BIS_fnc_getCfgData",
                                "[] call BIS_HubBriefing_getRequiredGearText"
			};
			image = "\A3\Ui_f\data\GUI\Cfg\Hints\Rules_ca.paa";

			dlc = -1;
		};
	};
};