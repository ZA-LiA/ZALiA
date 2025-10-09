/// Tyell_update_1()


// Remove tile's solid, unique, hidden
var _i, _x,_y;
for(_i=0;_i<4;_i++)
{
    _x = spawn_xl + ((_i&1)<<3);
    _y = spawn_yt + ((_i>1)<<3);
    tile_change_1a(DEPTH_BG, _x,_y, 0,0, 0,0,0);
}




