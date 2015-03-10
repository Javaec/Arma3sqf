
/*
	File: fn_AAN.sqf
	Author: Karel Moricky

	Description:
	It's showtime!

	Parameter(s):
	_this select 0: STRUCTURED TEXT: Header text
	_this select 1: STRUCTURED TEXT: Bottom text (moving)

	Returns:
	Nothing
*/
disableserialization;

_header = _this select 0;
_line = _this select 1;

([] call bis_fnc_rscLayer) cutrsc ["rscAAN","plain"];
_display = uinamespace getvariable "BIS_AAN";
_textHeader = _display displayctrl 3001;
_textHeader ctrlsetstructuredtext _header;//parsetext "<t size='2.3'>Military press conference</t><br />Col. Kane announces the end of the op. Arrowhead";
_textHeader ctrlcommit 0;

_textLine = _display displayctrl 3002;
_textLine ctrlsetstructuredtext _line;//"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar euismod neque, eget malesuada lectus auctor sit amet. Maecenas ac est ipsum. Vestibulum in sapien turpis. Nunc ultricies, tellus ac lacinia consequat, mi massa sodales eros, vel semper justo enim non erat. Cras vitae urna et erat dapibus sagittis ac porttitor odio. Aliquam adipiscing malesuada libero, vitae suscipit mi interdum at. Vivamus sapien metus, ultricies quis ultricies ultrices, venenatis nec orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In egestas congue malesuada. Vestibulum gravida ligula volutpat ipsum auctor vulputate. ";
_textLine ctrlcommit 0;
_textLinePos = ctrlposition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlcommit 1500;

_textClock = _display displayctrl 3003;
while {!isnull _display} do {

	_textClock ctrlsettext ([daytime,"HH:MM"] call bis_fnc_timetostring);
	_textClock ctrlcommit 0;
	sleep 60;
};