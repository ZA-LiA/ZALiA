/// BlockB_init2()


var _i, _x,_y, _datakey0, _data, _pos, _val;


set_xlyt(id, round8(xl),round8(yt));


GO_sprite_init(spr_Block_02a);

can_draw_self_exception = true;


Chain_hang      = false;
Chain_connected = true;
Chain_connected_prev = Chain_connected;
Chain_can_draw  = false;
Chain_PI = global.PI_BGR4;
ChainLink_W = 8;
ChainLink_H = 8;
Chain_XL = x - (ChainLink_W>>1);
_val = (cam_yt_min() div 8) - 1;
_val = find_row_solid(TID_SOLID1|TID_ONEWY1, x>>3,yt>>3, -1,0, _val);
Chain_YT = _val * 8;
ChainLink_COUNT = max(0, (yt-Chain_YT) div ChainLink_H);
//show_debug_message("BlockB_init2(). "+"yt=$"+hex_str(yt)+" Chain_YT=$"+hex_str(Chain_YT)+" ChainLink_H=$"+hex_str(ChainLink_H)+" ChainLink_COUNT=$"+hex_str(ChainLink_COUNT));
ChainLink_surf = -1;


GO_init_palidx(global.PI_BGR4);


if(!is_undefined(dk_spawn))
{
    GO_init_palidx(val(g.dm_spawn[?dk_spawn+STR_pal_idx], palidx));
    
    
    for(_i=1; _i<=$10; _i++)
    {
        _data = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if (is_undefined(_data)) break;//_i
        
        
        if (string_pos("_ChainHang",_data)) Chain_hang = ChainLink_COUNT>0;
    }
}
//show_debug_message("BlockB_init2(). "+"Chain_hang="+string(Chain_hang)+" Chain_connected="+string(Chain_connected)+" ChainLink_COUNT="+string(ChainLink_COUNT));

//Chain_PI = palidx;


GO_depth_init(DEPTH_BG1-1); // -1 so tile pal swap can work
//GO_depth_init(DEPTH_BG4+1); // +1 so tile pal swap can work


facing_dir = 1;


hspd      = 0;

VSPD_MAX  = $50;
vspd_grav = 2;
vspd      = 0;


BODY_HB_IDX1 = $01; // $01: about +2,3 xy offsets, about 12x12
BODY_HB_IDX2 = $66; // $66: 0 offsets, 16x16
BodyHB_idx   = BODY_HB_IDX2;


Fall_delay_DURATION = 3; // Give time for breaking block anim below.
Fall_delay_timer = 0;


solid_type = TID_SOLID1;
add_to_solid_inst_list(id);


// TID_HIDE_1: Hidden when rm is NOT lit.
TID_HIDDEN = TID_HIDE_1&$F;


// Change tiles to solid.
for(_i=0; _i<4; _i++)
{
    _x = xl + ((_i&$1)<<3);
    _y = yt + ((_i>$1)<<3);
    tile_change_1a(0, _x,_y, -1,0, TID_SOLID1);
}




