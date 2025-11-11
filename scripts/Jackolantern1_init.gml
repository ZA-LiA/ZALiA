/// Jackolantern1_init()


var _i;
var _depth = DEPTH_BG3-1;


can_draw_self = true;
state = 1;


if (ver==1 
&& !global.Halloween1_enabled )
{
    can_draw_self = false;
    state = 0;
    for(_i=ds_list_size(g.dl_niao)-1; _i>=0; _i--)
    {
        if(!is_undefined(g.dl_niao[|_i]) 
        &&  g.dl_niao[|_i]==id )
        {
            g.dl_niao[|_i] = noone;
            break;//_i
        }
    }
    instance_destroy();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


scr_draw = Jackolantern1_draw;


if(!is_undefined(dk_spawn))
{
    if(!is_undefined(g.dm_rm[?dk_spawn+STR_Data+"01"]))
    {   x =      val(g.dm_rm[?dk_spawn+STR_Data+"01"]);  }
    
    if(!is_undefined(g.dm_rm[?dk_spawn+STR_Data+"02"]))
    {   y =      val(g.dm_rm[?dk_spawn+STR_Data+"02"]);  }
    
    set_xy(id,x,y);
    
    if(!is_undefined(g.dm_rm[?dk_spawn+STR_Data+"03"]))
    {   _depth = val(g.dm_rm[?dk_spawn+STR_Data+"03"]);  }
}


var _SPR = spr_Jackolantern01_1;
//var _SPR = spr_Jackolantern01_2;
//var _SPR = spr_Jackolantern01_3;
switch(ver){
case 1:{GO_sprite_init(_SPR); break;}
//case 2:{GO_sprite_init(spr_Flame1); break;}
//case 3:{GO_sprite_init(spr_Flame_Small_1b); break;}
}

//ANIM_SPEED = $08;

GO_depth_init(_depth);
GO_init_palidx(global.PI_MOB_ORG);


sdm("Jackolantern1_init(). "+" xl $"+hex_str(xl)+", yt $"+hex_str(yt));




