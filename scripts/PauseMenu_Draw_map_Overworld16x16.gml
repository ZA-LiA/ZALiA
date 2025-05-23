/// PauseMenu_Draw_map_Overworld16x16()


var _i,_j;
var _x,_y, _x_base,_y_base;
var _clm,_row, _clms,_rows;
var _grid_x2,_grid_y2, _grid_x2_base,_grid_y2_base;
var _tile_data, _tsrc, _ts_x,_ts_y;


// Calculate 4x4 cell grid
_clm  = (CLMS_MAP_PAPER - paper_drawn_clms) <<1; // 4x4. Convert 8x8 to 4x4
_clms =  CLMS_MAP_TERRA - _clm; // num of 4x4 clms to draw
_row  =  0;                                       // 4x4
_rows =  ROWS_MAP_TERRA - _row; // num of 4x4 rows to draw
//sdm("_clms "+string(_clms)+", _rows "+string(_rows)+", _clm "+string(_clm)+", _row "+string(_row));



// find 4x4 owrc for terrain draw start
_grid_x2_base  = ((global.OVERWORLD.pcrc_map>>0)&$FF) <<2; // 4x4 owrc. Convert 16x16 to 4x4
_grid_x2_base +=  2;                       // 4x4 owrc. center of overworld pcrc
_grid_x2_base -= (CLMS_MAP_TERRA>>1);      // 4x4 owrc. clm-0 of CLMS_MAP_TERRA
_grid_x2_base += _clm;                     // 4x4 owrc. 1st draw clm of this frame

_grid_y2_base  = ((global.OVERWORLD.pcrc_map>>8)&$FF) <<2; // 4x4 owrc. Convert 16x16 to 4x4
_grid_y2_base +=  2;                       // 4x4 owrc. center of overworld pcrc
_grid_y2_base -= (ROWS_MAP_TERRA>>1);      // 4x4 owrc. row-0 of ROWS_MAP_TERRA
_grid_y2_base += _row;                     // 4x4 owrc. 1st draw row of this frame



// terrain draw x/y = g.pm.drawX/Y + 8(win border) + 8(map paper border)
_x_base = drawX + 8 + 8;
_y_base = drawY + 8 + 8;


if (paper_drawn_clms 
&&  paper_drawn_clms < CLMS_MAP_PAPER )
{
    // Adding 1 extra 4x4 column to far left during opening anim.
    // This is to fill some of the blank hard edge on the left 
    // due to the map tears not drawing there until map finish opening.
    _grid_x2_base--;
    _x_base -= 4;
    _clms++; // Now an extra 1 on the right is needed.
}



for(_i=0; _i<_rows; _i++) // each row (4x4 tiles)
{
    for(_j=0; _j<_clms; _j++) // each column (4x4 tiles)
    {
        // 4x4 owrc
        _grid_x2 = _grid_x2_base + _j;
        _grid_y2 = _grid_y2_base + _i;
        
        // (_grid_xy2>>2): _grid_xy2's 16x16 owrc
        _tile_data = global.OVERWORLD.dg_tsrc[#_grid_x2>>2, _grid_y2>>2];
        _tsrc = _tile_data&$FF;
        
        _ts_x  = ((_tsrc>>0) &$F) <<4;  // Tileset's 16x16 tile's left
        _ts_y  = ((_tsrc>>4) &$F) <<4;  // Tileset's 16x16 tile's top
        _ts_x += ((_grid_x2  &$3) <<2); // add num of 4x4 units (times 4 pixels) to left
        _ts_y += ((_grid_y2  &$3) <<2); // add num of 4x4 units (times 4 pixels) to top
        
        _x = _x_base + (_j<<2);
        _y = _y_base + (_i<<2);
        draw_background_part(g.dl_tileset[|(_tile_data>>8)&$FF], _ts_x,_ts_y, 4,4, _x,_y);
        //draw_background_part(global.OVERWORLD.TILESET1, _ts_x,_ts_y, 4,4, _x,_y);
    }
}




