//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
		//Handgun
	["P07","hgun_P07_F",40,20],
    ["Rook-40","hgun_Rook40_F",40,20], 
    	//Underwater Gun
	["SDAR","arifle_SDAR_F",100,50],
    	//Assault Rifle
	["MX","arifle_MX_F",100,50],
	["TRG-21","arifle_TRG21_F",100,50],
    ["TRG-20","arifle_TRG20_F",100,50],
    ["MXC","arifle_MXC_F",100,50],
    ["Katiba","arifle_Khaybar_F",100,50],
    ["Katiba Carabine","arifle_Khaybar_C_F",100,50],
    ["MX 3GL","arifle_MX_GL_F",200,100],
    ["Katiba GL","arifle_Khaybar_GL_F",200,100],
    ["EBR","srifle_EBR_F",250,100], 
    	//Light Machine Gun
    ["MX SW","arifle_MX_SW_F",250,100],
    ["Mk200","LMG_Mk200_F",250,100],
		//Assault Rifle
    ["TRG-21 EGLM","arifle_TRG21_GL_F",275,150],
    	//Rocket
    ["NLAWr","launch_NLAW_F",300,200],
    ["RPG-42 Alamut","launch_RPG32_F",300,200],
    	//Sniper
    ["MXM","arifle_MXM_F",450,300]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",10],
	["5.56mm 20Rnd Mag","20Rnd_556x45_UW_mag",10],
	["7.62mm 20Rnd Mag","20Rnd_762x45_Mag",10],
    ["6.5mm 30Rnd CL Mag","30Rnd_65x39_caseless_mag",30],
    ["6.5mm 30Rnd C Mag","30Rnd_65x39_case_mag",25],
	["6.5mm 100Rnd Belt","100Rnd_65x39_caseless_mag_Tracer",50],
	["6.5mm 200Rnd Belt","200Rnd_65x39_cased_Box",10],
	["NLAW Missile","NLAW_F",100],
    ["RPG32 Missile","RPG32_F",100],
    ["RPG32 AA Missile","RPG32_AA_F",100],
	["Explosive Charge","DemoCharge_Remote_Mag",100],
    ["Explosive Satchel","SatchelCharge_Remote_Mag",100],
    ["AT Mine","ATMine_Range_Mag",100],
    ["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",100],
    ["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",100],
    ["APERS Mine","APERSMine_Range_Mag",100],
    ["APERS Bounding Mine","APERSBoundingMine_Range_Mag",100],
    ["APERS Tripwire Mine","APERSTripMine_Wire_Mag",100]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["GPS","ItemGPS", 100,"item"],
	["Binoculars","Binocular",100,"binoc"],
	["NV Goggles","NVGoggles",100,"binoc"],
    ["First Aid","FirstAidKit", 100,"item"],
    ["Medkit","Medikit", 100,"item"],
    ["Toolkit","ToolKit", 100,"item"],
  	["Suppressor 9mm","muzzle_snds_L", 100,"item"],
    ["Suppressor 7.82mm","muzzle_snds_B", 100,"item"],
    ["Suppressor 6.5mm","muzzle_snds_H", 100,"item"],
    ["LMG Suppressor 6.5mm","muzzle_snds_H_MG", 100,"item"],
    ["Flash Light","acc_flashlight", 100,"item"],
    ["RCO Sight","optic_Hamr", 100,"item"],
    ["Holosight","optic_Holosight", 100,"item"],
    ["ARCO Sight","optic_Arco", 100,"item"],
    ["ACO Sight","optic_Aco", 100,"item"]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_1",200,"Air Station Mike-28"],
		["Town_2",100,"Agios Loannis"],
		["Town_3",100,"Agios Cephas"],
		["Town_4",175,"Girna"],			
		["Town_5",175,"Camp Tempest"],
		["Town_6",250,"Stratis Airbase Town"],
		["Town_7",180,"Stratis Airbase Runway"],
		["Town_8",290,"Agia Marina"],
		["Town_9",150,"Kill Farm"],
		["Town_10",210,"Camp Rogain"],
		["Town_11",180,"Kamino Firing Range"],
		["Town_12",220,"Camp Maxwell"]
];
cityLocations = [];
