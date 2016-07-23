_quotes = [
["A single death is a tragedy, a million deaths is a statistic.","Joseph Stalin"],
[],
[],
[]
];

_unit = player;
_shooter = _unit getVariable ["ACE_medical_lastDamageSource",_unit];

showCinemaBorder true;

playSound "march_hell";

_filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

_camera = "camera" camCreate (position _unit);
_camera camSetTarget _unit;
_camera cameraEffect ["internal","back"];
_camera camSetFov 0.4;
_camera camCommit 0;
sleep 1;
_camera camSetFov 0.6;
_camera camCommit 5;
sleep 5;
_camera camSetTarget _shooter;
_camera camSetFov 0.2;
_camera camCommit 10;
sleep 10;
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
