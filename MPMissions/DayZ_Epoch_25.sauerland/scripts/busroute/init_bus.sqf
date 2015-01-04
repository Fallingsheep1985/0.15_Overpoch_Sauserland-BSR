	private ["_axeBusUnit","_firstRun","_dir","_axWPZ","_unitpos","_rndLOut","_ailoadout","_aiwep","_aiammo","_axeBus","_axeBusGroup","_axeBuspawnpos","_axeBusWPradius","_axeBusWPIndex","_axeBusFirstWayPoint","_axeBusWP","_axeBusRouteWaypoints","_axeBusDriver","_axeBusLogicGroup","_axeBusLogicCenter"];
	_axeBusUnit = objNull;
	_axeBusGroup = createGroup west;
	_axeBuspawnpos = [1741.54, 20733.3, 0.00143814];
	_unitpos = [1741.54, 20738.3, 0.00143814];
	_axeBusWPradius = 2;//waypoint radius
	
	_axeBusDriver = objNull;
	
	//Set Sides
	_firstRun = _this select 0;
	if(_firstRun)then{
	createCenter RESISTANCE;
	RESISTANCE setFriend [WEST,1];//Like Survivors..
	RESISTANCE setFriend [EAST,0];//Don't like banditos !
	WEST setFriend [RESISTANCE,1];
	EAST setFriend [RESISTANCE,0];
	};
	
	//Load Bus Route
	_axWPZ=0;
	_axeBusWPIndex = 2;
	_axeBusFirstWayPoint = [1722.67, 23409.2, _axWPZ];
	_axeBusWP = _axeBusGroup addWaypoint [_axeBusFirstWayPoint, _axeBusWPradius,_axeBusWPIndex];
	_axeBusWP setWaypointType "MOVE";
	_axeBusRouteWaypoints = [[8166.96, 22017.2,_axWPZ],[16764.7, 17115.2,_axWPZ],[23757, 18793.3,_axWPZ],
	[19603.9, 11406.9,_axWPZ],[12273.5, 5879.12,_axWPZ],[3380.19, 1603.62,_axWPZ],[3040.65, 7910.06,_axWPZ],
	[3930.72, 13417.7,_axWPZ],[3040.65, 7910.06,_axWPZ],[3380.19, 1603.62,_axWPZ],[12273.5, 5879.12,_axWPZ],
	[19603.9, 11406.9,_axWPZ],[23757, 18793.3,_axWPZ],[16764.7, 17115.2,_axWPZ],[8166.96, 22017.2,_axWPZ],
	[1722.67, 23409.2, _axWPZ],[1741.54, 20733.3, _axWPZ]];
	
	{
	_axeBusWPIndex=_axeBusWPIndex+1;
	_axeBusWP = _axeBusGroup addWaypoint [_x, _axeBusWPradius,_axeBusWPIndex];
	_axeBusWP setWaypointType "MOVE";
	_axeBusWP setWaypointTimeout [20, 30, 35];
	diag_log format ["BUS:Waypoint Added: %2 at %1",_x,_axeBusWP];
	} forEach _axeBusRouteWaypoints;
	
	//Create Loop Waypoint
	_axeBusWP = _axeBusGroup addWaypoint [_axeBusFirstWayPoint, _axeBusWPradius,_axeBusWPIndex+1];
	_axeBusWP setWaypointType "CYCLE";
	
	//Create Bus
	_dir = 244;
	_axeBus = "Ikarus_TK_CIV_EP1" createVehicle _axeBuspawnpos;
	_axeBus setDir _dir;
    _axeBus setPos getPos _axeBus;
    _axeBus setVariable ["ObjectID", [_dir,getPos _axeBus] call dayz_objectUID2, true];
    _axeBus setFuel .3;
	_axeBus allowDammage false;
	//Uncomment for normal dayZ
	//dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_axeBus];
	//For Epoch - Comment out for normal dayZ | Credit to Flenz
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_axeBus];
	[_axeBus,"Ikarus_TK_CIV_EP1"] spawn server_updateObject;
	
	//Make Permanent on some builds.. No Need really,
	//dayzSaveVehicle = _axeBus;
	//publicVariable "dayzSaveVehicle";
	
	_axeBus addEventHandler ["HandleDamage", {false}];	
	_axeBus setVariable ["axBusGroup",_axeBusGroup,true];
	_axeBus setVariable ["isAxeAIBus",1,true];
	_axeBus setVariable ["MalSar",1,true];
	_axeBus setVariable ["Sarge",1,true];
	
	//Create Driver and Drivers Mate
	for [{ x=1 },{ x <3 },{ x = x + 1; }] do {
		_rndLOut=floor(random 3);
		_ailoadout=
		switch (_rndLOut) do 
		{ 
		  case 0: {["AK_47_M","30Rnd_762x39_AK47"]}; 
		  case 1: {["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"]}; 
		  case 2: {["Remington870_lamp","8Rnd_B_Beneli_74Slug"]}; 
		};
		
		"BAF_Soldier_L_DDPM" createUnit [_unitpos, _axeBusGroup, "_axeBusUnit=this;",0.6,"Private"];
		
		_axeBusUnit enableAI "TARGET";
		_axeBusUnit enableAI "AUTOTARGET";
		_axeBusUnit enableAI "MOVE";
		_axeBusUnit enableAI "ANIM";
		_axeBusUnit enableAI "FSM";
		//stop AI attacking bus
		_axeBusUnit setCaptive true;
		_axeBusUnit allowDammage true;

		_axeBusUnit setCombatMode "GREEN";
		_axeBusUnit setBehaviour "CARELESS";
		//clear default weapons / ammo
		removeAllWeapons _axeBusUnit;
		//add random selection
		_aiwep = _ailoadout select 0;
		_aiammo = _ailoadout select 1;
		_axeBusUnit addweapon _aiwep;
		_axeBusUnit addMagazine _aiammo;
		_axeBusUnit addMagazine _aiammo;
		_axeBusUnit addMagazine _aiammo;

		//set skills
		_axeBusUnit setSkill ["aimingAccuracy",1];
		_axeBusUnit setSkill ["aimingShake",1];
		_axeBusUnit setSkill ["aimingSpeed",1];
		_axeBusUnit setSkill ["endurance",1];
		_axeBusUnit setSkill ["spotDistance",0.6];
		_axeBusUnit setSkill ["spotTime",1];
		_axeBusUnit setSkill ["courage",1];
		_axeBusUnit setSkill ["reloadSpeed",1];
		_axeBusUnit setSkill ["commanding",1];
		_axeBusUnit setSkill ["general",1];
		
		if(x==1)then{
		_axeBusUnit assignAsCargo _axeBus;
		_axeBusUnit moveInCargo _axeBus;
		_axeBusUnit addEventHandler ["HandleDamage", {false}];
		}
		else{
		_axeBusGroup selectLeader _axeBusUnit;
		_axeBusDriver = _axeBusUnit;
		_axeBusDriver addEventHandler ["HandleDamage", {false}];
		_axeBus addEventHandler ["killed", {[false] execVM "scripts\busroute\init_bus.sqf"}];//Shouldn't be required
		
		//Test - Allow dev time to get in bus
		sleep 36;
		
		_axeBusUnit assignAsDriver _axeBus;
		_axeBusUnit moveInDriver _axeBus;
		};
	};
	
	waitUntil{!isNull _axeBus};
	//diag_log format ["AXLOG:BUS: Bus Spawned:%1 | Group:%2",_axeBus,_axeBusGroup];
	
	//Monitor Bus
	while {alive _axeBus} do {
	//diag_log format ["AXLOG:BUS: Tick:%1",time];
		//Fuel Bus
		if(fuel _axeBus < 0.2)then{
		_axeBus setFuel 0.3;
		//diag_log format ["AXLOG:BUS: Fuelling Bus:%1 | Group:%2",_axeBus,_axeBusGroup];
		};
		//Junk
		_arrJunk = ["Rubbish1","Rubbish2","Rubbish3","Rubbish4","Rubbish5","Land_Misc_Rubble_EP1","UralWreck","SKODAWreck","HMMWVWreck","datsun02Wreck","hiluxWreck",
		"UAZWreck","datsun01Wreck","Land_Misc_Garb_Heap_EP1","CinderWallHalf_DZ","CinderWall_DZ","Fort_RazorWire","Hedgehog_DZ","Sandbag1_DZ","WoodSmallWallThird_DZ","WoodSmallWall_DZ"];
		
		//Remove Junk
		_junk = (position _axeBus) nearEntities [_arrJunk,15];
		if(count _junk > 0)then{
		diag_log format["AXLOG:BUS:Deleting Junk:%1",_junk];
	{	deleteVehicle  _x;}forEach _junk;
};
		//Keep Bus Alive - Shouldn't be required.
		if(damage _axeBus>0.4)then{
		_axeBus setDamage 0;
		//diag_log format ["AXLOG:BUS: Repairing Bus:%1 | Group:%2",_axeBus,_axeBusGroup];
		};
		
		//Monitor Driver
		if((driver _axeBus != _axeBusDriver)||(driver _axeBus != _axeBusUnit))then{
		//diag_log format ["AXLOG:BUS: Driver Required:%1",driver _axeBus];
		units _axeBusGroup select 0 assignAsDriver _axeBus;
		units _axeBusGroup select 0 moveInDriver _axeBus;
		};
		if(BUSmarkerScript)then{
		//Create marker for bus
		deleteMarker "BUSMarker";
		_BUSMarker = createmarker ["BUSMarker", position _axeBus];
		_BUSMarker setMarkerText "Bus";
		_BUSMarker setMarkerType "DOT";
		_BUSMarker setMarkerColor "ColorRed";
		_BUSMarker setMarkerBrush "Solid";
		_BUSMarker setMarkerSize [1, 1];
		BUSMarker = _BUSMarker;
		};

	sleep 3;
	};
	
	
	
	
