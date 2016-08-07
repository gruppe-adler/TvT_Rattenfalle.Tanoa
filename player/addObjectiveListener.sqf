_bluforWinsListener = {
  if (!BLUFOR_WINS) exitWith {};
  if (playerside == west || playerside == independent) then {
      ["US troops safely brought their pilot home.",true,true] call BIS_fnc_endMission;
  } else {
      ["US troops safely brought their pilot home.",false,true] call BIS_fnc_endMission;
  };
};

_opforWinsListener = {
  if (!OPFOR_WINS) exitWith {};
  if (playerside == west || playerside == independent) then {
      ["Rebels eliminated the pilot.",false,true] call BIS_fnc_endMission;
  } else {
      ["Rebels eliminated the pilot.",true,true] call BIS_fnc_endMission;
  };  
};


"BLUFOR_WINS" addPublicVariableEventHandler _bluforWinsListener;
"OPFOR_WINS" addPublicVariableEventHandler _opforWinsListener;