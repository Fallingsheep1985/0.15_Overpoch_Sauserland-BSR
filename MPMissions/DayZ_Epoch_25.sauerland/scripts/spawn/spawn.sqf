private ["_counter","_vipBase","_vipUID","_findSpot","_isBase","_isNear","_isPZombie","_isZero","_nearPlayers","_position","_seldLoc","_seldRandom","_waitScript"];

cutText ["","BLACK OUT",0];
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
haloSelect = -1;
spawnSelect = -1;
statusSelect = -2;

locArray = [
	[[22155.611,8980.7969,0], [22045.734,9249.6309,0], [21706.324,9489.2549,0], [21580.607,9377.5693,0], [21774.498,9220.5947,0]], //Hoeinghausen
	[[23612.93,12621.984,0], [23308.719,12880.493,0], [22940.457,12822.11,0], [22898.914,12445.987,0], [23224.514,12256.241,0]], //Roosbach
	[[18656.91,16235.612,0], [19368.49,16950.834,0], [18568.738,17583.799,0], [17009.191,18669.23,0], [15785.311,16652.701,0]], //Meshede
	[[3437.1987,18843.248,0], [3025.9553,19183.209,0], [3422.3604,19536.742,0], [3163.4036,19449.713,0], [3570.877,19354.959,0]], //Strelingen
	[[23717.863,18706.191,0], [24151.51,18866.934,0], [24178.889,19346.506,0], [23656.234,19337.293,0], [23469.855,19013.938,0]], //Oberbergbach
	[[18733.816,21955.281,0], [18175.742,21921.025,0], [18060.129,22249.305,0], [18646.75,22429.146,0], [18328.463,22410.592,0]], //Berghouen
	[[8667.6211,22649.57,0], [7804.2739,22685.014,0], [7647.3013,22335.625,0], [8342.2832,21974.842,0], [8884.0908,22309.041,0]], //Oeuentrop
	[[1133.8636,24263.709,0], [1681.769,24368.125,0], [2096.0664,24162.66,0], [1149.5822,23742.75,0], [1988.2822,23906.67,0]], //Arnsberg
	[[13260.167,542.87262,0], [13182.495,1080.603,0], [12709.493,949.15924,0], [12828.987,549.84589,0], [12914.626,1098.5276,0]], //Suederbarup
	[[12336.33,5526.1533,0], [12690.392,5884.9121,0], [12472.629,6160.6401,0], [12030.054,6246.8062,0], [11697.142,5956.978,0]], //Oberdorf
	[[2580.4822,8344.1162,0], [3023.0586,8433.415,0], [2586.7485,7972.0762,0], [3002.6917,7819.3281,0], [3312.1028,7981.4756,0]], //Oslerholz
	[[10786.638,13186.689,0], [11163.099,13368.861,0], [11138.379,13485.189,0], [11008.962,13589.887,0], [10786.968,13512.819,0]],//Schueren
	[[16192.545,8873.8203,0], [16302.314,9105.8643,0], [16587.16,9104.4756,0], [16690.678,8711.9443,0], [16521.158,8484.0713,0]], //Buersfeld
	[[4092.1287,12941.91,0], [4277.1958,13950.928,0], [3585.2058,14189.1,0], [3137.8264,13791.607,0], [3215.0715,13228.36,0]], //Uhlenbusch
	[[9640.0371,19193.469,0], [9907.1494,19034.455,0], [9743.4355,18674.127,0], [9288.3271,18751.678,0], [9318.876,19035.238,0]], //Ihrhofen
	[[17252.738,2166.8608,0], [17489.738,1727.7161,0], [16728.951,2137.9836,0], [16474.027,1903.9719,0], [16837.492,1531.5444,0]] //Airstrip
];

_waitScript =  [] spawn {
	private ["_blocked","_bodies","_bodyCheck","_bodyPos","_vipBase","_vipUID","_i","_idc","_pos"];
	_bodyCheck = {
		if (ctrlVisible 1001) then {
			_vipUID = (getPlayerUID player);
			{if (_vipUID == _x) then {_vipBase = _forEachIndex;};} forEach vipListBase;
			locArray = locArray+[[(vipListBases select _vipBase)]];
		};
		_blocked = false;
		_bodies = [];
		{if (!isNull _x) then {if ((_x getVariable["bodyName",name _x]) == (name player)) then {_bodyPos = (getPosATL _x);_bodies set [count _bodies,_bodyPos];};};} count allDead;
		if (count _bodies != 0) then {
			{
				_bodyPos = _x;
				{
					_pos = (locArray select _forEachIndex) select 0;
					if ((_bodyPos distance _pos) <= bodyCheckDistance) then {
						_idc = (1600+_forEachIndex);
						ctrlShow [_idc,false];
						_blocked = true;
					};
				} forEach locArray;
			} count _bodies;
			if !(ctrlVisible 1616) then {ctrlShow [1001,false];};
			if (_blocked) then {systemChat format ["Note: some spawns are blocked due to a body of yours within %1m",bodyCheckDistance];};
		};
	};
	while {statusSelect < 2} do {
		dayz_temperatur = 36;
		DZE_InRadiationZone = false;
		fnc_usec_damageHandler = {};
		{_x hideObject true;_x allowDamage false;} count (player nearEntities ["CAManBase", 80]);		
		uiSleep 1;
		if (!dialog) then {
			cutText ["","BLACK OUT",0];
			if (statusSelect == -2) then {_i="createDialog";createDialog "E_Class_Dialog";call classFill;};
			if (statusSelect == 0) then {disableUserInput true;disableUserInput true;disableUserInput true;_i="createDialog";createDialog "E_Spawn_Dialog";if !((getPlayerUID player) in vipListBase) then {ctrlShow [1001,false];ctrlShow [1616,false];};call _bodyCheck;uiSleep 1;disableUserInput false;disableUserInput false;disableUserInput false;};
			if (statusSelect == 1) then {_i="createDialog";createDialog "E_Halo_Dialog";};
		};
	};
};

_isPZombie = player isKindOf "PZombie_VB";
#include "class.sqf"
statusSelect = 0;
closeDialog 0;
waitUntil {spawnSelect != -1};
statusSelect = 1;
closeDialog 0;
if (!_isPZombie && (spawnSelect != 41)) then {waitUntil {haloSelect != -1};};
statusSelect = 3;
closeDialog 0;
terminate _waitScript;
{_x hideObject false;_x allowDamage true;} count (player nearEntities ["CAManBase", 80]);
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
cutText ["","BLACK IN"];

if (spawnSelect == 40) exitWith {
	_vipUID = (getPlayerUID player);
	{if (_vipUID == _x) then {_vipBase = _forEachIndex;};} forEach vipListBase;
	_position = vipListBases select _vipBase;
	if (haloSelect == 1) then {player setPosATL [_position select 0,_position select 1,1500];[player,1500] spawn BIS_fnc_halo;} else {player setPosATL _position;};
};
if (spawnSelect == 41) then {spawnSelect = floor (random 15)};

_seldLoc = locArray select spawnSelect;
_seldRandom = _seldLoc call BIS_fnc_selectRandom;
_findSpot = true;
_isNear = false;
_counter = 0;
while {_findSpot && _counter < 20} do {
	_position = ([_seldRandom,0,650,1,0,20,0] call BIS_fnc_findSafePos);
	_nearPlayers = (_position nearEntities ["CAManBase",100]);
	{if ((!isNull _x) && (getPlayerUID _x != "")) then {_isNear = true;};} count _nearPlayers;
	_isZero = ((_position select 0) == 0) && ((_position select 1) == 0);
	_isBase = (count(nearestObjects [_position,["Plastic_Pole_EP1_DZ"],45]) > 0);
	_counter = _counter + 1;
	if (!_isNear && !_isZero && !_isBase) then {_findSpot = false};
};
_position = [_position select 0,_position select 1,0];
if (haloSelect == 1) then {player setPosATL [_position select 0,_position select 1,1500];[player,1500] spawn BIS_fnc_halo;} else {player setPosATL _position;};