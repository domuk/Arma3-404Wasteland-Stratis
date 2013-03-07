private ["_allVehicles","_check","_vehicleType"];

_allVehicles = vehicles;

{
	_check = _x getVariable ["newVehicle",0];
	if(_check != 1) then 
	{
		_vehicleType = Format["%1",typeOf _x];
		if(_vehicleType isKindOf "Car") then {
			if(_vehicleType isKindOf "MotorCycle") then {
				deleteVehicle _x;
			};
			if(_vehicleType isKindOf "Truck") then {
				deleteVehicle _x;
			};
			if(!(_vehicleType isKindOf "Truck") AND !(_vehicleType isKindOf "MotorCycle") AND !(_vehicleType isKindOf "Wheeled_APC")) then {
				deleteVehicle _x;   
			};
		};
		if(_vehicleType isKindOf "Helicopter") then {
			deleteVehicle _x;
		};
		if(_vehicleType isKindOf "Plane") then {
			deleteVehicle _x;
		};
		if(_vehicleType isKindOf "Tank") then {
			deleteVehicle _x;
		};
		if(_vehicleType isKindOf "Wheeled_APC") then {
			deleteVehicle _x;
		};
	};
} forEach _allVehicles;

player commandChat "All Hacked Vehicles Deleted";

closeDialog 0;
execVM "client\systems\adminPanel\vehicleManagement.sqf";