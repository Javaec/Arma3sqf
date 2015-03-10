// Defines
#define EXEC_RATE 0.25

// Limit execution rate
if (time >= (missionNamespace getVariable "BIS_instructorUiLastExecution") + EXEC_RATE) then {
	// Store this execution time
	missionNamespace setVariable ["BIS_instructorUiLastExecution", time];
	
	// Validate data
	if (!isNil { BIS_instructorRecruitStatus } && { count BIS_instructorRecruitStatus > 0 } ) then {
		// Show resource
		if (isNil { BIS_instructorRecruitStatusShown }) then {
			BIS_instructorRecruitStatusShown = true;
			2 cutRsc ["RscRecruitStatus", "PLAIN"];
		};
		
		// The recruits and it's total amount
		private ["_recruits", "_recruitsCount"];
		_recruits	= ["allRecruits"] call BIS_fnc_flow;
		_recruitsCount	= count _recruits;
		
		// Get controls and misc
		private ["_background", "_title", "_description", "_listbox", "_progressBar", "_backgroundHeight", "_descriptionHeight", "_listboxHeightPerRecruit", "_progressBarWidth"];
		_background			= uiNamespace getVariable ["RscRecruitStatus_Background", controlNull];
		_title				= uiNamespace getVariable ["RscRecruitStatus_Title", controlNull];
		_description 			= uiNamespace getVariable ["RscRecruitStatus_Description", controlNull];
		_listbox 			= uiNamespace getVariable ["RscRecruitStatus_Listbox", controlNull];
		_progressBar 			= uiNamespace getVariable ["RscRecruitStatus_ProgressBar", controlNull];
		_backgroundHeight		= uiNamespace getVariable ["RscRecruitStatus_BackgroundHeight", 0];
		_descriptionHeight		= uiNamespace getVariable ["RscRecruitStatus_DescriptionHeight", 0];
		_listboxHeightPerRecruit	= uiNamespace getVariable ["RscRecruitStatus_ListboxHeightPerRecruit", 0];
		_progressBarWidth		= uiNamespace getVariable ["RscRecruitStatus_ProgressBarWidth", 0];
		
		// Challenge task
		private ["_taskTitle", "_taskDescription", "_taskCondition"];
		_taskTitle		= BIS_instructorRecruitStatus select 0;
		_taskDescription 	= BIS_instructorRecruitStatus select 1;
		_taskCondition		= BIS_instructorRecruitStatus select 2;
		
		// Count how many recruits are done
		private "_doneRecruits";
		_doneRecruits = 0;
		
		// Clear list box
		lbClear _listbox;
		
		{
			// The icon
			private ["_isNotDone", "_path", "_icon", "_color", "_image"];
			_isNotDone 	= _x call _taskCondition;
			_path 		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\";
			_icon 		= if (_isNotDone) then { "CheckBox_unchecked_ca.paa" } else { "CheckBox_checked_ca.paa" };
			_color		= if (_isNotDone) then { "#FF0000" } else { "#008000" };
			_image		= _path + _icon;
			
			// The name
			private "_name";
			_name = name _x;
			
			// Is this recruit dead
			if (count (toArray _name) <= 20 && { !alive _x }) then {
				_name = _name + format [" (%1)", localize "STR_A3_cfgfactionclasses_respawn"];
			};
			
			// List box
			_listbox lbAdd _name;
			_listbox lbSetPicture [_forEachIndex, _image];
			
			// Recruit done?
			if (!_isNotDone) then {
				_doneRecruits = _doneRecruits + 1;
			};
		} forEach _recruits;
		
		// Title and Description
		_title ctrlSetText _taskTitle; _title ctrlCommit 0;
		_description ctrlSetText _taskDescription; _description ctrlCommit 0;
		
		// Resizing of controls
		private "_heightListboxTotal";
		_heightListboxTotal = _listboxHeightPerRecruit * _recruitsCount;
		
		// Description
		private ["_numberOfLines", "_positionDescription"];
		_numberOfLines 		= ceil (count (toArray _taskDescription) / 33);
		_positionDescription	= ctrlPosition _description;
		_positionDescription set [3, _descriptionHeight * _numberOfLines];
		_description ctrlSetPosition _positionDescription;
		_description ctrlSetTextColor [0,0,0,1];
		
		// Background
		private "_positionBackground";
		_positionBackground = ctrlPosition _background;
		_positionBackground set [3, _backgroundHeight + _heightListboxTotal - _listboxHeightPerRecruit + _descriptionHeight * _numberOfLines - _descriptionHeight + ((ctrlPosition _progressBar) select 3)];
		_background ctrlSetPosition _positionBackground;
		
		// Listbox
		private "_positionListbox";
		_positionListbox = ctrlPosition _listbox;
		_positionListbox set [1, ((_positionDescription select 1) + (_descriptionHeight * _numberOfLines)) + ((ctrlPosition _progressBar) select 3)];
		_positionListbox set [3, _heightListboxTotal];
		_listbox ctrlSetPosition _positionListbox;
		
		// Progress bar
		private "_positionProgressBar";
		_positionProgressBar = ctrlPosition _progressBar;
		if (!isNil { BIS_curator getVariable "BIS_convoy_timeInConvoyStart" }) then {
			if (BIS_curator getVariable "BIS_convoy_timeInConvoyStart" == 0) then {
				// Progress bar reset
				_positionProgressBar set [2, 0];
			} else {
				private "_timeInConvoy";
				_timeInConvoy = abs((BIS_curator getVariable "BIS_convoy_timeInConvoyStart") - time);
				
				private "_progressBarWidthPerSecond";
				_progressBarWidthPerSecond = _progressBarWidth / 120;
				
				// Progress bar shows in convoy time
				_positionProgressBar set [2, _progressBarWidthPerSecond * _timeInConvoy];
			};
		} else {
			private "_progressBarWidthPerRecruit";
			_progressBarWidthPerRecruit = if (_recruitsCount > 0) then {
				_progressBarWidth / _recruitsCount;
			} else {
				0;
			};
			
			// Progress bar shows recruits progress
			_positionProgressBar set [2, _progressBarWidthPerRecruit * _doneRecruits];
		};
		_progressBar ctrlSetPosition _positionProgressBar;
		
		// Commit controls
		_background ctrlCommit EXEC_RATE;
		_description ctrlCommit EXEC_RATE;
		_listbox ctrlCommit EXEC_RATE;
		_progressBar ctrlCommit EXEC_RATE;
	} else {
		// Hide resource
		BIS_instructorRecruitStatusShown = nil;
		2 cutText ["", "PLAIN"];
	};
};
