/// PauseMenu_udp()


var _i,_j, _idx, _bit, _amt;
var _x,_y, _x0,_y0, _xl,_yt, _dist_x, _w,_h, _w0;
var _clm,_row;
var _grid_clm,_grid_row;
var _ts, _tsrc1,_tsrc2,_tsrc3,_tsrc4, _tsrcA,_tsrcB, _ts_x,_ts_y, _ts_xoff,_ts_yoff, _tile_data, _tile_w,_tile_h;
var _is_treeA,_is_treeB;
var _owrc;
var _dk;

var _TERRAIN_SURF_COUNT = ds_grid_width(dg_terrain_surf);

drawX = get_menu_x();
drawY = viewYT() + Y_BASE;
canDrawSections = g.menu_built_count;

var _ST_CURR =  state    &$3; // $1: spell menu, 2: item menu, 3: map
var _ST_PREV = (state>>4)&$3;
canDrawSpells = _ST_CURR==state_SPELL || (_ST_PREV==state_SPELL && g.menu_state<5 && _ST_CURR!=state_ITEM);
canDrawItems  = _ST_CURR==state_ITEM  || (_ST_PREV==state_ITEM  && g.menu_state<5 && _ST_CURR!=state_SPELL);


map_is_opening = false;

paper_drawn_clms = 0;
paper_drawn_rows = 0;

terrain_draw_area_w = 0;
terrain_draw_area_h = 0;

terrain_tile_xl_base = 0;
terrain_tile_yt_base = 0;
terrain_draw_area_xl = 0;
terrain_draw_area_xr = 0;
terrain_draw_area_yt = 0;
terrain_draw_area_yb = 0;

tsrc_grid_clm_base = 0;
tsrc_grid_row_base = 0;

Window_extra_draw_clms   = 0;
Window_extra_draw_clms_w = 0;

MapArea_xl = 0;
MapArea_yt = 0;
MapArea_w  = 0;
MapArea_h  = 0;

MapPaper_xl = 0;
MapPaper_yt = 0;
MapPaper_w  = 0;
MapPaper_h  = 0;


// g.menu_state==4: constructing menu on menu open, deconstructing menu from map to spell/item
// g.menu_state==5: idle, user input
                                                             Window_draw_data_state = _ST_CURR;
     if (_ST_CURR==state_MAP             && g.menu_state>=5) Window_draw_data_state =  state_MAP;
else if (_ST_CURR==state_MAP && _ST_PREV && g.menu_state==4) Window_draw_data_state = _ST_PREV;   // when constructing map window
if(!Window_draw_data_state){                                 Window_draw_data_state =  state_SPELL;}



if (canDrawSections>ANIM_FRAMES_DEF) // Map
{
    drawX -= (canDrawSections-ANIM_FRAMES_DEF)<<4;
    
    var _IDX_LAST = ds_list_size(dl_map_anim_data)-1;
    Window_extra_draw_clms = (canDrawSections-ANIM_FRAMES_DEF)<<1; // column width 8
    
    if (g.menu_state==5) map_anim_idx = _IDX_LAST;
    else                 map_anim_idx = clamp((Window_extra_draw_clms>>1)-1, 0,_IDX_LAST); // 0 is the 1st frame of anim, 4 is 5th frame
    
    
    
    paper_drawn_clms = dl_map_anim_data[|map_anim_idx];
    paper_drawn_rows = MapPaper_ROWS;
    
    
    MapArea_w = paper_drawn_clms<<3;
    MapArea_h = MapPaper_ROWS   <<3;
    
    MapArea_xl  = drawX; // menu window draw xl
    MapArea_xl += 8;     // +8(win border, drawn paper xl)
    
    MapArea_yt  = drawY; // menu window draw yt
    MapArea_yt += 8;     // +8(win border, drawn paper yt)
    
    
    MapPaper_w = MapArea_w - (MapPaper_PAD1<<1);
    MapPaper_h = MapArea_h - (MapPaper_PAD1<<1);
    
    // This xl,yt are relative to 0,0 when drawing onto `MenuMap_srf`
    MapPaper_xl = MapPaper_PAD1;
    MapPaper_yt = MapPaper_PAD1;
    
    
    MapTearsSurf_xl  = MapArea_W;     // MapArea xr
    MapTearsSurf_xl -= MapPaper_PAD1; // paper xr
    MapTearsSurf_xl -= MapPaper_w;    // draw paper xl
    
    MapTearsSurf_yt  = MapArea_H;     // MapArea yb
    MapTearsSurf_yt -= MapPaper_PAD1; // paper yb
    MapTearsSurf_yt -= MapPaper_h;    // draw paper yt
    
    MapTearsDraw_xl = MapPaper_xl;
    MapTearsDraw_yt = MapPaper_yt;
    
    
    map_is_opening = paper_drawn_clms && paper_drawn_clms<MapPaper_CLMS;
    current_terrain_surf_idx = !(g.counter0&$40);
    
    
    // The draw xl of the left most tile of a fully drawn map, even if only part of that tile may draw.
    terrain_tile_xl_base  = MapArea_xl;
    terrain_tile_xl_base += paper_drawn_clms<<3; // drawn paper xr
    terrain_tile_xl_base -= MapPaper_CLMS<<3;   // paper xl, whether drawn yet or not
    terrain_tile_xl_base += 8;     // +8(terrain pad)
    terrain_tile_xl_base -= 4;     // offset 1/2 a tile because pc centered on map
    
    // The draw yt of the top most tile of a fully drawn map, even if only part of that tile may draw.
    terrain_tile_yt_base  = MapArea_yt;
    terrain_tile_yt_base += paper_drawn_rows<<3; // drawn paper yb
    terrain_tile_yt_base -= MapPaper_ROWS<<3;   // paper yt, whether drawn yet or not
    terrain_tile_yt_base += 8;     // +8(terrain pad)
    terrain_tile_yt_base -= 4;     // offset 1/2 a tile because pc centered on map
    
    
    // The xl of what terrain can be drawn currently, which may include a partial tile
    terrain_draw_area_xl  = MapArea_xl;
    terrain_draw_area_xl += 8;     // +8(terrain pad)
    terrain_draw_area_xl -= 4 * map_is_opening; // extra half tile while opening
    
    terrain_draw_area_xr  = MapArea_xl;
    terrain_draw_area_xr += paper_drawn_clms<<3; // drawn paper xr
    terrain_draw_area_xr -= 8;     // -8(terrain pad)
    //terrain_draw_area_xr += 4 * map_is_opening; // extra half tile while opening
    
    // The yt of what terrain can be drawn currently, which may include a partial tile
    terrain_draw_area_yt  = MapArea_yt;
    terrain_draw_area_yt += 8;     // +8(terrain pad)
    
    terrain_draw_area_yb  = MapArea_yt;
    terrain_draw_area_yb += paper_drawn_rows<<3; // paper yb
    terrain_draw_area_yb -= 8;     // -8(terrain pad)
    
    
    for(_i=0; _i<_TERRAIN_SURF_COUNT; _i++)
    {
        dg_terrain_surf[#_i,$1] = terrain_draw_area_xl - MapArea_xl;
        dg_terrain_surf[#_i,$2] = terrain_draw_area_yt - MapArea_yt;
        dg_terrain_surf[#_i,$3] = terrain_draw_area_xr - terrain_draw_area_xl;
        dg_terrain_surf[#_i,$4] = terrain_draw_area_yb - terrain_draw_area_yt;
        dg_terrain_surf[#_i,$5] = TerrainSurfDraw_X_MAX - dg_terrain_surf[#_i,$3];
        dg_terrain_surf[#_i,$6] = TerrainSurfDraw_Y_MAX - dg_terrain_surf[#_i,$4];
    }
}
//dg_terrain_surf[#anim frame,$0] // $0: surface image
//dg_terrain_surf[#anim frame,$1] // $1: draw xl
//dg_terrain_surf[#anim frame,$2] // $2: draw yt
//dg_terrain_surf[#anim frame,$3] // $3: current frame's surface part width
//dg_terrain_surf[#anim frame,$4] // $4: current frame's surface part height
//dg_terrain_surf[#anim frame,$5] // $5: current frame's surface part xl (relative to surface left edge)
//dg_terrain_surf[#anim frame,$6] // $6: current frame's surface part yt (relative to surface top  edge)
//dg_terrain_surf[#anim frame,$7] // $7: encoded grid of terrain tile data for this anim frame surface
//draw_surface_part(id, surface xl,surface yt, part width,part height, draw xl,draw yt)




var _will_refresh_terrain_data = false;

if (g.menu_state==1)
{
    _will_refresh_terrain_data = true;
}
else
{
    for(_i=0; _i<_TERRAIN_SURF_COUNT; _i++)
    {
        if(!surface_exists(dg_terrain_surf[#_i,$0]))
        {
            _will_refresh_terrain_data = true;
            break;//_i
        }
    }
}


if (_will_refresh_terrain_data)
{
    for(_i=0; _i<_TERRAIN_SURF_COUNT; _i++)
    {
        if (surface_exists(dg_terrain_surf[#_i,$0]))
        {   surface_free(  dg_terrain_surf[#_i,$0]);  }
    }//_i
    
    
    var _TSRC_ERROR = $FF;
    var _TILE_COUNT = TerrainTile_CLMS * TerrainTile_ROWS;
    var _dg_tile_data = ds_grid_create(_TILE_COUNT,$8);
    
    _owrc = val(g.dm_rm[?   g.rm_name+STR_OWRC], global.OVERWORLD.pcrc_map);
    _owrc = val(f.dm_rando[?g.rm_name+STR_OWRC], _owrc);
    tsrc_grid_clm_base = ((_owrc>>0)&$FF) - (TerrainTile_CLMS>>1);
    tsrc_grid_row_base = ((_owrc>>8)&$FF) - (TerrainTile_ROWS>>1);
    
    for(_i=0; _i<_TERRAIN_SURF_COUNT; _i++)
    {
        ds_grid_clear(_dg_tile_data,0);
        
        for(_j=0; _j<_TILE_COUNT; _j++)
        {
            _clm = _j div TerrainTile_ROWS;
            _row = _j mod TerrainTile_ROWS;
            
            _dg_tile_data[#_j,$0] = _clm<<3; // tile surface draw xl (relative to 0,0 while surface is being drawn)
            _dg_tile_data[#_j,$1] = _row<<3; // tile surface draw yt (relative to 0,0 while surface is being drawn)
            
            _grid_clm = tsrc_grid_clm_base + _clm;
            _grid_row = tsrc_grid_row_base + _row;
            _owrc = (_grid_row<<8) | _grid_clm;
            
            _tile_data = global.OVERWORLD.dg_tsrc[#_grid_clm,_grid_row];
            _tsrc1 = _tile_data&$FF;
            
            _tsrc2 = -1;
            _tsrc3 = -1;
            
            if (_tile_data==global.OVERWORLD.TSRC_WATER01   // Water - deep
            ||  _tile_data==global.OVERWORLD.TSRC_WATER02 ) // Water - shallow
            //if (_tsrc1==$00   // Water - deep
            //||  _tsrc1==$04   // Water - shallow
            //||  _tsrc1==$06 ) // Water - shallow
            {
                if (_tile_data==global.OVERWORLD.TSRC_WATER01) _tsrc2 = $82; // Water - deep
                else                                           _tsrc2 = $86; // Water - shallow
                _tsrc2 += _grid_clm&$1;
                _tsrc2 += (!(_i&$1))<<1;
                _tsrc2 +=(_grid_row&$1)<<4;
            }
            else
            {
                _tsrc2 = val(dm_terrain[?STR_TSRC+"_16x16_to_8x8_"+"_Layer1"+hex_str(_tile_data)], -1);
            }
            
            
            
            if (_tsrc2!=-1)
            {
                _tsrc3 = val(dm_terrain[?STR_TSRC+"_16x16_to_8x8_"+"_Layer2"+hex_str(_tile_data)], -1);
                
                if (_tsrc3==$E8) // River Devil
                {
                    _tsrc3 += _i&$1;
                    //_tsrc3 += sign(g.counter0&$40);
                }
                else if (_tsrc3==-1)
                {
                    _tsrc4 = -1;
                    
                    if (_tsrc1==TSRC_TREE01 
                    ||  _tsrc1==TSRC_TREE02 
                    ||  _tsrc1==TSRC_TREE03 
                    ||  _tsrc1==TSRC_TREE04 
                    ||  _tsrc1==TSRC_TREE04+1 
                    ||  _tsrc1==TSRC_TREE04+2 )
                    {
                        _tsrc4 = _tsrc1;
                        _tsrcA = global.OVERWORLD.dg_tsrc[#_grid_clm-1,_grid_row]&$FF; // Left of _owrc
                        if (_tsrcA==TSRC_TREE01 
                        ||  _tsrcA==TSRC_TREE02 
                        ||  _tsrcA==TSRC_TREE03 
                        ||  _tsrcA==TSRC_TREE04 
                        ||  _tsrcA==TSRC_TREE04+1 
                        ||  _tsrcA==TSRC_TREE04+2 )
                        {
                            _tsrc3 = $00;
                        }
                        else
                        {
                            _tsrc3 = $01;
                        }
                    }
                    else
                    {
                        _tsrcA = global.OVERWORLD.dg_tsrc[#_grid_clm-1,_grid_row]&$FF; // Left of _owrc
                        _is_treeA = isVal(_tsrcA,TSRC_TREE01,TSRC_TREE02,TSRC_TREE03,TSRC_TREE04,TSRC_TREE04+1,TSRC_TREE04+2); // Left of _owrc
                        _tsrcB = global.OVERWORLD.dg_tsrc[#_grid_clm,_grid_row+1]&$FF; // Under _owrc
                        _is_treeB = isVal(_tsrcB,TSRC_TREE01,TSRC_TREE02,TSRC_TREE03,TSRC_TREE04,TSRC_TREE04+1,TSRC_TREE04+2); // Under _owrc
                        
                        if (_is_treeA   // Left of _owrc
                        ||  _is_treeB ) // Under _owrc
                        {
                            if (_is_treeA 
                            &&  _is_treeB )
                            {
                                _tsrc4 = _tsrcA;
                                _tsrc3 = $07; // Tree top + right tree edge for upper left tree
                            }
                            else if (_is_treeA)
                            {
                                _tsrc4 = _tsrcA;
                                _tsrc3 = $06; // Right tree edge
                            }
                            else
                            {
                                _tsrc4 = _tsrcB;
                                _tsrc3 = $05; // Right tree edge
                            }
                        }
                    }
                    
                    if (_tsrc3!=-1 
                    &&  _tsrc4!=-1 )
                    {
                        if (_tsrc4==TSRC_TREE02     // $31 orange - reg
                        ||  _tsrc4==TSRC_TREE04+2   // $35 orange - water
                        ||  _tsrc4==TSRC_TREE03     // $32 dark green - bright grass
                        ||  _tsrc4==TSRC_TREE04 )   // $33 dark green - mid grass
                        {
                            if (_tsrc4==TSRC_TREE02     // $31 orange - reg
                            ||  _tsrc4==TSRC_TREE04+2 ) // $35 orange - water
                            {
                                _tsrc3 += $10; // Orange tree
                            }
                            else
                            {
                                _tsrc3 += $08; // Dark green tree
                            }
                        }
                    }
                }
            }
            
            
            
            if (_tsrc2!=-1)
            {
                _dg_tile_data[#_j,$2] = ts_Overworld_8x8_01;  // $2: Layer 1 tileset
                _dg_tile_data[#_j,$3] = ((_tsrc2>>0)&$F) <<3; // $3: Layer 1 _ts_x
                _dg_tile_data[#_j,$4] = ((_tsrc2>>4)&$F) <<3; // $4: Layer 1 _ts_y
            }
            
            
            if (_tsrc3!=-1)
            {
                _dg_tile_data[#_j,$5] = ts_Overworld_8x8_01;  // $5: Layer 2 tileset
                _dg_tile_data[#_j,$6] = ((_tsrc3>>0)&$F) <<3; // $6: Layer 2 _ts_x
                _dg_tile_data[#_j,$7] = ((_tsrc3>>4)&$F) <<3; // $7: Layer 2 _ts_y
            }
        }//_j
        
        
        dg_terrain_surf[#_i,$7] = ds_grid_write(_dg_tile_data);
    }//_i
    
    
    ds_grid_destroy(_dg_tile_data); _dg_tile_data=undefined;
}




if(!surface_exists(MenuMap_srf))
{
    MenuMap_srf = surface_create(1,1);
}

if (MapArea_w 
&&  MapArea_h )
{
    surface_resize(MenuMap_srf, MapArea_w,MapArea_h);
}




Window_w  = Window_W0;
Window_w += Window_extra_draw_clms<<3;

var _SECTIONS = clamp(canDrawSections, 1, ANIM_FRAMES_DEF);
Window_h  = _SECTIONS<<1;
Window_h += dg_win_tdata_spl[#_SECTIONS-1,dg_tdata_H-1]!=0; // extra row
//Window_h += (array_length_2d(ar_win_tdata_spl, _SECTIONS-1) &$1); // extra row
Window_h  = Window_h<<3;


Window_vertical_draw_section_count = clamp(canDrawSections, 1, ANIM_FRAMES_DEF);

Window_xl0 = get_menu_x();
Window_xl  = drawX;
Window_xr  = Window_xl0 + Window_W0;
Window_yt  = drawY;
Window_yb  = drawY + Window_h;

Window_filler_clms = max(0, Window_extra_draw_clms-2);


Window_extra_draw_clms_w  = $1; // left border
Window_extra_draw_clms_w += Window_filler_clms;
Window_extra_draw_clms_w += $1; // ? adj
Window_extra_draw_clms_w  = Window_extra_draw_clms_w<<3;


MenuFrameSeparator1_can_draw = Window_extra_draw_clms!=0;
if (MenuFrameSeparator1_can_draw) _w0 = MenuFrameSeparator1_W; // spell/item: frame left clm. map: area-name/menu-navigation separator. 1st clm of `Window_xl0`
else                              _w0 = $0;
switch(Window_draw_data_state){
case state_SPELL:{MenuFrameMain_w=MenuFrame_srf_SPELL_W; break;}
case state_ITEM: {MenuFrameMain_w=MenuFrame_srf_ITEM_W;  break;}
case state_MAP:  {MenuFrameMain_w=MenuFrame_srf_MAP_W;   break;}
}

MenuFrameMain_srf_xl  = MenuFrameMain_w - Window_W0;
MenuFrameMain_srf_xl += _w0;
MenuFrameMain_w      -= _w0;
MenuFrameMain_xl      = Window_xl0 + _w0;
MenuFrameMain_yt      = drawY;




Items_Bar1_can_draw = drawY+ITEMS_BAR1_Y+4 < Window_yb; // Main & Quest items separator
Items_Bar1_x = Window_xl0 + Items_Bar1_XOFF;
Items_Bar1_y = drawY + Items_Bar1_YOFF;

Items_Bar2_can_draw = drawY+ITEMS_BAR2_Y+2 < Window_yb; // Crystals top bar
Items_Bar2_x = Window_xl0 + Items_Bar2_XOFF;
Items_Bar2_y = drawY + Items_Bar2_YOFF;

Items_Bar3_can_draw = drawY+ITEMS_BAR3_Y+3 < Window_yb; // Crystals btm bar
Items_Bar3_x = Window_xl0 + Items_Bar3_XOFF;
Items_Bar3_y = drawY + Items_Bar3_YOFF;
/*
Items_Bar1_can_draw = drawY+ITEMS_BAR1_Y+4 < Window_yb; // Main & Quest items separator
Items_Bar1_x = Window_xl0 + 8;
Items_Bar1_y = drawY + ITEMS_BAR1_Y;

Items_Bar2_can_draw = drawY+ITEMS_BAR2_Y+2 < Window_yb; // Crystals top bar
Items_Bar2_x = Window_xl0 + 8;
Items_Bar2_y = drawY + ITEMS_BAR2_Y;

Items_Bar3_can_draw = drawY+ITEMS_BAR3_Y+3 < Window_yb; // Crystals btm bar
Items_Bar3_x = Items_Bar2_x;
Items_Bar3_y = drawY + ITEMS_BAR3_Y;
*/








MenuNav_can_draw = Window_vertical_draw_section_count-1 == ANIM_FRAMES_DEF-1;
MenuNavL_text_can_draw = sign(state_dir) != -1;
MenuNavR_text_can_draw = sign(state_dir) !=  1;
//                                                  //
_x  = Window_xl0;
_x += Window_W0>>1; // menu center x
_y  = Window_yb - $0C; // dist from menu bottom to yc of text
//                                                  //
//                                                  //
_xl = _x - (MenuNav_FONT_W>>1);
_yt = _y - (MenuNav_FONT_H>>1);
_dist_x  = $3<<3; // dist from menu centerx to inner edge of text
_dist_x += MenuNav_FONT_W>>1;// dist from menu centerx to center of text
//                                                  //
MenuNavL_text    = "B";
MenuNavL_text_xl = _xl - _dist_x;
MenuNavL_text_yt = _yt;
//                                                  //
MenuNavR_text    = "A";
MenuNavR_text_xl = _xl + _dist_x;
MenuNavR_text_yt = _yt;
//                                                  //
//                                                  //
//                                                  //
switch(_ST_CURR){
default:        {MenuNavL_sprite=SPR_ICON_MAP; MenuNavR_sprite=SPR_ICON_ITM; break;}
case state_ITEM:{MenuNavL_sprite=SPR_ICON_SPL; MenuNavR_sprite=SPR_ICON_MAP; break;}
case state_MAP: {MenuNavL_sprite=SPR_ICON_ITM; MenuNavR_sprite=SPR_ICON_SPL; break;}
}
_dist_x = $5<<3; // dist from menu centerx to center of sprite
//                                                  //
MenuNavL_sprite_x = _x - _dist_x;
MenuNavL_sprite_y = _y;
//                                                  //
MenuNavR_sprite_x = _x + _dist_x;
MenuNavR_sprite_y = _y;
//                                                  //








AreaName_can_draw = _ST_CURR==state_MAP && map_anim_idx==ds_list_size(dl_map_anim_data)-1;
if (AreaName_can_draw)
{
    AreaName_text = MapAreaName;
    //                                                  //
    AreaName_xl  = drawX;
    AreaName_xl += 8; // window border
    AreaName_xl += (Window_xl0-AreaName_xl)>>1; // text area xc
    AreaName_xl -= (string_length(AreaName_text)*AreaName_FONT_W) >>1; // text xl
    //                                                  //
    AreaName_yt  = Window_yb - $10; // text yt
}








_amt = $0;
WindowBackground_can_draw = true;
WindowBackground_color = global.BackgroundColor_scene;
WindowBackground_alpha = 1;
switch(0) // test diff styles
{
    case 1:{
    _amt = $2;
    WindowBackground_color = p.C_BLK1;
    WindowBackground_alpha = 0.7;
    break;}
    
    case 2:{
    _amt = $2;
    WindowBackground_alpha = 0.85;
    break;}
}
WindowBackground_w = Window_w - (_amt<<1);
WindowBackground_h = Window_h - (_amt<<1);

WindowBackground_xl = drawX + _amt;
WindowBackground_yt = drawY + _amt;








MainItems_can_draw = false;

for(_i=ds_grid_width(dg_items)-1; _i>=0; _i--)
{
    dg_items[#_i,$5] = false; // $5: can draw
    _bit = dg_items[#_i,$0]; // $0: item bit
    if (f.items&_bit)
    {
        if ((_bit!=ITM_MASK && _bit!=ITM_BTL1) 
        ||  f.quest_num>1 )
        {
            _y = drawY + dg_items[#_i,$2];
            if (_y+8<Window_yb)
            {
                MainItems_can_draw = true;
                dg_items[#_i,$5] = true; // $5: can draw
            }
        }
    }
}

dg_items[#(bitNum(ITM_FRY1))-1,$3] = g.dl_Fairy_SPRITES[|!(g.counter0&$8)];




Feather_can_draw = f.items&ITM_FTHR!=0;
if(Feather_can_draw)
{
    if (g.DoubleJump_state) Feather_pi = global.PI_MOB_ORG;
    else                    Feather_pi = global.PI_GUI2;
    Feather_x = Window_xr - (Window_W0>>1);
    Feather_y = Window_yb - $C;
    //Feather_can_draw &= Feather_y+8<Window_yb;
}








Crystals_x = Window_xl0 + Crystals_PAD1;
Crystals_y = drawY + Crystals_Y;
Crystals_can_draw = Crystals_y+8<Window_yb;








Icons_can_draw = false;

Icons_x  = Window_xl0;
Icons_x += 8;
Icons_x += 3;

Icons_y  = drawY + Icons_Y;
for(_i=0; _i<Icons_COUNT; _i++)
{
    _y = Icons_y + (Icons_PAD*_i);
    dg_icons1[#_i,$5] = false; // $5: can draw
    if (_y+sprite_get_height(dg_icons1[#_i,$1])<Window_yb)
    {
        Icons_can_draw = true;
        dg_icons1[#_i,$5] = true; // $5: can draw
    }
}








LifeDolls_can_draw = LifeDolls_count!=0;
if (LifeDolls_can_draw)
{
    LifeDolls_x = Window_xl0 + Dolls_X;
    LifeDolls_y = drawY + Dolls_Y;
    LifeDolls_pi = global.PI_PC1; // Green PC pal
    //LifeDolls_pi = p.dg_PI_SEQ[#0,0]; // Current PC pal
    LifeDolls_can_draw &= LifeDolls_y+8<Window_yb;
}








AllKey_can_draw = f.items&ITM_SKEY!=0;
if (AllKey_can_draw)
{
    if (POSITIONING_VER==3)
    {
        AllKey_x = Window_xl0 + AllKey_X;
        AllKey_y = drawY      + AllKey_Y;
    }
    else
    {
        if (f.quest_num==1)
        {
            AllKey_x = Window_xl0 + $1A;
            AllKey_y = drawY + dg_items[#$9,$2];
        }
        else
        {
            AllKey_x = Window_xl0 + AllKey_X;
            AllKey_y = drawY      + AllKey_Y;
        }
    }
    
    AllKey_can_draw &= AllKey_y+8<Window_yb;
}








TreasureMap1_x = Window_xl0 + TreasureMap1_XOFF;
TreasureMap1_y = drawY + TreasureMap1_YOFF;
TreasureMap1_can_draw = f.items&ITM_MAP1 && TreasureMap1_y+8<Window_yb;


TreasureMap2_x = Window_xl0 + TreasureMap2_XOFF;
TreasureMap2_y = drawY + TreasureMap2_YOFF;
TreasureMap2_can_draw = f.items&ITM_MAP2 && TreasureMap2_y+8<Window_yb;








if (ContainerPiece_count_hp==f.CONT_PIECE_MAX_HP) ContainerHP_sprite = g.SPR_CONT_HP;
else                                              ContainerHP_sprite = g.dl_cont_spr_hp[|ContainerPiece_count_hp mod f.CONT_PIECE_PER_HP];
ContainerHP_x = Window_xl0 + Containers_X;
ContainerHP_y = drawY + Containers_Y;
ContainerHP_can_draw = ContainerHP_y+8<Window_yb;

if (ContainerPiece_count_mp==f.CONT_PIECE_MAX_MP) ContainerMP_sprite = g.SPR_CONT_MP;
else                                              ContainerMP_sprite = g.dl_cont_spr_mp[|ContainerPiece_count_mp mod f.CONT_PIECE_PER_MP];
ContainerMP_x = ContainerHP_x + $10 + Containers_PAD;
ContainerMP_y = ContainerHP_y;
ContainerMP_can_draw = ContainerMP_y+8<Window_yb;








MenuMapPC_can_draw = false;
MenuMapPC_use_sprite_sheet = false;

if (canDrawSections>ANIM_FRAMES_DEF  // Map
&&  map_anim_idx+1==ds_list_size(dl_map_anim_data) )
{
    if(!g.dungeon_num)
    {   // PC OW FIGURE -------------------------
        _w = MapPaper_CLMS<<3;
        _h = MapArea_h;
        MenuMapPC_x = MapArea_xl + (_w>>1) + global.OVERWORLD.PC_draw_XOFF;
        MenuMapPC_y = MapArea_yt + (_h>>1) + global.OVERWORLD.PC_draw_YOFF;
        MenuMapPC_y += 1; // micro adjustment
        //MenuMapPC_y -= 2; // micro adjustment
        
        // g.rm_ow_dir: $0: horizontal axis, $1: vertical axis, bit $2: flip x/y scale
        var _frame_index  = (g.rm_ow_dir&$1)<<2; // 0,4. 0,1: right, 2,3: left, 4,5: down, 6,7: up
            _frame_index += (!global.pc.xScale)<<1;   // +=0,2. Flips x/y scale
            _frame_index += (g.rm_ow_dir&$2) * global.pc.xScale; // flips x/y scale
            //_frame_index += (g.rm_ow_dir&$2) * sign(!global.pc.xScale); // flips x/y scale
            //_frame_index +=  g.rm_ow_dir&$2; // flips x/y scale
            _frame_index += sign(g.counter0&$1F>$11); // anim timing
        //
        MenuMapPC_OW_sprite = global.pc.Skin_image;
        MenuMapPC_OW_sprite_image_idx = $60|_frame_index;
        
        _idx = val(global.pc.dm_skins[?STR_Current+STR_Idx]);
        if (val(global.pc.dm_skins[?hex_str(_idx)+"_source_is_file"]))
        {
            MenuMapPC_use_sprite_sheet = true;
            
            MenuMapPC_sprite_w = global.pc.Spritesheet_W;
            MenuMapPC_sprite_h = global.pc.Spritesheet_H;
            MenuMapPC_x -= MenuMapPC_sprite_w>>1;
            MenuMapPC_y -= MenuMapPC_sprite_h>>1;
            MenuMapPC_sheet_x = MenuMapPC_sprite_w * _frame_index;
            //if (global.OVERWORLD.mot==global.OVERWORLD.MOT_RAFT) MenuMapPC_sheet_x += 8; // 8-F: Raft
            MenuMapPC_sheet_y = MenuMapPC_sprite_h * $E;
        }
        
        MenuMapPC_can_draw = true;
    }
    else if (g.counter0&$20) // $20: on for .5s, then off for .5s
    {   // PC DUNGEON ICON --------------------------------
        _x0 = MapArea_xl + 8;
        MenuMapPC_x  = _x0;
        MenuMapPC_x +=(((dngn_map_pc_rc>>0)&$FF) + map_clm_off) <<3;
        MenuMapPC_x += DNGN_MAP_PC_SPR_WW_;
        
        _y0 = MapArea_yt + 8;
        MenuMapPC_y  = _y0;
        MenuMapPC_y +=(((dngn_map_pc_rc>>8)&$FF) + map_row_off) <<3;
        MenuMapPC_y += DNGN_MAP_PC_SPR_HH_;
        
        _clm = (MenuMapPC_x-_x0)>>3;
        _row = (MenuMapPC_y-_y0)>>3;
        if (is_in_grid(_clm,_row, MapDungeon_CLMS,MapDungeon_ROWS))
        {
            MenuMapPC_can_draw = true;
        }
    }
}




/*
if(keyboard_check_pressed(vk_f7)){
sdm("drawX $"+hex_str(drawX)+", drawY $"+hex_str(drawY)+", terrain_tile_xl_base $"+hex_str(terrain_tile_xl_base)+", terrain_tile_yt_base $"+hex_str(terrain_tile_yt_base)+", terrain_draw_area_xl $"+hex_str(terrain_draw_area_xl)+", terrain_draw_area_yt $"+hex_str(terrain_draw_area_yt));
sdm("is_undefined(paper_drawn_clms) "+string(is_undefined(paper_drawn_clms))+", is_undefined(paper_drawn_rows) "+string(is_undefined(paper_drawn_rows)));
//sdm("paper_drawn_clms $"+hex_str(paper_drawn_clms)+", paper_drawn_rows $"+hex_str(paper_drawn_rows));
sdm("MapPaper_CLMS $"+hex_str(MapPaper_CLMS)+", MapPaper_ROWS $"+hex_str(MapPaper_ROWS)+", canDrawSections $"+hex_str(canDrawSections)+", Window_extra_draw_clms $"+hex_str(Window_extra_draw_clms)+", Window_vertical_draw_section_count $"+hex_str(Window_vertical_draw_section_count)+", Window_filler_clms $"+hex_str(Window_filler_clms));
}
*/




