/// TitleScreen_Create()

show_debug_message("TitleScreen_Create()");


var _i, _a, _x,_y;


set_background_color(p.C_BLK1);

depth = 0;
//depth = DEPTH_BG8+(TILE_DEPTHS_PAD>>1);
//depth = DEPTH_BG8+DEPTH_PAD;



HOME_X  = viewXC() - VIEW_W_OG_; // centered
HOME_Y  = viewYB() - VIEW_H_OG;  // aligned to bottom
HOME_Y += $10; // Because VIEW_H_OG used to erronously be 224 instead of 240

x = HOME_X;
y = HOME_Y;
//x  = viewXC() - VIEW_W_OG_; // centered
//y  = viewYB() - VIEW_H_OG;  // aligned to bottom



f.quest_num = 1;
g.game_end_state = 0;





// STARRY SKY ----------------------------------------------------
/*
W 30, b 21, B 02, G 00

25 STARS - y & x coords - Starting colors
  y       x      x      x      x      x
  3:     83 b, 163 B, 
 11:     35 G, 123 W, 
 19:    227 B, 
 27:     19 G,  43 W, 163 B, 227 W, 235 b, 
 
 35:    123 B, 203 G, 235 W, 
 43:     43 b, 219 B, 
 51:     19 G, 203 W, 
 59:     27 B, 171 b, 
 
 67:     11 G,  75 W, 
 75:    131 G, 227 b, 
 91:     67 b,  99 b, 
*/
         _a=0;
var _W = _a++; // White
var _b = _a++; // blue(light)
var _B = _a++; // Blue(dark)
var _G = _a++; // Grey

dg_STAR_SKY = ds_grid_create(25,3);
             _a = 0;
dg_STAR_SKY[#_a,0] = $0A<<3; // x $50
dg_STAR_SKY[#_a,1] = $00<<3; // y $00
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $14<<3; // x $A0
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $00
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $04<<3; // x $20
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $08
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $0F<<3; // x $78
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $08
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $1C<<3; // x $E0
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $10
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $02<<3; // x $10
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $18
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $08<<3; // x $40
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $18
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $14<<3; // x $A0
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $18
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $1C<<3; // x $E0
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $18
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $1D<<3; // x $E8
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $18
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $0F<<3; // x $78
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $20
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $19<<3; // x $C8  0001 1001 -> 1100 1000
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $20
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $1D<<3; // x $E8
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $20
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $05<<3; // x $28
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $28
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $1B<<3; // x $D8
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $28
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $02<<3; // x $10
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $30
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $19<<3; // x $C8
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $30
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $03<<3; // x $18
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $38
dg_STAR_SKY[#_a,2] = _B;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $15<<3; // x $A8
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $38
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $01<<3; // x $08
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $40
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $09<<3; // x $48
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $40
dg_STAR_SKY[#_a,2] = _W;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $10<<3; // x $80
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $48
dg_STAR_SKY[#_a,2] = _G;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $14<<3; // x $A0
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $48
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
//                          // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $08<<3; // x $40
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1] + 8; // y $50
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 
             _a++;
dg_STAR_SKY[#_a,0] = $0C<<3; // x $60
dg_STAR_SKY[#_a,1] = dg_STAR_SKY[#_a-1,1]; // y $50
dg_STAR_SKY[#_a,2] = _b;  // 
//                          // 


dl_STAR_SKY = ds_list_create();
//repeat(4) ds_list_add(dl_STAR_SKY,-1);
for(_i=3; _i>=0; _i--) dl_STAR_SKY[|_i] = -1;






// SHOOTING STAR ---------------------------------------
sstar_can_draw          = true;
sstar_is_first_cycle    = true;
//SSTAR_SHOOT_DELAY1      =   -1;
//SSTAR_SHOOT_DELAY2      =    2;
SSTAR_VISIBLE_DELAY     =  $6C; // 108
SSTAR_VISIBLE_DELAY     = $16C;

SSTAR_BASEX             = x + $2B; // 43
SSTAR_BASEY             = y +   3;

SSTAR_MOVEX             =    3;
SSTAR_MOVEY             =    2;

SSTAR_MAX_MOVES         =  $18; // 
sstar_moveNum           =    0;

//sstar_colors[3] = p.dl_color[| $00]; // grey         $00. rgb(116, 116, 116);
//sstar_colors[2] = p.dl_color[| $02]; // dark blue    $02. rgb(  0,   0, 168);
//sstar_colors[1] = p.dl_color[| $21]; // light blue   $21. rgb( 60, 188, 252);
//sstar_colors[0] = p.dl_color[| $30]; // white        $30. rgb(252, 252, 252);



// TITLE -----------------------------------------------------
TITLE_SPR       = spr_Title_screen_Title;
TITLE_SPR_W     = sprite_get_width( TITLE_SPR);
TITLE_SPR_H     = sprite_get_height(TITLE_SPR);

TITLE_Y_START   = HOME_Y + ($0C<<3); // HOME_Y: $18 + $60 = $78
TITLE_Y_RESET   = TITLE_Y_START;
title_y         = TITLE_Y_START;



// STORY -----------------------------------------------------
SCROLL1_DELAY_COUNT =    3;
SCROLL2_DELAY_COUNT =    8;
SCROLL2_DELAY       =    8;
RESET_COUNT         =   14;

COUNTER_START       = -SCROLL1_DELAY_COUNT;
COUNTER_START       = -1;
counter             = COUNTER_START;

counter             = $100;
cycle_num           = 0;


Story_srf = 0;
Story_W   = $100;
Story_H   = $E0;
//Story_XL  = $18;
//STORY_SPR       = spr_Title_screen_Story;
//STORY_SPR_W     = sprite_get_width( STORY_SPR);
//STORY_SPR_H     = sprite_get_height(STORY_SPR); // $E0 (224)
//STORY_SPR_W $0100, STORY_SPR_H $E0
//sdm("STORY_SPR_W $"+hex_str(STORY_SPR_W)+", STORY_SPR_H $"+hex_str(STORY_SPR_H));

STORY_YOFF = HOME_Y + $90; // HOME_Y: $18 + $90 = $A8
story_y    = TITLE_Y_START + STORY_YOFF; // $78 + $A8 = $120



title_y = -(story_y + Story_H); // -($120 + $E0) = -$200
//title_y = -(story_y + STORY_SPR_H); // -($120 + $E0) = -$200
//sdm("HOME_Y $"+hex_str(HOME_Y)+", TITLE_Y_START $"+hex_str(TITLE_Y_START)+", title_y $"+hex_str(title_y)+" ("+string(title_y)+")");



// FG --------------------------------------------------------
SWORD_SPR    = spr_Title_screen_Sword_1a;
SWORD_SPR_X  = g.rm_w_;
SWORD_SPR_Y  = g.rm_h  - (sprite_get_height(SWORD_SPR)>>1) - ($07<<3);
SWORD_SPR_Y -= 4;



         _a=0;
var _W = _a++; // 0. White
var _b = _a++; // 1. blue(light)
var _B = _a++; // 2. Blue(dark)
var _G = _a++; // 3. Grey


//                                      // 
dg_SeaSparkle = ds_grid_create(1+$A,3);
// First idx reserved for general properties
dg_SeaSparkle[#$00,0] = 1; // 
dg_SeaSparkle[#$00,1] = VIEW_W_WD_-VIEW_W_OG_; // 
dg_SeaSparkle[#$00,2] = viewYB()-($A<<3)-3;
//                                      // 
dg_SeaSparkle[#$01,0] = _b; // 
dg_SeaSparkle[#$01,1] = ($12<<3)+3; // 
dg_SeaSparkle[#$01,2] =  $03; // 
//                                      // 
dg_SeaSparkle[#$02,0] = _G; // 
dg_SeaSparkle[#$02,1] = ($0E<<3)+3; // 
dg_SeaSparkle[#$02,2] =  $06; // 
//                                      // 
dg_SeaSparkle[#$03,0] = _b; // 
dg_SeaSparkle[#$03,1] = ($12<<3)+1; // 
dg_SeaSparkle[#$03,2] =  $07; // 
//                                      // 
dg_SeaSparkle[#$04,0] = _W; // 
dg_SeaSparkle[#$04,1] = ($11<<3)+3; // 
dg_SeaSparkle[#$04,2] =  $09; // 
//                                      // 
dg_SeaSparkle[#$05,0] = _B; // 
dg_SeaSparkle[#$05,1] = ($16<<3)+3; // 
dg_SeaSparkle[#$05,2] =  $09; // 
//                                      // 
dg_SeaSparkle[#$06,0] = _G; // 
dg_SeaSparkle[#$06,1] = ($11<<3)+5; // 
dg_SeaSparkle[#$06,2] =  $0C; // 
//                                      // 
dg_SeaSparkle[#$07,0] = _b; // 
dg_SeaSparkle[#$07,1] = ($0B<<3)+3; // 
dg_SeaSparkle[#$07,2] =  $13; // 
//                                      // 
dg_SeaSparkle[#$08,0] = _B; // 
dg_SeaSparkle[#$08,1] = ($09<<3)+3; // 
dg_SeaSparkle[#$08,2] =  $21; // 
//                                      // 
dg_SeaSparkle[#$09,0] = _G; // 
dg_SeaSparkle[#$09,1] = ($09<<3)+3; // 
dg_SeaSparkle[#$09,2] =  $24; // 
//                                      // 
dg_SeaSparkle[#$0A,0] = _W; // 
dg_SeaSparkle[#$0A,1] = ($04<<3)+3; // 
dg_SeaSparkle[#$0A,2] =  $28; // 
//                                      // 
// dg_SeaSparkle[#$0B,0] = _W; // 
// dg_SeaSparkle[#$0B,1] = -8; // 
// dg_SeaSparkle[#$0B,2] =  $04; // 
//                                      // 



// COVER -------------------------------------------------------
cover_can_draw = true;




// TILE DATA -------------------------------------------------------
dg_terrain_H = 4;
dg_terrain = ds_grid_create(0,dg_terrain_H);

dl_tile_layer_data = 0;
tile_clms = 0;




if (is_undefined(g.dm_tile_file) 
||  g.dm_tile_file==-1 )
{
    var _DATA = rm_get_file_data(RM_NAME_TITLSCR);
    if(!is_undefined(_DATA)) g.dm_tile_file = json_decode(_DATA);
}


if(!is_undefined(g.dm_tile_file) 
&&  g.dm_tile_file!=-1 )
{
    var _dm_layer_data, _layer_name, _pos, _name, _depth, _idx, _pi, _w;
    var _terrain_idx = 0;
    
    tile_clms = val(g.dm_tile_file[?"width"]);
    
    dl_tile_layer_data = val(g.dm_tile_file[?"layers"]);
    if (dl_tile_layer_data!=0)
    {
        var          _layer_count = ds_list_size(dl_tile_layer_data);
        for(_i=0; _i<_layer_count; _i++)
        {
            _dm_layer_data = dl_tile_layer_data[|_i];
            _layer_name = _dm_layer_data[?"name"];
            _layer_name = string(_layer_name);
            if (string_pos("BG0",_layer_name) 
            ||  string_pos("FG0",_layer_name) )
            {
                _terrain_idx = ds_grid_width(dg_terrain);
                ds_grid_resize(dg_terrain,_terrain_idx+1,dg_terrain_H);
                
                if (        string_pos("BG0",_layer_name))
                {    _pos = string_pos("BG0",_layer_name);  }
                else _pos = string_pos("FG0",_layer_name);
                _name  = string_copy(_layer_name,_pos,4); // depth name:  "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
                //_depth = val(g.dm_TILE_DEPTH[?_name],dg_terrain[#_terrain_idx,2]);
                //_idx   = ds_list_find_index(g.dl_TILE_DEPTHS, _depth);
                
                _pi  = string_copy(_layer_name, _pos+string_length(_name), 2); // bg palette num ('01', '02', '03', '04')
                _pi  = str_hex(_pi);
                _pi -= _pi>5;
                _pi  = global.PI_BGR1 + (_pi-1);
                
                dg_terrain[#_terrain_idx,0] = -1;  // Surface
                dg_terrain[#_terrain_idx,1] = _pi;
                dg_terrain[#_terrain_idx,2] = _i;
            }
        }
    }
}


dg_terrain_W = ds_grid_width(dg_terrain);
//scene_enter_add_tiles();




set_rm_brightness(g.RM_BRIGHTNESS_MAX);

_y = g.rm_h - viewH() - 3;
rm_set_cam_1a(g.rm_w_, _y);
set_camera_xy(g.rm_w_-viewW_(), _y);

/*
if(!(g.counter1&$7F)){
var _str  =   'viewXL() '+string(viewXL()) + ', viewYT() '+string(viewYT());
    _str += ', viewW() ' +string(viewW())  + ', viewH() ' +string(viewH());
    _str += ', room_width ' +string(room_width) + ', room_height '+string(room_height);
    _str += ', g.rm_w ' +string(g.rm_w) + ', g.rm_h ' +string(g.rm_h);
    _str += ', x '+string(x)+', y '+string(y);
sdm(_str);
}
*/




