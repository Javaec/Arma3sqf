/*
	Author: Jiri Wainar

	Description:
	Returns cfg to the campaign config.

	Example:
	[] call BIS_fnc_camp_campaignConfig;
*/

private["_config"];

_config = if (isclass (campaignconfigfile >> "campaign")) then
{
	campaignconfigfile
}
else
{
	if (isclass (missionconfigfile >> "hubs")) then
	{
		private["_stage"];

		_stage = ["stage"] call BIS_fnc_getCfgData;
		_stage = format["Stage%1",_stage];

		configfile >> "CfgMissions" >> "Campaigns" >> "RootCampaign" >> _stage
	}
	else
	{
		configfile
	};
};

_config