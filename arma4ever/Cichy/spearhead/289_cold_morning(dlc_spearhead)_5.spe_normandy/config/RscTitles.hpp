class RscTitles {
	class Default {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
	};
    class GVAR(introSlideshow) {
        idd = -1;
		fadein = 0.001;
		fadeout = 0.001;
		duration = 9999999;
        onload = "_this call mission_fnc_introSlideshow";
        class controls {
            class RscPicture_1201: RscPicture {
            	idc = 1201;
                text = "data\slides\slide_1.jpg";
                x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
                colortext[] = {0,0,0,0};
            };
            class RscPicture_1202: RscPicture {
            	idc = 1202;
                text = "data\slides\slide_2.jpg";
                x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
                colortext[] = {0,0,0,0};
            };
            class RscPicture_1203: RscPicture {
            	idc = 1203;
                text = "data\slides\slide_3.jpg";
                x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
                colortext[] = {0,0,0,0};
            };
            class RscPicture_1204: RscPicture {
            	idc = 1204;
                text = "data\slides\slide_4.jpg";
                x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
                colortext[] = {0,0,0,0};
            };
            class RscPicture_1205: RscPicture {
            	idc = 1205;
                text = "data\slides\slide_5.jpg";
                x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
                colortext[] = {0,0,0,0};
            };
        };
    };
};
