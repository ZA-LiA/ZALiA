/// Cutscene_FloorTrap_1_update_1a(phase)


var _i, _clm,_row;
var _count = CrumbleGround_CLMS * CrumbleGround_ROWS;
for(_i=0; _i<_count; _i++)
{
    _clm = CrumbleGround_CLM + (_i mod CrumbleGround_CLMS);
    _row = CrumbleGround_ROW + (_i div CrumbleGround_CLMS);
    switch(argument0)
    {
        case 1:{ // remove tiles
        tile_change_1a(DEPTH_BG2, _clm<<3,_row<<3, 0);
        break;}
        
        case 2:{ // remove solids
        global.dg_solid[#_clm,_row] = 0;
        //tile_change_1a(DEPTH_BG2, _clm<<3,_row<<3, 0, $00, 0);
        break;}
    }
}



_count = MetalBlock_COUNT<<1;
for(_i=0; _i<_count; _i++)
{
    _clm = MetalBlock_CLM + _i;
    _row = MetalBlock_ROW;
    //_row = MetalBlock_ROW + (_i>=(_count>>1));
    if (_clm>=g.rm_clms) break;
    
    switch(argument0){
    case 1:{
    tile_change_1a(DEPTH_BG3, _clm<<3, _row   <<3, 0);
    tile_change_1a(DEPTH_BG3, _clm<<3,(_row+1)<<3, 0);
    break;} // remove tiles
    
    case 2:{
    global.dg_solid[#_clm,_row]   = 0;
    global.dg_solid[#_clm,_row+1] = 0;
    break;} // remove solids
    }
}




