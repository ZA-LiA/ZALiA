/// PalettePicker_Create()


depth = DEPTH_HUD;
//depth = DEPTH_HUD-8;


var               _a=0;
STATE_IDLE      = _a++; // IDLE
STATE_PKM1      = _a++; // PicK Mode state 1
STATE_PKM2      = _a++; // PicK Mode state 2
STATE_PKM3      = _a++; // PicK Mode state 3
STATE_BGR_COLOR = _a++; // Pick background color
state           = STATE_IDLE;



var _SCALE1 = 6;

// -1 Upper left, 0 Center left, 1 Bottom left
gui_alignment       = -1;


PI_OFFSET           = global.PI_PC1;
PAL_CNT             = p.PAL_PER_SET;
PAL_CNT            -= 1; // PAL BASE
PAL_CNT            -= val(global.dm_pi[?"GUI"+STR_Count],1); // MENU PAL
PAL_CNT            += p.PAL_PER_SET; // Dark pals
COL_PER_PAL_        = global.COLORS_PER_PALETTE;


// View only
PALS1_SCALE         = 2;
PALS1_X             = $01<<3;
PALS1_Y             = $05<<3;


// Color Grid
COLOR_GRID_SPR      = spr_color_grid_2c;
COLOR_GRID_SCALE    = _SCALE1;
COLOR_GRID_X        = $01<<3;
COLOR_GRID_Y        = $01<<3;
COLOR_GRID_W        = sprite_get_width( COLOR_GRID_SPR);
COLOR_GRID_H        = sprite_get_height(COLOR_GRID_SPR);
COLOR_GRID_W2       = COLOR_GRID_W * COLOR_GRID_SCALE;
COLOR_GRID_H2       = COLOR_GRID_H * COLOR_GRID_SCALE;


// Edit mode
PALS2_SCALE         = _SCALE1;
PALS2_X             = COLOR_GRID_X + COLOR_GRID_W2 + ($01<<3);
PALS2_X            -= PI_OFFSET * PALS2_SCALE;
PALS2_Y             = COLOR_GRID_Y;
PALS2_X2            = PALS2_X + (PI_OFFSET * PALS2_SCALE);;
PALS2_Y2            = PALS2_Y + ((global.COLORS_PER_PALETTE-COL_PER_PAL_) * PALS2_SCALE);
PALS2_W             = global.palette_image_w * PALS2_SCALE;
PALS2_H             = global.COLORS_PER_PALETTE * PALS2_SCALE;
PALS2_W2            = PAL_CNT * PALS2_SCALE;


// Object Palettes
ObjPal_COL_SIZE = 4;
ObjPalOutline_W = 1;
ObjPal_DIST1  = ObjPal_COL_SIZE +  ObjPalOutline_W;
ObjPalBgr1_W  = ObjPal_COL_SIZE + (ObjPalOutline_W<<1);
ObjPalBgr1_H  = ObjPal_COL_SIZE *  global.COLORS_PER_PALETTE;
ObjPalBgr1_H += ObjPalOutline_W * (global.COLORS_PER_PALETTE+1);
ObjPalBgr2_W  = ObjPalBgr1_W + (ObjPalOutline_W<<1);
ObjPalBgr2_H  = ObjPalBgr1_H + (ObjPalOutline_W<<1);
ObjPal_YT_OFFSET  = ObjPalBgr2_H;
ObjPal_YT_OFFSET += 2; // obj sprite pad
ObjPal_surf_W = ObjPalBgr2_W;
ObjPal_surf_H = ObjPalBgr2_H;
ObjPal_surf = surface_create(ObjPal_surf_W,ObjPal_surf_H);
ObjPal_FONT   = spr_Font2_1;
ObjPal_FONT_W = sprite_get_width( ObjPal_FONT);
ObjPal_FONT_H = sprite_get_height(ObjPal_FONT);






/*
var _SCALE1 = 6;

// -1 Upper left, 0 Center left, 1 Bottom left
gui_alignment       = -1;



PI_OFFSET           = PI_BGR_1;
PAL_CNT             = p.BGR_PAL_COUNT + p.MOB_PAL_COUNT + 1 + p.PAL_PER_SET; // +1 bc PC
COL_PER_PAL_        = COL_PER_PAL-1;


// View only
PALS1_SCALE         = 2;
PALS1_X             = $01<<3;
PALS1_Y             = $05<<3;

// Edit mode
PALS2_SCALE         = _SCALE1;
PALS2_X             = $01<<3;
PALS2_Y             = $01<<3;
//PALS2_Y             = PALS1_Y + (COL_PER_PAL * PALS1_SCALE) + ($02<<3);
PALS2_X2            = PALS2_X + (PI_OFFSET                  * PALS2_SCALE);;
PALS2_Y2            = PALS2_Y + ((COL_PER_PAL-COL_PER_PAL_) * PALS2_SCALE);
PALS2_W             = p.P_SPR_W * PALS2_SCALE;
PALS2_H             = p.P_SPR_H * PALS2_SCALE;
PALS2_W2            = PAL_CNT   * PALS2_SCALE;



// COLOR_GRID_SPR      = spr_color_grid_2a;
// COLOR_GRID_SPR      = spr_color_grid_2b;
COLOR_GRID_SPR      = spr_color_grid_2c;
COLOR_GRID_SCALE    = _SCALE1;
COLOR_GRID_X        = PALS2_X;
COLOR_GRID_Y        = PALS2_Y;
//COLOR_GRID_Y        = PALS2_Y + (COL_PER_PAL*PALS2_SCALE) + ($01<<3);
COLOR_GRID_W        = sprite_get_width( COLOR_GRID_SPR);
COLOR_GRID_H        = sprite_get_height(COLOR_GRID_SPR);
COLOR_GRID_W2       = COLOR_GRID_W * COLOR_GRID_SCALE;
COLOR_GRID_H2       = COLOR_GRID_H * COLOR_GRID_SCALE;
*/


DELAY1_DUR  = $10;
DELAY2_DUR  = $20;
DELAY3_DUR  = $40;
DELAY4_DUR  = $80;
DELAY5_DUR  = $FF;
timer       = DELAY4_DUR;


PP          = 0; // 'P' key Pressed
PP0         = 0; // 'P' is ONLY key Pressed
PH          = 0; // 'P' key Held
PH0         = 0; // 'P' is ONLY key Held

CTL         = 0;
SHF         = 0;
ALT         = 0;
CTL0        = 0; // ONLY CTL held
SHF0        = 0; // ONLY SHF held
ALT0        = 0; // ONLY ALT held

EditRequested_Pal_counter   = 0;
EditRequested_Bgr_counter   = 0;



// Palette history for the current palette editing session.
dl_hist_sess        = ds_list_create();
   HIST_SESS_MAX    = $80;

// Palette history for the current rm.
dl_hist_room        = ds_list_create();
   HIST_ROOM_MAX    = $80;
//
// A backup if session is cancelled.
pal_at_sess_start       = "";
pal_before_edit_color   = "";
pal_in_editor           = ""; // Current palette affecting screen while in edit mode(STATE_PKM2)



//pal_curs_idx_DEF    = 0;
pal_curs_idx_DEF    = (global.PI_BGR1-PI_OFFSET)*global.COLORS_PER_PALETTE;
pal_curs_idx        = pal_curs_idx_DEF;
//pal_curs_idx        = 0;
pal_curs_col        = 0;
col_idx_old_col     = 0;

col_curs_idx        = 0;
col_curs_idx_prev   = col_curs_idx;
col_curs_col        = 0;
col_idx_new_col     = 0;

CURSOR_COLOR        = p.dl_COLOR[|$27]; // $27 orange, bright



bgr_at_sess_start       = ds_list_find_index(p.dl_COLOR,background_colour);
//bgr_at_sess_start       = p.background_color_index;
bgr_before_edit_color   = bgr_at_sess_start;
bgr_in_editor           = bgr_at_sess_start; // Current bgr color affecting screen while in edit mode(STATE_PKM2)




