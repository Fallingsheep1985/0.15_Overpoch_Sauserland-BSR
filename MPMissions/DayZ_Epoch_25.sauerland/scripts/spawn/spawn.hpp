class E_Spawn_Dialog
{
	idd = -1;
	movingenable = true;
	enableSimulation = true;
	class Controls
	{
		class MapSaue: RscPicture
		{
			idc = 1200;
			text = "scripts\spawn\map.paa";
			x = 0.340983 * safezoneW + safezoneX;
			y = 0.23125 * safezoneH + safezoneY;
			w = 0.30876 * safezoneW;
			h = 0.531375 * safezoneH;
		};
		class BtnHoe: E_RscButton
		{
			idc = 1600;
			text = "Hoeinghausen";
			x = 0.560252 * safezoneW + safezoneX;
			y = 0.59375 * safezoneH + safezoneY;
			w = 0.0530954 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 0;";
		};
		class BtnMoo: E_RscButton
		{
			idc = 1601;
			text = "Moosbach";
			x = 0.576969 * safezoneW + safezoneX;
			y = 0.486875 * safezoneH + safezoneY;
			w = 0.0435326 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 1;";
		};
		class BtnMes: E_RscButton
		{
			idc = 1602;
			text = "Meschede";
			x = 0.526568 * safezoneW + safezoneX;
			y = 0.42375 * safezoneH + safezoneY;
			w = 0.0430816 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 2;";
		};
		class BtnStre: E_RscButton
		{
			idc = 1603;
			text = "Strelingen";
			x = 0.362789 * safezoneW + safezoneX;
			y = 0.349375 * safezoneH + safezoneY;
			w = 0.0508304 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 3;";
		};
		class BtnObe: E_RscButton
		{
			idc = 1604;
			text = "Oberbergbach";
			x = 0.569935 * safezoneW + safezoneX;
			y = 0.388125 * safezoneH + safezoneY;
			w = 0.0544397 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 4;";
		};
		class BtnBerg: E_RscButton
		{
			idc = 1605;
			text = "Berghoven";
			x = 0.531964 * safezoneW + safezoneX;
			y = 0.324375 * safezoneH + safezoneY;
			w = 0.0451144 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 5;";
		};
		class BtnOev: E_RscButton
		{
			idc = 1606;
			text = "Oeventrop";
			x = 0.452343 * safezoneW + safezoneX;
			y = 0.2825 * safezoneH + safezoneY;
			w = 0.0450025 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 6;";
		};
		class BtnArn: E_RscButton
		{
			idc = 1607;
			text = "Arnsberg";
			x = 0.361087 * safezoneW + safezoneX;
			y = 0.264375 * safezoneH + safezoneY;
			w = 0.043142 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 7;";
		};
		class BtnSue: E_RscButton
		{
			idc = 1608;
			text = "Suederbarup";
			x = 0.497265 * safezoneW + safezoneX;
			y = 0.726875 * safezoneH + safezoneY;
			w = 0.0521419 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 8;";
		};
		class BtnOber: E_RscButton
		{
			idc = 1609;
			text = "Oberdorf";
			x = 0.441785 * safezoneW + safezoneX;
			y = 0.651875 * safezoneH + safezoneY;
			w = 0.0400025 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 9;";
		};
		class BtnOste: E_RscButton
		{
			idc = 1610;
			text = "Osterholz";
			x = 0.367552 * safezoneW + safezoneX;
			y = 0.58 * safezoneH + safezoneY;
			w = 0.0387236 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 10;";
		};
		class BtnSch: E_RscButton
		{
			idc = 1611;
			text = "Schueren";
			x = 0.423423 * safezoneW + safezoneX;
			y = 0.461875 * safezoneH + safezoneY;
			w = 0.040142 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 11;";
		};
		class BtnBuer: E_RscButton
		{
			idc = 1612;
			text = "Buersfeld";
			x = 0.471088 * safezoneW + safezoneX;
			y = 0.571875 * safezoneH + safezoneY;
			w = 0.0400955 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 12;";
		};
		class BtnUhl: E_RscButton
		{
			idc = 1613;
			text = "Uhlenbusch";
			x = 0.343423 * safezoneW + safezoneX;
			y = 0.461875 * safezoneH + safezoneY;
			w = 0.045142 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 13;";
		};
		class BtnIhr: E_RscButton
		{
			idc = 1614;
			text = "Ihrhofen";
			x = 0.439935 * safezoneW + safezoneX;
			y = 0.408125 * safezoneH + safezoneY;
			w = 0.0404397 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 14;";
		};
		class BtnAir: E_RscButton
		{
			idc = 1615;
			text = "Airstrip";
			x = 0.577265 * safezoneW + safezoneX;
			y = 0.706875 * safezoneH + safezoneY;
			w = 0.0381419 * safezoneW;
			h = 0.0145 * safezoneH;
			action = "spawnSelect = 15;";
		};
		class BtnDono: E_RscButton
		{
			idc = 1616;
			text = "Base";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0188889 * safezoneH;
			action = "spawnSelect = 40;";
		};
		class BtnRand: E_RscButton
		{
			idc = 1625;
			text = "Random";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0188889 * safezoneH;
			action = "spawnSelect = 41;";
		};
		class LblMap: RscText
		{
			idc = 1000;
			text = "Select spawn point or click here to spawn randomly:";
			x = 0.350521 * safezoneW + safezoneX;
			y = 0.225001 * safezoneH + safezoneY;
			w = 0.239687 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
		class LblMap2: RscText
		{
			idc = 1001;
			text = "Click here to spawn at your base:";
			x = 0.445 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.239687 * safezoneW;
			h = 0.0290741 * safezoneH;
		};
	};
};
