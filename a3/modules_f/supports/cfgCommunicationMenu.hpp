class CfgCommunicationMenu
{
	class Default;
	class ArtilleryBase;
	class Support_Request_Artillery: ArtilleryBase
	{
		expression = "player setVariable ['BIS_SUPP_request', ['Artillery', _pos]]";	
	};
	
	class CASBase;
	class Support_Request_CAS_Heli: CASBase
	{
		text = $STR_A3_mdl_supp_disp_cas_heli;
		expression = "player setVariable ['BIS_SUPP_request', ['CAS_Heli', _pos]]";	
	};
	
	class Support_Request_CAS_Bombing: CASBase
	{
		text = $STR_A3_mdl_supp_disp_cas_bombing;
		expression = "player setVariable ['BIS_SUPP_request', ['CAS_Bombing', _pos]]";	
	};
	
	class SupplyDropBase;
	class Support_Request_Drop: SupplyDropBase
	{
		expression = "player setVariable ['BIS_SUPP_request', ['Drop', _pos]]";	
	};
	
	class TransportBase;
	class Support_Request_Transport: TransportBase
	{
		expression = "player setVariable ['BIS_SUPP_request', ['Transport', _pos]]";	
	};
	
	class Support_Report_Done
	{
		text = $STR_A3_mdl_supp_comm_done;
		expression = "player setVariable ['BIS_SUPP_supporting', FALSE]; call BIS_SUPP_refreshMainWindow";
	};
	
	class Support_Report_Failed
	{
		text = STR_A3_mdl_supp_comm_failed;
		expression = "player setVariable ['BIS_SUPP_failed', TRUE]";
	};
};