/// Overworld_enc_spawn_update()


if (flute_timer) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// ********************************************************************************************************************
// ********************************************************************************************************************

// --------------------------------------------------------------------------------
// ENCOUNTER OBJ SPAWNING --------------------------------------------------



if (BAIT_timer)
{   BAIT_timer--;  }




if (mot 
&&  mot!=MOT_WALK )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





var _i, _idx, _count, _val,_val1,_val2, _num;
var _clm, _row, _clms, _rows, _pc_clm, _pc_row, _owrc, _ow_clm, _ow_row;
var _data, _str;




_pc_clm = (pcrc>>0)&$FF;
_pc_row = (pcrc>>8)&$FF;






// --------------------------------------------------------------------
if (enc_spawn_timer)
{
    if (pc_step_counter)
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
            _data = dg_area[#_pc_clm,_pc_row];
    _idx = (_data>>0)&$FF;
    _num = (_data>>8)&$FF;
    
    if (_idx>=0 
    &&  _idx<=ds_list_size(g.dl_AREA_NAME)-1 
    &&  g.dl_AREA_NAME[|_idx]+hex_str(_num)==Area_WestA+"01" )
    {   // is in NW Hyrule
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}






// --------------------------------------------------------------------
// Which tsrc types can spawn enc objs
    _ow_clm  = _pc_clm;
    _ow_row  = _pc_row;
if (dest_dist){
    _ow_clm += bit_dir(pc_dir&$3); // += 0,1,-1
    _ow_row += bit_dir(pc_dir&$C); // += 0,1,-1
}

var _tsrc = dg_tsrc[#_ow_clm,_ow_row];

if (RandoTSRC_active)
{
    _val1 = dm_Rando_TSRC[?hex_str(_tsrc)];
    if(!is_undefined(_val1)) _tsrc = (_val1>>2)<<2;
    /*
    _val1 = ((_tsrc&$FF)>>2)<<2;
    _val1 = val(dm_Rando_TSRC[?hex_str(_val1)]);
    if (_val1) _tsrc = (_tsrc&$FF00) | _val1;
    */
}




var _BIOME = Biome_dm[?STR_TSRC+hex_str(_tsrc)+STR_Biome];
//var _BIOME_IDX = val(Biome_dm[?val(_BIOME,"")+STR_Biome+STR_Num]) - 1;
//var _BIOME     = dm_enc[?hex_str(_tsrc)+STR_Biome];
//var _BIOME_IDX = dm_enc[?hex_str(_tsrc)+STR_Biome+STR_Idx];


if (is_undefined(_BIOME) 
|| !val(dm_enc[? _BIOME+"_Can"+STR_Spawn+dk_EncounterInstance]) )
//||  ds_list_find_index(dl_biome_enc_spawn_trigger,_BIOME)==-1) // if the biome doesn't spawn enc objs
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

var _BIOME_NUM = Biome_dm[?_BIOME+STR_Biome+STR_Num];
if (is_undefined(_BIOME_NUM))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// --------------------------------------------------------------------
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// if (pc_step_counter!=0) then the trigger for this spawn must be (enc_spawn_timer==0)
// OG just checks if (pc_step_counter!=0) instead of: if (enc_spawn_timer==0)
if (pc_step_counter) // OG
{
    enc_spawn_timer = val(dm_enc[?_BIOME+STR_Spawn+STR_Cooldown]);
}




var _obj_id_idx1 = $0;
var _obj_id_idx2 = $3;
var _rand_idx    = $1;

// $824D-8264:  $00,60,B0,D0,  00,60,D0,F0,  00,60,C0,E0,  00,50,BB,F0,  00,57,D7,F8,  00,57,D7,FF
//   $00, 60, B0, D0,   // FIELD
//   $00, 60, D0, F0,   // DESERT
//   $00, 60, C0, E0,   // FOREST
//   $00, 50, BB, F0,   // SWAMP
//   $00, 57, D7, F8,   // CEMETERY
//   $00, 57, D7, FF    // VOLCANO
//                      // 
//   $00, 60, D0, F0,   // BEACH
var          _COUNT1 = val(dm_enc[?_BIOME+STR_Spawn+STR_Chance+STR_Count]);
for(_i=0; _i<_COUNT1; _i++) // for data in `dm_enc[?_BIOME+STR_Spawn+STR_Chance..`, values are in decending order, so start at `_i=0`
{
    _obj_id_idx1 = _i;
    if (g.dl_RandomOG[|_rand_idx] >= val(dm_enc[?_BIOME+STR_Spawn+STR_Chance+hex_str(_i+1)]))
    {
        break;//_i
    }
}

_obj_id_idx1 &= $3;
// _idx_obj  = _idx_obj<<2;   // (0,1,2,3)<<2 = 0,4,8,C
// _idx_obj |= 3;             // 3,7,B,F
/*
var    _COUNT1 = ds_grid_height(dg_enc_obj_id_spawn_data_1);
for(_i=_COUNT1-1; _i>=0; _i--)
{
    _obj_id_idx1 = _i;
    if (g.dl_RandomOG[|_rand_idx] >= dg_enc_obj_id_spawn_data_1[#_BIOME_NUM-1,_i])
    {
        break;//_i
    }
}
*/





var _idx_xy  = _BIOME==STR_FIELD || _BIOME==STR_DESER || _BIOME==STR_SWAMP || _BIOME==STR_BEACH;
    _idx_xy  = _idx_xy<<2; // (0,1 <<2) = 0,4
    _idx_xy |= $3;         //             3,7
//



_rand_idx++;

var _enemy_spawned = false;
var _DIST = $2<<SHIFT; // $20
var _a = 3;
             _count = ds_grid_width(dg_enc_inst);
for(_i=0; _i<_count; _i++)
{
    if (dg_enc_inst[#_i,0])
    {
        continue;//_i
    }
    
    if (g.dl_RandomOG[|_rand_idx]&$3==_a)
    {
        _obj_id_idx2--;
        _idx_xy--;
        
            _a--;
        if (_a<0)
        {
            break;//_i
        }
        else
        {
            continue;//_i
        }
    }
    
    
    
    // -------------------------------------------------------------------------------------
    // OBJ TYPE. $8265-8274: $01,02,01,01, 01,01,01,02, 02,01,02,01 ,01,03,01,03
    
    // _idx_obj:  0   1   2   3,    4   5   6   7,    8   9   A   B,    C   D   E   F
    // _TYPES:   01, 02, 01, 01,   01, 01, 01, 02,   02, 01, 02, 01,   01, 03, 01, 03
    
    // _idx_obj&3 = 0:   01, 01, 02, 01
    // _idx_obj&3 = 1:   02, 01, 01, 03
    // _idx_obj&3 = 2:   01, 01, 02, 01
    // _idx_obj&3 = 3:   01, 02, 01, 03
    dg_enc_inst[#_i,0] = dg_enc_obj_id_spawn_data_2[#_obj_id_idx1,_obj_id_idx2];
    
    if(!_enemy_spawned)
    {
        _enemy_spawned = isVal(dg_enc_inst[#_i,0], g.ENC_WEAK,g.ENC_STRG);
        enc_objs_spawned_count += _enemy_spawned;
        
        if (_enemy_spawned 
        &&  f.items&ITM_MEAT 
        && !BAIT_timer 
        &&  BAIT_countdown )
        {   BAIT_countdown--;  }
    }
    
    
    
    
    if (_enemy_spawned 
    &&  f.items&ITM_MEAT 
    && !BAIT_timer 
    && !BAIT_countdown 
    && (!mot || mot==MOT_WALK) )
    {
        //enc_objs_spawned_count = 0;
        BAIT_countdown = 3;
        if(!irandom($3)) BAIT_countdown += sign_(!irandom($1));
        //BAIT_countdown = 2 + irandom($1); // 2-3
        BAIT_timer     = BAIT_DURATION1;
        
        BAIT_owrc  = pcrc;
        // Place the MEAT 1 tile behind PC so enemy can discern what 
        // side of the PC to spawn on to get to the MEAT.
        BAIT_owrc += (abs(bit_dir(pc_dir&$3))<<0) * -bit_dir(pc_dir&$3);
        BAIT_owrc += (abs(bit_dir(pc_dir&$C))<<8) * -bit_dir(pc_dir&$C);
        
        BAIT_ow_x  = ((BAIT_owrc>>0)&$FF) <<SHIFT;
        BAIT_ow_y  = ((BAIT_owrc>>8)&$FF) <<SHIFT;
        BAIT_ow_x += T_SIZE>>1;
        BAIT_ow_y += T_SIZE>>1;
    }
    
    
    
    // X & Y  ------------------------------------------
    // _idx_xy:       0  1  2  3     4  5  6  7
    // $8229-8230:  $58,76,98,7A,  $38,74,B8,7C
    
    // _idx_xy 0-3:  FOREST, CEMETERY, VOLCANO
    // _idx_xy 4-7:  FIELD , DESERT  , SWAMP
    
    // Spawn location possibilitiess are 4 points, 
    // each in a cardinal dir, $20 from pc.
    if (_idx_xy&$4) _val = _DIST+$20; // _DIST=$20
    else            _val = _DIST;     // _DIST=$20
    _val *= sign_(_idx_xy&$2); // +/-($20,40)
    
    
    if (BAIT_timer 
    &&  isVal(dg_enc_inst[#_i,0], g.ENC_WEAK,g.ENC_STRG) ) // Only hostile type
    {   // Spawn on whatever side of PC the meat is on.
        if (_idx_xy&$1) _val = abs(_val) * sign_(BAIT_ow_x-pc_ow_x);
        else            _val = abs(_val) * sign_(BAIT_ow_y-pc_ow_y);
    }
    
    
    // X
                    dg_enc_inst[#_i,1]  = ow_pc_xy(0); // $108
    if (_idx_xy&$1) dg_enc_inst[#_i,1] += _val; // Horizontal
    
    // Y
                    dg_enc_inst[#_i,2]  = ow_pc_xy(1); //  $98
    if!(_idx_xy&$1) dg_enc_inst[#_i,2] += _val; // Vertical
    
    
    /*  _val = dest_dist & (T_SIZE-1);
    if (_val){
        _val = T_SIZE - _val;
        dg_enc_inst[#_i,1] += _val * bit_dir(pc_dir&$3);
        dg_enc_inst[#_i,2] += _val * bit_dir(pc_dir&$C);
    }*/
    
    
    
    
    
    
    
    // MOVEMENT DIR --------------------------------------------
    dg_enc_inst[#_i,3] = 0; // x dir. 0,  1, -1
    dg_enc_inst[#_i,4] = 0; // y dir. 0,  1, -1
    
    
    
    
    
    
    
    // ENC INST LIFE TIMER.  $8247-824C: $0A,0A,18,18,30,30  -----------------------------------------------------------
    dg_enc_inst[#_i,ENC_INST_TMR_IDX] = val(dm_enc[?_BIOME+dk_EncounterInstance+STR_Duration]);
    //dg_enc_inst[#_i,ENC_INST_TMR_IDX] = dl_enc_inst_life_dur[|_BIOME_NUM-1];
    
    
    
    
    
    /*
    sdm("");
    if (1){
        _str  = " ";
        // _str += ", " + hex_str();
        _str += ", ENC INST SPAWNED! " + string(dg_enc_inst[#_i,0]);
        _str += ", x $"         + hex_str(dg_enc_inst[#_i,1]);
        _str += ", y $"         + hex_str(dg_enc_inst[#_i,2]);
        _str += ", clm $"       + hex_str(dg_enc_inst[#_i,1]>>SHIFT);
        _str += ", row $"       + hex_str(dg_enc_inst[#_i,2]>>SHIFT);
        _str += ", pc on tsrc $" + hex_str(_tsrc);
        _str += ", _BIOME $"    + hex_str(_BIOME);
        _str += ", life dur $"  + hex_str(dg_enc_inst[#_i,ENC_INST_TMR_IDX]);
        _str += ", g.tmr_enc_spawn "   + string(g.tmr_enc_spawn);
        sdm(_str);
    }
    
    if (0){
        _str  = " ";
        _str += ", _pc_clm $"       + hex_str(_pc_clm);
        _str += ", _pc_row $"       + hex_str(_pc_row);
        _str += ", pc on tsrc $"    + hex_str(_tsrc);
        _str += ", pc_step_ctr $"   + hex_str(pc_step_ctr);
        sdm(_str);
    }
    
    if (0){
        _str  = " ";
        _str += ", _a $"        + string(_a);
        _str += ", _i $"         + string(_i);
        // _str += ", _idx_obj "   + string(_idx_obj);
        _str += ", _idx_xy "    + string(_idx_xy);
        _str += ", _rand_idx "          + string(_rand_idx);
        _str += ", g.ar_rand[_rand_idx]&3 $" + hex_str(g.ar_rand[_rand_idx]&3);
        _str += ", g.ar_rand[_rand_idx-1] $" + hex_str(g.ar_rand[_rand_idx-1]);
        _str += ", _count " + string(_count);
        show_debug_message(_str);
    }
    
    
    sdm("");
    if(!_a) { sdm(""); sdm(""); }
    */
    
    
    
    _obj_id_idx2--;
    _idx_xy--;
    
    
        _a--;
    if!(_a+1) break;
}


//if (_enemy_spawned) sdm("g.counter1 $"+hex_str(g.counter1));
/*
    enc_objs_spawned_count += _enemy_spawned;
if (enc_objs_spawned_count >= 4)
{   enc_objs_spawned_count  = 0;  }
*/




