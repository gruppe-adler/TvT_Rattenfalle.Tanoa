class GRAD_buy_menu
{
		idd = 1337;
		movingenable = 0;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "uiNamespace setVariable ['GRAD_buy_menu_var', (_this select 0)];";
		fadein = 0.25;
		fadeout = 0.25;

		class ControlsBackground
		{
			class dlgBackground: RscBackground
			{
				idc = 1336;
				x = safeZoneX;
				y = safeZoneY;
				w = safeZoneW;
				h = safeZoneH;
				colorBackground[] = {0,0,0,0.8};
			};


		};



		class Objects {

			class pic1 {
				onObjectMoved = "systemChat str _this";
				idc = 1338;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0};
				position[] = {0,3,0.25};
				positionBack[] = {0,3,0.25};
				// x = 0.5; y = 0.5; z = 1;
				// xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 0;
				enableZoom = 0;
				zoomDuration = 0.001;
				onLoad = "ctrlShow [_this, false];";

			};

			class pic2 {
				onObjectMoved = "systemChat str _this";
				idc = 1339;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic3 {
				onObjectMoved = "systemChat str _this";
				idc = 1340;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic4 {
				onObjectMoved = "systemChat str _this";
				idc = 1341;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";
			};

			class pic5 {
				onObjectMoved = "systemChat str _this";
				idc = 1342;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic6 {
				onObjectMoved = "systemChat str _this";
				idc = 1343;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic7 {
				onObjectMoved = "systemChat str _this";
				idc = 1344;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic8 {
				onObjectMoved = "systemChat str _this";
				idc = 1345;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic9 {
				onObjectMoved = "systemChat str _this";
				idc = 1346;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic10 {
				onObjectMoved = "systemChat str _this";
				idc = 1347;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic11 {
				onObjectMoved = "systemChat str _this";
				idc = 1348;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

			class pic12 {
				onObjectMoved = "systemChat str _this";
				idc = 1349;
				type = 82;
				model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
				scale = 0.3;
				direction[] = {0, -0.35, -0.65};
				up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
				x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
				xBack = 0.5; yBack = 0.5; zBack = 1;
				inBack = 1;
				enableZoom = 1;
				zoomDuration = 0.001;
				onload = "ctrlShow [_this,false]";

			};

		};
};


class GRAD_buy_menu_select_airdrop
{
		idd = 2337;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "uiNamespace setVariable ['GRAD_buy_menu_select_airdrop', (_this select 0)];";
		fadein = 0.25;
		fadeout = 0.25;
		controls[] = { RscCombo_AirDropDirection_txt, RscCombo_AirDropDirection_combo, RscText_map_headline, RscWindIntuitive };

		class controlsBackground
				{
					class GRAD_buy_menu_map : RscMapControl
					{
								idc = 2338;
								maxSatelliteAlpha = 0;
								x = SafeZoneXAbs;
								y = SafeZoneY;
								w = SafeZoneWAbs;
								h = SafeZoneH;
					};


				};


	  class RscText_map_headline : RscStructuredText {
			idc = -1;
			text = "<t size='4' shadow='0' align='center'>Select Dropzone</t>";
			color[] = {1,1,1,0.3};
			x = safeZoneX + (safeZoneX + safeZoneW)/5;
			y = safeZoneY + (safeZoneY + safeZoneH)/20;
			w = safeZoneX + safeZoneW;
			h = safeZoneH/10;
			colorBackground[] = {0,0,0,0.2};
		};

		class RscCombo_AirDropDirection_combo: RscCombo
		{
			idc = 2339;
			text = ""; //--- ToDo: Localize;
			x = safeZoneW + safeZoneX - (8.5 * GUI_GRID_W);
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};

		class RscCombo_AirDropDirection_txt: RscStructuredText
		{
			idc = 2340;
			text = "to be done"; //--- ToDo: Localize;
			x = safeZoneW + safeZoneX - (8.5 * GUI_GRID_W);
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscWindIntuitive {
			idc=2339;
			type=0;
			style=48;
			font="TahomaB";
			colorBackground[]={0,0,0,0};
			colorText[]={0,0,0,0};
			x="SafeZoneX + 0.001";
			y="SafeZoneY + 0.001";
			w=0.2;
			h=0.2*4/3;
			size=0.034;
			sizeEx=0.027;
			text="";
			};
};

class GRAD_DeathCamDisplay
{
		idd = 7000;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "uiNamespace setVariable ['GRAD_DeathCamDisplay', (_this select 0)];";
		fadein = 0.25;
		fadeout = 0.25;

		class controlsBackground
				{
						class GRAD_DeathCam_bg : RscStructuredText
						{
									idc = -1;
									x = SafeZoneX;
									y = SafeZoneY;
									w = SafeZoneW + safeZoneX;
									h = SafeZoneH + safeZoneY;
									colorBackground[] = {0,0,0,0};
									color[] = {0,0,0,0};
									text = "";
						};
				};
		class controls {
			class RscText_DeathCam_headline : RscStructuredText {
				idc = 7001;
				text = "<t size='4' shadow='0' align='center'>Du bist tot.</t>";
				color[] = {1,1,1,0};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneY + safeZoneH)/20;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/10;
				colorBackground[] = {0,0,0,0};
			};
			class RscText_DeathCam_quote : RscStructuredText {
				idc = 7002;
				text = "quote";
				color[] = {1,1,1,0.8};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneH/20)*16;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/10;
				colorBackground[] = {0,0,0,0};
			};
			class RscText_DeathCam_author : RscStructuredText {
				idc = 7003;
				text = "author";
				color[] = {1,1,1,0.4};
				x = safeZoneX + (safeZoneX + safeZoneW)/5;
				y = safeZoneY + (safeZoneH/20)*18;
				w = safeZoneX + safeZoneW;
				h = safeZoneH/10;
				colorBackground[] = {0,0,0,0};
			};
		};
};

class RscTitles {

	class gui_pleasewait
	{
		idd = -1;
		duration = 10e10;
		name = "gui_pleasewait";
		fadeIn = 1;
		fadeOut = 1;
		onLoad = "uiNamespace setVariable ['GRAD_rattrap_loading', (_this select 0)];";

	 	class controls {
			class gui_pleasewait_pic: RscPicture
			{
				idc = -1;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = (10 * GUI_GRID_H) * 3/4;
				text = "pic\loading_pic.jpg";
			};
			class gui_pleasewait_txt : RscStructuredText {
				idc = 4444;
				text = "<t size='1' shadow='0' align='center'>Emergency Landing Zone Search.</t>";
				color[] = {1,1,1,0.3};
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 19 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
		};
	};

	class gui_intel
	{
		idd = -1;
		duration = 10;
		name = "gui_intel";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic_us: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\intel.paa";
			};
		};
	};

};
