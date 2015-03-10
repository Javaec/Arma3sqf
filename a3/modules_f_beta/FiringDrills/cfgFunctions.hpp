class CfgFunctions 
{
	class A3 
	{
		class ModuleFiringDrills
		{
			file = "A3\modules_f_beta\FiringDrills\functions";
			
			class moduleFiringDrill {description = $STR_A3_FIRING_DRILLS_FUNCTION1; ext=".fsm";};
			class moduleFDCPIn {description = $STR_A3_FIRING_DRILLS_FUNCTION2; ext=".fsm";};
			class moduleFDCPOut {description = $STR_A3_FIRING_DRILLS_FUNCTION3; ext=".fsm";};
			class moduleFDCPClear {description = $STR_A3_FIRING_DRILLS_FUNCTION4;};
			class moduleFDStatsClear {description = $STR_A3_FIRING_DRILLS_FUNCTION5;};
			class moduleFDSkeetDestruction {description = "Skeet clay destruction effect";}; //TODO: Localize?
			class moduleFDFadeMarker {description = "Crude marker fading in and out";}; //TODO: Localize?
		};
	};
};