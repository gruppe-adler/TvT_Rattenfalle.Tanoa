/*
player addEventHandler ["Fired",{
    params ['_unit', '_weapon', '_muzzle','_mode','_ammo','_mag','_projectile'];
    _color = "random";

    switch (_ammo) do {
        case "Sub_F_Signal_Red": {_color = "red"}; // 6Rnd_RedSignal_F
        case "Sub_F_Signal_Green": {_color = "green"}; // 6Rnd_GreenSignal_F
        default {};
    };

    _pos = getPosATLVisual _projectile;
    _vel = velocity _projectile;
    _dir = getDir _projectile;
    deletevehicle _projectile;
    
    [_pos, _vel, _dir, 'normal', _color] remoteExec ["callFireworks",2,false]; 
}];
*/