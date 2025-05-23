/// PauseMenu_udp()


var _i, _bit, _amt;
var _x,_y, _x0,_y0, _xl,_yt, _dist_x, _w0;
var _clm,_row;
var _grid_clm,_grid_row;
var _ts, _tsrc1,_tsrc2,_tsrc3,_tsrc4, _tsrcA,_tsrcB, _ts_x,_ts_y, _ts_xoff,_ts_yoff, _tile_data, _tile_w,_tile_h;
var _is_treeA,_is_treeB;
var _owrc;


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


// g.menu_state==4: constructing menu, deconstructing menu from map to spell/item
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
    paper_drawn_rows = ROWS_MAP_PAPER;
    
    
    MapArea_w = paper_drawn_clms<<3;
    MapArea_h = ROWS_MAP_PAPER  <<3;
    
    MapArea_xl  = drawX; // menu window draw xl
    MapArea_xl += 8;     // +8(win border, drawn paper xl)
    
    MapArea_yt  = drawY; // menu window draw yt
    MapArea_yt += 8;     // +8(win border, drawn paper yt)
    
    
    MapPaper_w = MapArea_w - (MapPaper_PAD1<<1);
    MapPaper_h = MapArea_h - (MapPaper_PAD1<<1);
    
    MapPaper_xl = MapArea_xl + MapPaper_PAD1;
    MapPaper_yt = MapArea_yt + MapPaper_PAD1;
    
    
    map_is_opening = paper_drawn_clms && paper_drawn_clms<CLMS_MAP_PAPER;
    
    
    // The xl of the left most tile of a fully drawn map, even if only part of that tile may draw.
    terrain_tile_xl_base  = MapArea_xl;
    terrain_tile_xl_base += paper_drawn_clms<<3; // drawn paper xr
    terrain_tile_xl_base -= CLMS_MAP_PAPER<<3;   // paper xl, whether drawn yet or not
    terrain_tile_xl_base += 8;     // +8(terrain pad)
    terrain_tile_xl_base -= 4;     // offset 1/2 a tile because pc centered on map
    
    // The yt of the top most tile of a fully drawn map, even if only part of that tile may draw.
    terrain_tile_yt_base  = MapArea_yt;
    terrain_tile_yt_base += paper_drawn_rows<<3; // drawn paper yb
    terrain_tile_yt_base -= ROWS_MAP_PAPER<<3;   // paper yt, whether drawn yet or not
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
    
    
    var _OWRC = val(f.dm_rando[?g.rm_name+STR_OWRC], global.OVERWORLD.pcrc_map);
    tsrc_grid_clm_base = ((_OWRC>>0)&$FF) - (TerrainDraw_CLMS>>1);
    tsrc_grid_row_base = ((_OWRC>>8)&$FF) - (TerrainDraw_ROWS>>1);
    
    
    var _TSRC_ERROR = $FF;
    
    ds_grid_clear(dg_terrain_draw,0);
    
    var          _TILE_COUNT = ds_grid_width(dg_terrain_draw);
    for(_i=0; _i<_TILE_COUNT; _i++)
    {
        _clm = _i div TerrainDraw_ROWS;
        _row = _i mod TerrainDraw_ROWS;
        
        _xl = terrain_tile_xl_base + (_clm<<3);
        _yt = terrain_tile_yt_base + (_row<<3);
        
        if (_xl  >=terrain_draw_area_xr) break;//_i
        if (_xl+8<=terrain_draw_area_xl) continue;//_i
        if (_yt  >=terrain_draw_area_yb) continue;//_i
        if (_yt+8<=terrain_draw_area_yt) continue;//_i
        
        
        
        
             if (_xl  <terrain_draw_area_xl) _tile_w = (_xl+8) - terrain_draw_area_xl;
        else if (_xl+8>terrain_draw_area_xr) _tile_w = terrain_draw_area_xr - _xl;
        else                                 _tile_w = 8;
        
        if (_xl<terrain_draw_area_xl) _ts_xoff = 8 - _tile_w;
        else                          _ts_xoff = 0;
        _xl += _ts_xoff;
        
        
             if (_yt  <terrain_draw_area_yt) _tile_h = (_yt+8) - terrain_draw_area_yt;
        else if (_yt+8>terrain_draw_area_yb) _tile_h = terrain_draw_area_yb - _yt;
        else                                 _tile_h = 8;
        
        if (_yt<terrain_draw_area_yt) _ts_yoff = 8 - _tile_h;
        else                          _ts_yoff = 0;
        _yt += _ts_yoff;
        
        dg_terrain_draw[#_i,$2] = _tile_w; // $2: tile width
        dg_terrain_draw[#_i,$3] = _tile_h; // $3: tile height
        
        dg_terrain_draw[#_i,$0] = _xl;     // $0: xl
        dg_terrain_draw[#_i,$1] = _yt;     // $1: yt
        if (MapPaper_USE_SURFACE)
        {
            dg_terrain_draw[#_i,$0] -= MapArea_xl;
            dg_terrain_draw[#_i,$1] -= MapArea_yt;
        }
        
        
        
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
            else                                      _tsrc2 = $86; // Water - shallow
            _tsrc2 += _grid_clm&$1;
            _tsrc2 += (!(g.counter0&$40))<<1;
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
                _tsrc3 += sign(g.counter0&$40);
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
            _ts_x  = ((_tsrc2>>0)&$F) <<3; // Tileset's 8x8 tile's left
            _ts_x += _ts_xoff;
            
            _ts_y  = ((_tsrc2>>4)&$F) <<3; // Tileset's 8x8 tile's top
            _ts_y += _ts_yoff;
            
            dg_terrain_draw[#_i,$4] = true; // $5: can draw
            dg_terrain_draw[#_i,$5] = ts_Overworld_8x8_01; // $6: Layer 1 tileset
            dg_terrain_draw[#_i,$6] = _ts_x; // $6: Layer 1 _ts_x
            dg_terrain_draw[#_i,$7] = _ts_y; // $7: Layer 1 _ts_y
        }
        
        
        if (_tsrc3!=-1)
        {
            _ts_x  = ((_tsrc3>>0)&$F) <<3; // Tileset's 8x8 tile's left
            _ts_x += _ts_xoff;
            
            _ts_y  = ((_tsrc3>>4)&$F) <<3; // Tileset's 8x8 tile's top
            _ts_y += _ts_yoff;
            
            dg_terrain_draw[#_i,$8] = true; // $8: can draw
            dg_terrain_draw[#_i,$9] = ts_Overworld_8x8_01; // $9: Layer 2 tileset
            dg_terrain_draw[#_i,$A] = _ts_x; // $A: Layer 2 _ts_x
            dg_terrain_draw[#_i,$B] = _ts_y; // $B: Layer 2 _ts_y
        }
    }
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
        if (_bit!=ITM_MASK 
        ||  _bit!=ITM_BTL1 
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




/*
if(keyboard_check_pressed(vk_f7)){
sdm("drawX $"+hex_str(drawX)+", drawY $"+hex_str(drawY)+", terrain_tile_xl_base $"+hex_str(terrain_tile_xl_base)+", terrain_tile_yt_base $"+hex_str(terrain_tile_yt_base)+", terrain_draw_area_xl $"+hex_str(terrain_draw_area_xl)+", terrain_draw_area_yt $"+hex_str(terrain_draw_area_yt));
sdm("is_undefined(paper_drawn_clms) "+string(is_undefined(paper_drawn_clms))+", is_undefined(paper_drawn_rows) "+string(is_undefined(paper_drawn_rows)));
//sdm("paper_drawn_clms $"+hex_str(paper_drawn_clms)+", paper_drawn_rows $"+hex_str(paper_drawn_rows));
sdm("CLMS_MAP_PAPER $"+hex_str(CLMS_MAP_PAPER)+", ROWS_MAP_PAPER $"+hex_str(ROWS_MAP_PAPER)+", canDrawSections $"+hex_str(canDrawSections)+", Window_extra_draw_clms $"+hex_str(Window_extra_draw_clms)+", Window_vertical_draw_section_count $"+hex_str(Window_vertical_draw_section_count)+", Window_filler_clms $"+hex_str(Window_filler_clms));
}
*/




