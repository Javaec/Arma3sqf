/*
	File: fn_bloodEffect.sqf
	Author: Vladimir Hynek

	Description:
	Blood splash (texture) postprocess.

	Parameter(s):
	_this select 0: Number - Bleeding time in seconds, could be <5;90>

	Returned value:
	None.
*/

//---------------- Hit that caused bleeding - show blood--------------------------------------------------------------
//bleeding time could be <5;90> in seconds

	BIS_oldBleedRemaining = _this select 0;
	
[]spawn {

	private ["_display", "_texLower", "_texMiddle", "_texUpper", "_x", "_y", "_w", "_h"];

	disableSerialization;
	if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
	//if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};
	if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_blood"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
	_display = uinamespace getvariable "RscHealthTextures";

	//remove old textures --TODO: replace this by texture overlay-repaint textures
	//textures are defined in TEST_description_screen.hpp
		_texLower = _display displayctrl 1211;//1013; //1001
		_texLower ctrlsetfade 1;
		_texLower ctrlcommit 0;
		
		_texMiddle = _display displayctrl 1212;
		_texMiddle ctrlsetfade 1;	
		_texMiddle ctrlcommit 0;
		
		_texUpper = _display displayctrl 1213;
		_texUpper ctrlsetfade 1;	
		_texUpper ctrlcommit 0;
               
//               _texRight = _display displayctrl 1004;
//               _texRight ctrlsetfade 1;	
//	       _texRight ctrlcommit 0;
  


  //temporarily disabled
		//choose which texture to display
/*		if((BIS_oldBleedRemaining > 0.0) && (BIS_oldBleedRemaining < 0.5)) then
		{
			//hint "blood A";
			_control = _display displayctrl 1001; //light splatter	
		}
		else
		{
			if (BIS_oldBleedRemaining < 1.0) then
			{
			//hint "blood B";
				_control = _display displayctrl 1001;  //1002; //enable when new texture is available //medium splatter
			}
			else
			{
			//hint "blood C";
				_control = _display displayctrl 1001; //1003; //enable when new texture is available //heavy splatter
			};	
		};
 */
	
        //ok pro texturu 1024x1024px - ale roztahovala se do šíøky v 16:9 - nutno použít RscPictureKeepAspect
         //_x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (1 * safezoneW * 3/4)) / 2); //textura vycentrovana na støed (pøièítá se polovina místa které zbývá od konce textury k pravému okraji obrazovky)
         //_y = (0 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
         //_w = 1 * safezoneW * 3/4;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
         //_h = 1 * safezoneH;                    //vyska o 20% vetsi nez vyska obrazovky
         
         //OK pro texturu 2048x1024px
         //_x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.2 * safezoneW * 3/4)) / 2); //textura vycentrovana na støed (pøièítá se polovina místa které zbývá od konce textury k pravému okraji obrazovky)
         //_y = (-0.1 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
         //_w = 2.2 * safezoneW * 3/4;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
         //_h = 1.2 * safezoneH;
         
         _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2); //textura vycentrovana na støed (pøièítá se polovina místa které zbývá od konce textury k pravému okraji obrazovky)
         _y = (-0.0625 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
         _w = 2.125 * safezoneW * 3/4;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
         _h = 1.125 * safezoneH;
        
        
        //temporarily commented //-
//        _texUp ctrlsetposition [safezoneX, safezoneY, safezoneW, safezoneH];
        _texLower ctrlsetposition [_x, _y, _w, _h];
        _texMiddle ctrlsetposition [_x, _y, _w, _h];
        _texUpper ctrlsetposition [_x, _y, _w, _h];
        
        _texLower ctrlcommit 0;
        _texMiddle ctrlcommit 0;
        _texUpper ctrlcommit 0;
		
	//first set position and commit - to not see movement of the texture
//-	_texUp    ctrlsetposition [(safezoneW*(-0.020833))+safezoneX, safezoneY, 1.25*safezoneH, 0.75*safezoneH]; //-0.125 = x
//-        _texDown  ctrlsetposition [(safezoneW*(-0.020833))+safezoneX, safezoneH*0.25 + safezoneY, 1.25*safezoneH, 0.75*safezoneH];
        //_texDown  ctrlsetposition [(safezoneW*0) + safezoneX, safezoneH*0.25 + safezoneY, 1.068*safezoneH, 0.75*safezoneH];
//-        _texLeft  ctrlsetposition [safezoneX, safezoneY, 0.4*safezoneH, 1.0*safezoneH];
//-        _texRight ctrlsetposition [safezoneW*0.668 + safezoneX, safezoneY, 0.4*safezoneH, 1.0*safezoneH];
        
        
        /*
        _texUp    ctrlsetposition [-(safezoneW/12), safezoneY, 1.2*safezoneH, 0.7*safezoneH]; //-0.125 = x
        _texDown  ctrlsetposition [-(safezoneW/12), safezoneH*0.3, 1.2*safezoneH, 0.7*safezoneH];        
        _texLeft  ctrlsetposition [-(safezoneW/12), safezoneY, 0.4*safezoneH, 1.0*safezoneH];
        _texRight ctrlsetposition [(safezoneW/1.710376), safezoneY, 0.4*safezoneH, 1.0*safezoneH];
        */
        
        //[-0.586364,-0.40101,2.17424,0.738384]
        
        /*
        _texUp    ctrlsetposition [safezoneX, safezoneY, 1.2*safezoneH, 0.7*safezoneH]; //-0.125 = x
        _texDown  ctrlsetposition [safezoneX, safezoneH*0.15, 1.2*safezoneH, 0.7*safezoneH];        
        _texLeft  ctrlsetposition [safezoneX, safezoneY, 0.4*safezoneH, 1.0*safezoneH];
        _texRight ctrlsetposition [(safezoneW/2.18), safezoneY, 0.4*safezoneH, 1.0*safezoneH];
        */
        
        /*
        _texUp    ctrlsetposition [0.5, 0.5, 0.2048, 0.1024]; //-0.125 = x
        _texDown  ctrlsetposition [-0.357143, 0.214286, 1.71429, 1.0];        
        _texLeft  ctrlsetposition [-0.357143, -0.214286, 0.571429, 1.42857];
        _texRight ctrlsetposition [0.78637, -0.214286, 0.571429, 1.42857];
        */
        
        
	
//-        _texDown ctrlcommit 0;
//-        _texLeft ctrlcommit 0;
//-        _texRight ctrlcommit 0;

	//--- Fade in (0.1s)
//	_texLower ctrlsetfade 0;
//-        _texDown ctrlsetfade 0;
//-        _texLeft ctrlsetfade 0;
//-        _texRight ctrlsetfade 0;
        
//	_texLower ctrlcommit 0.3;
//-        _texDown ctrlcommit 0.3;
//-        _texLeft ctrlcommit 0.3;
//-        _texRight ctrlcommit 0.3;
                
//	waituntil {ctrlcommitted _texLower};

//	sleep 3;
        
        
        
        
        
        //lower
        if((BIS_oldBleedRemaining > 5) && (BIS_oldBleedRemaining < 25)) then
        {
            _texLower ctrlsetfade 0.2;	 //0 --changed
            _texLower ctrlcommit 0.2;
            waituntil {ctrlcommitted _texLower};
			
			//fade-out
			sleep 0.5;
			
			_texLower ctrlsetfade 1;
			_texLower ctrlcommit 0.8;
        };
        
        //lower, 50% middle
        if ((BIS_oldBleedRemaining >= 25) && (BIS_oldBleedRemaining < 40)) then
        {
            _texLower ctrlsetfade 0.2;	 //0 --changed
            _texMiddle ctrlsetfade 0.85;  //0 --changed
            
            _texLower ctrlcommit 0.2;
            _texMiddle ctrlcommit 0.2;
            waituntil {ctrlcommitted _texMiddle};
			
			//fade-out
			sleep 0.5;
			
			_texLower ctrlsetfade 1;
			_texMiddle ctrlsetfade 1;

			_texMiddle ctrlcommit 1;
			sleep 0.5;
			_texLower ctrlcommit 0.8;
        };
        
        //lower, middle
        if ((BIS_oldBleedRemaining >= 40) && (BIS_oldBleedRemaining < 55)) then
        {
            _texLower ctrlsetfade 0.2;	 //0 --changed
            _texMiddle ctrlsetfade 0.7;  //0 --changed
            
            _texLower ctrlcommit 0.2;
            _texMiddle ctrlcommit 0.2;
            waituntil {ctrlcommitted _texMiddle};
			
			//fade-out
			sleep 0.5;
			
			_texLower ctrlsetfade 1;
			_texMiddle ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texMiddle ctrlcommit 1;
			sleep 0.5;
			_texLower ctrlcommit 0.8;
        };
        
        //lower, middle, 50% upper
        if ((BIS_oldBleedRemaining >= 55) && (BIS_oldBleedRemaining < 70)) then
        {
            _texLower ctrlsetfade 0.2;	 //0 --changed
            _texMiddle ctrlsetfade 0.7;  //0 --changed
            _texUpper ctrlsetfade 0.85;  //0.5 --changed
            
            _texLower ctrlcommit 0.2;
            _texMiddle ctrlcommit 0.2;
            _texUpper ctrlcommit 0.2;
            waituntil {ctrlcommitted _texUpper};
			
			//fade-out
			sleep 0.5;
			
			_texLower ctrlsetfade 1;
			_texMiddle ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 1;
			_texMiddle ctrlcommit 1;
			sleep 0.5;
			_texLower ctrlcommit 0.8;
        };
        
        //lower, middle, upper
        if (BIS_oldBleedRemaining >= 70) then
        {
            _texLower ctrlsetfade 0.2;	 //0 --changed
            _texMiddle ctrlsetfade 0.7;  //0 --changed
            _texUpper ctrlsetfade 0.7;   //0 --changed
            
            _texLower ctrlcommit 0.2;
            _texMiddle ctrlcommit 0.2;
            _texUpper ctrlcommit 0.2;
            waituntil {ctrlcommitted _texUpper};
			
			//fade-out
			sleep 0.5;
			
			_texLower ctrlsetfade 1;
			_texMiddle ctrlsetfade 1;
			_texUpper ctrlsetfade 1;

			_texUpper ctrlcommit 1.5;
			sleep 1;
			_texMiddle ctrlcommit 1;
			sleep 0.5;
			_texLower ctrlcommit 0.8;
        };
        
        
        // sleep 0.5;
        
        
//------fade out-----------------------------------------------------

	//by MUF
        // _texLower ctrlsetfade 1;
        // _texMiddle ctrlsetfade 1;
        // _texUpper ctrlsetfade 1;

        // _texLower ctrlcommit 5;
        // sleep 4;
        // _texMiddle ctrlcommit 3;
        // sleep 2;
        // _texUpper ctrlcommit 2;
		
	//tuned by Dave&Muf	
		// _texLower ctrlsetfade 1;
        // _texMiddle ctrlsetfade 1;
        // _texUpper ctrlsetfade 1;

        // _texUpper ctrlcommit 1.5;
        // sleep 1;
        // _texMiddle ctrlcommit 1;
        // sleep 0.5;
        // _texLower ctrlcommit 0.8;



        

	//--- Fade out--OLD
//	_texUp ctrlsetfade 1;
//-        _texDown ctrlsetfade 1;
//-        _texLeft ctrlsetfade 1;
//-        _texRight ctrlsetfade 1;
             
//        _fadeTime = 2 + random 5;
        
//	_texUp ctrlcommit (_fadeTime);
//-        _texDown ctrlcommit (_fadeTime);
//-        _texLeft ctrlcommit (_fadeTime);
//-        _texRight ctrlcommit (_fadeTime);
	//waituntil {ctrlcommitted _control};		//consider removing this

	//sleep 2;	
        
        

};