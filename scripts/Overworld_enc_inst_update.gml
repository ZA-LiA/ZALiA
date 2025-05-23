/// Overworld_enc_inst_update()


if (flute_timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ********************************************************************************************************************
// ********************************************************************************************************************

// --------------------------------------------------------------------------------
// UPDATE ENC OBJ MOVEMENT -----------------------------------------

var _UpdateMovementDir_VER = 1; // OG(the closest I could get to it)
    _UpdateMovementDir_VER = 2; // Better working but more difficult
//
var _i,_j,_k, _idx, _val,_val1,_val2;
var _count, _count_j,_count_k;
var _x,_y, _target_x,_target_y, _w,_h;
var _clm,_row, _clms,_rows, _owrc, _ow_clm,_ow_row;
var _dk, _str;
var _tsrc;
var _rm_name;
var _biome;

var _PC_DIR_SIGN_X = bit_dir(pc_dir&$3);
var _PC_DIR_SIGN_Y = bit_dir(pc_dir&$C);


var _OFF = T_SIZE-1; // $7 or $F



var _pc_clm  = (pcrc>>0)&$FF;
var _pc_row  = (pcrc>>8)&$FF;


var _target_x  = ow_pc_xy(0);
var _target_y  = ow_pc_xy(1);

if (BAIT_timer)
{
    _target_x += BAIT_ow_x-pc_ow_x;
    _target_y += BAIT_ow_y-pc_ow_y;
}



var _is_new_dir_frame = !(g.counter1&$F); // every 16 frames

var _use_rand = false;
var _use_rand_count = 0;

var          _DG_WIDTH = ds_grid_width(dg_enc_inst);
for(_i=0; _i<_DG_WIDTH; _i++)
{
    if (dg_enc_inst[#_i,0] 
    && !dg_enc_inst[#_i,ENC_INST_TMR_IDX] )
    {   // despawn inst
        for(_j=ds_grid_height(dg_enc_inst)-1; _j>=0; _j--)
        {
            dg_enc_inst[#_i,_j] = 0;
        }
    }
    
    
    if(!dg_enc_inst[#_i,0])
    {
        continue;//_i
    }
    
    
    
    
    // UPDATE MOVEMENT DIR ---------------------------------------------------------------
    if (_is_new_dir_frame) // every 16 frames
    {
        _use_rand = true;
        
        dg_enc_inst[#_i,3] = 0; // move dir x (1, -1)
        dg_enc_inst[#_i,4] = 0; // move dir y (1, -1)
        
        
        // TODO: Fix OG overworld enemy update code. 2024/11/24: Using my own code which does not match the OG behavior.
        switch(_UpdateMovementDir_VER)
        {
            case 1:{ // =============================================================
            // This follows OG code. But something isnt right. Too easy to avoid.
            // The issue may have to do with g_Room_End setting g.counter1=0. 
            // since pc_step_counter & g.counter1 would start at 0, spawns keep happening 
            // right around g.timer==0 and g.counter1=$0-$40 guarantees random movement during 
            // this period. 
            // Reviewing OG, g.counter1 does not reset to 0 when going from side-scrolling to overworld.
            if (dg_enc_inst[#_i,0] != g.ENC_FARY  // if NOT fairy
            &&  g.counter1 >= $40 )
            {
                _use_rand = false;
                
                _x = dg_enc_inst[#_i,1];
                _y = dg_enc_inst[#_i,2];
                //sdm("_i "+string(_i)+", _x $"+hex_str(_x)+", _target_x $"+hex_str(_target_x)+", _y $"+hex_str(_y)+", _target_y $"+hex_str(_target_y));
                
                var _DIST  = $2<<SHIFT; // $20
                    //_DIST += $4;
                var _DISTX = abs(_x-_target_x);
                var _DISTY = abs(_y-_target_y);
                
                if (BAIT_timer)
                {
                     if (_DISTX >= _DISTY) dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                     else                  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
                }
                else if (_DISTY <  _DIST)  dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                else if (_DISTX <  _DIST)  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
                else _use_rand = true;
            }
            
            if (_use_rand)
            {       _val = g.dl_RandomOG[|1+_i];
                if!(_val&$4)               dg_enc_inst[#_i,3] = sign_(_val<$80); // x movement
                else                       dg_enc_inst[#_i,4] = sign_(_val<$80); // y movement
            }
            break;}//case 1:{
            
            
            
            case 2:{ // =============================================================
            // This ver seems to work better, but too difficult.
            if (dg_enc_inst[#_i,0]!=g.ENC_FARY  // if NOT fairy
            &&  g.counter1>=$40 )
            {
                _use_rand = false;
                
                _x = dg_enc_inst[#_i,1];
                _y = dg_enc_inst[#_i,2];
                //sdm("_i "+string(_i)+", _x $"+hex_str(_x)+", _target_x $"+hex_str(_target_x)+", _y $"+hex_str(_y)+", _target_y $"+hex_str(_target_y));
                
                var _DIST  = $2<<SHIFT; // $20
                    //_DIST -= $4;
                var _DISTX = abs(_x-_target_x);
                var _DISTY = abs(_y-_target_y);
                
                if(!BAIT_timer 
                &&  _DISTX>_DIST 
                &&  _DISTY>_DIST )
                {
                     _use_rand = true;
                }
            }
            
            
            if (_use_rand)
            {       _val = g.dl_RandomOG[|1+_i];
                if!(_val&$4)        dg_enc_inst[#_i,3] = sign_(_val<$80); // x movement
                else                dg_enc_inst[#_i,4] = sign_(_val<$80); // y movement
            }
            else
            {
                if (_DISTX>=_DISTY) dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                else                dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            }
            break;}//case 2:{
        }
        
        _use_rand_count += _use_rand;
    }
    
    
    
    // UPDATE X & Y ------------------------------------------------
    dg_enc_inst[#_i,1] += dg_enc_inst[#_i,3]+move_x; // x
    dg_enc_inst[#_i,2] += dg_enc_inst[#_i,4]+move_y; // y
    
    
    
    
    
    
    
    
    // PC COLLISION  ---------------------------------------------------------
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    // -------------------------------------------------------------
    if(!Warp_is_warping)
    {
        _x  = dg_enc_inst[#_i,1]; // enc obj center x
        _y  = dg_enc_inst[#_i,2]; // enc obj center y
        
        _w  = ENC_TRIG_HB_W; // $0A
        _h  = ENC_TRIG_HB_H; // $10
        if(!pointInRect(_x,_y, ow_pc_xy(0)-(_w>>1), ow_pc_xy(1)-(_h>>1), _w,_h) 
        ||  g.dev_invState==2 )
        {   // PC is NOT colliding with this ecounter instance
            continue;//_i
        }
        
        
        
        
        
        // -------------------------------------------------------------
            _pc_clm  = (pcrc>>0)&$FF;
            _pc_row  = (pcrc>>8)&$FF;
        if (dest_dist){
            _pc_clm += _PC_DIR_SIGN_X;
            _pc_row += _PC_DIR_SIGN_Y;
        }
        
        
        
        
        
        _owrc    = (_pc_row<<8) | _pc_clm;
        _rm_name = dm[?hex_str(_owrc)+STR_Special+STR_Encounter];
        if(!is_undefined(_rm_name))
        {   // Dark Forest Kakusu
            pcrc         = _owrc;
            exit_grid_xy =  pcrc; // triggers the change room process -------------------------------
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
        
        
        
        
        
        
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        _tsrc  = dg_tsrc[#_pc_clm,_pc_row];
        
        if (RandoTSRC_active)
        {
            _val1 = dm_Rando_TSRC[?hex_str(_tsrc)];
            if(!is_undefined(_val1)) _tsrc = (_val1>>2)<<2;
            /*
            _val1=((_tsrc&$FF)>>2)<<2;
            _val1=val(dm_Rando_TSRC[?hex_str(_val1)]);
            if (_val1) _tsrc = (_tsrc&$FF00) | _val1;
            */
        }
        
        _biome = dm_enc[?hex_str(_tsrc)+STR_Biome]; // STR_FIELD, STR_DESER, etc..
        
        if (is_undefined(                   _biome) 
        || !is_string(                      _biome) 
        ||  ds_list_find_index(dl_biome_enc,_biome)==-1 )
        {   // PC is NOT on a tile that can go to a rm
            continue;//_i
        }
        
        
        
        
        
        
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // TODO: Add "count" data to ow enc area objects. 
        // $20 is just guessing there won't be more than that.
        _count=$20;  _count_j=_count;
        for(_j=0; _j<_count_j; _j++) // Each rm for this _biome of g.area_name
        {
                         _count_k=_count;
            for(_k=0; _k<_count_k; _k++) // Each ow rect area for the rm
            {   // _dk example: "_FIELD" + "_WestA_" + "02" + "03"
                _dk = _biome + g.area_name + hex_str(_j+1) + hex_str(_k);
                
                if (is_undefined(dm[?_dk+STR_Clm]))
                {
                    if(!_k) _j=_count_j;
                    break;//_k
                }
                
                
                _ow_clm = val(dm[?_dk+STR_Clm]);
                _ow_row = val(dm[?_dk+STR_Row]);
                _clms   = val(dm[?_dk+STR_Clms]);
                _rows   = val(dm[?_dk+STR_Rows]);
                
                /*if(0){if(!_k) sdm("");
                    _str  = " , _dk: "+_dk;
                    _str += ", _ow_clm $"+hex_str(_ow_clm) + ", _ow_row $"+hex_str(_ow_row);
                    _str += ", _clms $"  +hex_str(_clms) + ", _rows $"  +hex_str(_rows);
                    _str += ", _pc_clm $"+hex_str(_pc_clm) + ", _pc_row $"+hex_str(_pc_row);
                    _str += ", is_in_grid(_pc_clm-_ow_clm, _pc_row-_ow_row, _clms, _rows): "+string(is_in_grid(_pc_clm-_ow_clm, _pc_row-_ow_row, _clms, _rows));
                    sdm(""); sdm(_str); sdm("");
                }*/
                
                if (is_in_grid(_pc_clm-_ow_clm, _pc_row-_ow_row, _clms, _rows))
                {   // _dk example: "_FIELD" + "_WestA_" + "02"
                    _dk = STR_Rm + _biome + g.area_name + hex_str(_j+1);
                    _rm_name = dm_enc[?_dk];
                    if (is_undefined(_rm_name))
                    {
                        _j=_count_j;
                        break;//_k
                    }
                    
                    
                    g.encounter_type = dg_enc_inst[#_i,0];
                    
                    pcrc = (_pc_row<<8) | _pc_clm;
                    exit_grid_xy = pcrc; // trigger change room process -------------------------------
                    
                    // enc_reen_dk  = hex_str(exit_grid_xy) + hex_str(pc_dir) + STR_Exit + STR_Encounter;
                    enc_reen = _rm_name+"00"; // exit num $00
                    //dm[?enc_reen_dk] = enc_reen; // WARNING.   This would overwrite ow exit data if the enc happened on a trap tile.
                    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
            }
        }
    }
}



// 2022/12/02. Attempting to nerf encounter instances due to 
// complaints about difficulty after fixing them
if (1&&_UpdateMovementDir_VER==2 
&&  _is_new_dir_frame 
&& !_use_rand_count  // if none picked a random movement dir
&& !BAIT_timer 
&& !irandom(1) ) // chance to change movement dir to a diff dir
{
    var _dl_options = ds_list_create();
    
    for(_i=0; _i<_DG_WIDTH; _i++)
    {
        if (dg_enc_inst[#_i,0])
        {   ds_list_add(_dl_options,_i);  }
    }
    
    if (ds_list_size(_dl_options))
    {
        ds_list_shuffle(_dl_options);
        _i=_dl_options[|0];
        
        dg_enc_inst[#_i,1] -= dg_enc_inst[#_i,3]+move_x; // x
        dg_enc_inst[#_i,2] -= dg_enc_inst[#_i,4]+move_y; // y
        
        
        // set dir to move away from PC
        dg_enc_inst[#_i,3] = abs(dg_enc_inst[#_i,3]) * sign_(ow_pc_xy(0)<dg_enc_inst[#_i,1]); // move dir x (0, 1, -1)
        dg_enc_inst[#_i,4] = abs(dg_enc_inst[#_i,4]) * sign_(ow_pc_xy(1)<dg_enc_inst[#_i,2]); // move dir y (0, 1, -1)
        
        dg_enc_inst[#_i,1] +=    dg_enc_inst[#_i,3]+move_x; // x
        dg_enc_inst[#_i,2] +=    dg_enc_inst[#_i,4]+move_y; // y
    }
    
    ds_list_destroy(_dl_options) _dl_options=undefined;
}









    /*
    // UPDATE MOVEMENT DIR ---------------------------------------------------------------
    if!(g.timer0&$F) // every 16 frames
    {
        _use_rand = true;
        
        dg_enc_inst[#_i,3] = 0; // move dir x (1, -1)
        dg_enc_inst[#_i,4] = 0; // move dir y (1, -1)
        
        
        // Pick movement direction -----------------------------------
        if (dg_enc_inst[#_i,0] != g.ENC_FARY  // if NOT fairy
        &&  g.timer0 >= $40 )
        {
            _use_rand = false;
            
            _x = dg_enc_inst[#_i,1];
            _y = dg_enc_inst[#_i,2];
            //sdm("_i "+string(_i)+", _x $"+hex_str(_x)+", _target_x $"+hex_str(_target_x)+", _y $"+hex_str(_y)+", _target_y $"+hex_str(_target_y));
            
            var _DIST  = $2<<SHIFT; // $20
                _DIST += $4;
            var _DISTX = abs(_x-_target_x);
            var _DISTY = abs(_y-_target_y);
            
            if (BAIT_tmr)
            {
                 if (_DISTX >= _DISTY) dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                 else                  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            }
            else if (_DISTY <  _DIST)  dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
            else if (_DISTX <  _DIST)  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            else _use_rand = true;
        }
        
        if (_use_rand)
        {       _val = g.ar_og_rand[1+_i];
            if!(_val&$4)               dg_enc_inst[#_i,3] = sign_(_val<$80); // x movement
            else                       dg_enc_inst[#_i,4] = sign_(_val<$80); // y movement
        }
    }
    */
    
    /*
    // UPDATE MOVEMENT DIR ---------------------------------------------------------------
    if!(g.timer0&$F) // every 16 frames
    {
        _use_rand = true;
        
        dg_enc_inst[#_i,3] = 0; // move dir x (1, -1)
        dg_enc_inst[#_i,4] = 0; // move dir y (1, -1)
        
        
        // Pick movement direction -----------------------------------
        if (dg_enc_inst[#_i,0] != g.ENC_FARY  // if NOT fairy
        &&  g.timer0 >= $40 )
        {
            _use_rand = false;
            
            _x = dg_enc_inst[#_i,1];
            _y = dg_enc_inst[#_i,2];
            //sdm("_i "+string(_i)+", _x $"+hex_str(_x)+", _target_x $"+hex_str(_target_x)+", _y $"+hex_str(_y)+", _target_y $"+hex_str(_target_y));
            
            var _DIST  = $2<<SHIFT; // $20
                _DIST += $4;
            var _DISTX = abs(_x-_target_x);
            var _DISTY = abs(_y-_target_y);
            
            if (BAIT_tmr)
            {
                 if (_DISTX>=_DISTY) dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                 else                dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            }
            else if (_DISTX<=_DIST)  dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
            else if (_DISTY<=_DIST)  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            else _use_rand = true;
        }
        
        if (_use_rand)
        {       _val = g.ar_og_rand[1+_i];
            if!(_val&$4)             dg_enc_inst[#_i,3] = sign_(_val<$80); // x movement
            else                     dg_enc_inst[#_i,4] = sign_(_val<$80); // y movement
        }
    }
    */
    
    /*
    // UPDATE MOVEMENT DIR ---------------------------------------------------------------
    if!(g.timer0&$F) // every 16 frames
    {
        _use_rand = true;
        
        dg_enc_inst[#_i,3] = 0; // move dir x (1, -1)
        dg_enc_inst[#_i,4] = 0; // move dir y (1, -1)
        
        
        // Pick movement direction -----------------------------------
        if (dg_enc_inst[#_i,0] != g.ENC_FARY  // if NOT fairy
        &&  g.timer0 >= $40 )
        {
            _use_rand = false;
            
            _x = dg_enc_inst[#_i,1];
            _y = dg_enc_inst[#_i,2];
            //sdm("_i "+string(_i)+", _x $"+hex_str(_x)+", _target_x $"+hex_str(_target_x)+", _y $"+hex_str(_y)+", _target_y $"+hex_str(_target_y));
            
            var _DIST  = $2<<SHIFT; // $20
                _DIST += $4;
            var _DISTX = abs(_x-_target_x);
            var _DISTY = abs(_y-_target_y);
            
            if (BAIT_tmr)
            {
                 if (_DISTX>=_DISTY) dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
                 else                dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            }
            else if (_DISTX>=_DIST)  dg_enc_inst[#_i,3] = sign_(_x<_target_x); // x movement
            else if (_DISTY>=_DIST)  dg_enc_inst[#_i,4] = sign_(_y<_target_y); // y movement
            else _use_rand = true;
        }
        
        if (_use_rand)
        {       _val = g.ar_og_rand[1+_i];
            if!(_val&$4)             dg_enc_inst[#_i,3] = sign_(_val<$80); // x movement
            else                     dg_enc_inst[#_i,4] = sign_(_val<$80); // y movement
        }
    }
    */




