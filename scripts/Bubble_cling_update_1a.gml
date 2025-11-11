/// Bubble_cling_update_1a()


Bubble_cling_update_2a(); // update collision points


var _I2 = ds_grid_width(dg_cling)-4; // 4 center points

// _I3: 2nd to last grid y.
// dg_cling[#5-8, 6 & 8] contain the grid x for the 
// dg_cling[#5-8, 7] is just 0 and not used for anything.
// 2 corner points adjacent to each center point.
// This makes it easy to find the grid x of the corner point.
var _I3 = ds_grid_height(dg_cling)-2; // 2nd to last grid y


dg_cling[#0,1] = dg_cling[#0,0]; // set cling side prev frame


var _MOVE_DIR = byte_bit_dir(hspd,vspd); // $0,$1,$2,$4,$8
//if (_MOVE_DIR==8 && !(g.counter1&$F)) sdm("dg_cling[#0,0] $"+hex_str(dg_cling[#0,0]));




var _IDX = bitNum(_MOVE_DIR)-1; // 0,1,2,3


if (dg_cling[#_I2+_IDX,0]) // mid _MOVE_DIR point is colliding
{
    var         _idx3  = 0;   // RGT, LFT
    if (_IDX<2) _idx3  = 2;   // BTM, TOP
                _idx3 += _I2; // _I2: mid points
    //
    var _NEW_DIR = -sign_(dg_cling[#_idx3,0]);
    if(!dg_cling[#_idx3,  0]   // if RGT,BTM  NOT colliding
    && !dg_cling[#_idx3+1,0] ) // if LFT,TOP  NOT colliding
    {
        _NEW_DIR =  sign_(irandom(1));
        //show_debug_message("Bubble_cling_update_1a(). "+"_NEW_DIR="+string(_NEW_DIR)+" _MOVE_DIR=$"+hex_str(_MOVE_DIR)+", _idx3=$"+hex_str(_idx3)+" _IDX=$"+hex_str(_IDX)+" _I2=$"+hex_str(_I2));
    }
    
    
    
    if (1)
    {
        _idx3 = 1 + sign(_MOVE_DIR&$C); // 1: x, 2: y
        
        var                 _OFF = -(dg_cling[#_I2+_IDX,_idx3]&$7);
        if (_MOVE_DIR&$A)   _OFF = $7 + _OFF;
        
        var               _X_OFF =      _OFF;
        var               _Y_OFF =      _OFF;
        
        if (_MOVE_DIR&$C) _X_OFF =  abs(_OFF) * _NEW_DIR;
        else              _Y_OFF =  abs(_OFF) * _NEW_DIR;
    }
    else
    {
        switch(_MOVE_DIR){
        case 1:{
        var _X_OFF = -(dg_cling[#_I2+_IDX,1]&$7);
        var _Y_OFF = abs(_X_OFF) * _NEW_DIR;
        break;}
        
        case 2:{
        var _X_OFF = $7 - (dg_cling[#_I2+_IDX,1]&$7);
        var _Y_OFF = abs(_X_OFF) * _NEW_DIR;
        break;}
        
        case 4:{
        var _Y_OFF = -(dg_cling[#_I2+_IDX,2]&$7);
        var _X_OFF = abs(_Y_OFF) * _NEW_DIR;
        break;}
        
        case 8:{
        var _Y_OFF = $7 - (dg_cling[#_I2+_IDX,2]&$7);
        var _X_OFF = abs(_Y_OFF) * _NEW_DIR;
        break;}
        }
    }
    
    
    set_xy(id, x+_X_OFF, y+_Y_OFF);
    
                      hspd = 0;
                      vspd = 0;
    if!(_MOVE_DIR&$3) hspd = (spdBase*_NEW_DIR) &$FF;
    else              vspd = (spdBase*_NEW_DIR) &$FF;
    
    dg_cling[#0,0] = _MOVE_DIR; // cling side
    
    Bubble_cling_update_3a(); // rotate
}
else if (dg_cling[#0,0]) // cling side. Side that's anchored to the wall.
{
    var _IDX2  = bitNum(dg_cling[#0,0]) - 1; // 0-3 (should be 2-BTM or 3-TOP)
        _IDX2 += _I2;
    var _IDX1  = dg_cling[#_IDX2, _I3 + -bit_dir(_MOVE_DIR)]; // get gridx of dg_cling
    
    
    if(!dg_cling[#_IDX2,0]   // center point of cling side not colliding anymore
    && !dg_cling[#_IDX1,0] ) // LFT corner   of cling side not colliding anymore
    {
        var _NEW_DIR = bit_dir(dg_cling[#0,0]);
        
        
        
        switch(_MOVE_DIR){
        // -----------------------------------------------------------------
        case 1:{
        var _X_OFF = -((dg_cling[#_IDX1,1]&$7) + 1);
        var _Y_OFF = abs(_X_OFF) * _NEW_DIR;
        
        //var _x     =  dg_cling[#_IDX1,1] + -x_change;
        var _x     =  dg_cling[#_IDX1,1] + _X_OFF;
        var _y     =  dg_cling[#_IDX1,2] + (4*_NEW_DIR);
        break;}
        
        // -----------------------------------------------------------------
        case 2:{
        var _X_OFF = (7-(dg_cling[#_IDX1,1]&$7)) + 1;
        var _Y_OFF = abs(_X_OFF) * _NEW_DIR;
        
        //var _x     =  dg_cling[#_IDX1,1] + -x_change;
        var _x     =  dg_cling[#_IDX1,1] + _X_OFF;
        var _y     =  dg_cling[#_IDX1,2] + (4*_NEW_DIR);
        break;}
        
        // -----------------------------------------------------------------
        case 4:{
        var _Y_OFF = -((dg_cling[#_IDX1,2]&$7) + 1);
        var _X_OFF = abs(_Y_OFF) * _NEW_DIR;
        
        var _x     =  dg_cling[#_IDX1,1] + (4*_NEW_DIR);
        //var _y     =  dg_cling[#_IDX1,2] + -y_change;
        var _y     =  dg_cling[#_IDX1,2] + _Y_OFF;
        break;}
        
        // -----------------------------------------------------------------
        case 8:{
        var _Y_OFF = (7-(dg_cling[#_IDX1,2]&$7)) + 1;
        var _X_OFF = abs(_Y_OFF) * _NEW_DIR;
        
        var _x     =  dg_cling[#_IDX1,1] + (4*_NEW_DIR);
        //var _y     =  dg_cling[#_IDX1,2] + -y_change;
        var _y     =  dg_cling[#_IDX1,2] + _Y_OFF;
        break;}
        }
        
        
        
        if (collide_solid_grid(_x,_y)&TID_SOLID1)
        {
            set_xy(id, x+_X_OFF, y+_Y_OFF);
            
                              hspd = 0;
                              vspd = 0;
            if!(_MOVE_DIR&$3) hspd = (spdBase*_NEW_DIR) &$FF;
            else              vspd = (spdBase*_NEW_DIR) &$FF;
            
            // set cling side
            if (_MOVE_DIR&$3) dg_cling[#0,0] = _MOVE_DIR^$3;
            else              dg_cling[#0,0] = _MOVE_DIR^$C;
            
            Bubble_cling_update_3a(); // rotate
        }
        else if(!dg_cling[#0,4]) // 0 if NO points are colliding
        {
            dg_cling[#0,0] = 0;
            Bubble_cling_update_4a(); // Set orientation for rotation
        }
    }
}




