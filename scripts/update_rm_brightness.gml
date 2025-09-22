/// update_rm_brightness()


var _BRIGHTNESS_PREV = g.rm_brightness;


var _SCENE_IS_RANDO = global.SceneRando_enabled && g.rm_name!=val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name);
if (pal_rm_dark_idx<0 
||  (_SCENE_IS_RANDO && global.SceneRando_scene_brightness_control==1) )
{
    set_rm_brightness(g.RM_BRIGHTNESS_MAX);
}
else if(!g.EnterRoom_SpawnGO_timer)
{
    set_rm_brightness(0);
    
    if (f.items&ITM_CAND)
    {   set_rm_brightness(g.rm_brightness+1);  }
    
    if (g.rm_brightness<g.RM_BRIGHTNESS_MAX)
    {
        with(GameObject)
        {
            if(!state)      continue;
            if(!brightness) continue;
            
            set_rm_brightness(g.rm_brightness+brightness);
            if (g.rm_brightness>=g.RM_BRIGHTNESS_MAX) break;//with(GameObject)
        }
    }
}


if (g.rm_brightness!=_BRIGHTNESS_PREV)
{
    tile_hidden_update_2a(); // updates all tg(tile graphic) ids
    
    if (g.rm_brightness<g.RM_BRIGHTNESS_MAX)
    {
        update_Pallete_1b(); // update dark pal
    }
}




