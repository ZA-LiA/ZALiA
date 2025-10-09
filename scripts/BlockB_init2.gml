/// BlockB_init2()


var _i, _a, _x,_y;


GO_sprite_init(spr_Block_02a);

var _pi = global.PI_BGR4;
if(!is_undefined(         dk_spawn))
{   _pi = val(g.dm_spawn[?dk_spawn+STR_pal_idx], _pi);  }
GO_init_palidx(_pi);
//GO_init_palidx(global.PI_BGR4);


GO_depth_init(DEPTH_BG1-1); // -1 so tile pal swap can work
//GO_depth_init(DEPTH_BG4+1); // +1 so tile pal swap can work

facing_dir = 1;


hspd        = 0;

VSPD_MAX    = $50;
vspd_grav   = 2;
vspd        = 0;


BODY_HB_IDX1    = $01; // $01: about +2,3 xy offsets, about 12x12
BODY_HB_IDX2    = $66; // $66: 0 offsets, 16x16
BodyHB_idx      = BODY_HB_IDX2;


DUR_DELAY_FALL = 3; // Give time for breaking block anim below.
tmr_delay_fall = 0;


solid_type  = TID_SOLID1;
add_to_solid_inst_list(id);


// TID_HIDE_1: Hidden when rm is NOT lit.
TID_HIDDEN = TID_HIDE_1&$F;


set_xlyt(id, round8(xl),round8(yt));

// Change tiles to solid.
for(_i=0; _i<4; _i++)
{
    _x = xl + ((_i&$1)<<3);
    _y = yt + ((_i>$1)<<3);
    tile_change_1a(0, _x,_y, -1,0, TID_SOLID1);
}




