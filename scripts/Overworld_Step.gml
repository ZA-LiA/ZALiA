/// Overworld_Step()


var _i, _x, _y, _idx, _num, _val,_val1,_val2, _count, _mapkey;
var _clm,_row, _rm_clm,_rm_row, _pc_clm,_pc_row, _owrc,_owrc1, _ow_clm,_ow_row, _ow_clm1,_ow_row1;
var _dir;
var _tsrc,_tsrc1, _tid;
var _str, _datakey, _data;

var _C1 = !dest_dist && !exit_owrc && !flute_timer;




// -------------------------------------------------------------------
// -------------------------------------------------------------------
RandoTSRC_active = global.can_rando_ow_tsrc && ds_map_size(dm_Rando_TSRC);


move_x = 0;
move_y = 0;


if (_C1)
{
         if (Input.heldHV&$1) pc_dir = $1; // Right
    else if (Input.heldHV&$2) pc_dir = $2; // Left
    else if (Input.heldHV&$4) pc_dir = $4; // Down
    else if (Input.heldHV&$8) pc_dir = $8; // Up
}


var _PC_DIR_SIGN_X = bit_dir(pc_dir&$3);
var _PC_DIR_SIGN_Y = bit_dir(pc_dir&$C);




    _val = dg_area[#(pcrc>>0)&$FF, (pcrc>>8)&$FF]; // -1: No area
if (_val+1 
&&  _val&$FF < ds_list_size(g.dl_AREA_NAME) )
{
    g.area_name = g.dl_AREA_NAME[|_val&$FF];
}



// --------------------------------------------------------------------------------
if (_C1  // _C1 = !dest_dist && !exit_owrc && !flute_timer;
&& !Warp_is_warping 
&&  Input.heldHV )
{
    // Checking to see if move will still be in permitted area
    _pc_clm = ((pcrc>>0)&$FF) + _PC_DIR_SIGN_X;
    _pc_row = ((pcrc>>8)&$FF) + _PC_DIR_SIGN_Y;
    
    _ow_clm = _pc_clm + (_PC_DIR_SIGN_X * OW_CLMS_PAD); // pad=$B
    _ow_row = _pc_row + (_PC_DIR_SIGN_Y * OW_ROWS_PAD); // pad=$A
    
    
    //Overworld_Step_debug_1a(_pc_clm,_pc_row, _ow_clm,_ow_row, _PC_DIR_SIGN_X,_PC_DIR_SIGN_Y);
    
    
    
    // if view after move will be w/in allowable ow area
    if (is_in_grid(_ow_clm,_ow_row, OW_CLMS,OW_ROWS))
    {
        _val = dg_solid[#_pc_clm,_pc_row];
        
        // OST_SOLID1 = $01, OST_SOLID2 = OST_SOLID1+1
        // OST_BOOTS1 = $11, OST_BOOTS2 = OST_BOOTS1+1
        if(!_val 
        || !isVal(_val,OST_SOLID1,OST_SOLID2) )
        {
            if (f.items&ITM_BOOT 
            || !isVal(_val,OST_BOOTS1,OST_BOOTS2) )
            {
                dest_dist = T_SIZE; // T_SIZE: $10
                mot       = MOT_WALK;
                move_distance = 0;
                
                _tsrc  = dg_tsrc[#_pc_clm,_pc_row];
                _tsrc1 = _tsrc&$FF;
                
                if (_tsrc1==TSRC_SWAM01 
                ||  _tsrc1==TSRC_SWAM02 
                ||  _tsrc1==TSRC_SWAM03 
                ||  _tsrc1==TSRC_SWAM04 )
                {
                    move_spd   = MOVE_SPD_2;
                    move_speed = move_SPEED2;
                    
                    if (RandoTSRC_active)
                    {
                        move_spd   = MOVE_SPD_1;
                        move_speed = move_SPEED1;
                        //move_speed = move_SPEED3;
                    }
                }
                else
                {
                    move_spd   = MOVE_SPD_1;
                    move_speed = move_SPEED1;
                }
            }
        }
    }
}








if(!dest_dist 
&&  Input.pressedC ) // pressedC: 'a' or 'b' pressed
{
    if (Input.Jump_pressed)
    {
        if (f.items&ITM_HAMM 
        &&  _C1 ) // var _C1 = !dest_dist && !exit_owrc && !flute_timer;
        {
            _pc_clm = (pcrc>>0)&$FF;
            _pc_row = (pcrc>>8)&$FF;
            
            _ow_clm = (_pc_clm+_PC_DIR_SIGN_X) &$FF;
            _ow_row = (_pc_row+_PC_DIR_SIGN_Y) &$FF;
            _owrc   = (_ow_row<<8) | _ow_clm;
            
            _rm_clm = (DRAW_CLMS>>1)+_PC_DIR_SIGN_X;
            _rm_row = (DRAW_ROWS>>1)+_PC_DIR_SIGN_Y;
            
            _tsrc   = dg_tsrc[#_ow_clm,_ow_row];
            _tsrc1  = _tsrc&$FF;
            if (RandoTSRC_active)
            {
                _val1 = dm_Rando_TSRC[?hex_str(_tsrc)];
                if(!is_undefined(_val1)) _tsrc = (_val1>>2)<<2;
            }
            
            
            if (_owrc==val(dm[?MK_OWRC_TWN_NEWK1])) // New Kasuto
            {
                if(!val(dm[?hex_str(_owrc)+STR_Open]))
                {
                        dm[?hex_str(_owrc)+STR_Open] = 1;
                    _tsrc = (TILESET1_TS_IDX<<8)|TSRC_TOWN08; // $72: town w/ grass bg & green roofs
                    Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                    aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                    aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
                    
                    if (g.anarkhyaOverworld_MAIN 
                    &&  g.anarkhyaOverworld_enabled )
                    {
                        Overworld_tile_change_3(anarkhya_TSRC_NEWKAS, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH1, 0);
                        dg_anarkhya_tsrc[#_ow_clm,_ow_row] = anarkhya_TSRC_NEWKAS;
                    }
                }
            }
            else if(!is_undefined(dm[?STR_Forest+STR_Hammer+hex_str(_owrc)]))
            {   // CUCCO spell secret
                _datakey = STR_Forest+STR_Hammer;
                _data = dm[?_datakey+hex_str(_owrc)];
                // _data example: "_Forest_Hammer_0101"
                _data = strR(_data, string_length(_datakey)+2);
                _data = str_hex(_data);
                switch(_data)
                {
                    default:{
                    _tsrc = (TILESET1_TS_IDX<<8)|TSRC_GRAS01; // $20: field
                    Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                    aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                    break;}
                    
                    case $0101:{
                    if(!val(dm[?hex_str(_owrc)+STR_Open]))
                    {
                            dm[?hex_str(_owrc)+STR_Open] = 1;
                        _tsrc = (TILESET1_TS_IDX<<8)|TSRC_HOUSE04; // HOUSE04: Single house on grass
                        aud_play_sound(get_audio_theme_track(STR_Secret));
                        Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                        aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                    }
                    break;}
                }
            }
            else if (_tsrc1==TSRC_TREE01) // Forest
            //else if (_tsrc==(TILESET1_TS_IDX<<8)|TSRC_TREE01) // Forest
            {
                _tsrc = (TILESET1_TS_IDX<<8)|TSRC_GRAS01; // $20: field
                Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
            }
            else if (inRange(_tsrc1, TSRC_BOUL01,TSRC_BOUL01+7)) // Boulder
            //else if (inRange(_tsrc1, TSRC_BOUL02,TSRC_BOUL02+6)) // Boulder
            //else if (inRange(_tsrc, TSRC_BOUL02,TSRC_BOUL02+6)) // Boulder
            {
                _tsrc = val(dm[?hex_str(_owrc)+STR_TSRC+STR_Under+STR_Boulder], (TILESET1_TS_IDX<<8)|TSRC_PATH03);
                Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                
                if (g.anarkhyaOverworld_MAIN 
                &&  g.anarkhyaOverworld_enabled )
                {
                    if (ds_list_find_index(dl_BoulderCircle_OWRC,_owrc)==-1)
                    {
                        Overworld_tile_change_3(anarkhya_TSRC_RUBBLE, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH2, 0);
                        dg_anarkhya_tsrc_detail[#_ow_clm,_ow_row]=anarkhya_TSRC_RUBBLE;
                    }
                    else
                    {   // No rubble for boulder circle boulders
                        Overworld_tile_change_3(0, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH2, -1);
                        dg_anarkhya_tsrc_detail[#_ow_clm,_ow_row]=0;
                    }
                }
                
                _datakey = STR_Boulder+STR_Circle;
                if(!val(f.dm_quests[?_datakey+STR_Complete]))
                {       _idx = ds_list_find_index(dl_BoulderCircle_OWRC, _owrc);
                    if (_idx+1)
                    {                ds_list_add( dl_BoulderCircle_broke_order, _idx+1);
                            _count = ds_list_size(dl_BoulderCircle_broke_order);
                        if (_count==8)
                        {
                            var _complete=true;
                            for(_i=0; _i<_count; _i++)
                            {
                                _val = f.dm_quests[?_datakey+STR_Order+hex_str(_i+1)];
                                //sdm("_val "+string(_val)+", dl_BoulderCircle_broke_order[|_i] "+string(dl_BoulderCircle_broke_order[|_i]));
                                if (is_undefined(_val) 
                                ||  _val != dl_BoulderCircle_broke_order[|_i] )
                                {
                                    _complete=false;
                                    break;
                                }
                            }
                            
                            if (_complete)
                            {   // Break order was correct
                                f.dm_quests[?_datakey+STR_Complete] = 1;
                                
                                _owrc    = BoulderCircle_center_OWRC;
                                _ow_clm  = (_owrc>>0)&$FF;
                                _ow_row  = (_owrc>>8)&$FF;
                                
                                _pc_clm  = ( pcrc>>0)&$FF;
                                _pc_row  = ( pcrc>>8)&$FF;
                                
                                _rm_clm  = (DRAW_CLMS>>1) + (_ow_clm-_pc_clm);
                                _rm_row  = (DRAW_ROWS>>1) + (_ow_row-_pc_row);
                                
                                _tsrc    = BoulderCircle_center_TSRC; // $C8: Hole in ground
                                Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                                aud_play_sound(get_audio_theme_track(STR_Secret));
                                
                                if (g.anarkhyaOverworld_MAIN 
                                &&  g.anarkhyaOverworld_enabled )
                                {
                                    Overworld_tile_change_3(anarkhya_TSRC_HOLE, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH1, 0);
                                    dg_anarkhya_tsrc[#_ow_clm,_ow_row] = anarkhya_TSRC_HOLE;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    else if (Input.Attack_pressed)
    {
        if (f.items&ITM_FLUT)
        {
            //if (f.items&ITM_MEL1 
            if (g.Rando_FLUTE_WARPING 
            &&  Input.Magic_held 
            &&  val(f.dm_rando[?STR_Rando+STR_Active]) 
            && (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) || val(f.dm_rando[?STR_Randomize+STR_Spell+STR_Locations])) 
            &&  val(f.dm_quests[?STR_Warp+STR_Qualified]) ) // if any warp locations have been opened
            {
                if(!exit_owrc)
                {
                    if(!Warp_state 
                    ||  Warp_state==Warp_state_FLUTE 
                    ||  Warp_state==Warp_state_SPIN_UP )
                    {
                        if(!Warp_state)
                        {
                            var _INST = aud_play_sound(get_audio_theme_track(Warp_FLUTE_THEME));
                            flute_timer = round(audio_sound_length(_INST)*room_speed) + 8;
                            Warp_timer = flute_timer;
                            Warp_owrc  = pcrc;
                            Warp_state = Warp_state_FLUTE;
                        }
                        
                        // change destination
                        _count = ds_grid_width(Warp_dg_DESTINATIONS);
                        for(_i=0; _i<_count; _i++)
                        {
                            Warp_destination_num++;
                            if (Warp_destination_num>_count) Warp_destination_num=1;
                            
                            _val = Warp_dg_DESTINATIONS[#Warp_destination_num-1,0];
                            if (val(f.dm_quests[?STR_Warp+STR_Qualified+_val]))
                            {
                                break;//_i
                            }
                        }
                    }
                }
            }
            else
            {
                if (_C1  // var _C1 = !dest_dist && !exit_owrc && !flute_timer;
                && !Warp_is_warping )
                {
                    var _INST = aud_play_sound(get_audio_theme_track(STR_Flute));
                    //flute_timer = FLUTE_DUR;
                    flute_timer = round(audio_sound_length(_INST)*room_speed) + 8;
                    //Warp_destination_num = 0;
                }
            }
        }
    }
}








// --------------------------------------------------------------------------------
if(!flute_timer)
{
    // For using spritesheets
    pc_sprite_idx  = bitNum(pc_dir)-1;
    pc_sprite_idx += 4 * (mot==MOT_RAFT);
    pc_sprite_idx  = pc_sprite_idx<<1;
    pc_sprite_idx += dest_dist && dest_dist<(T_SIZE>>1);
    
    
    //  mot: Mode Of Transportation
    if (mot==MOT_RAFT)
    {
        if (pc_dir&$3) pc_x_scale = _PC_DIR_SIGN_X;
        else           pc_x_scale = 1;
    }
    else
    {
        pc_x_scale = 1;
    }
}








// --------------------------------------------------------------------------------
if (dest_dist) move_distance += move_speed;

if (move_SYS==2) var _IS_MOVE_FRAME = dest_dist && move_distance>=1;
else             var _IS_MOVE_FRAME = dest_dist && !(g.counter1&(move_spd-1)); // move_spd-1 = 0,1,3

move_distance = frac(move_distance);


if (dest_dist) exit_owrc = 0;


if (_IS_MOVE_FRAME)
{
    dest_dist--;
    move_x = -_PC_DIR_SIGN_X; // + 0, 1, -1
    move_y = -_PC_DIR_SIGN_Y; // + 0, 1, -1
    
    
    if!(dest_dist&(T_SIZE-1)) // T_SIZE-1 = $F
    {
        _pc_clm  = (pcrc>>0)&$FF
        _pc_row  = (pcrc>>8)&$FF
        _pc_clm += -move_x;
        _pc_row += -move_y;
        
        pcrc = (_pc_row<<8) | _pc_clm;
        pcrc_map = pcrc;
        
        if (f.items&ITM_BOOT 
        && !dest_dist )
        {
            WaterSparkle_refresh(pcrc);
        }
    }
}








// --------------------------------------------------------------------------------
// UPDATE ENCOUNTER OBJS --------------------------------------------------
Overworld_enc_spawn_update();
Overworld_enc_inst_update();








// --------------------------------------------------------------------------------
if (_IS_MOVE_FRAME)
{
    if (mot==MOT_WALK) pc_step_counter = (pc_step_counter+1)&$FF;
    
    
    if(!dest_dist) // if finished moving to destination
    {
        mot = 0;
        move_speed    = 0;
        move_distance = 0;
        
        var _PCRC_ = hex_str(pcrc);
        
            _val = val(dm[?_PCRC_+STR_Raft]);
        if (_val 
        &&  f.items&ITM_RAFT )
        {
            // Data Examples: $0101, $0102
            // Raft tiles are in pairs: (01)01 Set num, 01(01) Member num 1 or 2
            // Member 1 is always N or W of member 2
            var _rc1 = pcrc;
            var _rc2 = val(dm[?STR_Raft+hex_str(_val^$3)+STR_OWRC]);
            
            if (_rc2)
            {
                _val = abs(_rc2-_rc1); // end_rc - start_rc
                _dir = (1+(_rc1>_rc2)) <<((_val>$FF)<<1); // RAFT travel dir = 1,2,4,8
                
                // if NOT currently moving in opposite dir of RAFT travel dir
                if ( (_dir&$3 && pc_dir!=_dir^$3) 
                ||   (_dir&$C && pc_dir!=_dir^$C) )
                {
                    mot = MOT_RAFT;
                    pc_dir = _dir;
                    
                    var _SHIFT = (_val>$FF)<<3;      // =        0,8
                    dest_dist  =  _val     >>_SHIFT; // = _val >>0,8
                    dest_dist  = dest_dist << SHIFT;
                    
                    move_spd = MOVE_SPD_1;
                    move_speed    = move_SPEED1;
                    move_distance = 0;
                    aud_play_sound(get_audio_theme_track(STR_Fairy+STR_Greeting));
                }
            }
        }
        else if(!is_undefined(dm[?_PCRC_+STR_RmName]))
        {
            if (val(dm[?_PCRC_+STR_Open]))
            {   // ----- CHECK LEAVE OVERWORLD TO RM ------
                _datakey = _PCRC_+hex_str(pc_dir)+STR_Exit;
                
                if(!is_undefined(dm[?_datakey]))
                {   // Setting exit_owrc triggers the room change process.
                    exit_owrc = pcrc;
                    //sdm("exit_owrc $"+hex_str(exit_owrc));
                }
            }
        }
    }
}








// --------------------------------------------------------------------------------
if (flute_timer)
{
        flute_timer--;
    if(!flute_timer 
    &&  Warp_state!=Warp_state_FLUTE )
    {
        _pc_clm = (pcrc>>0)&$FF;
        _pc_row = (pcrc>>8)&$FF;
        
        
        // River Devil ------------------------------------------------
        _ow_clm = _pc_clm + _PC_DIR_SIGN_X;
        _ow_row = _pc_row + _PC_DIR_SIGN_Y;
        _owrc   = (_ow_row<<8) | _ow_clm;
        _tsrc   = dg_tsrc[#_ow_clm,_ow_row];
        
        
        if (val(dm[?hex_str(_owrc)+STR_River_Devil+STR_State]))
        {
                dm[?hex_str(_owrc)+STR_River_Devil+STR_State] = 0;
            aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
            
            _rm_clm = (DRAW_CLMS>>1) + _PC_DIR_SIGN_X;
            _rm_row = (DRAW_ROWS>>1) + _PC_DIR_SIGN_Y;
            _tsrc   = val(dm[?hex_str(_owrc)+STR_TSRC+STR_Under+STR_River_Devil], -1);
            if (_tsrc==-1)
            {
                switch(val(dm[?hex_str(_owrc)+STR_River_Devil])){
                default:{_tsrc=(TILESET1_TS_IDX<<8)|TSRC_PATH02; break;}
                case  1:{_tsrc=(TILESET1_TS_IDX<<8)|TSRC_BRDG1B; break;} // $B3. Vertically aligned bridge
                //case 2:{_tsrc=(TILESET1_TS_IDX<<8)|(TSRC_TREE01+1); break;} // Orange colored trees tile
                }
            }
            
            Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
            
            if (g.anarkhyaOverworld_MAIN 
            &&  g.anarkhyaOverworld_enabled )
            {
                Overworld_tile_change_3(0, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH2, -1);
                dg_anarkhya_tsrc_detail[#_ow_clm,_ow_row]=0;
            }
        }
        else
        {
            // Three-Eye-Rock-Palace ---------------------------
            _ow_clm = _pc_clm;
            _ow_row = _pc_row + 2;
            _owrc   = (_ow_row<<8) | _ow_clm;
            
            if (_owrc==val(dm[?MK_OWRC_PAL_THRE1]) 
            && !val(dm[?hex_str(_owrc)+STR_Open]) )
            {
                aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
                
                dm[?hex_str(_owrc)+STR_Open] = 1;
                
                _rm_clm = (DRAW_CLMS>>1);
                _rm_row = (DRAW_ROWS>>1) + 2;
                _tsrc   = (TILESET1_TS_IDX<<8)|(TSRC_PALA02+1); // TSRC_PALA02: $90-95: Palace w/ biom bg's
                //_tsrc   = (TILESET1_TS_IDX<<8)|TSRC_PALA01; // $E0: Palace
                Overworld_tile_change_1a(_rm_clm,_rm_row, _ow_clm,_ow_row, _tsrc);
                
                if (g.anarkhyaOverworld_MAIN 
                &&  g.anarkhyaOverworld_enabled )
                {
                    Overworld_tile_change_3(anarkhya_TSRC_PALACE, _rm_clm<<SHIFT,_rm_row<<SHIFT, anarkhya_TILE_DEPTH2, 0);
                    dg_anarkhya_tsrc_detail[#_ow_clm,_ow_row]=anarkhya_TSRC_PALACE;
                }
            }
        }
    }
}








// -------------------------------------------------------------------
// -------------------------------------------------------------------
if (Warp_timer)
{   Warp_timer--;  }


switch(Warp_state)
{   // -------------------------------------------------------------
    case Warp_state_FLUTE:{
    if (Warp_timer) break;
    Warp_timer = Warp_DURATION2; // chance to cancel/avoid warp during this time
    Warp_state = Warp_state_SPIN_UP;
    break;}
    
    // -------------------------------------------------------------
    case Warp_state_SPIN_UP:{
    if (Warp_timer) break; // chance to cancel/avoid warp during this time
    if (pcrc==Warp_owrc 
    && !exit_owrc )
    {
        Warp_is_warping = true;
    }
    Warp_timer = Warp_DURATION3;
    Warp_state = Warp_state_VANISH;
    break;}
    
    // -------------------------------------------------------------
    case Warp_state_VANISH:{
    if (Warp_timer) break;
    if (Warp_is_warping 
    && !exit_owrc )
    {
        Warp_timer = $20;
        Warp_state = Warp_state_OWRC_CHANGE;
    }
    else
    {
        Warp_owrc  = $0000;
        Warp_destination_num = 0;
        Warp_is_warping = false;
        Warp_timer = $0;
        Warp_state = 0;
    }
    break;}
    
    // -------------------------------------------------------------
    case Warp_state_OWRC_CHANGE:{
    g.surf.draw_clear_color = p.C_BLK1;
    if (Warp_timer) break; // solid black screen during this time
    _idx = clamp(Warp_destination_num-1,0,ds_grid_width(Warp_dg_DESTINATIONS)-1);
    pcrc = Warp_dg_DESTINATIONS[#_idx,1];
    var _OW_X  = ((pcrc>>0)&$FF)<<SHIFT;
    var _OW_Y  = ((pcrc>>8)&$FF)<<SHIFT;
        _OW_X += T_SIZE>>1;
        _OW_Y += T_SIZE>>1;
        _OW_X -= DRAW_W_;
        _OW_Y -= DRAW_H_;
    Overworld_refresh_tiles(_OW_X,_OW_Y);
    
    BAIT_timer = 0;
    BAIT_owrc  = $0000;
    BAIT_ow_x  = 0;
    BAIT_ow_y  = 0;
    
    // enc_spawn_timer decrements every $14 frames when g.timer_b reaches -1 in update_game_timers()
    enc_spawn_timer     = 8;
    enc_spawn_timer    += enc_spawn_timer_add; // 12/05/22. Attempting to balance enc difficulty
    enc_spawn_timer_add = 0;
    ds_grid_clear(dg_enc_inst,0);
    
    Warp_owrc  = pcrc;
    Warp_timer = Warp_DURATION3;
    Warp_state = Warp_state_APPEAR;
    break;}
    
    // -------------------------------------------------------------
    case Warp_state_APPEAR:{
    if (Warp_timer) break;
    Warp_timer = Warp_DURATION1;
    Warp_state = Warp_state_SPIN_DOWN;
    break;}
    
    // -------------------------------------------------------------
    case Warp_state_SPIN_DOWN:{
    if (Warp_timer) break;
    Warp_owrc  = $0000;
    Warp_destination_num = 0;
    Warp_is_warping = false;
    Warp_timer = $0;
    Warp_state = 0;
    break;}
}
// -------------------------------------------------------------------
// -------------------------------------------------------------------








if(!flute_timer)
{
    if (WaterSparkle_timer)
    {
        WaterSparkle_timer--;
        if(!WaterSparkle_timer)
        {
            WaterSparkle_timer = WaterSparkle_DURATION0;
            WaterSparkle_refresh(pcrc);
        }
    }
}

if (f.items&ITM_BOOT)
{
    _clm = (pcrc>>0)&$FF;
    _row = (pcrc>>8)&$FF;
    
    var _dl_OWRC=ds_list_create();
    
    // ON pc's tile
    _owrc = pcrc;
    if (ds_list_find_index(dl_BTI_OWRC,_owrc)!=-1) ds_list_add(_dl_OWRC,_owrc);
    
    // RIGHT-OF pc's tile
    if (_clm+1 < OW_CLMS)
    {
        _owrc = (_row<<8)|(_clm+1);
        if (ds_list_find_index(dl_BTI_OWRC,_owrc)!=-1) ds_list_add(_dl_OWRC,_owrc);
    }
    
    // LEFT-OF of pc's tile
    if (_clm-1 >= 0)
    {
        _owrc = (_row<<8)|(_clm-1);
        if (ds_list_find_index(dl_BTI_OWRC,_owrc)!=-1) ds_list_add(_dl_OWRC,_owrc);
    }
    
    // BELOW pc's tile
    if (_row+1 < OW_ROWS)
    {
        _owrc = ((_row+1)<<8)|_clm;
        if (ds_list_find_index(dl_BTI_OWRC,_owrc)!=-1) ds_list_add(_dl_OWRC,_owrc);
    }
    
    // ABOVE pc's tile
    if (_row-1 >= 0)
    {
        _owrc = ((_row-1)<<8)|_clm;
        if (ds_list_find_index(dl_BTI_OWRC,_owrc)!=-1) ds_list_add(_dl_OWRC,_owrc);
    }
    
    
    ds_list_clear(dl_WaterSparkle_idx);
    for(_i=ds_grid_width(dg_BTI)-1; _i>=0; _i--)
    {
        _owrc = dg_BTI[#_i,0];
        if (ds_list_find_index(_dl_OWRC,_owrc)!=-1)
        {
            //dg_BTI[#_i,1] = min(dg_BTI[#_i,1]+1, BTI_DURATION5);
            dg_BTI[#_i,1]++;
            _val = dg_BTI[#_i,1]-BTI_DURATION2;
            if (_val)
            {
                dg_BTI[#_i,1]  = BTI_DURATION2;
                dg_BTI[#_i,1] += _val mod BTI_DURATION4;
            }
        }
        else
        {
            if (dg_BTI[#_i,1])
            {
                dg_BTI[#_i,1]--;
                if (dg_BTI[#_i,1]<BTI_DURATION2)
                {
                    dg_BTI[#_i,1] = 0;
                }
            }
        }
        
        
        _val1 = dg_BTI[#_i,1]-BTI_DURATION2;
        if (_val1>=0)
        {
            // A list of dg_BTI indices that should draw the indication
            ds_list_add(dl_WaterSparkle_idx,_i);
            
            for(_j=0; _j<3; _j++) // sparkle groups for this owrc
            {
                _idx = 2+(_j<<1);
                
                _val2 = BTI_DURATION0*_j;
                _val = (global.App_frame_count-_val2) mod BTI_DURATION3;
                if(!_val) dg_BTI[#_i,_idx+1] = WaterSparkle_get_new_rc();
                
                dg_BTI[#_i,_idx] = 0;
                
                _val2 = (BTI_DURATION3+BTI_DURATION0) * _j;
                if (_val1 >= _val2)
                {
                         if (_val>=BTI_DURATION1)                    dg_BTI[#_i,_idx] = 0;
                    else if (_val>=BTI_DURATION1-(BTI_DURATION1>>2)) dg_BTI[#_i,_idx] = 2;
                    //else if (_val>=BTI_DURATION1-(BTI_DURATION1>>1)) dg_BTI[#_i,_idx] = 2;
                    else                                             dg_BTI[#_i,_idx] = 1;
                }
            }
            // 11111111    11111111    1111
            //     11111111    11111111
            // 1111    11111111    11111111
        }
    }
    
    ds_list_destroy(_dl_OWRC); _dl_OWRC=undefined;
}








// -------------------------------------------------------------------
    pc_ow_x  = ((pcrc>>0)&$FF) <<SHIFT;
    pc_ow_y  = ((pcrc>>8)&$FF) <<SHIFT;
    pc_ow_x += T_SIZE>>1;
    pc_ow_y += T_SIZE>>1;
    _val = dest_dist & (T_SIZE-1);
if (_val){
    _val = T_SIZE - _val;
    pc_ow_x += _val * _PC_DIR_SIGN_X;
    pc_ow_y += _val * _PC_DIR_SIGN_Y;
}




if (exit_owrc)
{
    g.overworld_paused = false;
    audio_stop_sound(global.OVERWORLD.Pause_SOUND1);
    audio_stop_sound(global.OVERWORLD.Pause_SOUND2);
}




// -------------------------------------------------------------------
switch((g.counter0&$7F)>>5){
case 0:{background_assign(ts_OverworldAnim01, ts_OverworldAnim01_00); break;}
case 1:{background_assign(ts_OverworldAnim01, ts_OverworldAnim01_01); break;}
case 2:{background_assign(ts_OverworldAnim01, ts_OverworldAnim01_02); break;}
case 3:{background_assign(ts_OverworldAnim01, ts_OverworldAnim01_03); break;}
}








// -------------------------------------------------------------------
// -------------------------------------------------------------------
if (g.room_type=="C" 
&& !exit_owrc 
&& !g.overworld_paused 
&&  (move_x!=0 || move_y!=0) ) // if movement happened this frame
{
    var _OFF = T_SIZE-1;
    var _pc_clm = ( pcrc>>0)&$FF;
    var _pc_row = ( pcrc>>8)&$FF;
    var _ow_x   = (_pc_clm<<SHIFT) + (T_SIZE>>1);
    var _ow_y   = (_pc_row<<SHIFT) + (T_SIZE>>1);
        _ow_x  -= DRAW_W_;
        _ow_y  -= DRAW_H_;
    //
    tile_layer_shift(Tile_DEPTH1, move_x,move_y);
    
    if (g.anarkhyaOverworld_MAIN 
    &&  g.anarkhyaOverworld_enabled )
    {
        tile_layer_shift(anarkhya_TILE_DEPTH1, move_x,move_y);
        tile_layer_shift(anarkhya_TILE_DEPTH2, move_x,move_y);
    }
    
    // if lined up with the grid this frame after moving, relative to T_SIZE
    if!(dest_dist&_OFF) Overworld_refresh_tiles(_ow_x,_ow_y);
}




Overworld_udp();




