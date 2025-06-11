// g_Create()

// g: game. General game stuff


if (DEV)
{
    var _START_TIME = current_time;
    repeat(1) show_debug_message("");
    show_debug_message("g_Create() START");
}


/*
TODO: Add "OG Mode"
OG Zelda II, widescreen, remove most/all added content, keep most/all QOL changes
*/

/*
TODO: Rename abbreviated game objects names to a full name. Example: IronKunckle enemy is currently named "IrKnA".
*/

/*
TODO: Assign all globally used variables to `global` instead of the persistant objects they're currently assigned to.
Many variables I use globally are variables in "persistant" objects.
I did this so that accessing them was less characters and to associate them with what they're realated to.
Example: g.torch_lighting_method, f.game_completed_count
*/

/*
TODO: Downgrade or upgrade graphic detail of scenes so it's consitant across all scenes.
Either reduce the detail of non-OG scenes and any OG scenes that had detail added, 
or add detail to mainly OG scenes to be consistant with detailed scenes.
*/

/*
TODO: Add more difficulty, challenges, and content to 2nd quest
  * Different dungeon layouts
  * Less torches to light scenes?
*/

/*
TODO: Revamp palette system
  * Increase available swap colors from 3 to 7. The 3-color-limit rule will continue. The extra colors are for potential future things
  * The rule that full green guarantees black is pointless. Just use black in the sprite/tile
*/

/*
TODO: Revamp dungeon tileset format and re-tile dungeons
  * For more space in the tilesets, for more graphics, offset tiles need to be removed, but scenes will need to be re-tiled so offsets aren't neccessary
*/

/*
TODO: 
*/




// ---------------------------------------------------
/*  -----  variable naming key  ------

ATK:    ATtacK

CAM:    CAMera
CHR:    text CHaRacter
COL:    COLor or COLumn
CLM:    CoLuMn
CS:     Colliding Side
CUE:    timing CUE
CUR:    CURrent

DG:     Dataset Grid
DL:     Dataset List
DK:     DataKey/Mapkey
DM:     Dataset Map
DP:     Dataset Priority
DQ:     Dataset Queue
DS:     Dataset Stack
DEF:    DEFault
DIR:    DIRection
DLG:    DiaLoGue
DUR:    DURation

E:      Entity
EHP:    Entity Hit Points
EID:    Entity ID
ENC:    ENCounter
EXP:    EXperience Points

FS:     Falling Scene

g:      game
GO:     Game Object
GOA:    Game Object A
GOB:    Game Object B
GOC:    Game Object C
GRT:    Game Run-through Test
H:      Height
HB:     Hit Box

IDX:    InDeX
INV:    INVulnerable

LEN:    LENgth
LIF:    LIFe
LVL:    LeVeL

MAG:    MAGic
MAX:    MAXimum
MGR:    ManaGeR
MIN:    MINimum
MP:     Map Page

NXT:    NeXT
NUM:    NUMber

OBJ:    OBJect
OCS:    Off Camera State
OFF:    OFFset
OG:     Original Game
OW:     OverWorld

PAL:    PALette
PWR:    PoWeR

RM:     RooM. *** 2024/09/11. `rm` and `scene` are the same. I intend to replace `rm` with `scene` throughout the whole app.

SCR:    SCRipt
SPL:    SPeLl
SPR:    SPRite
STAT:   STATistic
STRG:   STRonG
SURF:   SURFace
svs:    Solids Visible State. For debugging

T:      Tile
TN:     Tile Name
TG:     Tile Graphic
TS:     TileSet

VAL:    VALue

W:      Width

XP:     eXperience Points


HMS:    Highlight Midtone Shadow
WRB:    White     Red     Blue
WBR:    White     Blue    Red
RBW:    Red       Blue    White
BWR:    Blue      White   Red
*/

// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------








var _i,_j, _a, _num, _count,_count1,_count2, _bit;
var _x,_y;
var _clm,_row, _clms,_rows;
var _w,_w2, _h,_h2;
var _obj, _spr;
var _datakey, _dk,_dk1,_dk2,_dk3, _mk;
var _depth, _idx, _name, _id;
var _default, _exists;
var _ts;
var _dl_1 = ds_list_create();



depth = DEPTH_g;








// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
//can_use_dev_tools1 = false;
DevTools_state = 0;

// Frame Delay: An option that delays the game's render by 1 frame to simulate what I think happens in fceux.
// Draws the state of the frame delay. -1: App will not include this option, 0: Don't draw the Frame Delay's state, 1: Draw the Frame Delay's state
global.RenderFrameDelay_state = -1;
global.RenderFrameDelay_timer =  0; // Display state when > 0

view_update_order = 1; // 1: OG, 2: update after gob update

dev_use_tile_markers        = true;
can_show_t_solid            = false;
can_show_t_unique           = false;

can_show_debug_overlay      = false;
can_draw_hb                 = false;
can_draw_cs                 = false;
can_draw_ocs                = false;
can_draw_Exit_hb            = false;
can_draw_Exit_destination   = false;
canDraw_ogXY                = false;
can_draw_hp                 = false;
canDrawSprOutline           = 0; // 0,1,2
can_use_FrameIndicator      = false;
can_draw_og_cam_outline     = false;
BodyHB_COLOR                = c_fuchsia;
//BodyHB_COLOR                = c_white;
//BodyHB_COLOR                = c_aqua; // TODO: Use a color NOT in any mob palette
ShieldHB_COLOR              = c_yellow;
SwordHB_COLOR               = c_green;

dev_invState = 0; // For testing. The state of pc's invulnerability. 0: Off. 1: No dmg. 2: NOT collidable

//global.AppPause_unpause_key = vk_escape;
app_paused    = false;
app_adv_frame = false;
adv_frame_held_counter = 0;


// For UI like FileSelect, ContinueSave, ..
// 1: Mostly works like OG where select button is pressed to move the cursor
// 2: d-pad up and down can also move the cursor
global.GUI_NAV1_VER = 2;


DevDash_state    = 0; // 0: Off, 1: On, 2: On and dash input held
DoubleJump_state = false;
use_StabToCheat  = false;

_TwT_=ROOM_SPEED_BASE*60; // 1 min in frames
_YwY_=false;
_UwU_=0;
_OwO_=-1;
_8w8_="undefined";
_YxY_=false;
_UxU_=0;
_OxO_=-1;
_8x8_="undefined";
dg_YxY_=ds_grid_create($80,$4);


global.Halloween1_enabled = current_month==10 && current_day==31;
//global.Halloween1_enabled = current_month==10 && current_day==16; // testing

global.SloofLirpa_ENABLED = current_month==04 && current_day==01;
//global.SloofLirpa_ENABLED = current_month==10 && current_day==13; // testing




// 0: No masks
// 1: Draw masks. Waiting for animation start cue
// 2: Draw and animate masks
MaskWideView = 1;

MaskWideView_W = VIEW_W_WD_-VIEW_W_OG_;
MaskWideView_w = MaskWideView_W;
// 0: Wide view reveal will happen once per app session
// 1: will happen every time going to title screen
MaskWideView_RESPAWN = 0;




CuccoSpell2_Option   = 1; // So it can be toggled in options menu.
CuccoSpell2_Acquired = 0; // PC will be stuck as cucco after 2nd FAIRY spell attempt by wiseman.
CuccoSpell2_Active   = 0; // 
CuccoSpell2_SolidClip_exploit = 0; // 0: off, 1: allow
CUCCO_CAN_THRUST_D = true; // Allow cucco to dw-thrust
CUCCO_CAN_THRUST_U = true; // Allow cucco to up-thrust
CUCCO_CAN_BREAK1   = true; // Allow cucco to break blocks
CUCCO_CAN_BEAM     = true; // Allow cucco can use beam
CUCCO_CAN_FIRE     = true; // Allow cucco can use fire




global.OverworldSoftlock_DURATION0 = ROOM_SPEED_BASE * 3;
global.OverworldSoftlock_timer = 0;


DisplayOWPosOnMap_VER = 0; // 0: ow map will show pcrc as last uncovered(outside/not a cave) position. owrc does NOT update when going through multiple covered(like caves) rms and will show PC at the last un-covered owrc.
//DisplayOWPosOnMap_VER = 1; // 1: pcrc for map will always update, unless a particular challenge needs otherwise.


// For rando, will draw a check on ow tile if item there has been acquired.
can_mark_acquired_item_locations = 0;

HiddenExitIndicator_enabled = false;


// For users having background tile issues
all_bg_black_only       = false;


// show all dungeon rms on map regardless of explored amount
dev_DungeonMapShowAll   = false;


torch_lighting_method   = 0; // 0: stab: light torches by stabbing only
torch_lighting_method   = 1; // 1: auto: light torches by touching or stabbing




                         _i=0;
global.HUD_state       = _i++; // 0: HUD will NOT draw
global.HUD_state       = _i++; // 1: HUD displays info only OG does
global.HUD_state       = _i++; // 2: Displays key count above HP in dungeons. Displays lives count above HP.
global.HUD_state_COUNT = _i;





TargetGame_case = 0; // 0: off
//TargetGame_case = 1; // 1: different every time
//TargetGame_case = 2;


//use_old_pixel_art = 0;


global.can_rando_ow_tsrc = false;


Rando_FLUTE_WARPING=true;
//Rando_FLUTE_WARPING=false;

global.Rando_SpellSequence_SPELL_COUNT = 3;
global.RandoHints_enabled = false;
global.RandoDungeonTilesets_enabled = false;
global.SceneRando_enabled = false;


use_8x8_ow_menu_map=true;


//dm_PC_sprite_sets = ds_map_create();
//_name=STR_Default;
//dm_PC_sprite_sets[?STR_Current]=_name;




anarkhyaOverworld_MAIN    = true;
anarkhyaOverworld_enabled = false;



    FileCleaning01_STATE = 0;
if (FileCleaning01_STATE)
{
    FileCleaning01_dm = ds_map_create();
    FileCleaning01_current_data_id = 1;
    //FileCleaning01_current_file_name = 0;
    FileCleaning01_rm_name = Area_MazIs+"C0";
}


// CamZoom1: Simulate a resolution of 398.222.. x 224. Scale application surface by (VIEW_H_WD/VIEW_H_OG)..
global.CamZoom1_state = -1; // -1: App will not include this option, 0/1: Off/On
//global.CamZoom1_state = 1; // testing










// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------











// for options menu toggle
// 0: Off, 1: Dungeons & PC, 2: Dungeons, PC, and 2 BGR PI random palette when enter room
RandoPalette_state = 0;
//RandoPalette_state = 2;
RandoPalette_STATE_COUNT = 3;

// for options menu toggle
Rando_enemy = true;

Rando_DarkroomDiff_COUNT = 3;
Rando_DarkroomDiff_MIN   = 0;
Rando_DarkroomDiff_MAX   = Rando_DarkroomDiff_MIN + (Rando_DarkroomDiff_COUNT-1);


RandoKeys_MAP_items_show_keys=false;
RandoKeys_can_draw_key_stats=false;

RandoHintsRecorder_can_draw=false;
RandoHintsRecorder_Font_SPRITE=spr_Font2;
RandoHintsRecorder_Font_CHAR_SIZE=sprite_get_width(RandoHintsRecorder_Font_SPRITE);
RandoHintsRecorder_W  = $8<<1; // borders
RandoHintsRecorder_W += $2<<1; // border padding
RandoHintsRecorder_W += ($B*4) * RandoHintsRecorder_Font_CHAR_SIZE; // max $A chars per line, max 4 lines
RandoHintsRecorder_W  = (RandoHintsRecorder_W>>3)<<3;
dm_RandoHintsRecorder=ds_map_create();

dm_RandoHints=ds_map_create();

Rando_RauruRiverDevil=true;




// --------------------------------------------------------------------------
// The first room determines if wide view is used.
// In 'Rooms' asset tree, the first room determines this.
// I have made 2 start rooms: 'rmB_Start' & 'rmB_Start_Wide'.
// The only way, I have found, to change back and forth 
// between OG view size & wide view size is by changing the 
// order of these rooms in the asset tree..
// I can't find a way to do it in code.
rmA_ACTION = rmA_Action_Wide;
VIEW_W    = VIEW_W_WD;
VIEW_H    = VIEW_H_WD;
VIEW_W_   = VIEW_W>>1;
VIEW_H_   = VIEW_H>>1;
VIEW_CLMS = VIEW_W>>3; // 32
VIEW_ROWS = VIEW_H>>3; // 28


view_wview[0] = VIEW_W;
view_hview[0] = VIEW_H;
view_xview[0] = 0;
view_yview[0] = 0;

// Something to note about views and view ports is that 
// the total area of the bounding box for all active view ports 
// in the first room of the game is what defines the 
// background canvas size (or window size for MacOS, Ubuntu (Linux) and Windows)
// 2024/07/13. There's something I'm not understanding so I'm leaving the scale at 1.
VIEW_PORT_SCALE = 1;
//VIEW_PORT_SCALE = 4;
VIEW_PORT_W = view_wview[0] * VIEW_PORT_SCALE;
VIEW_PORT_H = view_hview[0] * VIEW_PORT_SCALE;
view_wport[0] = VIEW_PORT_W;
view_hport[0] = VIEW_PORT_H;




WINDOW_PAD = $40;

Fullscreen_toggled  = false; // true only on frame of toggle
Fullscreen_KEY      = ord("F");

WindowScale_changed = false;
WindowScale_KEY     = ord("G");
WindowScale_MIN     = 1;
//WindowScale_MIN     = global.RetroShaders_surface_scale;
//WindowScale_MIN     = 2;
WindowScale_scale   = max(WindowScale_MIN, 4);

display_center_x    = display_get_width() >>1;
display_center_y    = display_get_height()>>1;
window_center_x     = display_center_x;
window_center_y     = display_center_y;


// 0: Don't hide at all, 1: Hide all the time, 2: Hide only during fullscreen
MouseCursor_HideVer = 2; // 2: Hide only during fullscreen




rm_clms    = 0;
rm_rows    = 0;
rm_clm0    = 0; // First clm of last horizontal page
rm_row0    = 0; // First row of last vertical  page
rm_pages_x = 0;
rm_pages_y = 0;
rm_w       = 0;        //      the width  of the current rm
rm_w_      = rm_w>>1;  // half the width  of the current rm
rm_h       = 0;        //      the height of the current rm
rm_h_      = rm_h>>1;  // half the height of the current rm

//cam_page_move_limit = 0; // 00D1. 0, 1, 2, 3. Number of pages the camera can scroll for a room
view_x_page_min = 0; // 69C1,[00D1]. Camera left edge map page min for a room
view_x_page_max = 0;
view_y_page_min = 0;
view_y_page_max = 0;

view_at_rm_edge = 0; //       bits $F. 1 right, 2 left, 4 bottom, 8 top

view_lock       = 0; // 0728. bits $F. 1 right, 2 left, 4 bottom, 8 top
view_lock_rm    = 0; // The view lock for the current rm specified in the rm's data.
view_lock_boss  = 0; // What dir of the view a boss is locking.

VIEW_Y_TILE_OFF = ((viewH()^$7)+1) & $7; // 0: viewH is 224, 2: viewH is 270

VIEW_PAD_YT     = $01<<3; // pad 1 row = 8
VIEW_PAD_YB_OFF = 0;
VIEW_PAD_YB     = $01<<3; // pad 1 row = 8
VIEW_PAD_YB    += VIEW_PAD_YB_OFF;

// For horizontal scroll rms, cam sits 8 above bottom of rm
VIEW_Y_DEF_HOR = PAGE_H - VIEW_PAD_YB - VIEW_H;
VIEW_Y_DEF_VER = VIEW_PAD_YT;


view_xl_og = 0;                     // 072C:  left edge of OG view
view_xr_og = view_xl_og + (VIEW_W_OG-1); //  right edge of OG view
view_xc_og = view_xl_og +  VIEW_W_OG_;   //    x center of OG view

view_yt_og = VIEW_Y_DEF_HOR;             //    top edge of OG view
view_yb_og = view_yt_og + (VIEW_H_OG-1); // bottom edge of OG view
view_yc_og = view_yt_og +  VIEW_H_OG_;   //    y center of OG view

view_dir_x = 1; // 071F: the last dir the camera moved
view_dir_y = 1;

use_smooth_cam_x = 0;
use_smooth_cam_y = 1;

// 0: off, $1: horizontal, $2: vertical, $3: horizontal and vertical
ViewCatchUp_STATE   = $0;
//ViewCatchUp_STATE   = $3;
ViewCatchUp_SPEED_X = .25;
ViewCatchUp_SPEED_Y = .25;








global.RetroShaders_IS_LIVE = true; // false disables all RetroShaders actions
global.RetroShaders_enabled = false;
global.RetroShaders_surface_scale = 2;
global.application_surface_draw_enable_state = !global.RetroShaders_enabled;






// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
init_mod_control_props();

global.gamePaused = false;

//delta_time
delta_target     = 1/room_speed;
delta_actual     = 0;
delta_multiplier = 0;
// ------------------------------------------------


counter0 = $FF;

counter1 = $FF; // $0012
timer_a1 = -1;
timer_a2 = -1;
timer_a3 = -1;

timer_b_DURATION1 = $14; // 0500
timer_b  = timer_b_DURATION1;
timer_b1 = 0; // 0512


// RandomOG: original game's random number system.  $051A-0522
// I think you can make this array lenth longer w/out affecting og logic.
RandomOG_started   = false;
RandomOG_START_VAL = $A5; // $A5==165

       dl_RandomOG_SIZE = MAX_GOB1+3; // OG is 9
       dl_RandomOG = ds_list_create();
for(_i=dl_RandomOG_SIZE-1; _i>=0; _i--)
{      dl_RandomOG[|_i]=0;  }



ScreenShake_user_pref  = true;
ScreenShake_DUR1       = $18;
ScreenShake_DUR2       = $30;
ScreenShake_timer      = 0;
ScreenShake_strength_x = 0;
ScreenShake_strength_y = 0;
ScreenShake_xoff       = 0;
ScreenShake_yoff       = 0;





game_end_state = 0;




// Adding 1 to w & h. 
// OG includes the pixel to the right & bottom of hb in collision check.
HB_ADJ_X = 0;
HB_ADJ_Y = 0;
HB_ADJ_W = 1;
HB_ADJ_H = 1;







            dl_LOREM = ds_list_create();
ds_list_add(dl_LOREM, "LOREM");
ds_list_add(dl_LOREM, "IPSUM");
ds_list_add(dl_LOREM, "DOLOR");
ds_list_add(dl_LOREM, "SIT");
ds_list_add(dl_LOREM, "AMET");
ds_list_add(dl_LOREM, "CONSECTETU");
ds_list_add(dl_LOREM, "ADIPISCING");
ds_list_add(dl_LOREM, "ELIT");
ds_list_add(dl_LOREM, "SED");
ds_list_add(dl_LOREM, "EIUSMOD");
ds_list_add(dl_LOREM, "TEMPOR");
ds_list_add(dl_LOREM, "INCIDIDUNT");
ds_list_add(dl_LOREM, "LABORE");
ds_list_add(dl_LOREM, "DOLORE");
ds_list_add(dl_LOREM, "MAGNA");
ds_list_add(dl_LOREM, "ALIQUA");
ds_list_add(dl_LOREM, "ENIM");
ds_list_add(dl_LOREM, "MINIM");
ds_list_add(dl_LOREM, "VENIAM");
ds_list_add(dl_LOREM, "QUIS");
ds_list_add(dl_LOREM, "NOSTRUD");
ds_list_add(dl_LOREM, "EXERCITATI");
ds_list_add(dl_LOREM, "ULLAMCO");
ds_list_add(dl_LOREM, "LABORIS");
ds_list_add(dl_LOREM, "NISI");
ds_list_add(dl_LOREM, "ALIQUIP");
ds_list_add(dl_LOREM, "COMMODO");
ds_list_add(dl_LOREM, "CONSEQUAT");
ds_list_add(dl_LOREM, "DUIS");
ds_list_add(dl_LOREM, "AUTE");
ds_list_add(dl_LOREM, "IRURE");
ds_list_add(dl_LOREM, "REPREHENDE");
ds_list_add(dl_LOREM, "VOLUPTATE");
ds_list_add(dl_LOREM, "VELIT");
ds_list_add(dl_LOREM, "ESSE");
ds_list_add(dl_LOREM, "CILLUM");
ds_list_add(dl_LOREM, "FUGIAT");
ds_list_add(dl_LOREM, "NULLA");
ds_list_add(dl_LOREM, "PARIATUR");
ds_list_add(dl_LOREM, "EXCEPTEUR");
ds_list_add(dl_LOREM, "SINT");
ds_list_add(dl_LOREM, "OCCAECAT");
ds_list_add(dl_LOREM, "CUPIDATAT");
ds_list_add(dl_LOREM, "NON");
ds_list_add(dl_LOREM, "PROIDENT");
ds_list_add(dl_LOREM, "SUNT");
ds_list_add(dl_LOREM, "CULPA");
ds_list_add(dl_LOREM, "QUI");
ds_list_add(dl_LOREM, "OFFICIA");
ds_list_add(dl_LOREM, "DESERUNT");
ds_list_add(dl_LOREM, "MOLLIT");
ds_list_add(dl_LOREM, "ANIM");
ds_list_add(dl_LOREM, "EST");
ds_list_add(dl_LOREM, "LABORUM");




CHAR_BLANK     = "_"; //  
CHAR_END_LINE1 = "<"; // '<' End line
CHAR_END_LINE2 = ">"; // '>' End line with extra delay
CHAR_END_LINE3 = "{"; // '{' End line
CHAR_END_LINE4 = "}"; // '}' End line with extra delay
CHAR_TIMES     = "*"; // times/multiplication char

global.SWAP_LINK_NAME_WITH_SAVE_NAME = false;
global.USE_PLAYER_NAME_INDICATOR = "@@@";













// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// ------------------------   TILE   ------------------------------------
global.dm_tile_layer_data = ds_map_create();

// init_tile_layer_data(): The data within is pre-baked with dev_automate_tile_layer_data() so Rando_randomize_palettes() can access the data faster
init_tile_layer_data();


rm_tile_count = 0;

tile_pal_swap_ver = 1; // tracks which depths have tiles that need pal swapping
//tile_pal_swap_ver = 2; // pal swaps every depth


dm_tile         = ds_map_create();  // various/general tile data. Mostly populated in init_tile_data()
dm_hidden_tiles = ds_map_create();  // 
dl_hidden_tiles = ds_list_create(); // 
dm_tile_file    = undefined;
//dm_tile_file    = ds_map_create();  // 

file_data_quest_num = 1; // For the current rm.


ts_TILE_MARKER  = ts_tile_marker_1a_8x8;
ts_SOLID_COLORS = ts_solid_color_1a_8x8;



// HMS: Highlight Midtone Shadow
var _ts_MANMADE = ts_Man_made_1a_WRB;
ts_NATURAL1_HMS = ts_Natural_1a_WRB; // default
ts_Natural1_HMS = ts_NATURAL1_HMS;   // current






dm_tileset = ds_map_create();
dl_tileset = ds_list_create();

_ts = ts_Menu01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_TILE_MARKER;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_tile_marker_1a_16x16;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $10;
dm_tileset[?_name+STR_Tile+STR_Height] = $10;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_SOLID_COLORS;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Overworld_1;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $10;
dm_tileset[?_name+STR_Tile+STR_Height] = $10;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_OverworldAnim01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $10;
dm_tileset[?_name+STR_Tile+STR_Height] = $10;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];




_ts = ts_Natural_1a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Natural_2a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Natural_4a_HMS;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Natural02;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Cave01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];




_ts = ts_Man_made_1a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_2a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_3a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_4a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_ManMade05;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_6a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_7a_WRB;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Man_made_8a_HMS;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];




_ts = ts_DungeonA01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonB01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonC01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonD01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonE01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonF01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonG01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonH01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt01;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt02;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt03;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt04;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt05;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_DungeonAlt06;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];




//_ts = ts_Anim_1;
//ds_list_add(dl_tileset,_ts);
//_name = background_get_name(_ts);
//dm_tileset[?_name] = _ts;
//dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
//dm_tileset[?_name+STR_Tile+STR_Height] = $08;
//dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
//dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
//dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

//_ts = ts_Animation030101;
//ds_list_add(dl_tileset,_ts);
//_name = background_get_name(_ts);
//dm_tileset[?_name] = _ts;
//dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
//dm_tileset[?_name+STR_Tile+STR_Height] = $08;
//dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
//dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
//dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];

_ts = ts_Animation0301;
ds_list_add(dl_tileset,_ts);
_name = background_get_name(_ts);
dm_tileset[?_name] = _ts;
dm_tileset[?_name+STR_Tile+STR_Width]  = $08;
dm_tileset[?_name+STR_Tile+STR_Height] = $08;
dm_tileset[?_name+STR_Clms] = background_get_width( _ts) div dm_tileset[?_name+STR_Tile+STR_Width];
dm_tileset[?_name+STR_Rows] = background_get_height(_ts) div dm_tileset[?_name+STR_Tile+STR_Height];
dm_tileset[?_name+STR_Tile+STR_Count] = dm_tileset[?_name+STR_Clms] * dm_tileset[?_name+STR_Rows];




// Users can add their own dungeon tilesets by putting the image file 
// in %localappdata%\Z2TAOL_XXX\custom_dungeon_graphics.
var                    _DIRECTORY = "custom_dungeon_graphics";
if(!directory_exists(  _DIRECTORY))
{
    directory_create(  _DIRECTORY);
    show_debug_message(_DIRECTORY+" created!"+"  -  g_Create()");
}
else
{
    _i=0;
    var _pos, _len, _background;
    var _file_name,_file_ext, _img_name,_tileset_name,_creator_name;
    var _PATH = working_directory+_DIRECTORY+"\";
    var _file = file_find_first(_PATH+"*", 0);
    while(_file!="" && _i<4) // Limit to 4. Each one generates a new texture page because of sprite_add().
    {
        //sdm(string(_file));
        _file_ext = string_lower(filename_ext(_file));
        if(_file_ext==".png") // background_add() requires a .png image file
        {
            _i++;
            // _file_name example: "SkullDungeon01_HoverBat.png"
            _file_name = filename_name(_file);
            //  _img_name example: "SkullDungeon01_HoverBat"
            _img_name = string_copy(_file_name,1,string_length(_file_name)-string_length(_file_ext));
            
            _len = string_length( _img_name);
            _pos = string_pos("_",_img_name);
            _tileset_name = string_copy(_img_name,1,_pos-1);
            _pos++;
            _creator_name = string_copy(_img_name,_pos,(_len+1)-_pos);
            
            _datakey = "_User"+STR_Custom+STR_Dungeon+STR_Tileset;
            dm_tileset[?_datakey+STR_Count] = val(dm_tileset[?_datakey+STR_Count])+1;
            _count                          = val(dm_tileset[?_datakey+STR_Count]);
            
            dm_tileset[?_datakey+hex_str(_count)+STR_Asset]   = background_add(_PATH+_file_name,false,false);
            //dm_tileset[?_datakey+hex_str(_count)+STR_Image+STR_Name] = _img_name;
            dm_tileset[?_datakey+hex_str(_count)+STR_Creator] = _creator_name;
            dm_tileset[?_datakey+hex_str(_count)+STR_Name]    = _tileset_name;
            
            dm_tileset[?_tileset_name+STR_Tile+STR_Width]  = $08;
            dm_tileset[?_tileset_name+STR_Tile+STR_Height] = $08;
            dm_tileset[?_tileset_name+STR_Tile+STR_Count]  = (background_get_width(_ts) div dm_tileset[?_tileset_name+STR_Tile+STR_Width]) * (background_get_height(_ts) div dm_tileset[?_tileset_name+STR_Tile+STR_Height]);
        }
        
        _file = file_find_next();
    }
    file_find_close();
}
//sdm("custom tileset count: $"+hex_str(val(g.dm_tileset[?"_User"+STR_Custom+STR_Dungeon+STR_Tileset+STR_Count])));















                       _a=$F0;
TSRC_SolidColor_BLK0 = _a++; // Black   Full
TSRC_SolidColor_WHT0 = _a++; // White   Full
TSRC_SolidColor_RED0 = _a++; // Red     Full
TSRC_SolidColor_GRN0 = _a++; // Green   Full
TSRC_SolidColor_BLU0 = _a++; // Blue    Full
TSRC_SolidColor_MAG0 = _a++; // Magenta Full
TSRC_SolidColor_YLW0 = _a++; // Yellow  Full
TSRC_SolidColor_TEL0 = _a++; // Teal    Full



_rows = $9;
dg_tile_anim = ds_grid_create(0,_rows); // current room's tile animation info
repeat($10)
{
    ds_grid_resize(dg_tile_anim, ds_grid_width(dg_tile_anim)+1,_rows);
    dg_tile_anim[#ds_grid_width(dg_tile_anim)-1,0]=TID_BREAK1; // anim num/type
}
repeat($10)
{
    ds_grid_resize(dg_tile_anim, ds_grid_width(dg_tile_anim)+1,_rows);
    dg_tile_anim[#ds_grid_width(dg_tile_anim)-1,0]=TID_BREAK2; // anim num/type
}





dg_anim_liquid = ds_grid_create(0,0);
dg_anim_clouds = ds_grid_create(0,0);




dg_RmTile_solid     = ds_grid_create(0,0); // the current room's 8x8 grid of values representing if the tile is not solid, solid, or a oneway platform
dg_RmTile_solid_def = ds_grid_create(0,0); // the current room's 8x8 grid of values representing if the tile is not solid, solid, or a oneway platform
dg_RmTile_solid_w   = 0;
dg_RmTile_solid_h   = 0;


dl_solid_inst = ds_list_create();



            dl_TILE_DEPTHS=ds_list_create();
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG1); // +$80 depth
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG2); // +$90
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG3); // +$A0
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG4); // +$B0
                                       // 
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG5); // +$E0
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG6); // +$F0
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG7); // +$100 depth
ds_list_add(dl_TILE_DEPTHS,DEPTH_BG8); // +$110 depth
                                       // 
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG1); // -$80 depth
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG2); // -$90
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG3); // -$A0
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG4); // -$B0
                                       // 
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG5); // -$E0
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG6); // -$F0
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG7); // -$100 depth
ds_list_add(dl_TILE_DEPTHS,DEPTH_FG8); // -$110 depth

TILE_LAYER_COUNT = ds_list_size(dl_TILE_DEPTHS);


var                   _dl_DEPTH = ds_list_create();
ds_list_copy(         _dl_DEPTH, dl_TILE_DEPTHS);
ds_list_sort(         _dl_DEPTH, false);
TILE_DEPTH_MAX_BACK = _dl_DEPTH[|0]; // Furthest back/lowest. Away from player
ds_list_sort(         _dl_DEPTH, true);
TILE_DEPTH_MAX_FORW = _dl_DEPTH[|0]; // Furthest forward/highest. Torwards player
ds_list_destroy(      _dl_DEPTH); _dl_DEPTH = undefined;

var _PAL_COUNT    = TILE_LAYER_COUNT>>2; // 4 layer groups. Each have equal count since count is based on num of bg palettes

var _GROUP1_BASE  = TILE_DEPTHS_BASE;

var _GROUP2_BASE  = _GROUP1_BASE;
    _GROUP2_BASE += (TILE_DEPTHS_PAD * (_PAL_COUNT-1));
    _GROUP2_BASE +=  TILE_LAYERS_GROUP_PAD;
//


dl_TILE_DEPTH_NAMES = ds_list_create();
dm_TILE_DEPTH       = ds_map_create();

for(_i=0; _i<2; _i++)
{
    for(_j=0; _j<TILE_LAYER_COUNT; _j++) // each depth
    {
        _depth = dl_TILE_DEPTHS[|_j];
        
             _idx  = abs(_depth);
        if ( _idx >= _GROUP2_BASE)
        {    _idx -= _GROUP2_BASE;  }
        else _idx -= _GROUP1_BASE;
             _idx  = _idx div TILE_DEPTHS_PAD; // = 0,1,2,3
        //
        
        if (_depth) _name  = "BG"; // depth is positive +
        else        _name  = "FG"; // depth is negative -
        
        if (_i) // tile_data_system_ver 3
        {   // "BG01", "BG02", .. "BG08",   "FG01", "FG02", .. "FG08"
            _val   = _idx+1;
            _val  += (TILE_LAYER_COUNT>>2) * (abs(_depth) >= _GROUP2_BASE);
            _name += hex_str(_val);
            //_name += hex_str(_idx + 1 + ((TILE_LAYER_CNT>>2)*(abs(_depth) >= _GROUP2_BASE))); // BG/FG + 01-08
        }
        else
        { // tile_data_system_ver 2
            // _name Example: "BG" + "01" + "03"  =  "BG0103"
            if (abs(_depth) >= _GROUP2_BASE)
            {    _name += "02";  }
            else _name += "01";
                 _name += hex_str(_idx+1); // "01", "02", "03", "04"
        }
        
        
        // _name is value of 'depth' property of Tiled tile layer from file data
        dl_TILE_DEPTH_NAMES[|_j]        = _name;
        dm_TILE_DEPTH[?hex_str(_j)]     = _name;  // 
        dm_TILE_DEPTH[?hex_str(_depth)] = _name;  
        dm_TILE_DEPTH[?_name]           = _depth; // 
    }
}









dl_pal_swap_depths = ds_list_create();

dg_RmTile_Break         = ds_grid_create(0,0); // 8x8 room grid. Values represent break blocks, break bridge
dg_RmTile_Break_def     = ds_grid_create(0,0); // 8x8 room grid. Values represent break blocks, break bridge

dg_RmTile_Liquid        = ds_grid_create(0,0); // 8x8 room grid. Values represent liquid

dg_RmTile_Liquid_def    = ds_grid_create(0,0); // 8x8 room grid. Values represent liquid

dg_RmTile_Current       = ds_grid_create(0,0); // 8x8 room grid. Values represent a push force(like wind or water current)
dg_RmTile_Current_def   = ds_grid_create(0,0); // 8x8 room grid. Values represent a push force(like wind or water current)

dg_RmTile_TempSolid     = ds_grid_create(0,0); // 8x8 room grid. Values represent a solid tile that is timed to end (For IntermittentPlatformSequence)
//dg_RmTile_TempSolid_def = ds_grid_create(0,0); // 8x8 room grid. Values represent a solid tile that is timed to end (For IntermittentPlatformSequence)

dg_RmTile_Spike         = ds_grid_create(0,0); // 8x8 room grid. Values represent break blocks, break bridge
dg_RmTile_Spike_def     = ds_grid_create(0,0); // 8x8 room grid. Values represent break blocks, break bridge

dl_ceiling_bottom_rc = ds_list_create();

tile_data_init();


burnable_mgr = 0;
//burnable_mgr = instance_create(0,0,BurnableMgr);












// ----------------------------------------------------------
// --------------------  FILE  -----------------------------















// ----------------------------------------------------------
// --------------------  IMAGE  -----------------------------
surf = noone; // Surface object instance. Set in Surface create event



/*  W 30, b 21, B 02, G 00

// SEQ GBbW

25 STARS - y & x coords - Starting colors
  y       x        x        x        x        x
  3:     83 b,   163 B, 
 11:     35 G,   123 W, 
 
 19:    227 B,   
 27:     19 G,    43 W,   163 B,   227 W,   235 b, 
 
 35:    123 B,   203 G,   235 W, 
 43:     43 b,   219 B, 
 
 51:     19 G,   203 W, 
 59:     27 B,   171 b, 
 
 67:     11 G,    75 W, 
 75:    131 G,   227 b, 
 91:     67 b,    99 b,     */
//
//_idx = (dg_STAR_SKY[#_i,2]+_j) & $03;
//p.dg_color_seq[#1,_idx]
//dg_color_seq[#_a,0] = C_GRY3; // $747474. Grey,  2nd darkest
//dg_color_seq[#_a,1] = C_BLU4; // $A80000. Blue,  darkest
//dg_color_seq[#_a,2] = C_BLU2; // $FCBC3C. Blue,  light
//dg_color_seq[#_a,3] = C_WHT1; // $FCFCFC. White, brightest
var _dg_w;
var _dg_H = $3;
dg_StarSky_data = ds_grid_create(0,_dg_H);

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $53;
dg_StarSky_data[#_dg_w,2] = $03;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $A3;
dg_StarSky_data[#_dg_w,2] = $03;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $23;
dg_StarSky_data[#_dg_w,2] = $0B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $7B;
dg_StarSky_data[#_dg_w,2] = $0B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $E3;
dg_StarSky_data[#_dg_w,2] = $13;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $13;
dg_StarSky_data[#_dg_w,2] = $1B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $2B;
dg_StarSky_data[#_dg_w,2] = $1B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $63;
dg_StarSky_data[#_dg_w,2] = $1B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $A3;
dg_StarSky_data[#_dg_w,2] = $1B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $E3;
dg_StarSky_data[#_dg_w,2] = $1B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $EB;
dg_StarSky_data[#_dg_w,2] = $1B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $7B;
dg_StarSky_data[#_dg_w,2] = $23;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $CB;
dg_StarSky_data[#_dg_w,2] = $23;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $EB;
dg_StarSky_data[#_dg_w,2] = $23;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $2B;
dg_StarSky_data[#_dg_w,2] = $2B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $DB;
dg_StarSky_data[#_dg_w,2] = $2B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $13;
dg_StarSky_data[#_dg_w,2] = $33;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $CB;
dg_StarSky_data[#_dg_w,2] = $33;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $1B;
dg_StarSky_data[#_dg_w,2] = $3B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $AB;
dg_StarSky_data[#_dg_w,2] = $3B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $0B;
dg_StarSky_data[#_dg_w,2] = $43;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $4B;
dg_StarSky_data[#_dg_w,2] = $43;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $83;
dg_StarSky_data[#_dg_w,2] = $4B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $E3;
dg_StarSky_data[#_dg_w,2] = $4B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $34;
dg_StarSky_data[#_dg_w,2] = $54;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $43;
dg_StarSky_data[#_dg_w,2] = $5B;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $63;
dg_StarSky_data[#_dg_w,2] = $5B;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $5B;
dg_StarSky_data[#_dg_w,2] = $63;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $BC;
dg_StarSky_data[#_dg_w,2] = $64;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $14;
dg_StarSky_data[#_dg_w,2] = $74;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $7C;
dg_StarSky_data[#_dg_w,2] = $74;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $54;
dg_StarSky_data[#_dg_w,2] = $7C;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $B4;
dg_StarSky_data[#_dg_w,2] = $7C;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $34;
dg_StarSky_data[#_dg_w,2] = $84;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $F4;
dg_StarSky_data[#_dg_w,2] = $84;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $D4;
dg_StarSky_data[#_dg_w,2] = $94;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $5C;
dg_StarSky_data[#_dg_w,2] = $A4;
_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $A4;
dg_StarSky_data[#_dg_w,2] = $A4;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $AC;
dg_StarSky_data[#_dg_w,2] = $AC;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 3;
dg_StarSky_data[#_dg_w,1] = $14;
dg_StarSky_data[#_dg_w,2] = $BC;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 1;
dg_StarSky_data[#_dg_w,1] = $D4;
dg_StarSky_data[#_dg_w,2] = $C4;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 2;
dg_StarSky_data[#_dg_w,1] = $6B;
dg_StarSky_data[#_dg_w,2] = $CC;

_dg_w = ds_grid_width(dg_StarSky_data);
ds_grid_resize(dg_StarSky_data, _dg_w+1, _dg_H);
dg_StarSky_data[#_dg_w,0] = 0;
dg_StarSky_data[#_dg_w,1] = $CC;
dg_StarSky_data[#_dg_w,2] = $D4;


StarSky_dl_surfaces = ds_list_create();
repeat(4) ds_list_add(StarSky_dl_surfaces,0);
/*
            dl_StarSky_SPR2 = ds_list_create();
ds_list_add(dl_StarSky_SPR2, spr_Star_Sky_2a_1_1);
ds_list_add(dl_StarSky_SPR2, spr_Star_Sky_2a_2_1);
ds_list_add(dl_StarSky_SPR2, spr_Star_Sky_2a_3_1);
ds_list_add(dl_StarSky_SPR2, spr_Star_Sky_2a_4_1);
*/






            dl_Fairy_SPRITES = ds_list_create();
ds_list_add(dl_Fairy_SPRITES, spr_FairyA);
ds_list_add(dl_Fairy_SPRITES, spr_FairyB);



sprites_created = false; // A flag so the sprite creation in g_Draw only happens once.

//SignPole_SPR1   = 0; // The OG white & blue one
//SignPole_SPR2   = 0; // The bush trunk red & blue one.

//SignBoard_SPR1  = 0; // 

//Sign_SPR1       = 0; // 
//Sign_TILESET    = ts_Man_made_1a_WRB; // WRB: Board colors =   Midtone+Shadow,   Pole colors = Highlight+Shadow.
//Sign_TILESET    = ts_Man_made_1a_RWB; // RWB: Board colors = Highlight+Shadow,   Pole colors =   Midtone+Shadow.

//Leaf_SPR1       = 0; // Big vine leaf

//PlantPart1_SPR1 = 0; // 
//PlantPart2_SPR1 = 0; // 
//PlantPart2_SPR2 = 0; // 
//PlantPart3_SPR1 = 0; // 
//PlantPart4_SPR1 = 0; // 
//dl_PlantPart_SPR = ds_list_create(); // Will be populated in draw 1st frame.


Block1_SPR1 = spr_Block_02a; // Metal block. The outtie
Block2_SPR1 = spr_Block03;   // Metal block. The innie

//HeadMount1_SPR = 0;
//HeadMount2_SPR = 0;
//HeadMount3_SPR = 0;
//HeadMount4_SPR = 0;
//HeadMount5_SPR = 0;


CloudLarge1_SPR1 = 0;


TownDoor1_SPR    = 0;
Doorway1_SPR     = spr_Doorway01_1; // No highlight. Only midtone and shadow
//Doorway1_SPR        = spr_Doorway01;
//Doorway1_SPR        = spr_doorway_1a_WRB_2;


// 1: Graphic is not flush with solid grid so is treated as a solid object
// 2: Graphic is flush with solid grid so it sets and clears the solid grid
Pushable_SOLID_METHOD = 1;
Pushable_SPR1 = spr_Statue_4b; // graphic height 45
Pushable_SPR2 = spr_Statue_4d; // graphic height 48


BossExplosion_SPR1 = spr_Explosion1A; // small
BossExplosion_SPR2 = spr_Explosion1B; // big
BossExplosion_Inst_DURATION = ($1<<4)-1;
















// ----------------------------------------------------------
// --------------------  OVERWORLD  ------------------------

//overworld        = noone; // Overworld object instance
overworld_paused = false;












// ----------------------------------------------------------
// --------------------  HUD  -----------------------------

















// ----------------------------------------------------------
// --------------------  MENU  -----------------------------

gui_timer1 = 0; // 0487. menu timer
gui_timer2 = 0; // menu timer

//_0566 = 0; // 0566
//_0569 = 0; // 0569
//_056A = 0; // 056A
//_0736 = 0; // 0736
_074F = 0; // 074F

_0005 = 0; // 0005
_048C = 0; // 048C
_0766 = 0; // 0766


GUI_WIN_CLMS1 = $0E; // 8x8
GUI_WIN_CLMS2 = $18; // 8x8

// TSRC: TileSet Row & Column
dl_MenuFrame_TSRC     = ds_list_create();
dl_MenuFrame_TSRC[|0] = $20; // Bar Horizontal
dl_MenuFrame_TSRC[|1] = $21; // Bar Vertical
dl_MenuFrame_TSRC[|2] = $22; // Corner

TS_MENU = ts_Menu01;


switch(1)
{
    case 1:{
    global.SPR_ICON_ATK = spr_Menu_Sword_icon_1a;
    global.SPR_ICON_MAG = spr_menu_bottle_icon;
    global.SPR_ICON_LIF = spr_Menu_Heart_icon_1a;
    break;}
    
    case 2:{
    global.SPR_ICON_ATK = spr_icon_sword_1b;
    global.SPR_ICON_MAG = spr_icon_bottle_1a;
    global.SPR_ICON_LIF = spr_icon_shield_1a;
    break;}
}



















// ----------------------------------------------------------
// --------------------  RM & AREA  -----------------------------
// rm: room. Refers to an in-game room, rather than GMS room asset
// *** `rm` and `scene` are the same thing.



room_type = "B";

dm_rm = ds_map_create();

            dl_AREA_NAME=ds_list_create();
ds_list_add(dl_AREA_NAME,Area_WestA);
ds_list_add(dl_AREA_NAME,Area_DthMt);
ds_list_add(dl_AREA_NAME,Area_EastA);
ds_list_add(dl_AREA_NAME,Area_MazIs);
ds_list_add(dl_AREA_NAME,Area_PalcA);
ds_list_add(dl_AREA_NAME,Area_PalcB);
ds_list_add(dl_AREA_NAME,Area_PalcC);
ds_list_add(dl_AREA_NAME,Area_PalcD);
ds_list_add(dl_AREA_NAME,Area_PalcE);
ds_list_add(dl_AREA_NAME,Area_PalcF);
ds_list_add(dl_AREA_NAME,Area_PalcG);
ds_list_add(dl_AREA_NAME,Area_PalcH);
ds_list_add(dl_AREA_NAME,Area_TownA);
ds_list_add(dl_AREA_NAME,Area_TownB);



// 2024/09/11. `rm` and `scene` are the same. I intend to replace `rm` with `scene` throughout the whole app.
area_name = dl_AREA_NAME[|0]; // 
rm_num    = $00; // 0561. $00 North Palace
rm_name   = area_name+hex_str(rm_num);
scene_data_scene_name = rm_name;


dm_dungeon   = ds_map_create();
dungeon_num  = 0;
dungeon_name = undefined;
town_num     = 0;
town_name    = undefined;


// 0706. 0: West Hyrule, 1: Death Mtn & Maze Island, 2: East Hyrule
//area_type_A = 0; // 0706

// 0707. 0: Not palace or town. 1: West town. 2: East town. 
//       3: Palace 1,2,5. 4: Palace 3,4,6. 5: Great Palace
//area_type_B = 0; // 0707

rm_ow_dir = 0; // 0: WE, 1: NS, 2: 




//CrystalBarrier1_RM_NAME  = Area_PalcG+"00";
//TriforceBarrier1_RM_NAME = Area_EastA+"78";



// Populated in g_Room_Start so that the spawn update doesn't have to do as much work.
dg_spawn_prxm = ds_grid_create(0,$F);
dg_spawn_prio = ds_grid_create(0,ds_grid_height(dg_spawn_prxm));


//SPAWN_DIST_X = $0D<<3; // OG. $68 dist from edge of cam determines tile gob spawns on
SPAWN_DIST1_X = $01<<3; // WIDE VIEW. $08 dist from edge of cam determines tile gob spawns on
SPAWN_DIST1_Y = $01<<3; // $08 dist from edge of cam determines tile gob spawns on
SPAWN_DIST2_X = $03<<3; // WIDE VIEW. $08 dist from edge of cam determines tile gob spawns on
SPAWN_DIST2_Y = $03<<3; // $08 dist from edge of cam determines tile gob spawns on


                   _a=1;
coming_from_FILE = _a++;
coming_from_CONT = _a++;
coming_from_DEAD = _a++;
coming_from_RM_A = _a++;
coming_from_RM_C = _a++;
coming_from = coming_from_FILE;


// Track the order of all rooms visited, including rmA, rmB, rmC types. 
// STR_Counter keeps the order of the rms visited.
// Certain data about each rm visited can also be recorded.
dm_room_history = ds_map_create();
dm_room_history[?STR_Counter] = 0;


//ExitName_MIDO_CHURCH  = "undefined";
//ExitName_FAST_TRAVEL2 = "undefined";
//ExitName_FAST_TRAVEL3 = "undefined";



EXIT_DIR_MID   = $00; // middle (doorways)
EXIT_DIR_RIGHT = $10; // right
EXIT_DIR_LEFT  = $20; // left
EXIT_DIR_DOWN  = $40; // down
EXIT_DIR_UP    = $80; // up
            dl_exit_dirs=ds_list_create();
ds_list_add(dl_exit_dirs,EXIT_DIR_MID);
ds_list_add(dl_exit_dirs,EXIT_DIR_RIGHT);
ds_list_add(dl_exit_dirs,EXIT_DIR_LEFT);
ds_list_add(dl_exit_dirs,EXIT_DIR_DOWN);
ds_list_add(dl_exit_dirs,EXIT_DIR_UP);


// Exit.exit_type & g.EXIT_TYPE_XX to check
EXIT_TYPE_STANDARD = $0000; // Standard. No condition to use exit
EXIT_TYPE_DOOR     = $0010; // DooRway.  
EXIT_TYPE_ELEVATOR = $0020; // ELevator. pc must be on elevator to use exit
EXIT_TYPE_PIPE     = $0040; // Pipe.
EXIT_BIT_VERT1     = $0004; // Vertical 1. Means base spawn_x is g.leave_rm_x
EXIT_BIT_WARP1     = $0008; // Don't reload rm. Exit warps to another exit w/in same rm.
EXIT_BIT_TELEPORT  = $0001;
//EXIT_BIT_TELEPORT  = $0100;


FallScene_BIT_RIGHT  = $010000; // FALL RIGHT
FallScene_BIT_LEFT   = $020000; // FALL LEFT
FallScene_BIT_DOWN   = $040000; // FALL DOWNWARD
FallScene_BIT_UP     = $080000; // FALL UPWARD
FallScene_BITS       = FallScene_BIT_RIGHT | FallScene_BIT_LEFT | FallScene_BIT_DOWN | FallScene_BIT_UP;
FallScene_BITS_SHIFT = $10;


_datakey = STR_Fall+"_";
dm_cut_scene = ds_map_create();

_id   = FallScene_BIT_RIGHT;
_name = _datakey+hex_str(_id>>FallScene_BITS_SHIFT);
dm_cut_scene[?_name+STR_ID] = _id;
dm_cut_scene[?   hex_str(_id>>FallScene_BITS_SHIFT)+STR_Name] = _name;

_id   = FallScene_BIT_LEFT;
_name = _datakey+hex_str(_id>>FallScene_BITS_SHIFT);
dm_cut_scene[?_name+STR_ID] = _id;
dm_cut_scene[?   hex_str(_id>>FallScene_BITS_SHIFT)+STR_Name] = _name;

_id   = FallScene_BIT_DOWN;
_name = _datakey+hex_str(_id>>FallScene_BITS_SHIFT);
dm_cut_scene[?_name+STR_ID] = _id;
dm_cut_scene[?   hex_str(_id>>FallScene_BITS_SHIFT)+STR_Name] = _name;

_id   = FallScene_BIT_UP;
_name = _datakey+hex_str(_id>>FallScene_BITS_SHIFT);
dm_cut_scene[?_name+STR_ID] = _id;
dm_cut_scene[?   hex_str(_id>>FallScene_BITS_SHIFT)+STR_Name] = _name;



exit_enter = noone; // The Exit instance used to ENTER the current room
exit_leave = noone; // The Exit instance used to LEAVE the current room
exit_leave_pending = noone; // 

dm_exit_leave_history = ds_map_create();
dm_exit_leave_history[?STR_Counter] = 0;

leave_rm_x = 0; // 05D3,Y. pc's ogX when exiting a room
leave_rm_y = 0; // 



// bits representing encounter types
              _a=$01;
ENC_WEAK=_a;  _a=_a<<1;
ENC_STRG=_a;  _a=_a<<1;
ENC_FARY=_a;  _a=_a<<1;
//ENC_SPCL=_a;  _a=_a<<1; // A non-encounter rm that can only be accessed by getting into an encounter on a certain ow tile.

encounter_type = 0; // current room's encounter type
in_safe_encounter = false;



                      _a=0;
RM_BRIGHTNESS_1   = ++_a;
RM_BRIGHTNESS_2   = ++_a;
RM_BRIGHTNESS_MAX =   _a;
rm_brightness            = 0;
rm_brightness_update_VER = 2;





global.dm_scene_rando = ds_map_create();




















// ----------------------------------------------------------
// --------------------  AUDIO  -----------------------------







// ----------------------------------------------------------
// --------------------  COLOR  -----------------------------







// ----------------------------------------------------------
// --------------------  CHALLENGE  -------------------------






// ----------------------------------------------------------
// --------------------  NIAO  ------------------------------
// NIAO: Non-Interactive Animated Object

DEPTH_CLOUD = DEPTH_BG8   + (TILE_DEPTHS_PAD>>1);
DEPTH_STARS = DEPTH_CLOUD + (TILE_DEPTHS_PAD>>1);

dl_niao = ds_list_create();
repeat($10) ds_list_add(dl_niao,0);




global.Rain_is_active = false;
global.Rain_pi = 0;
global.Rain_direction_x = -1; // Horizontal. 1: right,    -1: left
global.Rain_direction_y =  1; // Vertical.   1: downward, -1: upward
global.Rain_speed_x = 1.0; // pixels per frame
global.Rain_speed_y = 4.0; // pixels per frame

global.Rain1_srf = 0;
global.Rain1_TS  = ts_Natural02;
global.Rain1_TILE_SIZE  = $2<<3; // 2x2 of 8x8 tiles
global.Rain1_LOOP_SIZE  = global.Rain1_TILE_SIZE<<1; // 4x4 of 8x8 tiles
global.Rain1_LOOP_SIZE_ = global.Rain1_LOOP_SIZE>>1;

var _EXTRA = $2<<1; // number of extra $10x$10 squares outside each axis(horizontal,vertical) of the camera

// _count1: number of $10x$10 squares, horizontally
_count1  =   viewW() div global.Rain1_TILE_SIZE;
_count1 += _EXTRA;
_count1 += ((viewW() mod global.Rain1_TILE_SIZE)!=0) <<1;
global.Rain1_srf_W = global.Rain1_TILE_SIZE * _count1;

// _count2: number of $10x$10 squares, vertically
_count2  =   viewH() div global.Rain1_TILE_SIZE;
_count2 += _EXTRA;
_count2 += ((viewH() mod global.Rain1_TILE_SIZE)!=0) <<1;
global.Rain1_srf_H = global.Rain1_TILE_SIZE * _count2;

global.Rain_xoff = 0; // current offset from base xl
global.Rain_yoff = 0; // current offset from base yt
global.Rain_xl   = 0;
global.Rain_yt   = 0;











// ----------------------------------------------------------
// --------------------  ITEMS  -----------------------------
//init_data_items();
SPR_CONT_PIECE_HP = spr_ItemContainer_Piece_HP_1b;
SPR_CONT_HP       = spr_Item_Heart_container_1d;

SPR_CONT_PIECE_MP = spr_Bottle_6a;
SPR_CONT_MP       = spr_Item_Magic_container_1d;

//                                                              //
            dl_cont_spr_hp=ds_list_create();
ds_list_add(dl_cont_spr_hp,spr_Item_Heart_container_1a); // 0/3 container
ds_list_add(dl_cont_spr_hp,spr_Item_Heart_container_1b); // 1/3 container
ds_list_add(dl_cont_spr_hp,spr_Item_Heart_container_1c); // 2/3 container
ds_list_add(dl_cont_spr_hp,SPR_CONT_HP);                 // 3/3 container
//                                                              //
            dl_cont_spr_mp=ds_list_create();
ds_list_add(dl_cont_spr_mp,spr_Item_Magic_container_1a); // 0/3 container
ds_list_add(dl_cont_spr_mp,spr_Item_Magic_container_1b); // 1/3 container
ds_list_add(dl_cont_spr_mp,spr_Item_Magic_container_1c); // 2/3 container
ds_list_add(dl_cont_spr_mp,SPR_CONT_MP);                 // 3/3 container
//                                                      // 
// For beating heart anim
            dl_HeartPiece_SPR=ds_list_create();
ds_list_add(dl_HeartPiece_SPR,spr_ItemContainer_Piece_HP_1b); // reg size
ds_list_add(dl_HeartPiece_SPR,spr_ItemContainer_Piece_HP_1a); // small



if (mod_MedicinePlantItem)
{
    SPR_ITEM_MEDICINE = spr_Item_Flower_1a;
}
else
{
    SPR_ITEM_MEDICINE = spr_Bottle_7a;
    //SPR_ITEM_MEDICINE = spr_Item_Medicine_1b;
    //SPR_ITEM_MEDICINE = spr_Item_Bottle_5a;
    //SPR_ITEM_MEDICINE = spr_Item_Medicine;
}
SPR_ITEM_CROSS  = spr_Item_Cross_1a_1; // 1 pixel taller than OG
//SPR_ITEM_CROSS  = spr_Item_Cross; // OG
SPR_ITEM_TROPHY = spr_Item_Trophy;


dm_ITEM = ds_map_create();

_obj=ItmA0; _name=object_get_name(_obj); _bit=ITM_CAND; _spr=spr_Item_Candle;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_CANDLE;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_CANDLE+STR_Object]            = _obj;
dm_ITEM[?STR_CANDLE+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_CANDLE+STR_Bit]               = _bit;
dm_ITEM[?STR_CANDLE+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmA1; _name=object_get_name(_obj); _bit=ITM_GLOV; _spr=spr_Item_Glove;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_GLOVE;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_GLOVE+STR_Object]             = _obj;
dm_ITEM[?STR_GLOVE+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_GLOVE+STR_Bit]                = _bit;
dm_ITEM[?STR_GLOVE+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmA2; _name=object_get_name(_obj); _bit=ITM_RAFT; _spr=spr_Item_Raft;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_RAFT;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_RAFT+STR_Object]              = _obj;
dm_ITEM[?STR_RAFT+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_RAFT+STR_Bit]                 = _bit;
dm_ITEM[?STR_RAFT+STR_Sprite]              = _spr;
//                                                      //
_obj=ItmA3; _name=object_get_name(_obj); _bit=ITM_BOOT; _spr=spr_Item_Boots;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_BOOTS;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_BOOTS+STR_Object]             = _obj;
dm_ITEM[?STR_BOOTS+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_BOOTS+STR_Bit]                = _bit;
dm_ITEM[?STR_BOOTS+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmA4; _name=object_get_name(_obj); _bit=ITM_FLUT; _spr=spr_Item_Flute;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_FLUTE;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_FLUTE+STR_Object]             = _obj;
dm_ITEM[?STR_FLUTE+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_FLUTE+STR_Bit]                = _bit;
dm_ITEM[?STR_FLUTE+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmA5; _name=object_get_name(_obj); _bit=ITM_CROS; _spr=SPR_ITEM_CROSS;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_CROSS;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_CROSS+STR_Object]             = _obj;
dm_ITEM[?STR_CROSS+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_CROSS+STR_Bit]                = _bit;
dm_ITEM[?STR_CROSS+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmA6; _name=object_get_name(_obj); _bit=ITM_HAMM; _spr=spr_Item_Hammer;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_HAMMER;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_HAMMER+STR_Object]            = _obj;
dm_ITEM[?STR_HAMMER+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_HAMMER+STR_Bit]               = _bit;
dm_ITEM[?STR_HAMMER+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmA7; _name=object_get_name(_obj); _bit=ITM_SWRD; _spr=spr_Item_Sword_1a_3;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_SWORD;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_SWORD+STR_Object]             = _obj;
dm_ITEM[?STR_SWORD+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_SWORD+STR_Bit]                = _bit;
dm_ITEM[?STR_SWORD+STR_Sprite]             = _spr;
//                                                      //
//                                                                  // 
_obj=ItmA8; _name=object_get_name(_obj); _bit=ITM_FRY1; _spr=dl_Fairy_SPRITES[|0];
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_RFAIRY;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_RFAIRY+STR_Object]            = _obj;
dm_ITEM[?STR_RFAIRY+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_RFAIRY+STR_Bit]               = _bit;
dm_ITEM[?STR_RFAIRY+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmA9; _name=object_get_name(_obj); _bit=ITM_BRAC; _spr=spr_Item_Bracelet_1b;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_BRACELET;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_BRACELET+STR_Object]          = _obj;
dm_ITEM[?STR_BRACELET+STR_Object+STR_Name] = _name;
dm_ITEM[?STR_BRACELET+STR_Bit]             = _bit;
dm_ITEM[?STR_BRACELET+STR_Sprite]          = _spr;
//                                                      //
_obj=ItmAA; _name=object_get_name(_obj); _bit=ITM_BOOK; _spr=spr_Item_Book_1b;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_BOOK;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_BOOK+STR_Object]              = _obj;
dm_ITEM[?STR_BOOK+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_BOOK+STR_Bit]                 = _bit;
dm_ITEM[?STR_BOOK+STR_Sprite]              = _spr;
//                                                      //
_obj=ItmAB; _name=object_get_name(_obj); _bit=ITM_MEAT; _spr=spr_Item_Meat_1a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_MEAT;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_MEAT+STR_Object]              = _obj;
dm_ITEM[?STR_MEAT+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_MEAT+STR_Bit]                 = _bit;
dm_ITEM[?STR_MEAT+STR_Sprite]              = _spr;
//                                                      //
_obj=ItmAC; _name=object_get_name(_obj); _bit=ITM_NKLC; _spr=spr_Item_Necklace;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_PENDANT;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_PENDANT+STR_Object]           = _obj;
dm_ITEM[?STR_PENDANT+STR_Object+STR_Name]  = _name;
dm_ITEM[?STR_PENDANT+STR_Bit]              = _bit;
dm_ITEM[?STR_PENDANT+STR_Sprite]           = _spr;
//                                                      //
_obj=ItmAD; _name=object_get_name(_obj); _bit=ITM_MASK; _spr=spr_Item_Mask_1a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_MASK;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_MASK+STR_Object]              = _obj;
dm_ITEM[?STR_MASK+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_MASK+STR_Bit]                 = _bit;
dm_ITEM[?STR_MASK+STR_Sprite]              = _spr;
//                                                      //
_obj=ItmK5; _name=object_get_name(_obj); _bit=ITM_TBLT; _spr=spr_Item_Tablet_1a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
//                                                      //
_obj=ItmAE; _name=object_get_name(_obj); _bit=ITM_SHLD; _spr=spr_Item_Shield_2a_2;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_SHIELD;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_SHIELD+STR_Object]            = _obj;
dm_ITEM[?STR_SHIELD+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_SHIELD+STR_Bit]               = _bit;
dm_ITEM[?STR_SHIELD+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmAF; _name=object_get_name(_obj); _bit=ITM_RING; _spr=spr_Item_Ring;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_RING;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_RING+STR_Object]              = _obj;
dm_ITEM[?STR_RING+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_RING+STR_Bit]                 = _bit;
dm_ITEM[?STR_RING+STR_Sprite]              = _spr;
//                                                      //
//                                                      //
_obj=ItmK6; _name=object_get_name(_obj); _bit=ITM_SKEY; _spr=spr_Item_Skull_key_1a_1; // ALL KEY
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_ALLKEY;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_ALLKEY+STR_Object]            = _obj;
dm_ITEM[?STR_ALLKEY+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_ALLKEY+STR_Bit]               = _bit;
dm_ITEM[?STR_ALLKEY+STR_Sprite]            = _spr;
//                                                      //
//                                                      //
_obj=ItmK7; _name=object_get_name(_obj); _bit=ITM_FTHR; _spr=spr_Item_Feather_1a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_FEATHER;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_FEATHER+STR_Object]           = _obj;
dm_ITEM[?STR_FEATHER+STR_Object+STR_Name]  = _name;
dm_ITEM[?STR_FEATHER+STR_Bit]              = _bit;
dm_ITEM[?STR_FEATHER+STR_Sprite]           = _spr;
//                                                      //
//                                                      //
_obj=ItmKB; _name=object_get_name(_obj); _bit=ITM_MEL1; _spr=spr_Item_Melody1_1a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_MELODY;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_MELODY+STR_Object]            = _obj;
dm_ITEM[?STR_MELODY+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_MELODY+STR_Bit]               = _bit;
dm_ITEM[?STR_MELODY+STR_Sprite]            = _spr;
//                                                      //
//                                                      //
_obj=ItmK8; _name=object_get_name(_obj); _bit=ITM_MAP1; _spr=spr_Item_Map_2a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite]  = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite]  = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite]  = _spr; // ITEM MAP1 - WEST
dm_ITEM[?hex_str(       _bit )+STR_Object]  = _obj;
dm_ITEM[?_name+STR_Bit]                     = _bit;
//dm_ITEM[?hex_str(       _bit )+STR_pal_idx] = global.PI_MOB_ORG;
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_MAP1;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_MAP1+STR_Object]               = _obj;
dm_ITEM[?STR_MAP1+STR_Object+STR_Name]      = _name;
dm_ITEM[?STR_MAP1+STR_Bit]                  = _bit;
dm_ITEM[?STR_MAP1+STR_Sprite]               = _spr;
//                                                      //
_obj=ItmK9; _name=object_get_name(_obj); _bit=ITM_MAP2; _spr=spr_Item_Map_2b;
dm_ITEM[?hex_str(       _bit )+STR_Sprite]  = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite]  = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite]  = _spr; // ITEM MAP2 - EAST
dm_ITEM[?hex_str(       _bit )+STR_Object]  = _obj;
dm_ITEM[?_name+STR_Bit]                     = _bit;
//dm_ITEM[?hex_str(       _bit )+STR_pal_idx] = global.PI_MOB_ORG;
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_MAP2;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_MAP2+STR_Object]               = _obj;
dm_ITEM[?STR_MAP2+STR_Object+STR_Name]      = _name;
dm_ITEM[?STR_MAP2+STR_Bit]                  = _bit;
dm_ITEM[?STR_MAP2+STR_Sprite]               = _spr;
//                                                      //
//                                                              //
//                                                              //
//                                                              //
_obj=CONT_PIECE_OBJ_HP; _name=object_get_name(_obj); _bit=0; _spr=SPR_CONT_PIECE_HP;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr; // 
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_HEART;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_HEART+STR_Object]              = _obj;
dm_ITEM[?STR_HEART+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_HEART+STR_Sprite]              = _spr;
//                                                              //
_obj=CONT_PIECE_OBJ_MP; _name=object_get_name(_obj); _bit=0; _spr=SPR_CONT_PIECE_MP;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr; // 
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_MAGIC;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_MAGIC+STR_Object]              = _obj;
dm_ITEM[?STR_MAGIC+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_MAGIC+STR_Sprite]              = _spr;
//                                                              //
//                                                              //
//                                                              //
_obj=ItmC0; _name=object_get_name(_obj); _bit=ITM_TRPH; _spr=SPR_ITEM_TROPHY;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?_name+'02'           +STR_Sprite] = dm_ITEM[?object_get_name(ItmC0)+'01'+STR_Sprite];
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_TROPHY;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_TROPHY+STR_Object]            = _obj;
dm_ITEM[?STR_TROPHY+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_TROPHY+STR_Bit]               = _bit;
dm_ITEM[?STR_TROPHY+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmC1; _name=object_get_name(_obj); _bit=ITM_NOTE; _spr=spr_Item_Map;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_NOTE;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_NOTE+STR_Object]              = _obj;
dm_ITEM[?STR_NOTE+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_NOTE+STR_Bit]                 = _bit;
dm_ITEM[?STR_NOTE+STR_Sprite]              = _spr;
//                                                      //
_obj=ItmC2; _name=object_get_name(_obj); _bit=ITM_MIRR; _spr=spr_Item_Mirror;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_MIRROR;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_MIRROR+STR_Object]            = _obj;
dm_ITEM[?STR_MIRROR+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_MIRROR+STR_Bit]               = _bit;
dm_ITEM[?STR_MIRROR+STR_Sprite]            = _spr;
//                                                      //
_obj=ItmC3; _name=object_get_name(_obj); _bit=ITM_MEDI; _spr=SPR_ITEM_MEDICINE;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_FLOWER;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_FLOWER+STR_Object]            = _obj;
dm_ITEM[?STR_FLOWER+STR_Object+STR_Name]   = _name;
dm_ITEM[?STR_FLOWER+STR_Bit]               = _bit;
dm_ITEM[?STR_FLOWER+STR_Sprite]            = _spr;
/*
if (g.mod_MedicinePlantItem){
dm_ITEM[?hex_str(       _bit )+STR_pal_idx]= global.PI_MOB_ORG;
}else{
dm_ITEM[?hex_str(       _bit )+STR_pal_idx]= global.PI_MOB_BLU;
}
*/
//                                                      //
_obj=ItmC4; _name=object_get_name(_obj); _bit=ITM_CHLD; _spr=spr_Item_Child;
dm_ITEM[?hex_str(       _bit )+STR_Sprite] = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite] = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite] = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object] = _obj;
dm_ITEM[?_name+STR_Bit]                    = _bit;
dm_ITEM[?_name+STR_Item+STR_Type]          = STR_CHILD;
dm_ITEM[?_name+STR_Hold+STR_Item]          = true; // is hold item
dm_ITEM[?STR_CHILD+STR_Object]             = _obj;
dm_ITEM[?STR_CHILD+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_CHILD+STR_Bit]                = _bit;
dm_ITEM[?STR_CHILD+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmC5; _name=object_get_name(_obj); _bit=ITM_BTL1; _spr=spr_Item_Bottle_8a;
dm_ITEM[?hex_str(       _bit )+STR_Sprite]  = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite]  = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite]  = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object]  = _obj;
dm_ITEM[?_name+STR_Bit]                     = _bit;
//dm_ITEM[?hex_str(       _bit )+STR_pal_idx] = global.PI_MOB_RED;
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_BOTTLE;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_BOTTLE+STR_Object]             = _obj;
dm_ITEM[?STR_BOTTLE+STR_Object+STR_Name]    = _name;
dm_ITEM[?STR_BOTTLE+STR_Bit]                = _bit;
dm_ITEM[?STR_BOTTLE+STR_Sprite]             = _spr;
//                                                      //
_obj=ItmS0; _name=object_get_name(_obj); _bit=ITEM_SPELL; _spr=spr_SpellItem01;
dm_ITEM[?hex_str(       _bit )+STR_Sprite]  = _spr;
dm_ITEM[?hex_str(bitNum(_bit))+STR_Sprite]  = _spr;
dm_ITEM[?_name+'01'           +STR_Sprite]  = _spr;        // 
dm_ITEM[?hex_str(       _bit )+STR_Object]  = _obj;
dm_ITEM[?_name+STR_Bit]                     = _bit;
//dm_ITEM[?hex_str(       _bit )+STR_pal_idx] = global.PI_MOB_ORG;
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_SPELL;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_SPELL+STR_Object]              = _obj;
dm_ITEM[?STR_SPELL+STR_Object+STR_Name]     = _name;
dm_ITEM[?STR_SPELL+STR_Bit]                 = _bit;
dm_ITEM[?STR_SPELL+STR_Sprite]              = _spr;
//                                                      //
//                                                      //
//                                                              //
_obj=ItmD0; _name=object_get_name(_obj); _bit=0; _spr=spr_Item_Key_2a;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr;           // 
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_KEY;
dm_ITEM[?STR_KEY+STR_Object]                = _obj;
dm_ITEM[?STR_KEY+STR_Object+STR_Name]       = _name;
dm_ITEM[?STR_KEY+STR_Bit]                   = _bit;
dm_ITEM[?STR_KEY+STR_Sprite]                = _spr;
//                                                              //
_obj=ItmE0; _name=object_get_name(_obj); _bit=0; _spr=spr_Item_Bottle;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr; // Magic jar red(Full) respawn refresh area
dm_ITEM[?_name+'02'+STR_Sprite]             = _spr; // Magic jar blue($10) respawn unlim
dm_ITEM[?_name+'03'+STR_Sprite]             = _spr; // Magic jar blue($10) respawn refresh area
dm_ITEM[?_name+'04'+STR_Sprite]             = _spr; // Magic jar red(Full) respawn unlim
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_JAR;
dm_ITEM[?STR_JAR+STR_Object]                = _obj;
dm_ITEM[?STR_JAR+STR_Object+STR_Name]       = _name;
dm_ITEM[?STR_JAR+STR_Bit]                   = _bit;
dm_ITEM[?STR_JAR+STR_Sprite]                = _spr;
//                                                              //
_obj=ItmF0; _name=object_get_name(_obj); _bit=0; _spr=spr_Item_PBag;
                       _i=$01;
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //   50
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  100
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  150
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  200
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  250
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  300
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  400
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  500
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    //  700
dm_ITEM[?_name+hex_str(_i++)+STR_Sprite]    = _spr;    // 1000
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_PBAG;
dm_ITEM[?STR_PBAG+STR_Object]               = _obj;
dm_ITEM[?STR_PBAG+STR_Object+STR_Name]      = _name;
dm_ITEM[?STR_PBAG+STR_Bit]                  = _bit;
dm_ITEM[?STR_PBAG+STR_Sprite]               = _spr;

_obj=ItmG0; _name=object_get_name(_obj); _bit=0; _spr=spr_Item_LifeDoll_1b;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr;    // 
dm_ITEM[?_name+'02'+STR_Sprite]             = _spr;    // 
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_1UP;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_1UP+STR_Object]                = _obj;
dm_ITEM[?STR_1UP+STR_Object+STR_Name]       = _name;
dm_ITEM[?STR_1UP+STR_Bit]                   = _bit;
dm_ITEM[?STR_1UP+STR_Sprite]                = _spr;
//                                                              //
_obj=ItmH0; _name=object_get_name(_obj); _bit=0; _spr=spr_Triforce_1a;
dm_ITEM[?_name+'01'+STR_Sprite]             = _spr;        // 
dm_ITEM[?_name+STR_Item+STR_Type]           = STR_TRIFORCE;
dm_ITEM[?_name+STR_Hold+STR_Item]           = true; // is hold item
dm_ITEM[?STR_TRIFORCE+STR_Object]           = _obj;
dm_ITEM[?STR_TRIFORCE+STR_Object+STR_Name]  = _name;
dm_ITEM[?STR_TRIFORCE+STR_Bit]              = _bit;
dm_ITEM[?STR_TRIFORCE+STR_Sprite]           = _spr;
//                                                              //



FlowerItemAnim_DUR  = $1<<5;
FlowerItemAnim_SPR1 = spr_Item_Flower_1a;
FlowerItemAnim_SPR2 = spr_Item_Flower_1b;
FlowerItemAnim_SPR3 = spr_Item_Flower_1c;



//LifeDoll_MAX = 0; // This will be set in RoomData_Create()


dl_MapItem_ITEM_IDS = ds_list_create();



// This will be set in rm_data_init_Palc_F()
//FallingKey1_spawn_datakey = undefined;
































// ----------------------------------------------------------
// --------------------  PLAYER CHARACTER  ------------------
pc = noone; // player character instance

            dl_WalkAnim_DURATION = ds_list_create();
ds_list_add(dl_WalkAnim_DURATION,8);
ds_list_add(dl_WalkAnim_DURATION,7);
ds_list_add(dl_WalkAnim_DURATION,5);
ds_list_add(dl_WalkAnim_DURATION,4);
WalkAnim_timer = 0; // $0501


// pc_lock: $1: hspd, $2: jump, $4: vspd, $8: , 
// $10: stab high, $20: stab low, $40: thrust down, $80: thrust up, 
// $100: use spell, $200: open menu, 
pc_lock = 0; // 00DE

//tmr_pipe_sink    = 0; // 070E
//tmr_pc_atk       = 0; // 050A
//tmr_pc_stun      = 0; // $050C
//tmr_invulnerable = 0; // $0518. invulnerable. Decrements everytime 0500 reaches -1
boss_stun_timer = 0; // 050D. Boss stun timer
STARTING_LIVES  = 3;

// Prevents any effect attacking has on hspd so pc x can update during pushback.
control1_timer  = 0; // 0502. 



StatRestore_DURATION1 = $30; // $070B/070C
StatRestore_timer_hp  = 0;   // 070D
StatRestore_timer_mp  = 0;   // 070C










// *****************************************************************
// -----------------------------------------------------------
// --------------------  SPELL  ------------------

// You can change the order however you like
            dl_Spell_STR=ds_list_create(); dm_Spell=ds_map_create();
ds_list_add(dl_Spell_STR,STR_PROTECT);     dm_Spell[?hex_str(SPL_PRTC)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_JUMP);        dm_Spell[?hex_str(SPL_JUMP)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_HEAL);        dm_Spell[?hex_str(SPL_LIFE)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_FAIRY);       dm_Spell[?hex_str(SPL_FARY)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_FIRE);        dm_Spell[?hex_str(SPL_FIRE)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_REFLECT);     dm_Spell[?hex_str(SPL_RFLC)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_ENIGMA);      dm_Spell[?hex_str(SPL_SPEL)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_THUNDER);     dm_Spell[?hex_str(SPL_THUN)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
ds_list_add(dl_Spell_STR,STR_SUMMON);      dm_Spell[?hex_str(SPL_SUMM)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];
//ds_list_add(dl_Spell_STR,STR_CUCCO);       dm_Spell[?hex_str(SPL_CUCO)+STR_Name] = dl_Spell_STR[|ds_list_size(dl_Spell_STR)-1];

dm_Spell[?STR_Bit+STR_PROTECT]    = SPL_PRTC;
dm_Spell[?STR_Bit+STR_JUMP]       = SPL_JUMP;
dm_Spell[?STR_Bit+STR_HEAL]       = SPL_LIFE;
dm_Spell[?STR_Bit+STR_FAIRY]      = SPL_FARY;
dm_Spell[?STR_Bit+STR_FIRE]       = SPL_FIRE;
dm_Spell[?STR_Bit+STR_REFLECT]    = SPL_RFLC;
dm_Spell[?STR_Bit+STR_ENIGMA]     = SPL_SPEL;
dm_Spell[?STR_Bit+STR_THUNDER]    = SPL_THUN;
dm_Spell[?STR_Bit+STR_SUMMON]     = SPL_SUMM;
//dm_Spell[?STR_Bit+STR_CUCCO]      = SPL_CUCO;

dm_Spell[?STR_Town+STR_Name+STR_PROTECT]    = STR_Rauru;
dm_Spell[?STR_Town+STR_Name+STR_JUMP]       = STR_Ruto;
dm_Spell[?STR_Town+STR_Name+STR_HEAL]       = STR_Saria;
dm_Spell[?STR_Town+STR_Name+STR_FAIRY]      = STR_Mido;
dm_Spell[?STR_Town+STR_Name+STR_FIRE]       = STR_Nabooru;
dm_Spell[?STR_Town+STR_Name+STR_REFLECT]    = STR_Darunia;
dm_Spell[?STR_Town+STR_Name+STR_ENIGMA]     = STR_New_Kasuto;
dm_Spell[?STR_Town+STR_Name+STR_THUNDER]    = STR_Old_Kasuto;
dm_Spell[?STR_Town+STR_Name+STR_SUMMON]     = STR_Bulblin;

dm_Spell[?STR_Town+STR_Spell+STR_Rauru]     = STR_PROTECT;
dm_Spell[?STR_Town+STR_Spell+STR_Ruto]      = STR_JUMP;
dm_Spell[?STR_Town+STR_Spell+STR_Saria]     = STR_HEAL;
dm_Spell[?STR_Town+STR_Spell+STR_Mido]      = STR_FAIRY;
dm_Spell[?STR_Town+STR_Spell+STR_Nabooru]   = STR_FIRE;
dm_Spell[?STR_Town+STR_Spell+STR_Darunia]   = STR_REFLECT;
dm_Spell[?STR_Town+STR_Spell+STR_New_Kasuto]= STR_ENIGMA;
dm_Spell[?STR_Town+STR_Spell+STR_Old_Kasuto]= STR_THUNDER;
dm_Spell[?STR_Town+STR_Spell+STR_Bulblin]   = STR_SUMMON;

SPELL_COUNT = ds_list_size(dl_Spell_STR);


spell_selected        = 1; // 0749.  Default value is 1
spell_ready           = 0;
spell_cast_this_frame = 0; // 074A. last spell cast
spells_active         = 0; // 076F. active spells

dl_spell_history = ds_list_create();
ds_list_add(dl_spell_history,0);

dg_spell_cost = ds_grid_create(SPELL_COUNT+1,9);
dg_spell_cost_DEFAULT = ds_grid_create(0,0);
ds_grid_clear(dg_spell_cost,$F0);
init_data_spells_1a(); // spell costs













// -----------------------------------------------------------
// *****************************************************************
                          _a=2;
CUTSCENE_BUILD_HOUSE1   = _a++;
CUTSCENE_GAME_END_1A    = _a++; // Wake Zelda
//CUTSCENE_GAME_END_1B    = _a++; // Zelda thanking Lonk
//CUTSCENE_GAME_END_1C    = _a++; // POST GAME CREDITS
cutscene                = 0;
cutscene_ctr            = 0;
cutscene_part           = 0;
cutscene_timer          = 0;

//GameEnd1B_TO_EXIT_NAME  = RM_NAME_NPALACE+'01'; // this gets set in rm_data_init..
//GameEnd1B_RM_NAME       = Area_WestA+'3B';      // this gets set in rm_data_init..
//NabooruQuest_RM_NAME    = Area_EastA+'59';      // this gets set in rm_data_init..

cutscene_house_built    = 0;


// MKH: Magical Key House
// TSRC: TileSet Row Column
var _TSRC1A = "BE"; // Stone structure tile 1
var _TSRC1B = "BF"; // Stone structure tile 2
var _TSRC1  = _TSRC1A + _TSRC1B;
var _TSRC2  = "DCDD"; // Door awning
var _TSRC3  = _TSRC1 + _TSRC1 + "0404" + _TSRC1 + _TSRC1;

MKH_TSRC_DATA = 
  "00"  +  "00"  + _TSRC1  + _TSRC1 + _TSRC1  +  "00"  + "00"      // row $01
+ "00"  + _TSRC1 + _TSRC1A + _TSRC2 + _TSRC1B + _TSRC1 + "00"      // row $02

                           + _TSRC3                                // row $03
                           + _TSRC3                                // row $04
                           + _TSRC3                                // row $05
                           + _TSRC3                                // row $06
                           + _TSRC3                                // row $07
                           + _TSRC3                                // row $08
                           + _TSRC3                                // row $09
// 
                           + _TSRC3                                // row $0A
                           + _TSRC3                                // row $0B
                           + _TSRC3                                // row $0C
                           + _TSRC3                                // row $0D
                           + _TSRC3                                // row $0E
                           + _TSRC3                                // row $0F
                           + _TSRC3;                               // row $10
//
/* MKH -------------------
0000 BEBF BEBF BEBF 0000 
00BE BFBE DCDD BFBE BF00 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF 
BEBF BEBF 0404 BEBF BEBF
*/

MKH_CLMS = string_length(_TSRC3)>>1;
MKH_ROWS = string_length(MKH_TSRC_DATA) div string_length(_TSRC3);
//MKH_RM_NAME   = undefined; // Gets set in rm_data_init_Town_A()
//MKH_EXIT_NAME = undefined; // Gets set in rm_data_init_Town_A()


















// ----------------------------------------------------------
// --------------------  GameObject  -----------------------------
go_mgr = noone; // GameObjectMgr instance

XP_RISE_DURATION = $20;

// Spawn data is initialized in rm data scr
dm_spawn         = ds_map_create();
dm_spawn_DEFAULT = ds_map_create();














// ----------------------------------------------------------
// --------------------  ENEMY  -----------------------------

dl_Enemy_OBJVER = ds_list_create();
dg_enemy_damage = ds_grid_create(0,0); // w: f.level_lif, h: enemy atk lvl
dg_enemy_damage_DEFAULT = ds_grid_create(0,0);
//dg_enemy_damage_DEFAULT = ds_grid_create(ds_grid_width(dg_enemy_damage),ds_grid_height(dg_enemy_damage));
data_stat_damage();

KILL_COUNT1 = 6;
KILL_COUNT2 = 6;
kill_count1 = 0; // enemy item drop level 1
kill_count2 = 0; // enemy item drop level 2

// For GO.drop_bits
                _a=0;
DROP_JAR1 = $1<<_a++; // Jar magic $10
DROP_JAR2 = $1<<_a++; // Jar magic full
DROP_JAR3 = $1<<_a++; // Jar life  1 container
DROP_JAR4 = $1<<_a++; // Jar life  4 container
DROP_BAG1 = $1<<_a++; // PBag   50
DROP_BAG2 = $1<<_a++; // PBag  100
DROP_BAG3 = $1<<_a++; // PBag  200
DROP_BAG4 = $1<<_a++; // PBag  300
DROP_BOM1 = $1<<_a++; // Bomb 
DROP_BOM2 = $1<<_a++; // Bomb 
DROP_1UP1 = $1<<_a++; // Extra life




BOSS_DEATH_FLASH_CUE = $68;


Ganon1_SPRITE1 = spr_Moai_1a;
Ganon2_SPRITE1 = spr_Ganon_Form2_1a;
Ganon3_SPRITE1 = spr_Slime_Body1_Large1a;
Ganon3_SPRITE2 = spr_Slime_Body1_Large1b;












//AnerA,ArurA,Bot_A,DairA,DoomA,FokkA,FokuA,GeruA,GoriA,GumaA,IrKnA,MagoA,MoblA,OctoA,StalA,Stallakk,TektA,ZoraA
//LowdA,MegmA,Myu_A,WizaA,
//GeldA,GlzmA,
//LeevA,
//BoonA,BubbA,GiruA,Moa_A,Moa_B,
//AttaA,Wheep
//Mau_A
//BagiA
//BagoA
//Boggnipp
//MoblB,WosuA,
//"AcheA01",CappA,DeelA,MagnA,
//MobyA,Ra__A
//Snaraa
//SpTrA

//            dl_RandoENEMIES1=ds_list_create();
//ds_list_add(dl_RandoENEMIES1, "AnerA01","AnerA02","AnerA03");
//ds_list_add(dl_RandoENEMIES1, "ArurA01");
//ds_list_add(dl_RandoENEMIES1, "BlazA02");
//ds_list_add(dl_RandoENEMIES1, "Bot_A01","Bot_A02");
//ds_list_add(dl_RandoENEMIES1, "DairA01","DairA02");
//ds_list_add(dl_RandoENEMIES1, "DoomA01");
//ds_list_add(dl_RandoENEMIES1, "FokkA01","FokkA02");
//ds_list_add(dl_RandoENEMIES1, "FokuA01");
//ds_list_add(dl_RandoENEMIES1, "GeruA01","GeruA02","GeruA03");
//ds_list_add(dl_RandoENEMIES1, "GoriA01","GoriA02","GoriA03");
//ds_list_add(dl_RandoENEMIES1, "GumaA01");
//ds_list_add(dl_RandoENEMIES1, "IrKnA01","IrKnA02","IrKnA03");
//ds_list_add(dl_RandoENEMIES1, "MagoA01");
//ds_list_add(dl_RandoENEMIES1, "MoblA01","MoblA02","MoblA03");
//ds_list_add(dl_RandoENEMIES1, "OctoA01","OctoA02","OctoA03");
//ds_list_add(dl_RandoENEMIES1, "StalA01","StalA02");
//ds_list_add(dl_RandoENEMIES1, "Stallakk01");
//ds_list_add(dl_RandoENEMIES1, "TektA01");
//ds_list_add(dl_RandoENEMIES1, "ZoraA01");
//ds_list_add(dl_RandoENEMIES1, "LowdA01");
//ds_list_add(dl_RandoENEMIES1, "MegmA01");
//ds_list_add(dl_RandoENEMIES1, "Myu_A01");
//ds_list_add(dl_RandoENEMIES1, "WizaA01");
//ds_list_add(dl_RandoENEMIES1, "BoBoA01");
//ds_list_add(dl_RandoENEMIES1, "GeldA01");
//ds_list_add(dl_RandoENEMIES1, "GlzmA01","GlzmA02");
//ds_list_add(dl_RandoENEMIES1, "LeevA01");

//"BoonA01","BubbA01","BubbA02","BubbA08","GiruA01","Moa_A01","Moa_A02","Moa_B01",
//"AttaA01","Wheep01",
//"Mau_A01",
//"BagiA01",
//"Boggnipp01",
//"BagoA01","BagoA02",
//"MoblB01","WosuA01",
//"AcheA01","AcheA02","CappA01","DeelA01","DeelA02","MagnA01",
//"GeruB01",
//"MobyA01","Ra__A01","Ra__A02","Ra__A03",
//"Snaraa01",
//"SpTrA01","SpTrA02","SpTrB01","SpTrB02","SpTrC01","FiRoA01",

// Enemies who have other data for their spawn: BagiA,


RandoEnemy_difficulty_MAX = 1; // will be set in Rando_init_enemy_data() and RandoData_enemy()

dm_RandoEnemy = ds_map_create();
Rando_init_enemy_data();



// The following lists are populated with various enemy's objver.
// An enemy objver must be in one of these lists to qualify to be in enemy rando.
// The lists also categorize these objver to help the enemy rando.
// -------------------------------------------------------------------------
            dl_RandoEnemy_OBJVER_A1 = ds_list_create(); // Enemies that can be defeated with no items and no spells
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(Bot_A)+"01",object_get_name(Bot_A)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(Myu_A)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(LowdA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(MegmA)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(GeldA)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(AnerA)+"01",object_get_name(AnerA)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(OctoA)+"01",object_get_name(OctoA)+"02",object_get_name(OctoA)+"03");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(LeevA)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(WosuA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(Stallakk)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(GoriA)+"01",object_get_name(GoriA)+"02",object_get_name(GoriA)+"03");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(GumaA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(DairA)+"01",object_get_name(DairA)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(DoomA)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(MoblA)+"01",object_get_name(MoblA)+"02",object_get_name(MoblA)+"03");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(StalA)+"01",object_get_name(StalA)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(IrKnA)+"01",object_get_name(IrKnA)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(GeruA)+"01",object_get_name(GeruA)+"02");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(MagoA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(ArurA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(AttaA)+"01");
//ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(Wheep)+"01");
//                                                                                              //
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(GeruA)+"03"); // Blue Geru
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(IrKnA)+"03");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(BoBoA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(AnerA)+"03"); // Fire Aneru
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(FokkA)+"01",object_get_name(FokkA)+"02");
ds_list_add(dl_RandoEnemy_OBJVER_A1, object_get_name(FokuA)+"01");
//                                                                                              //
//                                                                                              //
//                                                                                              //
//                                                                                              //
             dl_RandoEnemy_OBJVER1=ds_list_create(); // Sword-Immune Enemies
ds_list_copy(dl_RandoEnemy_OBJVER1,dl_RandoEnemy_OBJVER_A1);
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(GlzmA)+"01",object_get_name(GlzmA)+"02");
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(TektA)+"01");
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(ZoraA)+"01");
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(WizaA)+"01");
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(BlazA)+"01",object_get_name(BlazA)+"02");
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(FiRoA)+"01"); // Spinning FireRope
ds_list_add( dl_RandoEnemy_OBJVER1, object_get_name(SpTrC)+"01"); // Spinning spike ball
//                                                                                              //
//                                                                                              //
//                                                                                              //
//                                                                                              //
//"BoonA01","BubbA01","BubbA02","BubbA08","GiruA01","Moa_A01","Moa_A02","Moa_B01",
//"AttaA01","Wheep01",
//"Mau_A01",
//"BagoA01","BagoA02",
//"MoblB01","WosuA01",
//"AcheA01","AcheA02","CappA01","DeelA01","DeelA02","MagnA01",
//"MobyA01","Ra__A01","Ra__A02","Ra__A03",
//"SpTrA01","SpTrA02","SpTrB01","SpTrB02","SpTrC01","FiRoA01",
//"BagiA01",
//"Boggnipp01",
//"Snaraa01",
//"GeruB01",
            dl_RandoEnemy_OBJVER2=ds_list_create(); // Flying Enemies
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(BoonA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(BubbA)+"01",object_get_name(BubbA)+"02",object_get_name(BubbA)+"08");
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(GiruA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(Moa_A)+"01",object_get_name(Moa_A)+"02");
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(Moa_B)+"01"); // Fiery Moa
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(MobyA)+"01");
ds_list_add(dl_RandoEnemy_OBJVER2, object_get_name(Ra__A)+"01",object_get_name(Ra__A)+"02",object_get_name(Ra__A)+"03");
//                                                                                              //
//                                                                                              //
//                                                                                              //
//                                                                                              //
            dl_RandoEnemy_OBJVER3=ds_list_create(); // Enemy Spawners
ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpPoA)+"01"); // PoisonBubbleSpawner
ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpRoA)+"01"); // RockSpawner
ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpBaA)+"01"); // BagoSpawner
ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpMaA)+"01"); // MauSpawner
ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpMoA)+"01"); // MobySpawner
//                                                                                              //
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpGrA)+"01"); // GruntSpawner
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpWoA)+"01"); // WosuSpawner
//                                                                                              //
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(Spawner_Boggnipp)+"01"); // BoggnippSpawner
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpBlA)+"01"); // BlockSpawner
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpBuA)+"01"); // BulletSpawner
//ds_list_add(dl_RandoEnemy_OBJVER3, object_get_name(SpDrA)+"01"); // DropSpawner
//                                                                                              //
//                                                                                              //
//                                                                                              //
//                                                                                              //

















// ----------------------------------------------------------
// --------------------  NPC  -----------------------------


dm_town = ds_map_create();
init_data_town_1a();

dm_NPC = ds_map_create();
dg_NPC_SPR = ds_grid_create($00,$02);
NPC_data_init();

// Sets to false at beginning of each frame.
// Sets to true at moment of dialogue activation through an NPC.
// This is so NPC Healers, Savers, and Special Walkers can 
// take priority over Traffic NPC for dialogue activation, 
// interupting a lower tier dialogue priority.
dialogue_started_this_frame = false;







// ----------------------------------------------------------
// --------------  INIT GameObject DATA  -----------------
dm_go_scr  = ds_map_create(); // go scrs: Game Object Scripts
dm_go_prop = ds_map_create(); // GameObjectB/Entity

// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------

ChangeRoom_LEAVE_DURATION1 = $09;
ChangeRoom_LEAVE_DURATION2 = $05; // For falling scene
ChangeRoom_ENTER_DURATION1 = $22;
ChangeRoom_timer = 0;
//ChangeRoom_timer_extra = 0;


FallScene_INACTIVE  = -1;
FallScene_DURATION1 = $6D; // $6D = 109
FallScene_timer     = FallScene_INACTIVE;

EnterRoom_DURATION_SIDE = 9;
EnterRoom_DURATION_ELEV = $FF;
EnterRoom_DURATION_DOOR = 0;
EnterRoom_control_timer = EnterRoom_DURATION_DOOR; // 0503

EnterRoom_SpawnGO_DELAY = 2;
EnterRoom_SpawnGO_timer = 0;


last_dist_from_view_x = 0; // For Death flash screen
last_dist_from_view_y = 0; // For Death flash screen
last_pc_x      = 0; // For Death flash screen
last_pc_y      = 0; // For Death flash screen
last_pc_xscale = 1; // For Death flash screen



//DialogueDK_MIDO_CHURCH_DOOR = "undefined";









dg_BODY_HB = ds_grid_create($FF, 5);
init_body_hb_data();


dg_ShieldHB = ds_grid_create($0B, 5);
init_shield_hb_data();


dg_CS_OFF = ds_grid_create($00, $12);
init_cs_points_data();


dl_HP = ds_list_create();
dl_HP_DEFAULT = ds_list_create();
init_data_hp(); // dl_HP


dl_XP = ds_list_create();
dl_XP_DEFAULT = ds_list_create();
dl_XP_DRAIN = ds_list_create();
dl_rising_xp_spr = ds_list_create();
init_data_xp(); // dl_XP, dl_XP_DRAIN, dl_rising_xp_spr







// -----------------------------------------------------------------
// GUI WINDOW  ----------------------------------------------
gui_window_can_draw = 0;

                      _a=0;
gui_state_NONE      = _a++; // 
gui_state_PAUSE     = _a++; // PauseMenu(spell menu, inventory, map)
gui_state_LEVEL_UP  = _a++; // LevelUpMenu
gui_state_DIALOGUE1 = _a++; // DialogueWindow
gui_state_DIALOGUE2 = _a++; // DialogueWindow
gui_state_DIALOGUE3 = _a++; // DialogueWindow
gui_state_OPTIONS   = _a++; // OptionsMenu
gui_state_QUIT_APP  = _a++; // QuitAppMenu
gui_state_EDIT_PAL  = _a++; // PaletteEditor
gui_state_GEE       = _a++; // GraphicsEffectsEditor
gui_state           = gui_state_NONE; // 074C. GUI Window. 1 PauseMenu, 2 LevelUp, 3 Dialogue


menu_state       = 0; // 0524
menu_built_count = 0; // 0525
dialogue_source  = noone; // Sort of 048B
//dlg_uIdx         = -1; // 048B
temp_timer1      = 0; // b/c don't have sound yet
level_up_timer   = 0; // For pre-sound only
level_up_idx     = 2; // 074E. Level Up menu selector Index


// The instances are created in obj_start_Create()
PAUSE_MENU      = 0; // Pause/Spell Menu instance
LEVEL_MENU      = 0; // Level Up menu instance
DIALOGUE_WINDOW = 0; // Dialogue Window instance
QUIT_APP_MENU   = 0; // Quit App Menu instance












// ================================================================
// RANDO ------------------------------------------

RandoSeedChar_COUNT = 8; // 8 nybbles, each $0-F, total variations 518,918,400 (16*15*14*13*12*11*10*9)
//                                                                              //
            dl_rando_seed_SPRITES = ds_list_create();                     _default = spr_Flame1;
// $0-$3
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_CANDLE  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_GLOVE   +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_RAFT    +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_BOOTS   +STR_Sprite], _default));
// $4-$7                                                                        //
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_FLUTE   +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_CROSS   +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_HAMMER  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_BRACELET+STR_Sprite], _default));
// $8-$B                                                                        //
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_MIRROR  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_FLOWER  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_BOOK    +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_MEAT    +STR_Sprite], _default));
// $C-$F                                                                        //
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_SHIELD  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_ALLKEY  +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_PENDANT +STR_Sprite], _default));
ds_list_add(dl_rando_seed_SPRITES, val(dm_ITEM[?STR_SWORD   +STR_Sprite], _default));
//                                                                              //














// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
//db_test_various_1a(); // for testing various basic coding things

// *** You can also full search for "ds_grid_create" to find the order grids have been created.
//debug_ds_grids_1a();
/* Grid Indices As Of 2025/05/28:
  dg_YxY_:                  0
  dg_tile_anim:             1
  dg_anim_liquid:           2
  dg_anim_clouds:           3
  dg_RmTile_solid:          4
  dg_RmTile_solid_def:      5
  dg_RmTile_Break:          6
  dg_RmTile_Break_def:      7
  dg_RmTile_Liquid:         8
  dg_RmTile_Liquid_def:     9
  dg_RmTile_Current:       10
  dg_RmTile_Current_def:   11
  dg_RmTile_TempSolid:     12
  dg_RmTile_Spike:         13
  dg_RmTile_Spike_def:     14
  dg_StarSky_data:         15
  dg_spawn_prxm:           16
  dg_spawn_prio:           17
  dg_spell_cost:           18
  dg_spell_cost_DEFAULT:   19
  dg_enemy_damage:         20
  dg_enemy_damage_DEFAULT: 21
  dg_NPC_SPR:              22
  dg_BODY_HB:              23
  dg_ShieldHB:             24
  dg_CS_OFF:               25
*/

//db_spawnData_Automate_code_1a();

//dev_automate_tile_layer_data();




ds_list_destroy(_dl_1); _dl_1=undefined;




if (DEV)
{
    show_debug_message("g_Create() END. "+string(current_time-_START_TIME));
    repeat(1) show_debug_message("");
}




