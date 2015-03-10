/*******************************************************************************
 *DEFINES THE PARAMETERS FOR THE FTL MANAGER
*******************************************************************************/

private["_FTLManagerTable", "_FTLLevels"];


_FTLManagerTable =
[
		//TYPE				//VALUE
	[	"sysUpdate",		 		 0.00],			//do not delete it! 
	[	"NONE", 				 		 0.00],
	[	"CivKilled",				-0.50],
	[	"VIPCivKilled",			-0.70],
	[	"RebelKilled",				-0.30],
	[	"TaskSmallRefused",	-0.05],
	[	"TaskSmallDone", 		 0.40],
	[	"TaskSmallFailed", 		 -0.40],
	[	"TaskGreatRefused", -0.10],
	[	"TaskGreatDone", 		 0.60],
	[	"TaskGreatFailed", 		 -0.60],
	[	"CivHouseDestroyed",			-0.50],
	[	"GreatHouseDestroyed",			-0.80]
];

_FTLLevels =
[
	//LOW					//NEUTRAL										//HIGH
	[-1, -0.4],		[-0.3999999, 0.3999999],		[0.4,	1]
];