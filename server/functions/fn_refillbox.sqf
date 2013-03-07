//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
if (!isServer) exitWith {};
private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch(_selectedBox) do {
    case "mission_Mid_BAF": { // Broad selection of mid-high tier weapons 
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",1];
        _currBox addWeaponCargoGlobal ["SVD_CAMO",1];
		_currBox addWeaponCargoGlobal ["M14_EP1",1];			
		_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",1];
        _currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",1];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS",1];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",1];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",1];		
		_currBox addWeaponCargoGlobal ["FN_FAL_ANPVS4",1];
		_currBox addWeaponCargoGlobal ["M9",4];	 
        _currBox addWeaponCargoGlobal ["M9SD",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",8];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",24];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",20];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",8];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",4];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",5];
        _currBox addMagazineCargoGlobal ["6Rnd_45ACP",5];
        _currBox addMagazineCargoGlobal ["HandGrenade",4];
		_currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",8];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",5];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",10];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",15];
		_currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",8]; 		
    };
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;

		// Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["launch_NLAW_F",3];
		_currBox addWeaponCargoGlobal ["launch_RPG32_F",3];
		// Add ammunition
		_currBox addMagazineCargoGlobal ["RPG32_AA_F",10];
		_currBox addMagazineCargoGlobal ["RPG32_F",10];
		_currBox addMagazineCargoGlobal ["NLAW_F",10];
		_currBox addMagazineCargoGlobal ["DemoCharge_Remote_Mag",10];
		_currBox addMagazineCargoGlobal ["APERSMine_Range_Mag",15];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["LMG_Mk200_F",2];
		_currBox addWeaponCargoGlobal ["arifle_MX_SW_F",2];
		_currBox addWeaponCargoGlobal ["arifle_MXM_F",2];
		_currBox addWeaponCargoGlobal ["srifle_EBR_F",2];
		_currBox addWeaponCargoGlobal ["hgun_P07_F",2];
		_currBox addWeaponCargoGlobal ["hgun_Rook40_F",2];

		_currBox addWeaponCargoGlobal ["NVGoggles",5];
		_currBox addWeaponCargoGlobal ["Binocular",5];

		_currBox addMagazineCargoGlobal ["16Rnd_9x21_Mag",10];
		_currBox addMagazineCargoGlobal ["20Rnd_762x45_Mag",25];
		_currBox addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer",20];
		_currBox addMagazineCargoGlobal ["200Rnd_65x39_cased_Box",20];		
    };
};