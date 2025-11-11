/// Overworld_udp()


var _val, _idx, _count,_count1,_count2;
var _x,_y, _yoff;
var _clm,_row;
var _spr, _pi;
var _item_id, _datakey1, _owrc_;
var _C1 = g.room_type=="C" && !exit_owrc;


if (false)
{
    // adjusts an unintended 1 pixel offset while pc is moving
    draw_move_offset_x = -sign(move_x);
    draw_move_offset_y = -sign(move_y);
}
else
{
    draw_move_offset_x = 0;
    draw_move_offset_y = 0;
}




Pause_xl = viewXC() - (Pause_TEXT_W>>1);
Pause_yt = viewYC() - 4;




PC_can_draw       = _C1 && (Warp_owrc!=pcrc || !isVal(Warp_state, Warp_state_VANISH,Warp_state_OWRC_CHANGE,Warp_state_APPEAR));
PC_draw_image_idx = $60 | (pc_sprite_idx&$F);
PC_draw_xoff      = PC_draw_XOFF;
PC_draw_yoff      = PC_draw_YOFF;
PC_draw_x_base    = ow_pc_xy(0); // pc view x
PC_draw_y_base    = ow_pc_xy(1); // pc view y
PC_draw_x         = PC_draw_x_base + PC_draw_xoff;
PC_draw_y         = PC_draw_y_base + PC_draw_yoff;

_idx              = val(global.pc.dm_skins[?STR_Current+STR_Idx]);
PC_draw_is_sheet  = val(global.pc.dm_skins[?hex_str(_idx)+"_source_is_file"]);
PC_draw_sheet_xl  = global.pc.Spritesheet_W * pc_sprite_idx;
PC_draw_sheet_yt  = global.pc.Spritesheet_H * $E;

if (PC_draw_is_sheet)
{
    PC_draw_x -= global.pc.Spritesheet_W>>1;
    PC_draw_y -= global.pc.Spritesheet_H>>1;
}








Encounters_can_draw = _C1;




BAIT_can_draw = _C1 && BAIT_timer;

BAIT_draw_x  = PC_draw_x_base + (BAIT_ow_x-pc_ow_x);
BAIT_draw_x += draw_move_offset_x;

BAIT_draw_y  = PC_draw_y_base + (BAIT_ow_y-pc_ow_y);
BAIT_draw_y += draw_move_offset_y;








Warp_can_draw = false;
Warp_sprite   = 0;
Warp_xscale   = 1;
Warp_yscale   = 1;
WarpText_can_draw = false;

if (_C1 
&&  Warp_state )
{
    switch(Warp_state)
    {   // -----------------------------------------
        case Warp_state_FLUTE:{
        if (flute_timer&$1)
        {
            Warp_sprite = spr_Tornado01;
            Warp_xscale = sign_(flute_timer&$10);
        }
        break;}
        
        // -----------------------------------------
        case Warp_state_SPIN_UP:{
        Warp_sprite = spr_Tornado01;
        // Duration: $40
             if (Warp_timer<$08) Warp_xscale = sign_(Warp_timer&$1);
        else if (Warp_timer<$14) Warp_xscale = sign_(Warp_timer&$2);
        else if (Warp_timer<$28) Warp_xscale = sign_(Warp_timer&$4);
        else                     Warp_xscale = sign_(Warp_timer&$8);
        /* // Duration: $A0
             if (Warp_timer<$18) Warp_xscale = sign_(Warp_timer&$1);
        else if (Warp_timer<$38) Warp_xscale = sign_(Warp_timer&$2);
        else if (Warp_timer<$68) Warp_xscale = sign_(Warp_timer&$4);
        else                     Warp_xscale = sign_(Warp_timer&$8);
        */
        break;}
        
        // -----------------------------------------
        //case Warp_state_VANISH:{break;}
        //case Warp_state_APPEAR:{break;}
        
        // -----------------------------------------
        case Warp_state_SPIN_DOWN:{
        if (Warp_timer>$18 
        ||  Warp_timer&$1 )
        {
            Warp_sprite = spr_Tornado01;
        }
        // Duration: $60
             if (Warp_timer>Warp_DURATION1-$0C) Warp_xscale = sign_(Warp_timer&$1);
        else if (Warp_timer>Warp_DURATION1-$24) Warp_xscale = sign_(Warp_timer&$2);
        else if (Warp_timer>Warp_DURATION1-$40) Warp_xscale = sign_(Warp_timer&$4);
        else                                    Warp_xscale = sign_(Warp_timer&$8);
        /* // Duration: $70
             if (Warp_timer>Warp_DURATION1-$10) Warp_xscale = sign_(Warp_timer&$1);
        else if (Warp_timer>Warp_DURATION1-$26) Warp_xscale = sign_(Warp_timer&$2);
        else if (Warp_timer>Warp_DURATION1-$48) Warp_xscale = sign_(Warp_timer&$4);
        else                                    Warp_xscale = sign_(Warp_timer&$8);
        */
        /* // Duration: $A0
             if (Warp_timer>Warp_DURATION1-$18) Warp_xscale = sign_(Warp_timer&$1);
        else if (Warp_timer>Warp_DURATION1-$38) Warp_xscale = sign_(Warp_timer&$2);
        else if (Warp_timer>Warp_DURATION1-$68) Warp_xscale = sign_(Warp_timer&$4);
        else                                    Warp_xscale = sign_(Warp_timer&$8);
        */
        break;}
    }
    
    
    if ( Warp_sprite 
    ||  (Warp_state==Warp_state_VANISH && Warp_timer>Warp_DURATION3-$10) 
    ||  (Warp_state==Warp_state_APPEAR && Warp_timer<$10) )
    {
        Warp_can_draw = true;
        
        Warp_draw_x  = ((Warp_owrc>>0)&$FF) <<SHIFT;
        Warp_draw_x += T_SIZE>>1;
        Warp_draw_x  = PC_draw_x_base + (Warp_draw_x-pc_ow_x);
        Warp_draw_x += draw_move_offset_x;
        
        Warp_draw_y  = ((Warp_owrc>>8)&$FF) <<SHIFT;
        Warp_draw_y += T_SIZE>>1;
        Warp_draw_y  = PC_draw_y_base + (Warp_draw_y-pc_ow_y);
        Warp_draw_y += draw_move_offset_y;
        
        if (Warp_sprite)
        {
            Warp_pi = p.dg_PI_SEQ[#0,(Warp_timer>>2)&$3] + p.PI_LIT1;
            
            if (Warp_state==Warp_state_FLUTE 
            ||  Warp_state==Warp_state_SPIN_UP )
            {
                WarpText_can_draw = true;
                WarpText_text     = Warp_dg_DESTINATIONS[#Warp_destination_num-1,2];
                WarpText_draw_xl  = Warp_draw_x;
                WarpText_draw_xl -= (WarpText_FONT_W*string_length(WarpText_text))>>1;
                WarpText_draw_yt  = Warp_draw_y;
                WarpText_draw_yt -= $A + WarpText_FONT_W;
            }
        }
        else
        {
            _val  = Warp_timer - Warp_state==Warp_state_VANISH;
            _val &= $F;
                 if (_val>$A) Warp_sprite = spr_pop01_1; // $B-$F
            else if (_val>$6) Warp_sprite = spr_pop01_2; // $7-$A
            else              Warp_sprite = spr_pop01_3; // $0-$6
            
            Warp_pi = global.PI_GUI1;
        }
    }
}








TreasureMaps_can_draw = false;

if (_C1 
&&  f.items&(ITM_MAP1|ITM_MAP2) )
{
    if (g.counter1&$10) TreasureMaps_Kakusu_sprite = spr_Slime_Small_1a_1;
    else                TreasureMaps_Kakusu_sprite = spr_Slime_Small_1b_1;
    
                   _val = $28; // timing for beating heart anim
    if (g.counter0&_val==_val) TreasureMaps_Heart_sprite = spr_Heart_1a;
    else                       TreasureMaps_Heart_sprite = spr_Heart_1b;
    
    TreasureMaps_Magic_sprite0 = spr_Bottle_6a; // empty bottle
    switch(get_bottle_bubbling_frame()){
    case 0:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1a; break;}
    case 1:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1b; break;}
    case 2:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1c; break;}
    }
    
    if (g.counter1&$10) TreasureMaps_1up_sprite = spr_Item_LifeDoll_1a;
    else                TreasureMaps_1up_sprite = spr_Item_LifeDoll_1b;
    
    TreasureMaps_Key_sprite = val(g.dm_ITEM[?STR_KEY+STR_Sprite], spr_0);
    
    for(_i=ds_grid_width(TreasureMaps_dg)-1; _i>=0; _i--)
    {
        _x  = PC_draw_x_base; // 2: ow x
        _x += TreasureMaps_dg[#_i,$2] - pc_ow_x;
        _x += draw_move_offset_x;
        
        _y  = PC_draw_y_base; // 3: ow y
        _y += TreasureMaps_dg[#_i,$3] - pc_ow_y;
        _y += draw_move_offset_y;
        
        // $9: can draw
        TreasureMaps_dg[#_i,$9] = rectInView((_x>>SHIFT)<<SHIFT,(_y>>SHIFT)<<SHIFT, T_SIZE,T_SIZE);
        if (TreasureMaps_dg[#_i,$9])
        {
            TreasureMaps_can_draw = true;
            
            switch(TreasureMaps_dg[#_i,$8]) // $8: item type
            {   //-------------------------------------------
                default:{
                _spr  = spr_0;
                _pi   = global.PI_MOB_ORG;
                _yoff = 0;
                break;}
                
                //-------------------------------------------
                case STR_Kakusu:{
                _spr  = TreasureMaps_Kakusu_sprite;
                _pi   = TreasureMaps_Kakusu_PI;
                _yoff = TreasureMaps_Kakusu_YOFF; // because graphic is aligned to bottom of image
                break;}
                
                //-------------------------------------------
                case STR_HEART:{
                _spr  = TreasureMaps_Heart_sprite;
                _pi   = TreasureMaps_Heart_PI;
                _yoff = TreasureMaps_Heart_YOFF;
                break;}
                
                //-------------------------------------------
                case STR_MAGIC:{
                _spr  = TreasureMaps_Magic_sprite0;
                _pi   = TreasureMaps_Magic_PI;
                _yoff = TreasureMaps_Magic_YOFF;
                break;}
                
                //-------------------------------------------
                case STR_1UP:{
                _spr  = TreasureMaps_1up_sprite;
                _pi   = TreasureMaps_1up_PI;
                _yoff = TreasureMaps_1up_YOFF;
                break;}
                
                //-------------------------------------------
                case STR_KEY:{
                _spr  = TreasureMaps_Key_sprite;
                _pi   = TreasureMaps_Key_PI;
                _yoff = TreasureMaps_Key_YOFF;
                break;}
            }
            
            TreasureMaps_dg[#_i,$A] = _x;         // $A: draw x
            TreasureMaps_dg[#_i,$B] = _y + _yoff; // $B: draw y
            
            TreasureMaps_dg[#_i,$C] = _spr; // $C: sprite
            TreasureMaps_dg[#_i,$D] = _pi;  // $D: palette index
        }
    }
}








BootsTileIndicator_can_draw = g.room_type=="C" && f.items&ITM_BOOT;








HiddenExitIndicator_can_draw = false;
HiddenExitIndicator_sprite   = 0;
HiddenExitIndicator_xscale   = 1;
HiddenExitIndicator_yscale   = 1;

if (_C1  // _C1:  g.room_type=="C" && !exit_grid_xy
&&  g.HiddenExitIndicator_enabled )
{
        HiddenExitIndicator_counter = (HiddenExitIndicator_counter+1)&$FF;
    if (HiddenExitIndicator_counter&$20)
    {
        if!(HiddenExitIndicator_counter&$1F)
        {
            HiddenExitIndicator_xoff = choose(0,1,-1);
            HiddenExitIndicator_yoff = choose(0,1,-1);
        }
        
        _val = HiddenExitIndicator_counter&$1F;
        if ( _val<$18 
        || !(_val&$1) ) // fade effect
        {
            for(_i=ds_grid_width(HiddenExitIndicator_dg)-1; _i>=0; _i--)
            {
                _clm = HiddenExitIndicator_dg[#_i,$0]; // $0: ow clm
                _row = HiddenExitIndicator_dg[#_i,$1]; // $1: ow row
                
                _x  = ow_pc_xy(0) + ((_clm<<4)-pc_ow_x);
                _x += draw_move_offset_x;
                _x += 8;
                
                _y  = ow_pc_xy(1) + ((_row<<4)-pc_ow_y);
                _y += draw_move_offset_y;
                _y += 8;
                //if(!_val) sdm("_x $"+hex_str(_x)+", _y $"+hex_str(_y));
                if (rectInView((_x>>4)<<4,(_y>>4)<<4, T_SIZE,T_SIZE))
                {
                    HiddenExitIndicator_can_draw   = true;
                    HiddenExitIndicator_dg[#_i,$2] = true; // $2: can draw
                    HiddenExitIndicator_dg[#_i,$3] = _x + HiddenExitIndicator_xoff; // $3: draw x
                    HiddenExitIndicator_dg[#_i,$4] = _y + HiddenExitIndicator_yoff; // $4: draw y
                }
            }
            
            if (HiddenExitIndicator_can_draw)
            {
                     if (_val<$08) HiddenExitIndicator_sprite = spr_pop01_1;
                else if (_val<$10) HiddenExitIndicator_sprite = spr_pop01_2;
                else               HiddenExitIndicator_sprite = spr_pop01_3;
                
                if (_val>=$10)
                {
                    if (_val&$04) HiddenExitIndicator_xscale = -1;
                    if (_val&$08) HiddenExitIndicator_yscale = -1;
                }
            }
        }
    }
    else
    {
        if(!(HiddenExitIndicator_counter&$1F) 
        && !irandom($1) )
        {
            HiddenExitIndicator_counter = (HiddenExitIndicator_counter+$10)&$FF;
        }
    }
}








ItemAcquiredIndicator_can_draw = false;

if (_C1  // _C1:  g.room_type=="C" && !exit_grid_xy
&&  g.can_mark_acquired_item_locations 
&&  g.counter1&$40 )
{
    if (val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) 
    ||  val(global.dm_save_file_settings[?STR_Randomize+STR_PBAG+STR_Locations]) 
    ||  val(global.dm_save_file_settings[?STR_Randomize+STR_Key +STR_Locations]) )
    {
        _count = val(f.dm_rando[?STR_Total+STR_Location+STR_Count]);
        for(_i=1; _i<=_count; _i++)
        {
            _datakey1 = STR_Location+hex_str(_i);
            _owrc = val(dm_rando_locations[?_datakey1+STR_OWRC], -1);
            if (_owrc!=-1 
            &&  val(dm_rando_locations[?_datakey1+STR_Acquired]) )
            {
                _item_id = f.dm_rando[?_datakey1+STR_Item+STR_ID+STR_Randomized];
                if(!is_undefined(_item_id))
                {
                    _x  = ow_pc_xy(0);
                    _x += (byte(_owrc>>0)<<SHIFT) - pc_ow_x;
                    _x += draw_move_offset_x;
                    _x += 8;
                    dm_rando_locations[?_datakey1+"_X"] = _x;
                    
                    _y  = ow_pc_xy(1);
                    _y += (byte(_owrc>>8)<<SHIFT) - pc_ow_y;
                    _y += draw_move_offset_y;
                    _y += 8;
                    dm_rando_locations[?_datakey1+"_Y"] = _y;
                    
                    if (rectInView((_x>>SHIFT)<<SHIFT,(_y>>SHIFT)<<SHIFT, T_SIZE,T_SIZE))
                    {
                        ItemAcquiredIndicator_can_draw = true;
                        dm_rando_locations[?_datakey1+dk_can_draw] = true;
                        
                        _owrc_ = hex_str(_owrc);
                        
                             if (val(dm_rando_locations[?_owrc_+STR_Varied])) _spr = spr_CheckMark2_4; // grey
                        else if (string_pos(STR_PBAG,_item_id))               _spr = spr_CheckMark2_3; // full blue
                        else if (string_pos(STR_KEY, _item_id))               _spr = spr_CheckMark2_2; // full yellow
                        else                                                  _spr = spr_CheckMark2_1; // full green
                        dm_rando_locations[?_datakey1+STR_Sprite] = _spr;
                        
                        _count1 = val(dm_rando_locations[?_owrc_+STR_Item+STR_Count]);
                        _count2 = val(dm_rando_locations[?_owrc_+STR_Acquired+STR_Count]);
                        if (_count1>1 
                        &&  _count2 )
                        {
                            _text = string(_count2)+"/"+string(_count1);
                            _x -= (string_length(_text)*ItemAcquiredIndicator_FONT_W)>>1;
                            _y += 5;
                            dm_rando_locations[?_datakey1+STR_Text]       = _text;
                            dm_rando_locations[?_datakey1+STR_Text+"_XL"] = _x;
                            dm_rando_locations[?_datakey1+STR_Text+"_YT"] = _y;
                        }
                    }
                }
            }
            //sdm("ITEM: "+string(val(_item_id))+".  "+"location_num: $"+hex_str(_i)+", _spawn_datakey '"+string(val(_spawn_datakey))+"'");
        }
    }
}




