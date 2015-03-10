//savevar "hsim_heliportDB";

//--- Save global database
profilenamespace setvariable ["hsim_heliportDB",hsim_heliportDB];
saveprofilenamespace;

//--- Save campaign database
if !(isnil "hsim_heliportDB") then {savevar "hsim_heliportDBCampaign"};