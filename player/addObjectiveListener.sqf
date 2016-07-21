_bluforWinsListener = {
  if (side player == west || side player == independent) then {
      ["US troops safely brought their pilot home.",true,true] call BIS_fnc_endMission;
  } else {
      ["US troops safely brought their pilot home.",false,true] call BIS_fnc_endMission;
  };
};

_opforWinsListener = {
  if (side player == west || side player == independent) then {
      ["Rebels eliminated the pilot.",false,true] call BIS_fnc_endMission;
  } else {
      ["Rebels eliminated the pilot.",true,true] call BIS_fnc_endMission;
  };
};
