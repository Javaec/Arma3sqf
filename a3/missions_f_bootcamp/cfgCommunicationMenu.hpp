class CfgCommunicationMenu
{
	class Training_InstructorFigure
    	{
	        text = "%1";
	        //submenu = ""; // Submenu opened upon activation (expression is ignored when submenu is not empty.)
	        expression = "[ 'ShowFigures',[ '%1' ] ] call BIS_fnc_InstructorFigure"; // Code executed upon activation
	        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa"; // Icon displayed permanently next to the command menu
	        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
	        enable = "1"; // Simple expression condition for enabling the item
	        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    	};
};
