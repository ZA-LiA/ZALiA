/// TorchA_init2()


var _i, _a, _val, _count, _len, _pos;
var _OBJVER = object_get_name(object_index)+hex_str(ver);

GO_depth_init(DEPTH_NIAO-(DEPTH_PAD>>1));

facing_dir = 1;



brightness = 0; // need this here because GO_set_prop_values() sets brightness=1 AFTER init1

    BRIGHTNESS = val(g.dm_go_prop[?_OBJVER+STR_Brightness],1); // 1,2,..
if(!is_undefined(dk_spawn))
{   BRIGHTNESS = val(g.dm_spawn[?dk_spawn +STR_Brightness], BRIGHTNESS);  }
    BRIGHTNESS = clamp(BRIGHTNESS,1,2);
//

    is_lit = false;
if(!is_undefined(dk_spawn))
{   is_lit = val(g.dm_spawn[?dk_spawn+STR_Lit], is_lit);  }


if (global.SceneRando_enabled 
&&  global.SceneRando_scene_brightness_control==1 
&&  g.rm_name!=val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name) )
{
    is_lit = true;
}


if (is_lit) Torch_ignite();




if (ver==3)
{   // This torches fire cup is much lower
    GO_sprite_init(spr_Torch_2a);
    FIRE_YOFF  = -5;
    FIRE_YOFF -= (sprite_get_height(FIRE_SPR)>>1) - hh_; // (- 4 or - 0) In case I change the image height
    FIRE_YOFF--;
}




