_civilian = _this select 0;

_questioned = _civilian getVariable ["questioned",0];
_civilian setVariable ["questioned",_questioned + 0.1];

_knowsSomething = _civilian getVariable ["knowsSomething",false];

_sentenceDenyingCalm = [
	"Ich weiß von nichts.",
	"Ich habe niemand gesehen.",
	"Nein. Ich habe nichts gehört oder gesehen.",
	"Nein. Ich habe nichts gehört.",
	"Tut mir leid, davon weiß ich nichts.",
	"Wirklich keine Ahnung, tut mir leid.",
	"Keinen blassen Schimmer.",
	"Ich habe nichts gehört.",
	"Davon wüsste ich."
	] call BIS_fnc_selectRandom;

_sentenceDenyingSerious = [
	"Bitte lasst mich laufen, ich habe keine Ahnung.",
	"Ich bin unschuldig, inschallah.",
	"Ich weiß wirklich nichts!",
	"Brüder, glaubt mir, ich weiß nichts!",
	"Nein, ich habe wirklich niemand gesehen!",
	"Nein! Ich schwöre bei meiner Mutter, nein!",
	"Ich weiß nichts!",
	"Neeeein! Ich weiß nichts!"
	] call BIS_fnc_selectRandom;

_sentenceDenyingBegging = [
	"Aaaah, bitte lasst mich doch gehen!",
	"O Gott, o Gott, o Gott... Neiiin!",
	"Bitte, bitte! Ich weiß doch nichts!",
	"Bitte lasst mich! Ich weiß nichts!",
	"Wenn ich es euch doch sage, ich kann euch nichts sagen! Ich weiß es nicht!",
	"Gott wird euch richten!",
	"Schmort in der Hölle ihr Sadisten!",
	"Bitte nein, lasst mich leben! Bitte, ich bin unschuldig!"
	] call BIS_fnc_selectRandom;

_sentenceReveal = [
	"Ja, ja.. ich sag es ja. Ich hab jemanden gesehen bei ",
	"Ok, ok. Ich habe gehört, jemand sei bei ",
	"Gut, ich hab etwas gesehen bei ",
	"Lasst mich und ich verrate euch auch alles. Ich habe gehört, es sei jemand bei ",
	"Ich habe gehört bei "
	] call BIS_fnc_selectRandom;



_chanceToReveal = CHANCE_TO_REVEAL + _questioned;

if (_knowsSomething) exitWith {
	if (random 1 > _chanceToReveal) then {
		if (_questioned < 0.4) then {
			cutText [format ["Zivilist: %1",_sentenceDenyingCalm],"PLAIN"];
		};
		if (_questioned >= 0.4 && _questioned <= 0.7) then {
			cutText [format ["Zivilist: %1",_sentenceDenyingSerious],"PLAIN"];
		};
		if (_questioned > 0.7) then {
			cutText [format ["Zivilist: %1",_sentenceDenyingBegging],"PLAIN"];
		};

	} else {
		cutText [format ["Zivilist: %1",_sentenceReveal + (LAST_PILOTS_POSITION select 0) + ". Ich markiere es auf eurer Karte."],"PLAIN"];
		_civilian setVariable ["revealed",true];
		0 = [LAST_PILOTS_POSITION select 1, LAST_PILOTS_POSITION select 2] execVM "player\createPilotMarker.sqf";
	};
};

if (!_knowsSomething) exitWith {
	if (_questioned < 0.4) then {
		cutText [format ["Zivilist: %1",_sentenceDenyingCalm],"PLAIN"];
	};
	if (_questioned >= 0.4 && _questioned <= 0.7) then {
		cutText [format ["Zivilist: %1",_sentenceDenyingSerious],"PLAIN"];
	};
	if (_questioned > 0.7) then {
		cutText [format ["Zivilist: %1",_sentenceDenyingBegging],"PLAIN"];
	};

	// when someone questions too hard, reveal something random
	if (_questioned > 3) then {
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
		_civilian setVariable ["revealed",true];
		0 = [getpos _location] execVM "player\createPilotMarker.sqf";
	};
};
