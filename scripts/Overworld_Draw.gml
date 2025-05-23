/// Overworld_Draw()


var _C1 = g.room_type=="C" && !exit_grid_xy;
var _A1 = g.room_type=="A" && g.PAUSE_MENU.canDrawSections>g.PAUSE_MENU.ANIM_FRAMES_DEF;


if(!_C1 
&& !_A1 )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if(!Pause_ALLOW_BUFFERING 
&&  g.overworld_paused )
{
    draw_text_(Pause_xl,Pause_yt, Pause_TEXT, Pause_FONT);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}











// -------------------------------------------------------------------
// -------------------------------------------------------------------
var _DEBUG_ENC = DEV && false;

var _i,_j, _idx, _count1;
var _x,_y, _xl,_yt;
var _ow_clm,_ow_row;
var _spr, _pi, _text;
var _datakey1;
var _tid, _tsrc;

//  T_SIZE      is $8 or $10
// _OFF         is $7 or $F
//  SHIFT       is  3 or 4
//var _OFF = T_SIZE-1;

var _SIGN_X = sign(move_x);
var _SIGN_Y = sign(move_y);

//  _pcrc   =   pcrc;
var _pc_clm = ( pcrc>>0)&$FF;
var _pc_row = ( pcrc>>8)&$FF;
var _ow_x   = (_pc_clm<<SHIFT) + (T_SIZE>>1);
var _ow_y   = (_pc_row<<SHIFT) + (T_SIZE>>1);
    _ow_x  -= DRAW_W_;
    _ow_y  -= DRAW_H_;
var _owrc;
// -------------------------------------------------------------------
// -------------------------------------------------------------------
/*
if (_C1 
&& !g.overworld_paused )
{
    if (move_x!=0 
    ||  move_y!=0 )
    {   // if movement happened this frame
        Overworld_Draw_debug_1a(); // Output existing tile counts
    }
}
*/
// -------------------------------------------------------------------
// -------------------------------------------------------------------
// -------------------------------------------------------------------



// -------------------------------------------------------------------
// -------------------------------------------------------------------
if (BootsTileIndicator_can_draw)
{
    BootsTileIndicator_can_draw = false;
    Overworld_Draw_BootsTileHint();
}




if (HiddenExitIndicator_can_draw)
{
    HiddenExitIndicator_can_draw = false;
    
    for(_i=ds_grid_width(HiddenExitIndicator_dg)-1; _i>=0; _i--)
    {
        if (HiddenExitIndicator_dg[#_i,$2]) // $2: can draw
        {
            HiddenExitIndicator_dg[#_i,$2] = false;
            
            _x = HiddenExitIndicator_dg[#_i,$3]; // $3: draw x
            _y = HiddenExitIndicator_dg[#_i,$4]; // $4: draw y
            draw_sprite_(HiddenExitIndicator_sprite,0, _x,_y, -1, HiddenExitIndicator_xscale,HiddenExitIndicator_yscale);
        }
    }
}








// -------------------------------------------------------------------
// Indicate dungeon is cleared ---------------------------------
/*
if (g.room_type=="C")
{
    for(_i=1; _i<=7; _i++)
    {
        if (val(f.dm_quests[?STR_Dungeon+hex_str(_i)+"_FullCleared"]))
        {
            _owrc = g.dm_dungeon[?STR_Dungeon+hex_str(_i)+STR_OWRC];
            if(!is_undefined(_owrc))
            {
                _x  = ((_owrc>>0)&$FF) <<SHIFT;
                _x += draw_move_offset_x;
                _x  = PC_draw_x_base + (_x-pc_ow_x);
                //_x  = (_x>>SHIFT)<<SHIFT;
                
                _y  = ((_owrc>>8)&$FF) <<SHIFT;
                _y += draw_move_offset_y;
                _y  = PC_draw_y_base + (_y-pc_ow_y);
                //_y  = (_y>>SHIFT)<<SHIFT;
                
                if (rectInView(_x+T_SIZE,_y+T_SIZE, T_SIZE,T_SIZE))
                {
                    draw_background_part(ts_Overworld_1_1_2, $80,$90, T_SIZE,T_SIZE, _x,_y);
                }
            }
        }
    }
}
*/








// -------------------------------------------------------------------
// ITM_MAP1,ITM_MAP2.   Kakusu, HP/MP containers, Life dolls
// -------------------------------------------------------------------
if (TreasureMaps_can_draw)
{
    TreasureMaps_can_draw = false;
    
    for(_i=ds_grid_width(TreasureMaps_dg)-1; _i>=0; _i--)
    {
        if (TreasureMaps_dg[#_i,$9]) // $9: can draw
        {
            TreasureMaps_dg[#_i,$9] = false;
            
            _x   = TreasureMaps_dg[#_i,$A]; // $A: draw x
            _y   = TreasureMaps_dg[#_i,$B]; // $B: draw y
            _spr = TreasureMaps_dg[#_i,$C]; // $C: sprite
            _pi  = TreasureMaps_dg[#_i,$D]; // $D: palette index
            
            pal_swap_set(global.palette_image, _pi);
            if (TreasureMaps_dg[#_i,$8]==STR_MAGIC) // $8: item type
            {
                draw_sprite_(TreasureMaps_Magic_sprite1,0, _x,_y); // bubbling liquid
            }
            
            draw_sprite_(_spr,0, _x,_y);
            pal_swap_reset();
        }
    }
}








// BAIT
// -------------------------------------------------------------------
if (BAIT_can_draw)
{
    BAIT_can_draw = false;
    draw_sprite_(BAIT_SPRITE,0, BAIT_draw_x,BAIT_draw_y, global.PI_MOB_ORG);
}









// Encounter Enemies
// -------------------------------------------------------------------
if (Encounters_can_draw)
{
    Encounters_can_draw = false;
    
    if (_DEBUG_ENC){ // debug draw enc trigger hb
        for(_i=ds_grid_width(dg_enc_inst)-1; _i>=0; _i--){
            if(!dg_enc_inst[#_i,0]) continue;
            _x = PC_draw_x_base - (ENC_TRIG_HB_W>>1);
            _y = PC_draw_y_base - (ENC_TRIG_HB_H>>1);
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, ENC_TRIG_HB_W,ENC_TRIG_HB_H, c_orange);
            break;//_i
        }
    }
    
    
    
    for(_i=ds_grid_width(dg_enc_inst)-1; _i>=0; _i--)
    {
        if(!dg_enc_inst[#_i,0]) continue;
        
        
        _idx = bitNum(dg_enc_inst[#_i,0])-1;
        
        _x = dg_enc_inst[#_i,1]; // enc obj center x
        _y = dg_enc_inst[#_i,2]; // enc obj center y
        
        if (_idx==FAIRY_IDX) _pi = global.PI_MOB_ORG;
        else                 _pi = ENC_PI;
        
        _spr = dg_ENC_SPR[#_idx,sign(g.counter1&$8)];
        draw_sprite_(_spr,0, _x,_y, _pi);
        
        
        if (_DEBUG_ENC) drawPointCross(_x,_y, c_aqua,c_fuchsia); // draw obj center
    }
}








// PC
// -------------------------------------------------------------------
if (PC_can_draw)
{
    PC_can_draw = false;
    
    if (PC_draw_is_sheet)
    {
        PC_draw_is_sheet = false;
        draw_sprite_part_(g.pc.Skin_image,0, PC_draw_sheet_xl,PC_draw_sheet_yt, g.pc.Spritesheet_W,g.pc.Spritesheet_H, PC_draw_x,PC_draw_y, global.PI_PC1);
    }
    else
    {
        draw_sprite_(g.pc.Skin_image,PC_draw_image_idx, PC_draw_x,PC_draw_y, global.PI_PC1);
    }
}




// WARP
// -------------------------------------------------------------------
if (Warp_can_draw)
{
    Warp_can_draw = false;
    draw_sprite_(Warp_sprite,0, Warp_draw_x,Warp_draw_y, Warp_pi, Warp_xscale,Warp_yscale);
}

if (WarpText_can_draw)
{
    WarpText_can_draw = false;
    draw_text_(WarpText_draw_xl,WarpText_draw_yt, WarpText_text, WarpText_FONT, global.PI_GUI1);
}








// -------------------------------------------------------------------
if (_C1  // _C1:  g.room_type=="C" && !exit_grid_xy
&&  Pause_ALLOW_BUFFERING 
&&  g.overworld_paused )
{
    draw_text_(Pause_xl,Pause_yt, Pause_TEXT, Pause_FONT);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// Draw check mark over tile if the item has been acquired
// -------------------------------------------------------------------
if (ItemAcquiredIndicator_can_draw)
{
    ItemAcquiredIndicator_can_draw = false;
    
    _count1 = val(f.dm_rando[?STR_Total+STR_Location+STR_Count]);
    for(_i=1; _i<=_count1; _i++)
    {
        _datakey1 = STR_Location+hex_str(_i);
        if (val(dm_rando_locations[?_datakey1+dk_can_draw]))
        {
                dm_rando_locations[?_datakey1+dk_can_draw] = false;
            //
            _spr = val(dm_rando_locations[?_datakey1+STR_Sprite], spr_0);
            _x   = val(dm_rando_locations[?_datakey1+"_X"]);
            _y   = val(dm_rando_locations[?_datakey1+"_Y"]);
            draw_sprite_(_spr,0, _x,_y-1);
            
            _text = dm_rando_locations[?_datakey1+STR_Text];
            if(!is_undefined(_text))
            {
                _xl = val(dm_rando_locations[?_datakey1+STR_Text+"_XL"]);
                _yt = val(dm_rando_locations[?_datakey1+STR_Text+"_YT"]);
                draw_text_(_xl,_yt, _text, ItemAcquiredIndicator_FONT);
            }
        }
    }
}









// Update Tile Animations -----------------------------------
// ----------------------------------------------------------------------------
//if (g.counter0&$40) background_assign(ts_Overworld_1,ts_Overworld_1_2);
//else                background_assign(ts_Overworld_1,ts_Overworld_1_1_2);

// -------------------------------------------------------------------
// -------------------------------------------------------------------
// -------------------------------------------------------------------








// DEBUG DRAW - ------------------------------------------------------
if (_C1 
&&  g.DevTools_state )
{
    if (g.can_draw_Exit_hb 
    ||  g.can_show_t_solid )
    {
        var _dk;
        var _owrc, _ts_x,_ts_y;
        
        for(_i=0; _i<DRAW_ROWS; _i++) // each row
        {
            for(_j=0; _j<DRAW_CLMS; _j++) // each clm
            {
                _tid = dg_tid[#_j,_i];
                if(!tile_exists(_tid)) continue;
                
                _x = tile_get_x(_tid);
                _y = tile_get_y(_tid);
                
                if (rectInView(_x,_y, T_SIZE,T_SIZE))
                {
                    _ow_clm = (_ow_x + (_j<<SHIFT)) >>SHIFT;
                    _ow_row = (_ow_y + (_i<<SHIFT)) >>SHIFT;
                    _owrc   = (_ow_row<<8) | _ow_clm;
                    
                    _x += -_SIGN_X; // FIX. draw is 1 pixel off during movement
                    _y += -_SIGN_Y; // FIX. draw is 1 pixel off during movement
                    
                    
                    // 'Z' to toggle
                    if (g.can_show_t_solid)
                    {
                            _tsrc = dg_solid[#_ow_clm, _ow_row];
                        if (_tsrc)
                        {
                            _ts_x = ((_tsrc>>0)&$F) <<SHIFT;
                            _ts_y = ((_tsrc>>4)&$F) <<SHIFT;
                            draw_background_part(TILESET_TILEMARKER, _ts_x,_ts_y, T_SIZE,T_SIZE, _x,_y);
                        }
                    }
                    
                    
                    // 'E' to toggle
                    if (g.can_draw_Exit_hb)
                    {
                        _dk = hex_str(_owrc);
                        if(!is_undefined(dm[?_dk+STR_RmName])) // if this owrc is an exit
                        {
                            if (dm[?_dk+STR_Open]) _tsrc = $A0; // $A0. Green
                            else                   _tsrc = $B4; // $B4. Red
                            _ts_x = ((_tsrc>>0)&$F) <<SHIFT;
                            _ts_y = ((_tsrc>>4)&$F) <<SHIFT;
                            draw_background_part(TILESET_TILEMARKER, _ts_x,_ts_y, T_SIZE,T_SIZE, _x,_y);
                        }
                    }
                }
            }
        }
    }
}




