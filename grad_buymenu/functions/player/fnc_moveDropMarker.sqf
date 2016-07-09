moveDropMarker = {
    _pos = _this select 0;
    _marker = _this select 1;

    _marker setMarkerPos _pos;

    closeDialog 0;
};
