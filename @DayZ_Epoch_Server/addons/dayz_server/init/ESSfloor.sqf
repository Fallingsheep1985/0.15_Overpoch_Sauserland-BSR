_debug = getMarkerPos "respawn_west";
//_platform = createVehicle ["MetalFloor_DZ",[_debug select 0,_debug select 1,0.1],[],0,"CAN_COLLIDE"];
//_platform setVehicleInit "this allowDammage false;this enableSimulation false;";
//_platform allowDammage false;
//_platform enableSimulation false;

_this = createAgent ["Survivor2_DZ",[_debug select 0,_debug select 1,0.3],[],0,"CAN_COLLIDE"];
_this setVehicleInit "this enableSimulation false;this allowDammage false;this disableAI 'FSM';this disableAI 'ANIM';this disableAI 'MOVE';";
_this enableSimulation false;
_this allowDammage false;
_this disableAI "FSM";
_this disableAI "ANIM";
_this disableAI "MOVE"; 
_this disableAI "AUTOTARGET";
_this disableAI "TARGET";
_this setBehaviour "CARELESS";
_this forceSpeed 0;

//if (surfaceIsWater _debug) then {
//	_platform setPosASL [_debug select 0,_debug select 1,0.1];
//	_this setPosASL [_debug select 0,_debug select 1,0.3];
//};

processInitCommands;