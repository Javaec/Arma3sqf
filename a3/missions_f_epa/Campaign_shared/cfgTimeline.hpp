//per-hubmission specific data
class Timeline
{
	/*

	Every entry (line) is a specific key-point on the campaing timeline - starting date/time/weather for a campaign mission.

	_entry select 0 - mission starting date if format [_year,_month,_day,_hour,_min]
	_entry select 1 - travel time in hours to and from mission [_travelIn,_travelOut]
	_entry select 2 - mission weather conditions [_overcast,_fog,_changeSpeed]
	_entry select 3 - pool of available missions at given key-point

	Remarks:

	* Travel times will be tweaked later, ignore them for now.
	  * Used for transitions between hubs and missions only.

	* If weather is not defined for given key-point, it will be interpolated, using the nearest known values and time difference.
	  * It is planned to have the weather set per mission / key-point and interpolate weather for skirmishes and hubs only.

	* Listed missions are not used to control the campaign flow, it is still done by the campaign FSM.
	  * Missions are linked to the key-points here to allow for consistency / data corruption checking and for getting the
	    defaults in situations when mission is accessed using cheating (shift-campaign) or is run from outside the campaign
	    structure (opened in editor).

	*/

	class StageA
	{
		//date&time			travel time	overcast	fog			mission pool
		_0[] = {{2035,7,7,05,15},	{0,0},		{0.3,		0},			{"A_in"}};							//DRAWDOWN 2035
		_1[] = {{2035,7,7,07,15},	{0,0.16},	{0.3,		0},			{"A_in2"}};							//SITUATION NORMAL
		_2[] = {{2035,7,7,09,05},	{0.16,0.16},	{0.4,		{0.025,0.1,50}},	{"A_m01","A_hub01","A_skirmish01"}};				//BLACKFOOT DOWN
		_3[] = {{2035,7,7,12,25},	{0.16,0.16},	{0.5,		0},			{"A_m02","A_m03","A_m05","A_hub01","A_skirmish01"}};
		_4[] = {{2035,7,7,17,40},	{0.16,0.16},	{0.6,		0},			{"A_m02","A_m03","A_m05","A_hub01","A_skirmish01"}};
		_5[] = {{2035,7,7,19,15},	{0.16,0.16},	{0.6,		0},			{"A_m02","A_m03","A_m05","A_hub01","A_skirmish01"}};
		_6[] = {{2035,7,7,21,10},	{0.16,0.16},	{0.60,		{0.5,0.1,60}},		{"A_m04","A_hub01","A_skirmish01"}};				//CROSSING PATHS
		_7[] = {{2035,7,8,19,10},	{0.33,0},	{0.30,		{0.2,0.05,20}},		{"A_out","A_hub02","A_skirmish02"}};				//TIPPING POINT
	};

	class StageB
	{
		//date&time			travel time	overcast	fog			mission pool
		_0[] = {{2035,7,9,6,55},	{0,0},		{0.30,		0},			{"B_in"}};
		_1[] = {{2035,7,9,20,15},	{0,1},		{0.30,		{0.5,0.05,20}},		{"B_in2"}};
		//DEBRIEFING
		_2[] = {{2035,7,20,07,00},	{1,1},		{0.01,		0.01},			{"B_m06","B_hub01","B_skirmish01"}};
		_3[] = {{2035,7,21,05,00},	{1,1},		{0.01,		0.01},			{"B_m01","B_m03","B_m05","B_hub02","B_skirmish02"}};
		_4[] = {{2035,7,21,19,20},	{1,1},		{0.01,		0.01},			{"B_m01","B_m03","B_m05","B_hub02","B_skirmish02"}};
		_5[] = {{2035,7,22,14,15},	{1,1},		{0.01,		0.01},			{"B_m01","B_m03","B_m05","B_hub02","B_skirmish02"}};
		_6[] = {{2035,8,2,18,05},	{1,1},		{1.00,		{0.3,0.05,25}},		{"B_m02_1","B_hub02","B_skirmish02"}};
		_7[] = {{2035,8,2,19,25},	{1,1},		{0.42,		{0.025,0.275,25}},	{"B_m02_2"}};
		_8[] = {{2035,8,8,01,45},	{1,1},		{0.30,		0},			{"B_out2","B_hub03","B_skirmish03"}};
	};

	class StageC
	{
		//date&time			travel time	overcast	fog			mission pool
		_0[] = {{2035,08,09,03,15},	{0,1},		{0.3,		0},			{"C_in1","C_in2"}};
		_1[] = {{2035,08,09,05,05},	{1,1},		{0.35,		{0.15,0.12,22}},	{"C_m01"}};
		_2[] = {{2035,08,09,19,00},	{1,1},		{0.60,		0.01},			{"C_m02"}};
		_3[] = {{2035,08,10,08,45},	{1,1},		{0.01,		0.01},			{"C_out1"}};
		_4[] = {{2035,08,10,10,15},	{1,1},		{0.75,		{0.5,0.05,0.5}},	{"C_out2"}};
		//tweak the following dates and times to fit your ideas
		_5[] = {{2035,08,11,04,20},	{0,0},		{0.6,		{0.1,0.15,40}},		{"C_EB"}};
		_6[] = {{2035,09,27,17,20},	{1,1},		{0.30,		0.01},			{"C_EA"}};
	};
};
