//Script Control - Allows you to customize the repack by turning certain scripts on or off - true = on /false = off


//Server watermark
WaterMarkScript = false; //Watermark on/off
server_name = "0.15 Sauserland BSR"; //Watermark Text
//Gambling ( Slotmachine, Guessing Game)
GambleingScript = false; // NO NAPF CASINO YET
//Intro Music
IntroMusicScript = true;
//Server Logo
logoWatermark = false;
//Zombie free bases
ZombieFreeBaseScript = true;
//Fill oil barrels scripts
oilrigFillScript = true;
//Recruit Survivors
RecruitSurvivorsScript = true;
//Roaming Zombie Hordes
HordeScript = true;
//Base jump
BaseJumpScript = true;
//AI BUS Route
BusRouteScript = true; 
//Show marker for AI bus on map
BUSmarkerScript = True; 
//Custom Kill Message's
KillMessageScript = true;
//Weapon Mods
WeaponModScript = true;
//EVR Blowout
EVRScript = true;
//Lights
LightScript = true;
//Welcome Credits
ServerWelcomeCreditsScript = true;
//Admin Tools
AdmintoolsScript = true;
//Debug Monitor
DebugMonitorScript = true;
//deploy Bike
DeployBikeScript = true;
//Burn Tents
BurnTentsScript = true;
//Crafting
craftingScript = true;
//Suicide
SuicideScript = true;
//Binocular Fog
BinocularScript = true;
//Carepackage on self
carepackageSELFScript = true;
//Carepackage on map
carepackageMAPScript = true;
//Sirens
SirenScript = true;
//Animate MV22 wings
AnimateMV22script = true;
//Animate SUV Hatch
AnimateSUVscript = true;
//Nitro
NOSScript = true;
//Regen Blood
RegenBloodScript = true;
//Fast Rope
FastropeScript = true;
//Safezones
SafezoneScripts = true;
//Harvest Hemp
HarvestHempScript = true;
//DZGM (DayZ Group Management)
DZGMScript = true;
//Drink Water
DrinkWaterScript = true;
//Tent Sleep Healing
TentHealScript = true;
//Investigation / Detain / Arrest
ArrestScript = true;
//Trade from Vehicles / backpacks
TradeFromVehicleScript = true;
//Anti Zombie Emitter
AntiZombieEmitterScript = true;
//Zombie bait
ZombieBaitScript = true;
//Zombie bomb bait
ZombieBombScript = true;
//DZAI CLient (does not disable DZAI just the client side part)
DZAIClientScript = true;
//Take Clothes
TakeClothesScript = true;
//Bury Body
BuryHumanScript = true;
//Cannibalism
CannibalismScript = true;
//Zombie Truck
ZombieTruckScript = true;
//Hero Perks
HeroPerkScript = true;
//Walk amongst the dead
WalkAmongstDeadScript = true;
//Rob Bank
RobBankScript = true; 
//Service Points
ServicePointScript = true;
//Snow
SnowScript = true;
//Wind Dust
WindDustScript = true;
//Ground  Fog
GroundFogScript = false;
//JAEM ( Just Another Evac Mod)
JAEMScript = true;
//Advanced Alchemy Building
AdvancedAlchemyScript = true;
//noVoice in side
noVoicesidescript = true;

//CUSTOM BUILDINGS

/* 
to turn on a custom area remove the // from the front
to turn it back off add the // back in

EG
Sector FNG ON
execVM "\z\addons\dayz_server\CustomBuildings\sectorfng\sectorfng_init.sqf";

Sector FNG OFF
//execVM "\z\addons\dayz_server\CustomBuildings\sectorfng\sectorfng_init.sqf";

to turn the map markers on change false to true

*/
if (isServer) then {
//Custom buildings add under here.
execVM "\z\addons\dayz_server\CustomBuildings\bobsbase.sqf";
execVM "\z\addons\dayz_server\CustomBuildings\demonicsbase.sqf";
execVM "\z\addons\dayz_server\CustomBuildings\oilrig1.sqf";
execVM "\z\addons\dayz_server\CustomBuildings\casino.sqf";
};

// DO NOT CHANGE THIS!!
//Repack version 
REPACKMOD = "Overpoch Sauserland BSR"; 
BUILDNUMBER = "106";


