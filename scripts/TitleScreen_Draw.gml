/// TitleScreen_Draw()


//if (room!=rmB_Title) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//if (g.rm_name!=RM_NAME_TITLSCR) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



var _i,_j, _idx, _x,_y, _count;
var _spr, _depth;
var _IDX1 = (g.counter1>>4)&$3;



//  --------------------------------------------------------------------------------
// STARRY SKY  *SURFACE* --------------------------------------------------
if(!surface_exists(dl_STAR_SKY[|0])) // 1st frame only
{
    var _X1 = g.rm_w_ - VIEW_W_OG_;
    var _Y1 = g.rm_h  - VIEW_H_OG;
    _Y1 += $10; // Because VIEW_H_OG used to erronously be 224 instead of 240
    
                 _count = ds_grid_width(dg_STAR_SKY);
    for(_i=0; _i<_count; _i++) // each star
    {
        _x  = _X1 + dg_STAR_SKY[#_i,0] + 3;
        _y  = _Y1 + dg_STAR_SKY[#_i,1] + 3;
        
        for(_j=0; _j<4; _j++) // each color/anim_frame
        {
            if(!surface_exists(dl_STAR_SKY[|_j]))
            {   dl_STAR_SKY[|_j] = surface_create(g.rm_w,g.rm_h);  }
            
            surface_set_target(dl_STAR_SKY[|_j]);
            _idx = (dg_STAR_SKY[#_i,2]+_j) &$3;
            draw_point_colour(_x,_y, p.dg_color_seq[#1,_idx]);
            surface_reset_target();
        }
    }
    
    
    
    var _W    = VIEW_W_OG;
    var _H    = VIEW_W_OG_;
    var _surf = surface_create(_W,_H);
    var _X0   = _X1 - (_W>>1);
    var _X2   = _X1 -  _W;
    var _Y0   = _Y1 -  _H + ($04<<3);
    var _Y2   = _Y1 +  _H - ($01<<3);
    
    for(_i=(ds_list_size(dl_STAR_SKY)-1); _i>=0; _i--) // each color/anim_frame
    {
        surface_copy_part(_surf, 0,0, dl_STAR_SKY[|_i], _X1,_Y1,_W,_H);
        
        surface_set_target(dl_STAR_SKY[|_i]);
        
        draw_surface_ext(_surf, _X0,    _Y0,  1, 1, 0,c_white,1); // row 1
        draw_surface_ext(_surf, _X0+_W, _Y0,  1, 1, 0,c_white,1); // row 1
        
        draw_surface_part_ext(_surf, 0,0,_W>>1,_H, _X0,_Y1+_H,  1,-1, c_white,1);
        
        draw_surface_ext(_surf, _X1+_W, _Y1,  1, 1, 0,c_white,1); // row 2 
        
        draw_surface_ext(_surf, _X2,    _Y2, -1, 1, 0,c_white,1); // row 3
        draw_surface_ext(_surf, _X2+_W, _Y2, -1, 1, 0,c_white,1); // row 3
        
        surface_reset_target();
    }
    surface_free(_surf);
}


if (surface_exists(dl_STAR_SKY[|_IDX1]))
{     draw_surface(dl_STAR_SKY[|_IDX1], 0,0);  }






//  --------------------------------------------------------------------------------
// SHOOTING STAR ---------------------------------------------------
if (sstar_can_draw)
{
    _x = SSTAR_BASEX + (SSTAR_MOVEX * sstar_moveNum);
    _y = SSTAR_BASEY + (SSTAR_MOVEY * sstar_moveNum);
    draw_point_colour(_x,_y, p.dg_color_seq[# 1, _IDX1]);
}






//  --------------------------------------------------------------------------------
// TITLE ---------------------------------------------------------
if (rectInView(x, title_y, TITLE_SPR_W, TITLE_SPR_H))
{
    draw_sprite(TITLE_SPR,0, x,title_y);
}






//  --------------------------------------------------------------------------------
// STORY -----------------------------------------------------
if(!surface_exists(Story_srf))
{
    var _XL0 = $18;
    var _XL1 = _XL0+($7<<3);
    var _XL2 = _XL1+($1<<3);
    var _yt = 0;
    var _DIST1 = $10;
    var _PI1 = global.PI_BGR4;
    var _PI2 = global.PI_BGR1;
    Story_srf = surface_create(Story_W,Story_H);
    surface_set_target(Story_srf);
    draw_clear_alpha(c_black,0);
    draw_text_(_XL0,_yt, "AFTER GANON WAS DESTROYED,",  -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "IMPA TOLD LINK A SLEEPING",   -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "SPELL WAS CAST ON PRINCESS",  -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "ZELDA. SHE WILL WAKE ONLY",   -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "WITH THE POWER OF NO.3",      -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "TRIFORCE SEALED IN A PALACE", -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "IN HYRULE. TO BREAK THE",     -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "SEAL, CRYSTALS MUST BE",      -1, _PI1);
    //draw_text_(_XL0,_yt, "SEAL,CRYSTALS MUST BE",      -1, _PI1); // OG has no space after the comma
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "PLACED IN STATUES IN 6",      -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "WELL GUARDED PALACES.",       -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "LINK SET OUT ON HIS MOST",    -1, _PI1);
    _yt += _DIST1;
    draw_text_(_XL0,_yt, "ADVENTURESOME QUEST YET...",  -1, _PI1);
    _yt += _DIST1;
    draw_sprite_(spr_copyright_char,0, _XL1,_yt, _PI2);
    draw_text_(_XL2,_yt, "1987 NINTENDO", -1, _PI2);
    surface_reset_target();
}

if (surface_exists(Story_srf) 
&&  rectInView(x,story_y, Story_W,Story_H) )
{
    draw_surface(Story_srf, x,story_y);
}






//  --------------------------------------------------------------------------------
// FG --------------------------------------------------------------
if (dl_tile_layer_data!=0)
{
    var _dm_ts_info = -1;
    
    for(_i=0; _i<dg_terrain_W; _i++)
    {
        if(!surface_exists(dg_terrain[#_i,0]))
        {
            var _dm_layer_data = dl_tile_layer_data[|dg_terrain[#_i,2]];
            var _dl_tile = _dm_layer_data[?"data"];
            var _tile_count = ds_list_size(_dl_tile);
            if (_tile_count)
            {
                var _tile_data, _ts, _tsrc, _ts_x,_ts_y, _x,_y, _scale_x,_scale_y;
                
                if (_dm_ts_info==-1)
                {
                    var _ENCODED = get_scene_ts_data(); // returns -1 if it fails
                    if (_ENCODED   !=-1) _dm_ts_info = json_decode(_ENCODED);
                    if (_dm_ts_info==-1) _dm_ts_info = ds_map_create(); // in case data wasn't found, prevent errors below when trying to access map
                    //sdm("_ENCODED==-1: "+string(_ENCODED==-1));
                }
                
                dg_terrain[#_i,0] = surface_create(room_width,room_height);
                surface_set_target(dg_terrain[#_i,0]);
                draw_clear_alpha(c_black,0);
                
                for(_j=0; _j<_tile_count; _j++) // each tile of this depth
                {
                        _tile_data = _dl_tile[|_j];
                    if (_tile_data) // 0 means no tile
                    {
                        if (_tile_data&$80000000) _scale_x = -1;
                        else                      _scale_x =  1;
                        if (_tile_data&$40000000) _scale_y = -1;
                        else                      _scale_y =  1;
                        
                        _tile_data--; // Tiled app adds 1 so it can't be 0
                        _tile_data &= $3FFFFFFF; // truncate the scale xy data
                        _tile_data  = abs(_tile_data);
                        
                        _tsrc = _tile_data&$FF;
                        
                        _ts_x = ((_tsrc>>0)&$F)<<3;
                        _ts_y = ((_tsrc>>4)&$F)<<3;
                        
                        _x  = _j mod tile_clms;
                        _x += _scale_x==-1;
                        _x  = _x<<3;
                        
                        _y  = _j div tile_clms;
                        _y += _scale_y==-1;
                        _y  = _y<<3;
                        
                        _ts = ts_Natural_2a_WRB;
                        if (_dm_ts_info!=-1) _ts = val(_dm_ts_info[?hex_str((_tile_data>>8)&$FF)+"_idx"], _ts);
                        //if (_dm_ts_info!=-1) sdm("TitleScreen_Draw(). _i=$"+hex_str(_i)+", _ts="+background_get_name(_ts));
                        
                        draw_background_part_ext(_ts, _ts_x,_ts_y, 8,8, _x,_y, _scale_x,_scale_y, c_white,1);
                    }
                }
                
                surface_reset_target();
            }
        }
    }
    
    if (_dm_ts_info!=-1){ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;}
    
    
    for(_i=0; _i<dg_terrain_W; _i++)
    {
        if (surface_exists(dg_terrain[#_i,0]))
        {
            pal_swap_set(global.palette_image, dg_terrain[#_i,1]);
            draw_surface(dg_terrain[#_i,0],0,0);
            pal_swap_reset();
        }
    }
}



// Sea Sparkle
var _color = 0;
for(_j=ds_grid_width(dg_SeaSparkle)-1; _j>=1; _j--)
{
    _x  = dg_SeaSparkle[#0,1] + dg_SeaSparkle[#_j,1];
    _x += $10;
    _y  = dg_SeaSparkle[#0,2] + dg_SeaSparkle[#_j,2];
    _color = dg_SeaSparkle[#_j,0] + (g.counter1>>4);
    _color = p.dg_color_seq[#1,_color&$3];
    draw_point_colour(_x,_y, _color);
}


// Sword
draw_sprite_(SWORD_SPR,0, SWORD_SPR_X,SWORD_SPR_Y, global.PI_MOB_ORG);






//drawPointCross($02<<3, $00<<3);
//draw_rect_(c_fuchsia, 0,0, room_width,room_height, 1,1);
//if!(g.timer0&$7F) sdm("room_width $"+hex_str(room_width)+", room_height $"+hex_str(room_height));




