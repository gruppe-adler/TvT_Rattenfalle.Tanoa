_quotes = [
["A single death is a tragedy, a million deaths is a statistic.","Joseph Stalin"],
["I believe that people would be alive today if there were a death penalty.","Nancy Reagan"],
["The quickest way to end a war is to lose it.","George Orwell"],
["I know not with what weapons World War III will be fought, but World War IV will be fought with sticks and stones.","Albert Einstein"]
];

disableSerialization;

_title = "<t color='#8f110a' size='3' align='center'>Du bist tot.</t>";
_selectedQuote = selectRandom _quotes;
_quote = "<t color='#f9f9f9' size='2' align='center'>" + (_selectedQuote select 0) + "</t>";
_author = "<t color='#f9f9f9' size='1.2' align='center'>" + (_selectedQuote select 1) + "</t>";

_ctrlHeadline = (findDisplay 46) ctrlCreate ["RscStructuredText", 7001];
_ctrlHeadline ctrlSetPosition [safeZoneX, safeZoneH/20*3, safeZoneX + safeZoneW, safeZoneH/10];
_ctrlHeadline ctrlSetBackgroundColor [0,0,0,0];
_ctrlHeadline ctrlSetStructuredText parseText _title;
_ctrlHeadline ctrlSetFade 0.5;
_ctrlHeadline ctrlCommit 0;

_ctrlQuote = (findDisplay 46) ctrlCreate ["RscStructuredText", 7002];
_ctrlQuote ctrlSetPosition [safeZoneX, safeZoneH/20*17, safeZoneX + safeZoneW, safeZoneH/10];
_ctrlQuote ctrlSetBackgroundColor [0,0,0,0];
_ctrlQuote ctrlSetStructuredText parseText _quote;
_ctrlQuote ctrlSetFade 0.5;
_ctrlQuote ctrlCommit 0;

_ctrlAuthor = (findDisplay 46) ctrlCreate ["RscStructuredText", 7003];
_ctrlAuthor ctrlSetPosition [safeZoneX, safeZoneH/20*19, safeZoneX + safeZoneW, safeZoneH/10];
_ctrlAuthor ctrlSetBackgroundColor [0,0,0,0];
_ctrlAuthor ctrlSetStructuredText parseText _author;
_ctrlAuthor ctrlSetFade 0.5;
_ctrlAuthor ctrlCommit 0;

// CAM STUFF

_unit = player;
_shooter = _unit getVariable ["ACE_medical_lastDamageSource",_unit];

showCinemaBorder true;

playSound "march_hell";

_filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

_camera = "camera" camCreate (position _unit);
// _camera camSetTarget _unit;
_camera cameraEffect ["internal","back"];
_camera camSetFov 0.4;
_camera camCommit 1;
sleep 1;
_camera camSetPos [getpos _unit select 0, getpos _unit select 1,3];
_camera camSetFov 0.6;
_camera camCommit 2;
sleep 3;
_camera camSetTarget _shooter;
_camera camSetFov 0.2;
_camera camCommit 5;
sleep 10;
_camera camSetPos [getpos _unit select 0, getpos _unit select 1,50];
_camera camSetTarget _unit;
_camera camSetFov 0.4;
_camera camCommit 55;
sleep 55;
cutText ["", "BLACK OUT", 1];
sleep 1;
_filmgrain ppEffectEnable false;
ppEffectDestroy _filmgrain;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
showCinemaBorder false;
sleep 0.5;
cutText ["", "BLACK IN", 1];
true
