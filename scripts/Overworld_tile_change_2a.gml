/// Overworld_tile_change_2a(change type)


with(global.OVERWORLD)
{
    var _i, _clm,_row;
    switch(argument0)
    {
        case TileChangeEvent_TYPE_BOOT1:{
        for(_i=ds_grid_width(dg_ChangeTiles_Boots)-1; _i>=0; _i--)
        {
                      _clm       = (dg_ChangeTiles_Boots[#_i,0]>>0) &$FF;
                           _row  = (dg_ChangeTiles_Boots[#_i,0]>>8) &$FF;
            dg_solid[#_clm,_row] =  dg_ChangeTiles_Boots[#_i,1];
            dg_tsrc[# _clm,_row] =  dg_ChangeTiles_Boots[#_i,2];
        }
        break;}//case TileChangeEvent_TYPE_BOOT1:{
    }
}




