/// SpikeTrapB_init2()


var _i, _val, _len, _pos;


DRAW_YOFF = 0;
facing_dir = 1;

ds_list_add(dl_sprites,spr_Myu_2a);
ds_list_add(dl_sprites,spr_Myu_2b);
GO_set_sprite(id,dl_sprites[|0]);


SPEED1 = $10;
speed1 = SPEED1>>3;
hspd_dir = 1;

if(!is_undefined(dk_spawn))
{
    hspd_dir = val(g.dm_spawn[?dk_spawn+STR_Direction], hspd_dir);
    hspd_dir = sign_(hspd_dir);
    
    speed1 = val(g.dm_spawn[?dk_spawn+STR_Speed], speed1);
}


speed1 = clamp(speed1,1,4);
speed1 = speed1<<3; // $08,$10,$18,$20

hspd_dir  = sign_(hspd_dir);
hspd      = (speed1*hspd_dir) &$FF;



VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;
vspd      = 0;




