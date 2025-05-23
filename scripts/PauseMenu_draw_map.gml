/// PauseMenu_draw_map()


if(!paper_drawn_clms) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i,_j, _idx, _val;
var _x,_y, _x0,_y0, _xl,_yt, _xl0,_yt0, _w,_h;
var _clm,_row;
if (MapPaper_USE_SURFACE)
{
    var _XL0 = 0;
    var _YT0 = 0;
}
else
{
    var _XL0 = MapArea_xl;
    var _YT0 = MapArea_yt;
}








if (MapPaper_USE_SURFACE)
{
    if(!surface_exists(MapTears_srf))
    {
        MapTears_srf = surface_create(MapArea_W,MapArea_H);
        surface_set_target(MapTears_srf);
        draw_clear_alpha(c_black,0);
        var _ts_xl,_ts_yt, _tsrc;
        var _COLOR = global.C_ALPHA0; // C_ALPHA0: pal swap will set alpha=0 for any pixels of this color
        var _COUNT1 = ds_grid_width( dg_map_edge);
        var _COUNT2 = ds_grid_height(dg_map_edge);
        for(_i=0; _i<_COUNT1; _i++)
        {
            for(_j=0; _j<_COUNT2; _j++)
            {
                _val = dg_map_edge[#_i,_j];
                if (_val!=-1)
                {
                    _x_scale = sign_(_val==$FE || !(_val&$40)); // -1 if _val!=$FE && _val&$40
                    _y_scale = sign_(_val==$FE || !(_val&$80)); // -1 if _val!=$FE && _val&$80
                    
                    _xl  = _i<<3;
                    _yt  = _j<<3;
                    _xl += (!_x_scale)<<3;
                    _yt += (!_y_scale)<<3;
                    
                    _ts_xl  = ((_val>>0)&$F) <<3;
                    _ts_yt  = ((_val>>4)&$F) <<3;
                    _ts_yt *= _val==$FE;
                    draw_background_part_ext(g.TS_MENU, _ts_xl,_ts_yt, 8,8, _xl,_yt, _x_scale,_y_scale, _COLOR,1);
                }
            }
        }
        surface_reset_target();
    }
}

if (MapPaper_USE_SURFACE)
{
    surface_set_target(MenuMap_srf);
    draw_clear_alpha(c_black,0);
}




// MAP PAPER --------------------------
// -----------------------------------------------------------------------
_xl = _XL0 + MapPaper_PAD1;
_yt = _YT0 + MapPaper_PAD1;
// paper_drawn_clms is how many 8-pixel-wide columns of the paper will be drawn this frame of animation
draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, MapPaper_w,MapPaper_h, COLOR_PAPER);








if(!g.dungeon_num)
{   // -----------------------------------------------------------------------
    // -----------------------  OVERWORLD  ---------------------------
    if (g.use_8x8_ow_menu_map) PauseMenu_Draw_map_Overworld8x8();
    else                       PauseMenu_Draw_map_Overworld16x16();
}
else if (paper_drawn_clms>2)
{   // -----------------------------------------------------------------------
    // -----------------------  DUNGEON  -----------------------------
    PauseMenu_draw_map_dungeon();
}














// PC --------------------------
// -----------------------------------------------------------------------
if (map_anim_idx+1==ds_list_size(dl_map_anim_data))
{
    /*  TODO: Finish this code for MAP ITEMS
    if(!g.dungeon_num 
    &&  f.items&(ITM_MAP1|ITM_MAP2) )
    {   // MAP ITEMS
        for(_i=ds_grid_width(dg_map1)-1; _i>=0; _i--)
        {
            if (dg_map1[#_i,$05]) // marked as acquired/defeated
            {
                continue;
            }
            
            if ((dg_map1[#_i,$06]==1 && !(f.items&ITM_MAP1)) 
            ||  (dg_map1[#_i,$06]==2 && !(f.items&ITM_MAP2)) )
            {
                continue;
            }
            
            _x  = _pc_x + (dg_map1[#_i,$02]-pc_ow_x);
            _y  = _pc_y + (dg_map1[#_i,$03]-pc_ow_y);
            // There's an unintended 1 pixel offset while pc is moving.
            // This is to adj that.
            _x += -move_x;
            _y += -move_y;
            
            
            if(!rectInView((_x>>SHIFT)<<SHIFT,(_y>>SHIFT)<<SHIFT, T_SIZE,T_SIZE))
            {
                continue;
            }
            
            
            _spr  = spr_0;
            _yoff = 0;
            if (is_ancestor(dg_map1[#_i,$04], Kakusu))
            {
                if (g.timer0&$10) _spr=spr_Slime_Small_1a_1;
                else              _spr=spr_Slime_Small_1b_1;
                _pi = PI_MOB_ORG;
                _yoff = -4; // bc graphic is aligned to bottom of img
            }
            else if (dg_map1[#_i,$04]==CONT_PIECE_OBJ_HP)
            {
                               _val = $28;
                if (g.counter0&_val==_val) _spr=spr_Heart_1a;
                else                       _spr=spr_Heart_1b;
                _pi = PI_MOB_RED;
            }
            else if (dg_map1[#_i,$04]==CONT_PIECE_OBJ_MP)
            {
                switch(get_bottle_bubbling_frame()){
                case 0:{_spr=spr_Bottle_6a_Liquid_1a; break;}
                case 1:{_spr=spr_Bottle_6a_Liquid_1b; break;}
                case 2:{_spr=spr_Bottle_6a_Liquid_1c; break;}
                }
                _pi = PI_MOB_ORG;
                _yoff = -1;
                draw_sprite_(_spr,0, _x,_y+_yoff, _pi); // bubbling liquid
                _spr=spr_Bottle_6a; // empty bottle
            }
            else if (dg_map1[#_i,$04]==ItmG0)
            {
                if (g.timer0&$10) _spr=spr_Item_LifeDoll_1a;
                else              _spr=spr_Item_LifeDoll_1b;
                _pi = PI_PC_1;
            }
            
            draw_sprite_(_spr,0, _x,_y+_yoff, _pi);
        }
    }
    */
    
    
    if(!g.dungeon_num)
    {   // PC OW FIGURE -------------------------
        _w = CLMS_MAP_PAPER<<3;
        _h = MapArea_h;
        _x = _XL0 + (_w>>1) + global.OVERWORLD.PC_draw_XOFF;
        _y = _YT0 + (_h>>1) + global.OVERWORLD.PC_draw_YOFF;
        if (g.use_8x8_ow_menu_map) _y += 1; // micro adjustment
        //if (g.use_8x8_ow_menu_map) _y -= 2; // micro adjustment
        
        with(g.pc)
        {
            // g.rm_ow_dir: $0: horizontal axis, $1: vertical axis, bit $2: flip x/y scale
            var _frame_index  = (g.rm_ow_dir&$1)<<2; // 0,4. 0,1: right, 2,3: left, 4,5: down, 6,7: up
                _frame_index += (!xScale)<<1;   // +=0,2. Flips x/y scale
                _frame_index += (g.rm_ow_dir&$2) * xScale; // flips x/y scale
                //_frame_index += (g.rm_ow_dir&$2) * sign(!g.pc.xScale); // flips x/y scale
                //_frame_index +=  g.rm_ow_dir&$2; // flips x/y scale
                _frame_index += sign(g.counter0&$1F>$11); // anim timing
            //
            _idx = val(dm_skins[?STR_Current+STR_Idx]);
            if(!val(dm_skins[?hex_str(_idx)+"_source_is_file"]))
            {
                draw_sprite_(Skin_image,$60|_frame_index, _x,_y, global.PI_PC1);
            }
            else
            {
                _w = Spritesheet_W;
                _h = Spritesheet_H;
                _x -= _w>>1;
                _y -= _h>>1;
                var _Sheet_X = _w * _frame_index;
                //if (global.OVERWORLD.mot==global.OVERWORLD.MOT_RAFT) _Sheet_X += 8; // 8-F: Raft
                var _Sheet_Y = _h * $E;
                draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_Y, _w,_h, _x,_y, global.PI_PC1);
            }
        }
    }
    else if (g.counter0&$20) // $20: on for .5s, then off for .5s
    {   // PC DUNGEON ICON --------------------------------
              _x0 = _XL0 + 8;
        _x  = _x0;
        _x +=(((dngn_map_pc_rc>>0)&$FF) + map_clm_off) <<3;
        _x += DNGN_MAP_PC_SPR_WW_;
        
              _y0 = _YT0 + 8;
        _y  = _y0;
        _y +=(((dngn_map_pc_rc>>8)&$FF) + map_row_off) <<3;
        _y += DNGN_MAP_PC_SPR_HH_;
        
        _clm = (_x-_x0)>>3;
        _row = (_y-_y0)>>3;
        if (is_in_grid(_clm,_row, CLMS_MAP_DNGN,ROWS_MAP_DNGN))
        {
            draw_sprite_(SPR_ICON_PC1,0, _x,_y, global.PI_PC1, g.pc.xScale);
        }
    }
}












// MAP TEARS --------------------------
// -----------------------------------------------------------------------
if (paper_drawn_clms)
{
    if (MapPaper_USE_SURFACE)
    {
        _xl0  = MapArea_W;     // MapArea xr
        _xl0 -= MapPaper_PAD1; // paper xr
        _xl0 -= MapPaper_w;    // draw paper xl
        
        _yt0  = MapArea_H;     // MapArea yb
        _yt0 -= MapPaper_PAD1; // paper yb
        _yt0 -= MapPaper_h;    // draw paper yt
        
        _xl = MapPaper_PAD1;
        _yt = MapPaper_PAD1;
        draw_surface_part(MapTears_srf, _xl0,_yt0, MapPaper_w,MapPaper_h, _xl,_yt);
    }
    else
    {
        var _ts_xl,_ts_yt, _tsrc;
        var _COLOR = global.BackgroundColor_scene;
        _row  = 0;
        _clm  = CLMS_MAP_PAPER - paper_drawn_clms;
        var _ROWS = ROWS_MAP_PAPER - _row;
        var _CLMS = CLMS_MAP_PAPER - _clm;
        
        for(_i=0; _i<_ROWS; _i++) // each row
        {
            for(_j=0; _j<_CLMS; _j++) // each column
            {
                    _val = dg_map_edge[#_clm+_j, _row+_i];
                if (_val!=-1)
                {
                    _x_scale = sign_(_val==$FE || !(_val&$40)); // -1 if _val!=$FE && _val&$40
                    _y_scale = sign_(_val==$FE || !(_val&$80)); // -1 if _val!=$FE && _val&$80
                    
                    _xl  =  _XL0 + (_j<<3);
                    _yt  =  _YT0 + (_i<<3);
                    _xl += (!_x_scale)<<3;
                    _yt += (!_y_scale)<<3;
                    
                    if (_xl+8<=_XL0+MapArea_w)
                    //if (_x+8<=_x0+(paper_drawn_clms<<3))
                    {
                        _w = 8;
                        _h = 8;
                        _ts_xl  = ((_val>>0)&$F) <<3;
                        _ts_yt  = ((_val>>4)&$F) <<3;
                        _ts_yt *= _val==$FE;
                        draw_background_part_ext(g.TS_MENU, _ts_xl,_ts_yt, _w,_h, _xl,_yt, _x_scale,_y_scale, _COLOR,1);
                    }
                }
            }
        }
    }
}








// -----------------------------------------------------------------------
if (MapPaper_USE_SURFACE)
{
    surface_reset_target();
    pal_swap_set(global.palette_image, PI_MENU1); // this is so `global.C_ALPHA0` pixels(the map tears) draw transparent. doesn't matter which pi
    draw_surface(MenuMap_srf, MapArea_xl,MapArea_yt);
    pal_swap_reset();
}




