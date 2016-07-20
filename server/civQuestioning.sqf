GRAD_fnc_startTalkLips = {
    (_this select 0) setRandomLip true;
    sleep (random 3);
    (_this select 0) setRandomLip false;
};

GRAD_fnc_questionCiv = {
  _civilian = _this select 0;
  _player = _this select 1;

  diag_log format ["executing GRAD_fnc_questionCiv with civ %1 and player %2 ...", _civilian, _player];

  // dont do anything if the civilian is already in 'use'
  if (_civilian getVariable ["civ_occupied",false]) exitWith {};
  _civilian setVariable ["civ_occupied",true,true];

  _civ_questioned = _civilian getVariable ["civ_questioned",0];
  _civilian setVariable ["civ_questioned",_civ_questioned + 0.1,true];

  _knowsSomething = _civilian getVariable ["civ_knowsSomething",false];
  _alreadyRevealed = _civilian getVariable ["civ_revealed",false];

  _sentenceDenyingCalmArray = _civilian getVariable ["sentenceDenyingCalm",["Ich weiß nichts."]];
  _sentenceDenyingSeriousArray = _civilian getVariable ["sentenceDenyingSerious",["Bitte, ich weiß nichts."]];
  _sentenceDenyingBeggingArray = _civilian getVariable ["sentenceDenyingBegging",["Aaaaaah..."]];

  _sentenceDenyingCalm = selectRandom _sentenceDenyingCalmArray;
  _sentenceDenyingSerious = selectRandom _sentenceDenyingSeriousArray;
  _sentenceDenyingBegging = selectRandom _sentenceDenyingBeggingArray;

  _sentenceQuestionCalmArray = _civilian getVariable ["sentenceQuestionCalm",["Wo ist der Pilot?"]];
  _sentenceQuestionSeriousArray = _civilian getVariable ["sentenceQuestionSerious",["Erzähl uns keine Scheiße!"]];
  _sentenceQuestionRageArray = _civilian getVariable ["sentenceQuestionRage",["Du verdammter Wichser, wir hängen dich auf wenn du nichts rausrückst!"]];

  _sentenceQuestionCalm = selectRandom _sentenceQuestionCalmArray;
  _sentenceQuestionSerious = selectRandom _sentenceQuestionSeriousArray;
  _sentenceQuestionRage = selectRandom _sentenceQuestionRageArray;

  _sentenceReveal = [
  	"Ja, ja.. ich sag es ja. Ich hab jemanden gesehen bei ",
  	"Ok, ok. Ich habe gehört, jemand sei bei ",
  	"Gut, ich hab etwas gesehen bei ",
  	"Lasst mich und ich verrate euch auch alles. Ich habe gehört, es sei jemand bei ",
  	"Ich habe gehört bei "
  	] call BIS_fnc_selectRandom;

  _chanceToReveal = CHANCE_TO_REVEAL + _civ_questioned;

  if (_knowsSomething && !_alreadyRevealed) exitWith {
  	if (random 1 > _chanceToReveal) then {
  		if (_civ_questioned < 0.4) then {
        [position _civilian,_sentenceQuestionCalm, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceQuestionCalm", _sentenceQuestionCalmArray - [_sentenceQuestionCalm],true];
  			sleep 2;
  			[_civilian] spawn GRAD_fnc_startTalkLips;
  			[position _civilian,_sentenceDenyingCalm, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm],true];
  		};
  		if (_civ_questioned >= 0.4 && _civ_questioned <= 0.7) then {
        [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
        [_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
  			sleep 0.5;

        [_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
  			sleep 0.1;
        [_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
  			sleep 1.9;
  			[_player, ""] remoteExec ["switchMove", _player];
  			[_civilian] spawn GRAD_fnc_startTalkLips;
  			[position _civilian,_sentenceDenyingSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious],true];
  		};

  		if (_civ_questioned > 0.4) then {
  				_damage = (_civilian getHitPointDamage "head") + (random 1);
  				[_civilian, _damage, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
  				_civilian setVariable ["ACE_medical_lastDamageSource",_player];
  		};

  		if (_civ_questioned > 0.7) then {
        [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
  			[_player, "Acts_Executioner_Backhand"] remoteExec ["playMoveNow", _player];
  			sleep 0.5;
  			[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
  			sleep 0.1;
  			[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
  			sleep 3.1;
  			[_player, ""] remoteExec ["switchMove", _player];
  			[_civilian] spawn GRAD_fnc_startTalkLips;
  			[position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
        _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];
  		};

  	} else {

      diag_log "civilian knows and talks";
  		sleep 1;
  		[_civilian] spawn GRAD_fnc_startTalkLips;
  		[position _civilian,format ["Zivilist: %1",_sentenceReveal + (CURRENT_PILOTS_POSITION select 0) + ". Ich markiere es auf eurer Karte."],[CURRENT_PILOTS_POSITION select 1, CURRENT_PILOTS_POSITION select 2]] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
  		_civilian setVariable ["civ_revealed",true,true];
  	};
  	_civilian setVariable ["civ_occupied",false,true];
  };

  if (!_knowsSomething) exitWith {
  	if (_civ_questioned < 0.4) then {
      [position _civilian,_sentenceQuestionCalm, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionCalm", _sentenceQuestionCalmArray - [_sentenceQuestionCalm],true];
  		sleep 2;
  		[_civilian] spawn GRAD_fnc_startTalkLips;
  		[position _civilian,_sentenceDenyingCalm, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm],true];

  	};
  	if (_civ_questioned >= 0.4 && _civ_questioned <= 0.7) then {
      [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
  		[_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
  		sleep 0.5;
  		[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
  		sleep 0.1;
  		[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
  		sleep 1.9;
  		[_player, ""] remoteExec ["switchMove", _player];
  		[_civilian] spawn GRAD_fnc_startTalkLips;
  		[position _civilian,_sentenceDenyingSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious],true];
  	};
  	if (_civ_questioned > 0.7) then {
      [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
  		[_player, "Acts_Executioner_Backhand"] remoteExec ["playMoveNow", _player];
  		sleep 0.5;
  		[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
  		sleep 0.1;
  		[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
  		sleep 3.1;
  		[_player, ""] remoteExec ["switchMove", _player];
  		[_civilian] spawn GRAD_fnc_startTalkLips;
  		[position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];
  	};

  	if (_civ_questioned > 0.4) then {
  			_damage = (_civilian getHitPointDamage "hithead") + (random 0.3);
  			[_civilian, _damage, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
  			_civilian setVariable ["ACE_medical_lastDamageSource",_player];
  	};

  	// when someone questions too hard, reveal something random
  	if (_civ_questioned > 3 && alive _civilian) then {
      diag_log "civilian doesnt know and talks";
  		_location = ((nearestLocations [getPos _civilian,
     			[
  		    "NameCity",
  		    "NameCityCapital",
  		    "NameMarine",
  		    "NameVillage",
  		    "NameLocal"
  		   ],6000]) call BIS_fnc_selectRandom);
  		_text = text _location;
  		[_civilian] spawn GRAD_fnc_startTalkLips;
  		[position _civilian,format ["Zivilist: %1",_sentenceReveal + _text + ". Ich markiere es auf eurer Karte."],[getpos _location]] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
  		_civilian setVariable ["civ_revealed",true,true];

  	};

  	_civilian setVariable ["civ_occupied",false,true];
  };

  // if you just go on hitting him...

  if (_civ_questioned > 0.4) then {
      _damage = (_civilian getHitPointDamage "hithead") + (random 0.3);
      [_civilian, _damage, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
      _civilian setVariable ["ACE_medical_lastDamageSource",_player];
  };


  [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
  _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
  [_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
  sleep 0.5;
  [_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
  sleep 0.1;
  [_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
  sleep 3.1;
  [_player, ""] remoteExec ["switchMove", _player];
  [_civilian] spawn GRAD_fnc_startTalkLips;
  [position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
  _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];

	_civilian setVariable ["civ_occupied",false,true];
};
