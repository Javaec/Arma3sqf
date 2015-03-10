/*
	File: fn_dirtEffect.sqf
	Author: Vladimir Hynek

	Description:
	Dirt (texture) postprocess.

	Parameter(s):
	_this select 0: Object - Unit who gets the damage.
	_this select 1: Number - Damage given unit by explosion.
	
	Returned value:
	None.
*/

//TEST
// hint format ["Hit by: %1", BIS_hitArray select 4];

//Script displays dust PP according to damage obtained from near explosion
//takes array from "Explosion" event handler, that is registered in FSM PP

if( !BIS_performingDustPP  && (isAbleToBreathe player) &&  (((uavControl (getConnectedUav player)) select 1) == "")) then
{
	BIS_performingDustPP = true;

//private ["_damageFromExplosion"];
BIS_damageFromExplosion = _this select 1;  //from script parameters take the first one. From obtained array select 1 (damage)
	
//hint format ["Hit array: %1", _this];	

[]spawn {
	private ["_display", "_texLower", "_texUpper", "_x", "_y", "_w", "_h"];
	//_damageFromExplosion = _this select 1;
	
	//hint format ["%1", BIS_damageFromExplosion];
    
	disableSerialization;
	if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
	// if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};
	if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_dirt"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
	_display = uinamespace getvariable "RscHealthTextures";
        
        //choose random dirt texture
        //_randNr = round(random 6);
       
       //hint str _randNr;
       
       //hint "show dirt";
       
       //must be here to define _control variable
	   //textures are defined in TEST_description_screen.hpp
       _texLower = _display displayctrl 1214; //1006
       _texLower ctrlsetfade 1;	
       _texLower ctrlcommit 0;
       
       _texUpper = _display displayctrl 1215;
       _texUpper ctrlsetfade 1;
       _texUpper ctrlcommit 0;
       
     /*   switch (_randNr) do
        {
            case 0 : {_control = _display displayctrl 1006;};
            case 1 : {_control = _display displayctrl 1007;};
            case 2 : {_control = _display displayctrl 1008;};
            case 3 : {_control = _display displayctrl 1009;};
            case 4 : {_control = _display displayctrl 1010;};
            case 5 : {_control = _display displayctrl 1011;};
            case 6 : {_control = _display displayctrl 1012;};
            default  {_control = _display displayctrl 1006;};
        };*/


	//_control = _display displayctrl 1006;

	//remove previous dirt in case it is displayed
//	_texLower ctrlsetfade 1;
//        _texUpper ctrlsetfade 1;
//	_texLower ctrlcommit 0;
//        _texUpper ctrlcommit 0;
        
        _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2); //textura vycentrovana na støed (pøièítá se polovina místa které zbývá od konce textury k pravému okraji obrazovky)
        _y = (-0.0625 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
        _w = 2.125 * safezoneW * 3/4;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
        _h = 1.125 * safezoneH;
        
        _texLower ctrlsetposition [_x, _y, _w, _h];
        _texUpper ctrlsetposition [_x, _y, _w, _h];
        
        _texLower ctrlcommit 0;
        _texUpper ctrlcommit 0;
        
        
        //choose random position
   /*     _w = safezoneW * 0.35;
        _h = _w / 0.75;
        _pos = [
                ((safezoneX - _w/2) + random (safezoneW)),
                ((safezoneY - _h/2) + random (safezoneH)),
                _w,
                _h
        ];     */  
        
        //first set position and commit - to not see movement of the texture
	//_control ctrlsetposition [safezoneX, safezoneY, safezoneW, safezoneH];//_pos; //[0.5, 0.5, 0.5, 0.5];
	//_control ctrlcommit 0;

//	//--- Fade in (0.2s)
	//_control ctrlsetfade 0;
	//_control ctrlcommit 0.3;
	//waituntil {ctrlcommitted _control};
        
        
        //_delta = (abs((damage player) - BIS_oldDMG));
        
        //damage that hits player, before armor is subtracted
        //_damage = BIS_deltaDMG;//BIS_hitArray select 2;//damage player; /////////---------------------------TODO - remove this and compute delta properly
        
		
		
        //lower
        if((BIS_damageFromExplosion > 0.0001) && (BIS_damageFromExplosion < 0.03)) then
        {
            _texLower ctrlsetfade 0;
            _texLower ctrlcommit 0.3;
            waituntil {ctrlcommitted _texLower};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texLower ctrlcommit 1.2;
        };
        
        //lower, 50% upper
        if ((BIS_damageFromExplosion >= 0.03) && (BIS_damageFromExplosion < 0.15)) then
        {
            _texLower ctrlsetfade 0;
            _texUpper ctrlsetfade 0.5;
            
            _texLower ctrlcommit 0.3;
            _texUpper ctrlcommit 0.3;
            waituntil {ctrlcommitted _texUpper};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 0.75;
			_texLower ctrlcommit 1.2;
        };
        
        //lower, upper
        if (BIS_damageFromExplosion >= 0.15) then
        {
            _texLower ctrlsetfade 0;
            _texUpper ctrlsetfade 0;
            
            _texLower ctrlcommit 0.2;
            _texUpper ctrlcommit 0.2;
            waituntil {ctrlcommitted _texUpper};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 0.75;
			_texLower ctrlcommit 1.2;
        };
        
	sleep 1.2;
	BIS_performingDustPP = false;
};//spawn

};//if
		
		//--------------------------------this worked for _damage = BIS_deltaDMG; ------------------------------------
		/*
        //lower
        if((_damage > 0.0001) && (_damage < 0.05)) then
        {
            _texLower ctrlsetfade 0;
            _texLower ctrlcommit 0.3;
            waituntil {ctrlcommitted _texLower};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texLower ctrlcommit 1.2;
        };
        
        //lower, 50% upper
        if ((_damage >= 0.05) && (_damage < 0.1)) then
        {
            _texLower ctrlsetfade 0;
            _texUpper ctrlsetfade 0.5;
            
            _texLower ctrlcommit 0.3;
            _texUpper ctrlcommit 0.3;
            waituntil {ctrlcommitted _texUpper};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 0.75;
			_texLower ctrlcommit 1.2;
        };
        
        //lower, upper
        if (_damage >= 0.1) then
        {
            _texLower ctrlsetfade 0;
            _texUpper ctrlsetfade 0;
            
            _texLower ctrlcommit 0.2;
            _texUpper ctrlcommit 0.2;
            waituntil {ctrlcommitted _texUpper};
			
			//fade out-----------------------
			sleep 1.5;

			_texLower ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 0.75;
			_texLower ctrlcommit 1.2;
        };
		*/
        //--------------------------------this worked for _damage = BIS_deltaDMG; ------------------------------------

		
		//tuned by Dave&Muf, moved to separate cases to avoid unnecessary sleeps
		// sleep 1.5;
        
        ////fade out-----------------------
        // _texLower ctrlsetfade 1;
        // _texUpper ctrlsetfade 1;

        // _texUpper ctrlcommit 1.5;
        // sleep 0.75;
        // _texLower ctrlcommit 1.2;
        
        
        
        
        
        
        
        
        
        
        
        
        

	//--- Fade out
	//_control ctrlsetfade 1;
	//_control ctrlcommit (2 + random 5);
        
        
	//waituntil {ctrlcommitted _control};		//consider removing this

	//sleep 2;
    
        
            
                
                    
                        
                     


// was functional for one big texture------------------------------------

//	disableSerialization;
//	if (isnil {uinamespace getvariable "str_screen"}) then {uinamespace setvariable ["str_screen",displaynull]};
//	if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};
//	_display = uinamespace getvariable "str_screen";
//
//	_control = _display displayctrl 1000;
//
//	//remove previous dirt in case it is displayed
//	_control ctrlsetfade 1;	
//	_control ctrlcommit 0;
//
//	//first set position and commit - to not see movement of the texture
//	_control ctrlsetposition [safezoneX,safezoneY,safezoneW,safezoneH];
//	_control ctrlcommit 0;
//
//	//--- Fade in (0.2s)
//	_control ctrlsetfade 0;
//	_control ctrlcommit 0.3;
//	waituntil {ctrlcommitted _control};
//
//	sleep 3;
//
//	//--- Fade out
//	_control ctrlsetfade 1;
//	_control ctrlcommit (2 + random 5);
	//waituntil {ctrlcommitted _control};		//consider removing this

	//sleep 2;

//};//spawn