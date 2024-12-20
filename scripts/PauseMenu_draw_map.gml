/// PauseMenu_draw_map()


if(!paper_drawn_clms) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _x,_y, _x_base, _y_base, _w,_h;

var _i,_j, _idx, _val, _count, _color;
var _page;
var _row,_clm, _rows,_clms;
var _ts_x,_ts_y, _tsrc;
var _grid_x2,_grid_y2, _grid_x2_base,_grid_y2_base;
var _Grid_x2,_Grid_y2;
var _dk;










// MAP PAPER --------------------------
// -----------------------------------------------------------------------
_x_base = drawX   + 8;
_y_base = drawY   + 8;
_x      = _x_base + 2;
_y      = _y_base + 2;

// paper_drawn_clms is how many 8-pixel-wide columns of the paper will be drawn this frame of animation
_w = (paper_drawn_clms<<3) - 4;
_h = (ROWS_MAP_PAPER  <<3) - 4;

draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, _w,_h, COLOR_PAPER);








if(!g.dungeon_num)
{   // -----------------------------------------------------------------------
    // -----------------------  OVERWORLD  ---------------------------
    if (g.use_8x8_ow_menu_map) PauseMenu_Draw_map_Overworld8x8();
    else                       PauseMenu_Draw_map_Overworld16x16();
}
else if (paper_drawn_clms>2)
{   // -----------------------------------------------------------------------
    // -----------------------  DUNGEON  -----------------------------
    var _x_scale, _y_scale;
    var _rm_name = RM_NAME_NPALACE;
    var _AREA_NAME         = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Area], g.area_name);
    var _DUNGEON_NUM       = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], g.dungeon_num);
    
    var _Entrance_COUNT    = val(g.dm_rm[?_AREA_NAME+STR_Entrance+STR_Count]);
    var _Entrance_ExitName = val(g.dm_rm[?get_dk_dungeon_entrance(_DUNGEON_NUM)], EXIT_NAME_GAME_START);
    var _Entrance_ExitID   = str_hex(string_copy(_Entrance_ExitName,    RmName_LEN+1, 2));
    var _Entrance_RmName   =         string_copy(_Entrance_ExitName, 1, RmName_LEN);
    var _Entrance_Page     = val(g.dm_rm[?_Entrance_ExitName+STR_Page]);
    var _Entrance_Open     = 0;
    //var _Entrance_Open     = val(g.dm_rm[?_Entrance_ExitName+STR_Open]);
    
    
    if (_Entrance_COUNT)
    {
        var _dg_Entrance = ds_grid_create(_Entrance_COUNT, 5);
        for(_i=0; _i<_Entrance_COUNT; _i++)
        {
            _Entrance_ExitName  = val(g.dm_rm[?_AREA_NAME+STR_Entrance+hex_str(_i+1)], EXIT_NAME_GAME_START);
            _Entrance_ExitID    = str_hex(string_copy(_Entrance_ExitName,    RmName_LEN+1, 2));
            _Entrance_RmName    =         string_copy(_Entrance_ExitName, 1, RmName_LEN);
            _Entrance_Page      = val(g.dm_rm[?_Entrance_ExitName+STR_Page]);
            _Entrance_Open      = val(g.dm_rm[?_Entrance_ExitName+STR_Open]);
            _dg_Entrance[#_i,0] = _Entrance_ExitName;
            _dg_Entrance[#_i,1] = _Entrance_ExitID;
            _dg_Entrance[#_i,2] = _Entrance_RmName;
            _dg_Entrance[#_i,3] = _Entrance_Page;
            _dg_Entrance[#_i,4] = _Entrance_Open;
        }
    }
    
    
    
    
    
    
    
    _x_base = drawX + ($02<<3);
    _y_base = drawY + ($02<<3);
    
    var _DRAW_CLM_LFT  = (drawX>>3)+2;      // 1st rm draw clm
    
    var _DNGN_CLM_LFT  = _DRAW_CLM_LFT-1;   // 1st clm of drawn paper
        _DNGN_CLM_LFT += paper_drawn_clms;  // 1st clm after rgt of paper
        _DNGN_CLM_LFT -= CLMS_MAP_PAPER;    // 1st clm of paper (drawn or not)
        _DNGN_CLM_LFT += 1;                 // 1st clm of rm draw area (drawn or not)
        _DNGN_CLM_LFT += map_clm_off;       // lft most clm of dungeon (drawn or not)
    //
    
    var _DRAW_ROW_TOP  = (drawY>>3)+2;      // 1st rm draw row
    
    var _DNGN_ROW_TOP  = _DRAW_ROW_TOP-1;   // 1st row of drawn paper
        _DNGN_ROW_TOP += paper_drawn_rows;  // 1st row after btm of paper
        _DNGN_ROW_TOP -= ROWS_MAP_PAPER;    // 1st row of paper (drawn or not)
        _DNGN_ROW_TOP += 1;                 // 1st row of rm draw area (drawn or not)
        _DNGN_ROW_TOP += map_row_off;       // top most row of dungeon (drawn or not)
    //
    
    
    pal_swap_set(p.palette_image, get_pi(PI_GUI_1)); // BLUE room outline
    //pal_swap_set(p.palette_image, get_pi(PI_GUI_1, 1)); // RED room outline
    
    for(_i=ds_grid_width(dg_dngn_map)-1; _i>=0; _i--)
    {
        // index: 5 rm_name, 6 rm page, 7 explored
        if(!dg_dngn_map[#_i,7]  // if not yet explored rm page
        && !g.dev_DungeonMapShowAll ) // if true, all rms/pages will draw regardless of explored amount
        {
            continue;//_i
        }
        
            _clm  = _DNGN_CLM_LFT + dg_dngn_map[#_i,0]; // idx 0: clm
            _row  = _DNGN_ROW_TOP + dg_dngn_map[#_i,1]; // idx 1: row
        //if(g.dungeon_num==2 && !(g.counter0&$7F)) sdm("dg_dngn_map[#_i,0] $"+hex_str(dg_dngn_map[#_i,0])+", dg_dngn_map[#_i,1] $"+hex_str(dg_dngn_map[#_i,1])+", _DNGN_CLM_LFT $"+hex_str(_DNGN_CLM_LFT)+", _DNGN_ROW_TOP $"+hex_str(_DNGN_ROW_TOP)+", _clm $"+hex_str(_clm)+", _row $"+hex_str(_row));
        if (_clm <  _DRAW_CLM_LFT 
        ||  _clm >= _DRAW_CLM_LFT+(paper_drawn_clms-2) 
        ||  _row <  _DRAW_ROW_TOP 
        ||  _row >= _DRAW_ROW_TOP+(paper_drawn_rows-2) )
        {
            continue;//_i
        }
        
        
        
        _x_scale = dg_dngn_map[#_i,3];
        _y_scale = dg_dngn_map[#_i,4];
        
        
        _x  =  _clm     <<3;
        _x += !_x_scale <<3;
        
        _y  =  _row     <<3;
        _y += !_y_scale <<3;
        
        
        _tsrc = dg_dngn_map[#_i,2];
        _ts_x = ((_tsrc>>0)&$F) <<3;
        _ts_y = ((_tsrc>>4)&$F) <<3;
        draw_background_part_ext(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y, _x_scale,_y_scale, c_white,1);
        
        
        
        
        
        if (_Entrance_COUNT 
        &&  g.counter0&$20 )
        {
            _x_base  = (_clm<<3) + 4;
            _y_base  = (_row<<3) + 4;
            _rm_name = dg_dngn_map[#_i,5];
            _page    = dg_dngn_map[#_i,6];
            
            for(_j=0; _j<_Entrance_COUNT; _j++)
            {
                _Entrance_ExitName = _dg_Entrance[#_j,0];
                _Entrance_ExitID   = _dg_Entrance[#_j,1];
                _Entrance_RmName   = _dg_Entrance[#_j,2];
                _Entrance_Page     = _dg_Entrance[#_j,3];
                _Entrance_Open     = _dg_Entrance[#_j,4];
                
                if (_Entrance_RmName != _rm_name 
                ||  _Entrance_Page   != _page 
                || !_Entrance_Open )
                {
                    continue;//_j
                }
                
                
                // $00-0F:  Middle/Doorway exits
                // $10-1F, $20-2F, $40-4F, $80-8F: Side exits
                    _Entrance_ExitDir = (_Entrance_ExitID&$F0)>>4;
                if(!_Entrance_ExitDir) // $0:  Middle/Doorway exits
                {   // Arrow will face downward pointing a bit above the 
                    // y center of the entrance exit's page.
                    _EntranceArrow_SPR = dl_DngnEntranceArrow_SPR[|bitNum($4)];
                }
                else // $1(RGT), $2(LFT), $4(DWN), $8(UP)
                {   // Arrow will point AWAY from the entrance exit 
                    // and be close to that exit, but outside the rm.
                    _EntranceArrow_SPR = dl_DngnEntranceArrow_SPR[|bitNum(_Entrance_ExitDir)];
                }
                
                
                _x = _x_base;
                _y = _y_base;
                
                if(!_Entrance_ExitDir)
                {
                    _y -= 3;
                }
                else
                {
                    _x += DngnEntranceArrow_XYOff * bit_dir(_Entrance_ExitDir&$3);
                    _y += DngnEntranceArrow_XYOff * bit_dir(_Entrance_ExitDir&$C);
                }
                
                
                draw_sprite_(_EntranceArrow_SPR,0, _x,_y);
            }
        }
    }
    pal_swap_reset();
    
    
    if (_Entrance_COUNT)
    {
        ds_grid_destroy(_dg_Entrance); _dg_Entrance=undefined;
    }
    
    
    /* // debug.  1 Line indicates the left edge of rm draw area.
    var _color = c_lime;
    // indicates the LEFT edge of rm draw area.
    draw_line_colour( _x_base,      0, _x_base,viewYB(), _color,_color);
    // indicates the TOP  edge of rm draw area.
    draw_line_colour(viewXL(),_y_base,viewXR(), _y_base, _color,_color);
    
    _color = c_aqua;
    _x  = _DNGN_CLM_LFT<<3;
    // indicates the LEFT edge of the dungeon
    draw_line_colour( _x,           0, _x,     viewYB(), _color,_color);
    // indicates the TOP  edge of the dungeon
    _y  = _DNGN_ROW_TOP<<3;
    draw_line_colour(viewXL(),     _y,viewXR(),       _y, _color,_color);
    */
}














// PC --------------------------
// -----------------------------------------------------------------------
if (map_anim_idx+1==array_length_1d(ar_map_anim_data))
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
        _h = ROWS_MAP_PAPER<<3;
        _x = (drawX+8) + (_w>>1);
        _y = (drawY+8) + (_h>>1) + g.overworld.PC_DRAWY_OFF;
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
                switch(PCSkins_SYS_VER)
                {
                    case 1:{
                    draw_sprite_(Skin_image,$60|_frame_index, _x,_y, PI_PC_1);
                    break;}
                    
                    
                    
                    case 2:{
                    var _dk = val(dm_skins[?hex_str(_idx)+STR_Datakey]);
                    _dk += STR_Overworld+hex_str(_frame_index);
                    _w = dm_skins[?_dk+'_w'];
                    if(!is_undefined(_w))
                    {
                        _h   = val(dm_skins[?_dk+'_h']);
                        _xl2 = val(dm_skins[?_dk+STR_Placed+'_xl']); // relative to spr_PCSkins_Full01
                        _yt2 = val(dm_skins[?_dk+STR_Placed+'_yt']); // relative to spr_PCSkins_Full01
                        _xl1 = _x - (_w>>1);
                        _yt1 = _y - (_h>>1);
                        draw_sprite_part_(Skin_image,0, _xl2,_yt2, _w,_h, _xl1,_yt1, PI_PC_1);
                    }
                    break;}
                }
            }
            else
            {
                _w = Spritesheet_W;
                _h = Spritesheet_H;
                _x -= _w>>1;
                _y -= _h>>1;
                var _Sheet_X = _frame_index * _w;
                //if (g.overworld.mot==g.overworld.MOT_RAFT) _Sheet_X += 8; // 8-F: Raft
                var _Sheet_Y =           $E * _h;
                draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_Y, _w,_h, _x,_y, PI_PC_1);
            }
        }
    }
    else if (g.counter0&$20) // $20: on for .5s, then off for .5s
    {   // PC DUNGEON ICON --------------------------------
              _x_base = drawX + 8 + 8;
        _x  = _x_base;
        _x +=(((dngn_map_pc_rc>>0)&$FF) + map_clm_off) <<3;
        _x += DNGN_MAP_PC_SPR_WW_;
        
              _y_base = drawY + 8 + 8;
        _y  = _y_base;
        _y +=(((dngn_map_pc_rc>>8)&$FF) + map_row_off) <<3;
        _y += DNGN_MAP_PC_SPR_HH_;
        
        if (is_in_grid((_x-_x_base)>>3,(_y-_y_base)>>3, CLMS_MAP_DNGN,ROWS_MAP_DNGN))
        {
            draw_sprite_(SPR_ICON_PC1,0, _x,_y, PI_PC_1, g.pc.xScale);
        }
    }
}












// MAP TEARS --------------------------
// -----------------------------------------------------------------------
if (paper_drawn_clms)
{
    _row  = 0;
    _clm  = CLMS_MAP_PAPER - paper_drawn_clms;
    _rows = ROWS_MAP_PAPER - _row;
    _clms = CLMS_MAP_PAPER - _clm;
    
    _x_base = drawX + 8;
    _y_base = drawY + 8;
    
    _color = p.dl_COLOR[|p.background_color_index];
    
    for(_i=0; _i<_rows; _i++) // each row
    {
        for(_j=0; _j<_clms; _j++) // each column
        {
            _val = dg_map_edge[#_clm+_j, _row+_i];
            
            if (_val!=-1)
            {
                _x_scale = sign_(_val==$FE || !(_val&$40)); // -1 if _val!=$FE && _val&$40
                _y_scale = sign_(_val==$FE || !(_val&$80)); // -1 if _val!=$FE && _val&$80
                
                _x  =  _x_base + (_j<<3);
                _y  =  _y_base + (_i<<3);
                _x +=(!_x_scale     <<3);
                _y +=(!_y_scale     <<3);
                
                if (_x+8<=_x_base+(paper_drawn_clms<<3))
                {
                    _ts_x  = ((_val>>0)&$F) <<3;
                    _ts_y  = ((_val>>4)&$F) <<3;
                    _ts_y *= (_val==$FE);
                    draw_background_part_ext(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y, _x_scale,_y_scale, _color,1);
                }
            }
        }
    }
}





