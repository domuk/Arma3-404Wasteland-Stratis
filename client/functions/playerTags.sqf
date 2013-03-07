//#define __DEBUG true
if((side player) == resistance) exitWith {};
#define __REFRESH 0.34
#define __DISTANCE 300

while{true}do{
	#ifdef __DEBUG
		_initTime = diag_tickTime;
		_frameNo = diag_frameNo;
	#endif
   
	_target = cursorTarget;
	if (_target isKindOf "Man" && player == vehicle player) then{
		if((side _target == playerSide || playerside == resistance) && (player distance _target) < __DISTANCE)then{
			_nameString = "<t size='0.3' shadow='2' color='#7FFF00'>" + format['%1',_target getVariable ['unitname', name _target]] + "</t>";
			[_nameString,0,0.8,__REFRESH,0,0,3] spawn bis_fnc_dynamicText;
		};
	};
    
    if ((_target isKindOf "Car" || _target isKindOf "Motorcycle" || _target isKindOf "Tank") && player == vehicle player) then{
		if((side _target == playerSide || playerside == resistance) && (player distance _target) < __DISTANCE && ((count crew _target) > 0))then{
            _unit = crew _target select 0;
			_nameString = "<t size='0.3' shadow='2' color='#7FFF00'>" + format['%1',_unit getVariable ['unitname', name _target]] + "</t>";
			[_nameString,0,0.8,__REFRESH,0,0,3] spawn bis_fnc_dynamicText;
		};
	};
    
	#ifdef __DEBUG
	player sidechat format["time: %1, frames: %2",_initTime - diag_tickTime,_frameNo - diag_frameNo];
	#endif
	sleep __REFRESH;
};