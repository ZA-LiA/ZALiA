/// Aruroda_init2()


GO_init_palidx(global.PI_MOB_BLU);


SPR_WALK = spr_Aruroda_body2; // legs closed
SPR_IDLE = spr_Aruroda_body1; // legs open

Head_sprite = spr_Aruroda_head1;
tail_spr = spr_Aruroda_tail1;


VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;


projectile_OBJ = Fireball1;
projectile_VER = 2;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


ShieldHB_IDX = $FF; // $FF means use body hb dimensions
ShieldHB_idx = ShieldHB_IDX; // 


DUR_EYE_OPEN     = $20;
tmr_eye_open     =   0; // 0081,X

DUR_TAIL_FORWARD = $10;
tmr_tail_forward =   0;


frwd_bkwd = facing_dir;


// For Rando
if(!is_undefined(dk_spawn))
{
    var _obj = val(g.dm_spawn[?dk_spawn+STR_obj_idx]);
    var _ver = val(g.dm_spawn[?dk_spawn+STR_Version]);
    if (_obj 
    &&  _ver )
    {
        if (object_get_name(_obj)+hex_str(_ver) != object_get_name(object_index)+hex_str(ver))
        {
            var _y = ((yb>>3)-1)<<3;
            if (collide_solid_grid(x,_y))
            {
                _y  = find_row_solid(0, x>>3,_y>>3, -1,0, 0);
                _y  = (_y+1)<<3;
                _y -= hh_;
                set_xy(id, x,_y);
                //solid_clip_adj(false);
            }
        }
    }
}




