//	@file Version: 0.9
//	@file Name: playericons.sqf
//	@file Author: [404] Pulse
//	@file Created: 01/01/2012
//	@file Description: Creating and displaying the icons above team or group.

#define icons_idc 46300

FZF_ICHud_Zoom = 0.05;
FZF_ICHud_Scale = 1.0;
FZF_ICHud_Centre = [150, 150];
FZF_ICHud_Customised = false;
FZF_ICHud_Layer = 609;

FZF_IC_Icons = 
{
    private ["_pIcons", "_relativePos"];
    _pIcons = player getVariable "FZF_IC_Hud_pIcons";

    _make_icons = false;
	_remove_icon = false;
    _units = [];
    _uc = 0;
	if (playerSide == resistance)then{ //decide what method to check who needs icons
		{
			if ((!isNull(_x)) ) then {
				if (alive(_x)) then {
					_units set [_uc, _x];
					_uc = _uc + 1;
				};
			};			
		} forEach (units(player));	
	} else {
		{  //decide who needs icons
			if ((!isNull(_x)) && ((side _x) ==playerSide)) then {
				if (alive(_x)) then {
					_units set [_uc, _x];
					_uc = _uc + 1;
				};
			};			
		} forEach (allUnits);
	};

    if (isNil "_pIcons")then {
        _make_icons = true;
    } else {
        // Someone has joined the group
        if (count(_pIcons) < _uc) then {
            _make_icons = true;
        };
        // Someone has left the group, remove the marker
        if (count(_pIcons) > _uc) then {
			_make_icons = true;
			_remove_icon = true;
        };
    };
    if (_make_icons)then {
        _pIcons = [];
		private "_Plicon";
		switch(str(playerSide)) do {
			case "WEST": {
				_Plicon = "client\icons\igui_side_blufor_ca.paa";
			};
			case "EAST": {
				_Plicon = "client\icons\igui_side_opfor_ca.paa";
			};
			case "GUER": {
				_Plicon = "client\icons\igui_side_indep_ca.paa";
			};
		};
        for "_marker_index" from 0 to (_uc - 1) do {
            
			_picon = format ["<t align='left'><img image='%1'/></t>", _Plicon ];
            _pIcons set [_marker_index, _picon];
        };
        player setVariable ["FZF_IC_Hud_pIcons", _pIcons];
    };

	private "_index";
	_index = 0;
    {
        private ["_pos","_unit", "_distance", "_name"];
        _unit = _x;
		_pos = getposATL _x;
		if(surfaceIsWater _pos) then {
			_pos = getposASL _x;
		};
		
        _distance = _pos distance player;
		if (_distance > 1 && _distance < 1100) then { //rules out the player and players too far away.
		_pos set [2, (_pos select 2) + 1.5];
		_screen = worldToScreen _pos;
		_picon = _pIcons select _index;
			if((count _screen) > 1) then {  // Dont calculate if they are not on the screen
				_scale = 0;
				_sx = _screen select 0;
				_sy = _screen select 1;
				if (_distance < 200) then {_scale = 0.3;
				}else {
					_scale = 1 min ((1 - ((_distance) - 3) / 15) max 0.3); 
				};
							
				with uinamespace do{  //update posistion
					HUD_ICON = FZF_IC_Hud_Disp displayCtrl (icons_idc + _index);
					HUD_ICON ctrlSetStructuredText parseText _picon;
					HUD_ICON ctrlSetPosition [_sx, _sy, 0.4, 0.65];
					HUD_ICON ctrlSetScale _scale;
					HUD_ICON ctrlSetFade ((1- _scale ) / 2);
					HUD_ICON ctrlCommit 0;
					HUD_ICON ctrlShow true;
				};			
			} else {
				with uinamespace do{  //stop displaying the icon of the unit
					HUD_ICON = FZF_IC_Hud_Disp displayCtrl (icons_idc + _index);
					HUD_ICON ctrlShow false;
				};		
			};
			
		} else {
			with uinamespace do{
				HUD_ICON = FZF_IC_Hud_Disp displayCtrl (icons_idc + _index);
				HUD_ICON ctrlShow false;
			};		
		};
        _index = _index + 1;
		//sleep 0.0001;
    } forEach(_units);
		if (_remove_icon) then {
			with uinamespace do{
			HUD_ICON = FZF_IC_Hud_Disp displayCtrl (icons_idc + _index );
			HUD_ICON ctrlShow false;
			};	
//			player sideChat "Removed Unit From screen " + str(_index );
		};
	
};

FZF_IC_Hud_Debug =
{
    private ["_icon_text","_Plicon"];	
	_Plicon = "client\icons\igui_side_blufor_ca.paa";
	_icon_text = format ["<t align='left'><img image='%1'/>%2<br/></t>", _Plicon ,name cursorTarget];
//	_icon_text = "<t align='left'>Test</t>";
//	_icon_text = format["<t size='1.5' shadow='2' color='#689D22'>%1</t>",name cursorTarget];
	_screen = worldToScreen (getpos player);
	if((count _screen) > 1) then {
		_sx = _screen select 0;
		_sy = _screen select 1;
		
		HUD_TEXT ctrlSetPosition [_sx, _sy, 0.4, 0.65];
	//	HUD_TEXT ctrlSetPosition [0.5, 0.5, 0.4, 0.65];
		HUD_TEXT ctrlSetStructuredText parseText _icon_text;
		player sideChat _icon_text;
		HUD_TEXT ctrlCommit 0;
		
	};
};


FZF_IC_INIT =
{	
    if (!isNil "FZF_IC_Handle") then
    {
        terminate FZF_IC_Handle;
    };

    FZF_IC_Handle = [] spawn
    {
        sleep 1;
        while {true} do
        {
#define SHOW_HUD (cameraView in ["INTERNAL","EXTERNAL","GUNNER"]) && (alive(player) && isNil("BIS_DEBUG_CAM") && (count(allUnits) > 1)) && (!visibleMap)
            waitUntil{sleep 1; SHOW_HUD};

            FZF_ICHud_Layer cutRsc ["FZF_ICHud_Rsc", "PLAIN"];
            while {SHOW_HUD} do {
                call FZF_IC_Icons;
                sleep 0.01;
            };
            FZF_ICHud_Layer cutText ["", "PLAIN"];

        };
    };	
};

FZF_ICHud_Load =
{

	with uiNamespace do { FZF_IC_Hud_Disp = _this select 0; };
}