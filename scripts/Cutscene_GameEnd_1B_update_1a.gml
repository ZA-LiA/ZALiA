/// Cutscene_GameEnd_1B_update_1a(speed, dir, end pad)

// Curtains slowly falling
// if (1 && !g.timer0) sdm("Cutscene_GameEnd_1B_update_1a");

// argument[0]
// 0: every   frame
// 1: every 2 frames
// 2: every 4 frames
// 3: every 8 frames...
var _TIMING = 1<<argument[0];

if (g.counter1&_TIMING-1)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






var _DIR     = sign_(argument[1]);
var _END_PAD =       argument[2];



var _i, _idx, _x,_y;
var _depth;

var _ts   = CURTAIN_TS;
var _tsrc = 0;


var _str;




         curtain_frame += _DIR;
     if(!curtain_frame)                curtain_frame = CURTAIN_FRAMES;
else if (curtain_frame>CURTAIN_FRAMES) curtain_frame = 1;


// _C1: A row change up or down will happen this frame
var _C1 = ( _DIR && curtain_frame==1)               // moving down
       || (!_DIR && curtain_frame==CURTAIN_FRAMES); // moving   up
//

var _complete = true;


// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
for(_i=(CURTAIN_CLMS>>1)-1; _i>=0; _i--)
{
    _idx = _i<<1;
    
    if(!dg_curtain[#_idx,0]   // NOT a curtain clm
    ||  dg_curtain[#_idx,1] ) // reached goal
    {
        continue;
    }
    
    
    // If moving up, this will wait for lower curtain to catch up.
    if(!_DIR 
    &&  dg_curtain[#_idx,2] < curtain_lowest_row ) // dg_curtain[#_idx,2]: row under curtain
    {
        continue;
    }
    
    
    
    if (_DIR 
    &&  curtain_frame==1 
    &&  dg_curtain[#_idx,2] >= dg_curtain[#_idx,4] ) // dg_curtain[#_i,4]: this curtain clm's ground row
    {   // Don't go past ground.
        dg_curtain[#_idx,  1] = 1; // reached goal
        dg_curtain[#_idx+1,1] = 1; // reached goal
        continue;
    }
    
    
    
    // CHANGE TILES  ------------------------------------------------
    _depth = dg_curtain[#_idx,5];
    _x     = (CURTAIN_CLM+_idx)<<3;
    
    //
    if (_C1) // Row change up or down. Tile change 2 rows
    {
        if (_DIR) _ts = CURTAIN_TS; // Moving down.
        else      _ts = 0;          // Moving up. 0: Only delete the tile.
        
        _tsrc = dl_curtain_tsrc[|0]; // Mid curtain graphic
        
        _y  = dg_curtain[#_idx,2]; // row under curtain
        _y--;                      // curtain btm row
        _y  = _y<<3;
        tile_change_1a(_depth, _x,  _y, _ts,_tsrc);
        tile_change_1a(_depth, _x+8,_y, _ts,_tsrc+1);
        
        
        dg_curtain[#_idx,  2] += _DIR;
        dg_curtain[#_idx+1,2] += _DIR;
    }
    
    
    _ts   = CURTAIN_TS;
    _tsrc = dl_curtain_tsrc[|curtain_frame];
    
    _y  = dg_curtain[#_idx,2]; // row under curtain
    _y--;                     // curtain btm row
    _y  = _y<<3;
    tile_change_1a(_depth, _x,  _y, _ts,_tsrc);
    tile_change_1a(_depth, _x+8,_y, _ts,_tsrc+1);
    
    
    
    
    // CHECK IF COMPLETE  ---------------------------------------------
    if (curtain_frame==CURTAIN_FRAMES) // last frame if moving down, first frame if moving up
    {
        if (_DIR)
        {   // MOVING DOWN
                _y  = dg_curtain[#_idx,2]; // row under curtain
            if (_y >= dg_curtain[#_idx,4]  // dg_curtain[#_i,4]: this curtain clm's ground row
            ||  _y >= (GROUND_Y>>3)-_END_PAD )
            {
                dg_curtain[#_idx,  1] = 1; // reached goal
                dg_curtain[#_idx+1,1] = 1; // reached goal
                continue;
            }
        }
        else
        {   // MOVING UP
                _y  = dg_curtain[#_idx,2];     // row under curtain
            if (_y <= dg_curtain[#_idx,3] + 4  // dg_curtain[#_i,3]: row under ceiling
            //if (_y <= dg_curtain[#_idx,3] + 4  // dg_curtain[#_i,4]: this curtain clm's ground row
            ||  _y <= (CEILNG_Y>>3)+_END_PAD )
            {
                dg_curtain[#_idx,  1] = 1; // reached goal
                dg_curtain[#_idx+1,1] = 1; // reached goal
                continue;
            }
        }
    }
    
    
    _complete = false; // NOT all curtains have reached their goal
}





// if all curtain reached goal, reset 'reached goal' to 0
if (_complete)
{
    for(_i=0;_i<CURTAIN_CLMS;_i++) dg_curtain[#_i,1] = 0;
}




if (_C1) // Row change up or down happened this frame
//if (curtain_frame==CURTAIN_FRAMES)
{
            curtain_lowest_row = 0;
    for(_i=(CURTAIN_CLMS>>1)-1; _i>=0; _i--)
    {
        _idx = _i<<1;
        if (dg_curtain[#_idx,0]   // IS a curtain clm
        && !dg_curtain[#_idx,1] ) // NOT reached goal
        {
            if (curtain_lowest_row < dg_curtain[#_idx,2]) // dg_curtain[#_idx,2]: row under curtain
            {   curtain_lowest_row = dg_curtain[#_idx,2];  }
        }
    }
}





return _complete;






/*
    if (0 && !_i) {
        show_debug_message("");
        _str  = " ";
        // _str += ",  $"+hex_str();
        // _str += ",  "+string();
        _str += "dg_curtain[#_i,0]: "+string(dg_curtain[#_i,0]);
        _str += ", dg_curtain[#_i,2] $"+hex_str(dg_curtain[#_i,2]);
        _str += ", dg_curtain[#_i,_IDX2] $"+hex_str(dg_curtain[#_i,_IDX2]);
        _str += ", abs(dg_curtain[#_i,2] - dg_curtain[#_i,_IDX2]) $"+hex_str(abs(dg_curtain[#_i,2] - dg_curtain[#_i,_IDX2]));
        _str += ", _END_PAD $"+hex_str(_END_PAD);
        show_debug_message(_str);
        
        
        _str  = " ";
        _str += "_x $"+hex_str(_x)+", _y $"+hex_str(_y);
        
        _str += ", _depth ";
        if!(_depth+1) _str += "-";
        else          _str += " ";
        _str += "$"+hex_str(abs(_depth));
        
        _str += ", _DIR ";
        if!(_DIR+1)   _str += "-";
        else          _str += " ";
        _str += string(abs(_DIR));
        
        _str += ", dg_curtain[#_i,0] == 2: "+string(dg_curtain[#_i,0] == 2);
        _str += ", g.timer0 & _TIMING != 0: "+string(g.timer0 & _TIMING != 0);
        
        show_debug_message(_str);
    }
    
    
*/
