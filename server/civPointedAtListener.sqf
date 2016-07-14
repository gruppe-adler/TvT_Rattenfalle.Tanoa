GRAD_civInterrogationAnimations = [
    "AidlPercSnonWnonDnon_talk1",
    "AmovPercMstpSsurWnonDnon",
    "ACE_AmovPercMstpScapWnonDnon",
    "Acts_Kore_Introducing"
];

GRAD_fnc_stopCiv = {
    _civ = _this select 0;
    diag_log format ["GRAD_fnc_stopCiv executed"];
    doStop _civ;

    //if (vehicle _civ != _civ) then {

    _civ leaveVehicle (vehicle _civ);
    diag_log format ["leaveVehicle ordered"];
    waitUntil {vehicle _civ == _civ};
    //};

    _civ switchmove (selectRandom GRAD_civInterrogationAnimations);
    sleep 1;
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    _civ disableAI "ANIM";
    diag_log format ["disabling AI"];

    waitUntil {sleep 1; _civ getVariable ["GRAD_isPointedAtBy",0] == 0};
    _civ switchMove "";
    diag_log format ["reenabling AI"];
    _civ enableAI "MOVE";
    _civ enableAI "FSM";
    _civ enableAI "CHECKVISIBLE";
    _civ enableai "ANIM";

};

GRAD_fnc_questionCiv = {
  _civilian = _this select 0;
  _player = _this select 1;



  diag_log format ["server executes question civ script with civ %1 and player %2", _civilian, _player];

  // dont do anything if the civilian is already in 'use'
  if (_civilian getVariable ["civ_occupied",false]) exitWith {};
  _civilian setVariable ["civ_occupied",true];

  _civ_questioned = _civilian getVariable ["civ_questioned",0];
  _civilian setVariable ["civ_questioned",_civ_questioned + 0.1];

  _knowsSomething = _civilian getVariable ["civ_knowsSomething",false];

  _sentenceDenyingCalmArray = _civilian getVariable ["sentenceDenyingCalm","Ich weiß nichts."];
  _sentenceDenyingSeriousArray = _civilian getVariable ["sentenceDenyingSerious","Bitte, ich weiß nichts."];
  _sentenceDenyingBeggingArray = _civilian getVariable ["sentenceDenyingBegging","Aaaaaah..."];

  _sentenceDenyingCalm = selectRandom _sentenceDenyingCalmArray;
  _sentenceDenyingSerious = selectRandom _sentenceDenyingSeriousArray;
  _sentenceDenyingBegging = selectRandom _sentenceDenyingBeggingArray;

  _sentenceReveal = [
    "Ja, ja.. ich sag es ja. Ich hab jemanden gesehen bei ",
    "Ok, ok. Ich habe gehört, jemand sei bei ",
    "Gut, ich hab etwas gesehen bei ",
    "Lasst mich und ich verrate euch auch alles. Ich habe gehört, es sei jemand bei ",
    "Ich habe gehört bei "
    ] call BIS_fnc_selectRandom;



  _chanceToReveal = CHANCE_TO_REVEAL + _civ_questioned;

  if (_knowsSomething) exitWith {
    if (random 5 > _chanceToReveal) then {
      if (_civ_questioned < 0.4) then {
        cutText [format ["Zivilist: %1",_sentenceDenyingCalm],"PLAIN"];
        _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm]];
        sleep 2;
      };
      if (_civ_questioned >= 0.4 && _civ_questioned <= 0.7) then {
        cutText [format ["Zivilist: %1",_sentenceDenyingSerious],"PLAIN"];
        _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious]];
        _player switchMove "Acts_Executioner_Forehand";
        sleep 0.5;
        _civilian say3D (selectRandom ["smack1","smack2","smack3"]);
        sleep 0.1;
        _civilian say3D (selectRandom ["ouch1","ouch2","ouch3"]);
        sleep 1.9;
        _player switchMove "";

      };
      if (_civ_questioned > 0.7) then {
        cutText [format ["Zivilist: %1",_sentenceDenyingBegging],"PLAIN"];
        _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging]];
        _player switchMove "Acts_Executioner_Backhand";
        sleep 0.5;
        _civilian say3D (selectRandom ["smack1","smack2","smack3"]);
        sleep 0.1;
        _civilian say3D (selectRandom ["ouch1","ouch2","ouch3"]);
        sleep 3.1;
        _player switchMove "";
      };

    } else {
      cutText [format ["Zivilist: %1",_sentenceReveal + (LAST_PILOTS_POSITION select 0) + ". Ich markiere es auf eurer Karte."],"PLAIN"];
      _civilian setVariable ["civ_revealed",true];
      0 = [CURRENT_PILOTS_POSITION select 1, CURRENT_PILOTS_POSITION select 2] execVM "player\createPilotMarker.sqf";
    };
    _civilian setVariable ["civ_occupied",false];
  };

  if (!_knowsSomething) exitWith {
    if (_civ_questioned < 0.4) then {
      cutText [format ["Zivilist: %1",_sentenceDenyingCalm],"PLAIN"];
      _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm]];
      sleep 2;
    };
    if (_civ_questioned >= 0.4 && _civ_questioned <= 0.7) then {
      cutText [format ["Zivilist: %1",_sentenceDenyingSerious],"PLAIN"];
      _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious]];
      _player switchMove "Acts_Executioner_Forehand";
      sleep 0.5;
      _civilian say3D (selectRandom ["smack1","smack2","smack3"]);
      sleep 0.1;
      _civilian say3D (selectRandom ["ouch1","ouch2","ouch3"]);
      sleep 1.9;
      _player switchMove "";
    };
    if (_civ_questioned > 0.7) then {
      cutText [format ["Zivilist: %1",_sentenceDenyingBegging],"PLAIN"];
      _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging]];
      _player switchMove "Acts_Executioner_Backhand";
      sleep 0.5;
      _civilian say3D (selectRandom ["smack1","smack2","smack3"]);
      sleep 0.1;
      _civilian say3D (selectRandom ["ouch1","ouch2","ouch3"]);
      sleep 3.1;
      _player switchMove "";
    };

    // when someone questions too hard, reveal something random
    if (_civ_questioned > 3) then {
      _location = ((nearestLocations [getPos _civilian,
          [
          "NameCity",
          "NameCityCapital",
          "NameMarine",
          "NameVillage",
          "NameLocal"
         ],6000]) call BIS_fnc_selectRandom);
      _text = text _location;
      cutText [format ["Zivilist: %1",_sentenceReveal + _text + ". Ich markiere es auf eurer Karte."],"PLAIN"];
      _civilian setVariable ["civ_revealed",true];
      0 = [getpos _location] execVM "player\createPilotMarker.sqf"; // todo broadcast
    };

    _civilian setVariable ["civ_occupied",false];
  };
};
