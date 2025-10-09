/// break_block(clm, row)

// E23A. break block


var _CLM = argument0;
var _ROW = argument1;

if(!is_in_grid(_CLM,_ROW, g.rm_clms,g.rm_rows))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _DEPTH  = g.dl_TILE_DEPTHS[|(g.dg_RmTile_Break[#_CLM,_ROW]>>8)];

var _i,_j, _clm,_row;
for(_i=ds_grid_width(g.dg_tile_anim)-1; _i>=0; _i--)
{
    if (isVal(g.dg_tile_anim[#_i,0], TID_BREAK1,TID_BREAK3)  // 0: anim num/type
    &&       !g.dg_tile_anim[#_i,1] )                        // 1: counter
    {
        g.dg_tile_anim[#_i,0] = g.dg_RmTile_Break[#_CLM,_ROW] &$FF; // should only be TID_BREAK1 or TID_BREAK3
        g.dg_tile_anim[#_i,1] = 1; // set counter
        g.dg_tile_anim[#_i,3] = 1; // set frame num
        g.dg_tile_anim[#_i,5] = (_ROW<<8) | _CLM;
        g.dg_tile_anim[#_i,6] = _DEPTH;
        
        
        // remove solid & unique right away
        for(_j=0; _j<4; _j++)
        {
            _clm = _CLM+(_j&1);
            _row = _ROW+(_j>1);
            global.dg_solid[#_clm,_row] = 0;
            g.dg_RmTile_Break[#_clm,_row] = 0;
        }
        
        break;
    }
}


aud_play_sound(get_audio_theme_track(dk_BlockBreak));




