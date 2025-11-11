/// FileSelect_Create_Rando()


var _i,_j, _a, _idx, _val, _count, _dist1,_dist2;
var _x,_y, _X,_Y, _xl,_yt;
var _len, _font_sprite, _char_size;


Rando_failed = false;


RandoOptions_PAD1   = $04;
RandoOptions_Y_DIST = $08 + RandoOptions_PAD1;
RandoOptions_X      = $14<<3;
//RandoOptions_X      = $18<<3;

RandoOptions_YOFF1  = RANDO_YOFF2;
RandoOptions_Y      = $11<<3;
RandoOptions_Y     += -g.VIEW_Y_TILE_OFF; // VIEW_Y_TILE_OFF=2
RandoOptions_Y     += RandoOptions_YOFF1; // micro adj
RandoOptions_Y     += RANDO_YOFF1;

RandoDescription_XL  = $04<<3;
RandoDescription_YT  = viewH();
RandoDescription_YT += -($03<<3);
RandoDescription_YT += $04;

RandoGrid_H = 8;

BACK_PAD1 = $4;



                     _i=0;
RandoState_MAIN    = _i++; // NOT in a substate, like ITEM
RandoState_ITEM    = _i++; // Player is changing item rando settings
RandoState_SPELL   = _i++; // Spells
RandoState_DUNGEON = _i++; // 
RandoState_ENEMY   = _i++; // 
RandoState_OTHER   = _i++; // 
RandoState_SEED    = _i++; // Player is inputting seed
RandoState         = RandoState_MAIN;




dm_rando_SETTINGS = ds_map_create();
dm_rando_settings = ds_map_create();
//dm_rando_SETTINGS[?"MAIN"+hex_str(RandoMAIN_ITEMS)+"_X"] = _X;
//dm_rando_SETTINGS[?"MAIN"+hex_str(RandoMAIN_ITEMS)+"_Y"] = _Y+(RandoMAIN_ITEMS*RandoOptions_Y_DIST);
/*
                      _i=0;
RandoMAIN_ITEMS     = _i++;
RandoMAIN_SPELLS    = _i++;
RandoMAIN_ENEMIES   = _i++;
//RandoMAIN_OVERWORLD = _i++;
RandoMAIN_LVLCOST   = _i++;
RandoMAIN_XP        = _i++;
RandoMAIN_UP_A_XP_PENALTY = _i++;
RandoMAIN_PALETTE   = _i++;
RandoMAIN_OTHER     = _i++;
RandoMAIN_SEED      = _i++;
RandoMAIN_BACK      = _i++;
RandoMAIN_COUNT     = _i;
RandoMAIN_cursor    = RandoMAIN_ITEMS;
*/




var _HANDICAP_TEXT = "NOTE: THIS IS A HANDICAP AND DOES NOT AFFECT THE RANDOMIZATION LOGIC";
//var _HANDICAP_TEXT = "NOTE: THIS IS A HANDICAP AND DOES NOT AFFECT THE RANDOMIZATION PROCESS";


_X = RandoOptions_X;
_Y = RandoOptions_Y;

RandoMAIN_FONT_SPRITE=spr_Font2;
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoMAIN_FONT_SPRITE);
_dist1 = _char_size+4;




dg_RandoMAIN_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
_idx = -1;
RandoMAIN_ITEMS = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0]  = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2]  = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3]  = "ITEMS";  // 3: text
dg_RandoMAIN_Options[#_idx,4]  = "ITEM RANDO SETTINGS"; // 
//dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"FLUTE WARPING: HOLD THE CAST MAGIC BUTTON WHEN PLAYING THE FLUTE TO WARP TO VISITED TOWNS.";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: WITH THE FLUTE ITEM, YOU CAN WARP TO VISITED TOWNS.";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"HOLD THE CAST MAGIC BUTTON, THEN PRESS THE FLUTE BUTTON TO SEQUENCE THROUGH TOWNS.";
//dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+"HOLD THE CAST MAGIC BUTTON WHEN PLAYING THE FLUTE TO WARP";
//                                                          //
RandoMAIN_SPELLS = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0] = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2] = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3] = "SPELLS"; // 3: text
dg_RandoMAIN_Options[#_idx,4] = "SPELL RANDO SETTINGS"; // 
//                                                          //
RandoMAIN_ENEMIES = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0] = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2] = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3] = "ENEMIES"; // 3: text
dg_RandoMAIN_Options[#_idx,4] = "ENEMY RANDO SETTINGS"; // 
//                                                          //
RandoMAIN_DUNGEONS = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0] = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2] = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3] = "DUNGEONS AND TOWNS"; // 3: text
dg_RandoMAIN_Options[#_idx,4] = "DUNGEON AND TOWN RANDO SETTINGS"; // 
//dg_RandoMAIN_Options[#_idx,3] = "DUNGEONS"; // 3: text
//dg_RandoMAIN_Options[#_idx,4] = "DUNGEON RANDO SETTINGS"; // 
//                                                          //
RandoMAIN_LVLCOST = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0] = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2] = 0;       // 2: state
dg_RandoMAIN_Options[#_idx,3] = "LEVEL COSTS";// 3: text
dg_RandoMAIN_Options[#_idx,4] = "LEVEL COST VARIATION:"+g.CHAR_END_LINE3+"-25% TO +25%"; // 
//                                                          //
RandoMAIN_XP = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0] = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2] = 0;       // 2: state
dg_RandoMAIN_Options[#_idx,3] = "XP";// 3: text
dg_RandoMAIN_Options[#_idx,4] = "ENEMY XP AND PBAG XP VARIATION:"+g.CHAR_END_LINE3+"-25% TO +25%"; // 
//dg_RandoMAIN_Options[#_idx,4] = "ENEMY XP AND PBAG XP VARIATION:"+g.CHAR_END_LINE3+"+/- 25%"; // 
//dg_RandoMAIN_Options[#_idx,4] = "XP DROP AMOUNT VARIATION:"+g.CHAR_END_LINE3+"+/- 25%"; // 
//                                                          //
RandoMAIN_OTHER = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0]  = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,2]  = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3]  = "OTHER";   // 3: text
dg_RandoMAIN_Options[#_idx,4]  = "-GAME OVER WARPING PENALTY";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-RANDOMIZE COLORS";
//dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-RANDOMIZE DUNGEON TILSETS";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-START QUEST";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-START LEVELS";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-START ITEMS";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-START SPELLS";
dg_RandoMAIN_Options[#_idx,4] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-VARIOUS REQUIREMENTS";
//                                                          //
// I believe the number of possibilities is 518,918,400 (16*15*14*13*12*11*10*9)
RandoMAIN_SEED = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0]  = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,1] += $4; // extra space for item sprites
dg_RandoMAIN_Options[#_idx,2]  = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3]  = "SEED";   // 3: text
dg_RandoMAIN_Options[#_idx,4]  = "EDIT RANDOMIZATION SEED"; // 
//                                                          //
RandoMAIN_BACK = ++_idx;
ds_grid_resize(dg_RandoMAIN_Options, _idx+1,RandoGrid_H);
dg_RandoMAIN_Options[#_idx,0]  = _X;       // 0: x
dg_RandoMAIN_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoMAIN_Options[#_idx,1] += $8;
dg_RandoMAIN_Options[#_idx,1] += $2; // extra space for BACK
dg_RandoMAIN_Options[#_idx,2]  = 0;        // 2: state
dg_RandoMAIN_Options[#_idx,3]  = "DONE";   // 3: text
dg_RandoMAIN_Options[#_idx,4]  = 0; // 
//                                                          //

RandoMAIN_COUNT = ds_grid_width(dg_RandoMAIN_Options);
RandoMAIN_cursor = 0;
FileSelect_Rando_cursor_reset(RandoState_MAIN);

_len = 0;
for(_i=0; _i<RandoMAIN_COUNT; _i++) _len = max(_len, string_length(dg_RandoMAIN_Options[#_i,3]));
_len += 4; // For YES/NO/ON/OFF + 1 space

_xl  = viewXC() - ((_char_size*_len)>>1);
_xl  = min(_xl,Area1_XL+_char_size); // Area1_XL: Left edge of main save file area
_xl += _char_size*2;
//_xl = min(_xl,Area1_XL); // Area1_XL: Left edge of main save file area
for(_i=0; _i<RandoMAIN_COUNT; _i++) dg_RandoMAIN_Options[#_i,0] = _xl;






enum ZELDA_HINT_OPTIONS
{
    NONE,
    FLUTE,
    ALLKEY,
    JUMP,
    COUNT
}

_X = dg_RandoMAIN_Options[#0,0];

dg_RandoITEM_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
                      _idx = -1;
RandoITEM_LOCS    = ++_idx; // LOCS: Locations
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0]  = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2]  = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3]  = "GENERAL ITEMS";  // 3: text
//dg_RandoITEM_Options[#_idx,3]  = "ITEM LOCATIONS";  // 3: text
dg_RandoITEM_Options[#_idx,4]  = "ITEMS INCLUDED IN THE MIX:"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,4]  = "SHUFFLE LOCATIONS FOR:"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-MAIN ITEMS"      +g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-QUEST ITEMS"     +g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-TREASURE MAPS"   +g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,4] += "MAP ITEMS"       +g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-CONTAINER PIECES"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-1UP DOLLS"       +g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,4] = "SHUFFLE LOCATIONS FOR: MAIN ITEMS, QUEST ITEMS,";
//dg_RandoITEM_Options[#_idx,5] = "MAP ITEMS, CONTAINER PIECES, 1UP DOLLS";
//                                                          //
RandoITEM_PBAG    = ++_idx;
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0] = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2] = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3] = "PBAGS";  // 3: text
dg_RandoITEM_Options[#_idx,4] = "INCLUDE PBAGS IN THE MIX";
//dg_RandoITEM_Options[#_idx,3] = "PBAG LOCATIONS";  // 3: text
//dg_RandoITEM_Options[#_idx,4] = "PBAGS INCLUDED IN THE LOCATION MIX";
//                                                          //
RandoITEM_KEYS    = ++_idx;
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0]  = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2]  = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3]  = "KEY-SANITY";  // 3: text
dg_RandoITEM_Options[#_idx,4]  = "INCLUDE KEYS IN THE MIX";
//dg_RandoITEM_Options[#_idx,4] = "KEYS INCLUDED IN THE LOCATION MIX";
dg_RandoITEM_Options[#_idx,5]  = "TO VIEW KEY INFO: OPEN THE SPELL MENU AND HOLD XBOX-Y BUTTON.";
//dg_RandoITEM_Options[#_idx,5]  = "TO VIEW KEY INFO: OPEN THE SPELL MENU AND HOLD YOUR EQUIVILENT OF XBOX-Y BUTTON.";
dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: THIS WILL FORCE THE ALLKEY TO ITS VANILLA LOCATION.";
//dg_RandoITEM_Options[#_idx,5] = "NOTE: THIS WILL FORCE THE ALLKEY TO ITS VANILLA LOCATION, WHICH IS THE BOTTOM LEFT OF THE GREAT PALACE.";
//                                                          //
RandoITEM_OBSCURE_LOCS = ++_idx; // 
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0] = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2] = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3] = "LIMIT OBSCURE LOCATIONS";  // 3: text
dg_RandoITEM_Options[#_idx,4] = "SOME ITEM LOCATIONS ARE OBSCURE, MAKING THE TIME IT TAKES TO GET TO ONE FAIRLY LENGTHY. THIS SETTING LIMITS THE CHANCE A PROGRESSION ITEM WILL BE AT ONE.";
//dg_RandoITEM_Options[#_idx,4] = "THE TIME IT TAKES TO GET TO CERTAIN LOCATIONS CAN BE QUITE LOP-SIDED, SO THIS LIMITS THE CHANCE A PROGRESSION ITEM WILL BE AT ONE.";
//SOME ITEM LOCATIONS ARE OBSCURE MAKING THE TIME IT TAKES TO GET TO ONE FAIRLY LENGTHY. THIS LIMITS THE CHANCE A PROGRESSION ITEM WILL BE AT ONE.
//LIMIT THE CHANCE A REQUIRED ITEM WILL BE AT 
//THE TIME TO GET TO SOME ITEM LOCATIONS CAN BE SUBSTANTIALLY MORE THAN OTHERS, SO THIS LIMITS THE CHANCE A REQUIRED ITEM WILL BE AT ONE
//dg_RandoITEM_Options[#_idx,4] = "LIMIT THE CHANCE OBSCURE LOCATIONS CAN HAVE A REQUIRED ITEM";
//dg_RandoITEM_Options[#_idx,5] = "2: ANY AVAILABLE LOCATION COULD HAVE A REQUIRED ITEM";
//dg_RandoITEM_Options[#_idx,5] = "2: ALL AVAILABLE LOCATIONS HAVE AN EQUAL CHANCE FOR AN ITEM";
//LIMIT THE CHANCE OBSCURE LOCATIONS CAN HAVE A REQUIRED ITEM
//OBSCURE LOCATIONS ARE NOT LIMITED
//                                                          //
RandoITEM_DARKROOM = ++_idx; // Darkroom difficulty
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0]  = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2]  = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3]  = "DARK ROOM DIFFICULTY"; // 3: text
//THERE ARE MANY ITEM LOCATIONS WHERE THE PLAYER IS FORCED TO TRAVERSE AT LEAST ONE ROOM THAT IS DARK WITHOUT THE CANDLE OR THE FIRE SPELL.
dg_RandoITEM_Options[#_idx,4]  = "0(VANILLA): PROGRESSION ITEMS CAN BE LOCKED BEHIND DARK ROOMS AT A HANDFULL OF LOCATIONS:"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,4]  = "0(NORMAL): PROGRESSION ITEMS CAN BE LOCKED BEHIND;";
dg_RandoITEM_Options[#_idx,4] += "-THE CAVE S OF NORTH CASTLE"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,4] += "-SEVERAL LOCATIONS BEYOND CAVE BETWEEN RAURU WOODS AND PARAPA DESERT"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,4] += "PARAPA PALACE VANILLA 1ST KEY";
//dg_RandoITEM_Options[#_idx,4] += "PARAPA PALACE ITEM(VANILLA CANDLE LOCATION)";
//dg_RandoITEM_Options[#_idx,4] += "";
dg_RandoITEM_Options[#_idx,4] += g.CHAR_END_LINE3+"1: PROGRESSION ITEMS CAN BE LOCKED BEHIND DARK ROOMS OF MODERATE DIFFICULTY";
//dg_RandoITEM_Options[#_idx,4] += g.CHAR_END_LINE3+"1: PROGRESSION ITEMS CAN BE LOCKED BEHIND SOME DARK ROOMS WITH MODERATE DIFFICULTY";
//dg_RandoITEM_Options[#_idx,4] += "1: PROGRESSION ITEMS CAN BE LOCKED BEHIND SOME DARK ROOMS";
dg_RandoITEM_Options[#_idx,5]  = "2: PROGRESSION ITEMS CAN BE LOCKED BEHIND ANY DARK ROOM";
//                                                          //
RandoITEM_HINTS   = ++_idx; // 
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0] = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2] = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3] = "ITEM HINTS"; // 3: text
dg_RandoITEM_Options[#_idx,4] = "NPCS AND DIALOGUE OBJECTS WITH A '?' ABOVE THEM WILL GIVE A HINT TO THE LOCATION OF AN ITEM";
dg_RandoITEM_Options[#_idx,5] = "TO VIEW FOUND HINTS: OPEN THE SPELL MENU AND HOLD XBOX-B BUTTON.";
/*
dg_RandoITEM_Options[#_idx,4] = "SOME NPCS GIVE A HINT TO THE LOCATION OF AN ITEM";
//dg_RandoITEM_Options[#_idx,4] = "SOME NPCS GIVE A HINT TO THE LOCATION OF A PROGRESSION ITEM";
//dg_RandoITEM_Options[#_idx,4] = "SOME NPCS GIVE A HINT TO THE LOCATION OF A UNIQUE ITEM";
dg_RandoITEM_Options[#_idx,5]  = "NPCS THAT COULD GIVE A HINT:"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += "-CERTAIN ONES STANDING AROUND"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += "-UNIQUE WALKERS"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += "-SARIA CEMETERY GRAVE"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,5] += "-SARIA CEMETERY'S EDRICK GRAVE"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += "-INVISIBLE NPC IN A NEW KASUTO HOUSE"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += "-INVISIBLE NPC IN A OLD KASUTO HOUSE"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,5] += "-INVISIBLE DIALOGUE IN THE NEW KASUTO HOUSE"+g.CHAR_END_LINE3;
//dg_RandoITEM_Options[#_idx,5] += "-INVISIBLE DIALOGUE IN THE NEW KASUTO HOUSE"+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+"NOTE: NONE OF THE COMMON/GENERIC TRAFFIC NPC WALKERS WILL HAVE A HINT."+g.CHAR_END_LINE3;
dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+"TO VIEW FOUND HINTS: OPEN THE SPELL MENU AND HOLD YOUR EQUIVILENT OF 'XBOX-Y'";
//dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+"TO VIEW THE HINTS YOU'VE FOUND: OPEN THE SPELL MENU AND HOLD YOUR EQUIVILENT OF THE 'XBOX Y'";
//dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+"VIEW A LIST OF THE HINTS YOU'VE GOTTEN BY OPENING THE SPELL MENU AND HOLD YOUR EQUIVILENT OF THE 'XBOX Y'";
*/
//                                                          //
RandoITEM_ZELDA_HINT = ++_idx; // Zelda gives a hint to something good
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0]  = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,2]  = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3]  = "ZELDA HINT"; // 3: text
dg_RandoITEM_Options[#_idx,4]  = "FLUTE: ZELDA GIVES A HINT TO THE LOCATION OF THE FLUTE."+g.CHAR_END_LINE3+"NOTE THAT IF YOU START WITH THE FLUTE, THIS HINT WILL BE USELESS.";
dg_RandoITEM_Options[#_idx,5]  = "ALLKEY: ZELDA GIVES A HINT TO THE LOCATION OF THE ALLKEY."+g.CHAR_END_LINE3+"THIS OPTION IS NOT AVAILABLE WITH KEY-SANITY TURNED ON.";
dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"JUMP TOWN: ZELDA GIVES A HINT TO WHICH TOWN THE JUMP SPELL IS IN";
dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"TO VIEW FOUND HINTS: OPEN THE SPELL MENU AND HOLD XBOX-B BUTTON.";
//dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: THE ALLKEY HINT WILL NOT BE AVAILABLE WITH KEY-SANITY TURNED ON BECAUSE THE ALLKEY WILL BE IN ITS VANILLA LOCATION.";
//dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: IF YOU START WITH THE FLUTE, THE FLUTE HINT WILL BE USELESS.";
//dg_RandoITEM_Options[#_idx,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: IF YOU START WITH THE FLUTE, THE FLUTE HINT WILL BE USELESS AND YOU WILL NEED TO MANUALLY CHANGE ZELDA HINT TO A DIFFERENT OPTION.";
//                                                          //
RandoITEM_BACK     = ++_idx;
ds_grid_resize(dg_RandoITEM_Options, _idx+1,RandoGrid_H);
dg_RandoITEM_Options[#_idx,0]  = _X;       // 0: x
dg_RandoITEM_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoITEM_Options[#_idx,1] += BACK_PAD1;
dg_RandoITEM_Options[#_idx,2]  = 0;        // 2: state
dg_RandoITEM_Options[#_idx,3]  = "BACK";   // 3: text
dg_RandoITEM_Options[#_idx,4]  = 0;
//                                                          //
RandoITEM_COUNT  = _idx+1;
RandoITEM_cursor = RandoITEM_LOCS;


// 0: NONE, 1: ALLKEY LOCATION, 2: JUMP TOWN
//RandoITEM_ZELDA_HINT_COUNT = 3;



ItemLocations_DARKROOM_DIFFICULTY = 0;

//_X  = RandoOptions_X;
//_X += $00<<3;
////_X += $01<<3;
_X = dg_RandoMAIN_Options[#0,0];

_Y  = RandoOptions_Y;
_Y += $00<<3;
//_Y  =($11<<3) - $01;

RandoITEM_FONT_SPRITE = spr_Font2;
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoITEM_FONT_SPRITE);
_dist1 = _char_size<<1;




/*
dg_RandoITEM_Options[#RandoITEM_EVEN_SPREAD,0] = _X;       // 0: x
dg_RandoITEM_Options[#RandoITEM_EVEN_SPREAD,1] = _Y+((RandoITEM_EVEN_SPREAD<<1)<<3); // 1: y
dg_RandoITEM_Options[#RandoITEM_EVEN_SPREAD,2] = 1;        // 2: state
dg_RandoITEM_Options[#RandoITEM_EVEN_SPREAD,3] = "LOCATION CATEGORY EQUAL CHANCE";  // 3: text
dg_RandoITEM_Options[#RandoITEM_EVEN_SPREAD,4] = "USES LOCATION CATEGORIES TO HELP BETTER SPREAD ITEMS";
//                                                          //
dg_RandoITEM_Options[#RandoITEM_LESS_OBSCURE,0] = _X;       // 0: x
dg_RandoITEM_Options[#RandoITEM_LESS_OBSCURE,1] = _Y+((RandoITEM_LESS_OBSCURE<<1)<<3); // 1: y
dg_RandoITEM_Options[#RandoITEM_LESS_OBSCURE,2] = 1;        // 2: state
dg_RandoITEM_Options[#RandoITEM_LESS_OBSCURE,3] = "LESS OBSCURE LOCATIONS";  // 3: text
dg_RandoITEM_Options[#RandoITEM_LESS_OBSCURE,4] = "REQUIRED ITEMS LESS LIKELY PLACED AT OBSCURE LOCATIONS";
//                                                          //
dg_RandoITEM_Options[#RandoITEM_BLOCK1,0] = _X;       // 0: x
dg_RandoITEM_Options[#RandoITEM_BLOCK1,1] = _Y+((RandoITEM_BLOCK1<<1)<<3); // 1: y
dg_RandoITEM_Options[#RandoITEM_BLOCK1,2] = 1;        // 2: state
dg_RandoITEM_Options[#RandoITEM_BLOCK1,3] = "EXTRA REQUIREMENT FOR WHALE ISL";  // 3: text
dg_RandoITEM_Options[#RandoITEM_BLOCK1,4] = "JUMP OR FAIRY REQUIRED TO OPEN WHALE ISL";
//                                                          //
dg_RandoITEM_Options[#RandoITEM_BLOCK2,0] = _X;       // 0: x
dg_RandoITEM_Options[#RandoITEM_BLOCK2,1] = _Y+((RandoITEM_BLOCK2<<1)<<3); // 1: y
dg_RandoITEM_Options[#RandoITEM_BLOCK2,2] = 1;        // 2: state
dg_RandoITEM_Options[#RandoITEM_BLOCK2,3] = "MIDORO AREA EXTRA ACCESS";  // 3: text
dg_RandoITEM_Options[#RandoITEM_BLOCK2,4] = "GLOVE AND BRACELET CAN ACCESS MIDORO/SARIA AREA";
//                                                          //
dg_RandoITEM_Options[#RandoITEM_BLOCK3,0] = _X;       // 0: x
dg_RandoITEM_Options[#RandoITEM_BLOCK3,1] = _Y+((RandoITEM_EVEN_SPREAD<<1)<<3); // 1: y
dg_RandoITEM_Options[#RandoITEM_BLOCK3,2] = 1;        // 2: state
dg_RandoITEM_Options[#RandoITEM_BLOCK3,3] = "MIDO AREA EXTRA ACCESS";  // 3: text
dg_RandoITEM_Options[#RandoITEM_BLOCK3,4] = "FIRE CAN ACCESS MIDO AREA";
*/
//                                                          //

FileSelect_Rando_cursor_reset(RandoState_ITEM);








                      _i=0;
RandoSPELL_LOCS     = _i++; // LOCS: Locations
RandoSPELL_COST     = _i++;
RandoSPELL_BACK     = _i++;
RandoSPELL_COUNT    = _i;
RandoSPELL_cursor   = 0;

_X = dg_RandoMAIN_Options[#0,0];
//_X  = RandoOptions_X;
//_X += $00<<3;
////_X += $01<<3;

_Y  = RandoOptions_Y;
//_Y += $02<<3;
//_Y  =($11<<3) - $01;

RandoSPELL_FONT_SPRITE=spr_Font2;
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoSPELL_FONT_SPRITE);
_dist1 = _char_size<<1;


dg_RandoSPELL_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoSPELL_Options, ds_grid_width(dg_RandoSPELL_Options)+1, ds_grid_height(dg_RandoSPELL_Options));
dg_RandoSPELL_Options[#RandoSPELL_LOCS,0] = _X;       // 0: x
dg_RandoSPELL_Options[#RandoSPELL_LOCS,1] = _Y+(RandoSPELL_LOCS*_dist1); // 1: y
dg_RandoSPELL_Options[#RandoSPELL_LOCS,2] = 0;        // 2: state
dg_RandoSPELL_Options[#RandoSPELL_LOCS,3] = "TOWN SPELL";  // 3: text
dg_RandoSPELL_Options[#RandoSPELL_LOCS,4] = "SHUFFLE WHICH SPELL A WISE MAN WILL GIVE YOU";
//dg_RandoSPELL_Options[#RandoSPELL_LOCS,4] = "SHUFFLE WHICH SPELL A TOWN GIVES YOU";
//dg_RandoSPELL_Options[#RandoSPELL_LOCS,4] = "WHICH SPELL YOU GET FROM A TOWN IS SHUFFLED";
//                                                          //
ds_grid_resize(dg_RandoSPELL_Options, ds_grid_width(dg_RandoSPELL_Options)+1, ds_grid_height(dg_RandoSPELL_Options));
dg_RandoSPELL_Options[#RandoSPELL_COST,0] = _X;       // 0: x
dg_RandoSPELL_Options[#RandoSPELL_COST,1] = _Y+(RandoSPELL_COST*_dist1); // 1: y
dg_RandoSPELL_Options[#RandoSPELL_COST,2] = 0;        // 2: state
dg_RandoSPELL_Options[#RandoSPELL_COST,3] = "SPELL COSTS"; // 3: text
dg_RandoSPELL_Options[#RandoSPELL_COST,4] = "COST VARIATION:"+g.CHAR_END_LINE3+"-25% TO +10%";
//                                                          //
ds_grid_resize(dg_RandoSPELL_Options, ds_grid_width(dg_RandoSPELL_Options)+1, ds_grid_height(dg_RandoSPELL_Options));
dg_RandoSPELL_Options[#RandoSPELL_BACK,0]  = _X;       // 0: x
dg_RandoSPELL_Options[#RandoSPELL_BACK,1]  = _Y+(RandoSPELL_BACK*_dist1); // 1: y
dg_RandoSPELL_Options[#RandoSPELL_BACK,1] += BACK_PAD1;
dg_RandoSPELL_Options[#RandoSPELL_BACK,2]  = 0;        // 2: state
dg_RandoSPELL_Options[#RandoSPELL_BACK,3]  = "BACK";   // 3: text
dg_RandoSPELL_Options[#RandoSPELL_BACK,4]  = 0;
//                                                          //
FileSelect_Rando_cursor_reset(RandoState_SPELL);
//                                                          //
Rando_start_spells = 0;












_X = dg_RandoMAIN_Options[#0,0];
//_X  = RandoOptions_X;
//_X += $00<<3;

_Y  = RandoOptions_Y;
//_Y += $02<<3;

RandoDUNGEON_FONT_SPRITE = spr_Font2;
//_font_sprite = spr_Font2;
//_char_size = sprite_get_height(RandoDUNGEON_FONT_SPRITE);
_dist1 = sprite_get_height(RandoDUNGEON_FONT_SPRITE)<<1;


dg_RandoDUNGEON_Options = ds_grid_create(0,RandoGrid_H);
_i=-1;
//                                                          //
RandoDUNGEON_DIFF  = -1;
/*
RandoDUNGEON_DIFF  = ++_i; // DIFFICULTY
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0] = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1] = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,2] = 1;        // 2: state
dg_RandoDUNGEON_Options[#_i,3] = "DIFFICULTY";  // 3: text
dg_RandoDUNGEON_Options[#_i,4] = "DIFFICULTY OF THE DUNGEONS";
*/
//                                                          //
RandoDUNGEON_ROOM  = -1;
/*
RandoDUNGEON_ROOM  = ++_i;
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0] = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1] = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,2] = -1;        // 2: state
dg_RandoDUNGEON_Options[#_i,3] = "DUNGEON ROOMS";  // 3: text
dg_RandoDUNGEON_Options[#_i,4] = "RANDOMIZE DUNGEON ROOMS";
dg_RandoDUNGEON_Options[#_i,5] = "- CURRENTLY UNAVAILABLE";
*/
//                                                          //
RandoDUNGEON_LOCATION = ++_i;
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0] = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1] = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,2] = 0;        // 2: state
dg_RandoDUNGEON_Options[#_i,3] = "SHUFFLE DUNGEON LOCATIONS";
//dg_RandoDUNGEON_Options[#_i,3] = "SHUFFLE DUNGEONS";
//dg_RandoDUNGEON_Options[#_i,3] = "DUNGEON LOCATIONS"; // 3: text
dg_RandoDUNGEON_Options[#_i,4] = "- ASSIGNS EACH OVERWORLD DUNGEON TILE A DUNGEON FROM A SHUFFLED LIST";
//dg_RandoDUNGEON_Options[#_i,4] = "- EACH DUNGEON IN THE OVERWORLD TAKES YOU TO A DUNGEON FROM A SHUFFLED LIST";
dg_RandoDUNGEON_Options[#_i,5] = "- REQUIRES ITEM RANDO ENABLED"+g.CHAR_END_LINE3;
dg_RandoDUNGEON_Options[#_i,5]+= g.CHAR_END_LINE3;
dg_RandoDUNGEON_Options[#_i,5]+= "- INCLUDES THE 7 1ST QUEST DUNGEONS IN THE SHUFFLE";
//                                                          //
RandoDUNGEON_BOSS     = ++_i;
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0] = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1] = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,2] = 0;        // 2: state
dg_RandoDUNGEON_Options[#_i,3] = "SHUFFLE DUNGEON BOSSES"; // 3: text
//dg_RandoDUNGEON_Options[#_i,3] = "DUNGEON BOSSES"; // 3: text
dg_RandoDUNGEON_Options[#_i,4] = "- ASSIGNS EACH ONE OF THE 6 CRYSTAL DUNGEONS A BOSS FROM A SHUFFLED LIST";
//dg_RandoDUNGEON_Options[#_i,4] = "- ASSIGNS EACH DUNGEON A BOSS FROM A SHUFFLED LIST";
//dg_RandoDUNGEON_Options[#_i,4] = "SHUFFLE THE DUNGEON BOSSES";
//dg_RandoDUNGEON_Options[#_i,4] = "SHUFFLE THE BOSSES OF THE 6 CRYSTAL DUNGEONS";
dg_RandoDUNGEON_Options[#_i,5] = "- INCLUDES THE 6 CRYSTAL DUNGEON BOSSES IN THE SHUFFLE";
//dg_RandoDUNGEON_Options[#_i,5] = "- INCLUDES THE 6 CRYSTAL DUNGEON BOSSES IN THE SHUFFLE";
//                                                          //
RandoTOWN_LOCATION = ++_i;
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0] = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1] = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,2] = 0;        // 2: state
dg_RandoDUNGEON_Options[#_i,3] = "SHUFFLE TOWN LOCATIONS"; // 3: text
//dg_RandoDUNGEON_Options[#_i,3] = "SHUFFLE TOWNS"; // 3: text
//dg_RandoDUNGEON_Options[#_i,3] = "TOWN LOCATIONS"; // 3: text
dg_RandoDUNGEON_Options[#_i,4] = "- ASSIGNS EACH OVERWORLD TOWN TILE A TOWN FROM A SHUFFLED LIST";
//dg_RandoDUNGEON_Options[#_i,4] = "- EACH TOWN IN THE OVERWORLD TAKES YOU TO A TOWN FROM A SHUFFLED LIST";
//dg_RandoDUNGEON_Options[#_i,4] = "SHUFFLE THE TOWNS";
dg_RandoDUNGEON_Options[#_i,5] = "- INCLUDES THE 8 1ST QUEST TOWNS IN THE SHUFFLE";
//                                                          //
RandoDUNGEON_BACK     = ++_i;
ds_grid_resize(dg_RandoDUNGEON_Options, _i+1, ds_grid_height(dg_RandoDUNGEON_Options));
dg_RandoDUNGEON_Options[#_i,0]  = _X;       // 0: x
dg_RandoDUNGEON_Options[#_i,1]  = _Y+(_i*_dist1); // 1: y
dg_RandoDUNGEON_Options[#_i,1] += BACK_PAD1;
dg_RandoDUNGEON_Options[#_i,2]  = 0;        // 2: state
dg_RandoDUNGEON_Options[#_i,3]  = "BACK";   // 3: text
dg_RandoDUNGEON_Options[#_i,4]  = 0;
//                                                          //
RandoDUNGEON_COUNT    = _i+1;
RandoDUNGEON_cursor   = 0;

FileSelect_Rando_cursor_reset(RandoState_DUNGEON);












                      _i=0;
RandoENEMY_DIFF     = _i++; // DIFFICULTY
RandoENEMY_CHAR     = _i++;
RandoENEMY_SPAWNERS = _i++;
RandoENEMY_ENIGMA   = _i++;
RandoENEMY_HP       = _i++;
RandoENEMY_DAMAGE   = _i++;
RandoENEMY_BACK     = _i++;
RandoENEMY_COUNT    = _i;
RandoENEMY_cursor   = 0;


_X = dg_RandoMAIN_Options[#0,0];
//_X  = RandoOptions_X;
//_X += $00<<3;

_Y  = RandoOptions_Y;
//_Y += $02<<3;

RandoENEMY_FONT_SPRITE=spr_Font2;
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoENEMY_FONT_SPRITE);
_dist1 = _char_size<<1;


dg_RandoENEMY_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_DIFF,0] = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_DIFF,1] = _Y+(RandoENEMY_DIFF*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_DIFF,2] = 1;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_DIFF,3] = "DIFFICULTY";  // 3: text
dg_RandoENEMY_Options[#RandoENEMY_DIFF,4] = "DIFFICULTY RANK OF ENEMIES THAT GET RANDOMIZED";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_CHAR,0]  = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_CHAR,1]  = _Y+(RandoENEMY_CHAR*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_CHAR,2]  = 0;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_CHAR,3]  = "ENEMY RANDO METHOD";  // 3: text
//dg_RandoENEMY_Options[#RandoENEMY_CHAR,3]  = "CHARACTERS";  // 3: text
dg_RandoENEMY_Options[#RandoENEMY_CHAR,4]  = "SPAWNS: SHUFFLE ENEMY SPAWN LOCATIONS";
dg_RandoENEMY_Options[#RandoENEMY_CHAR,5]  = "TYPES:  SHUFFLE ENEMY TYPES";
dg_RandoENEMY_Options[#RandoENEMY_CHAR,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: 'SPAWNS' IS THE NORMAL WAY TO GO. 'TYPES' COULD POTENTIALLY TURN A COMMON ENEMY INTO A MUCH MORE DIFFICULT ONE MEANING THAT YOU'D END UP WITH A LOT OF THE MORE DIFFICULT ENEMY.";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,0] = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,1] = _Y+(RandoENEMY_SPAWNERS*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,2] = 0;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,3] = "ENEMY SPAWNERS"; // 3: text
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,4] = "SHUFFLE THE SPAWN LOCATIONS ENEMY SPAWNERS.";
//dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,4] = "SHUFFLE ENEMY SPAWNER SPAWN LOCATIONS";
dg_RandoENEMY_Options[#RandoENEMY_SPAWNERS,5] = "NOTE: DROP SPAWNERS KEEP THEIR VANILLA LOCATIONS BUT THE ENEMY THAT SPAWNS FROM EACH DROP IS RANDOMIZED.";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,0] = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,1] = _Y+(RandoENEMY_ENIGMA*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,2] = 0;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,3] = "ENIGMA SPELL EFFECT"; // 3: text
dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,4] = "ENEMIES TRANSFORM INTO A RANDOM ENEMY INSTEAD OF A BASIC BLUE SLIME";
//dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,4] = "OFF: ENEMIES TRANSFORM INTO A BASIC BLUE SLIME";
//dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,5] = "ON:  ENEMIES TRANSFORM INTO A RANDOM ENEMY";
//dg_RandoENEMY_Options[#RandoENEMY_ENIGMA,4] = "ENIGMA TRANSFORMS ENEMY TO RANDOM ENEMY";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_HP,0] = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_HP,1] = _Y+(RandoENEMY_HP*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_HP,2] = 0;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_HP,3] = "ENEMY HP"; // 3: text
dg_RandoENEMY_Options[#RandoENEMY_HP,4] = "HP VARIAION:"+g.CHAR_END_LINE3+"-25% TO +25%";
//dg_RandoENEMY_Options[#RandoENEMY_HP,4] = "ENEMY HP VARIAION:"+g.CHAR_END_LINE3+"-25% TO +25%";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,0] = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,1] = _Y+(RandoENEMY_DAMAGE*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,2] = 0;        // 2: state
//dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,3] = "ATTACK POWER"; // 3: text
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,3] = "ENEMY DAMAGE"; // 3: text
dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,4] = "DAMAGE VARIAION:"+g.CHAR_END_LINE3+"-25% TO +25%";
//dg_RandoENEMY_Options[#RandoENEMY_DAMAGE,4] = "ENEMY DAMAGE VARIAION:"+g.CHAR_END_LINE3+"-25% TO +25%";
//                                                          //
ds_grid_resize(dg_RandoENEMY_Options, ds_grid_width(dg_RandoENEMY_Options)+1, ds_grid_height(dg_RandoENEMY_Options));
dg_RandoENEMY_Options[#RandoENEMY_BACK,0]  = _X;       // 0: x
dg_RandoENEMY_Options[#RandoENEMY_BACK,1]  = _Y+(RandoENEMY_BACK*_dist1); // 1: y
dg_RandoENEMY_Options[#RandoENEMY_BACK,1] += BACK_PAD1;
dg_RandoENEMY_Options[#RandoENEMY_BACK,2]  = 0;        // 2: state
dg_RandoENEMY_Options[#RandoENEMY_BACK,3]  = "BACK";   // 3: text
dg_RandoENEMY_Options[#RandoENEMY_BACK,4]  = 0;
//                                                          //


FileSelect_Rando_cursor_reset(RandoState_ENEMY);










                           _i=0;
RandoOTHER_state_MAIN    = _i++;
RandoOTHER_state_ITEMS   = _i++;
RandoOTHER_state_SPELLS  = _i++;
RandoOTHER_state_SKILLS  = _i++;
RandoOTHER_state_REQUIRE = _i++; // Requirements
RandoOTHER_state         = RandoOTHER_state_MAIN;


_X = dg_RandoMAIN_Options[#0,0];
//_X  = RandoOptions_X;
////_X += $00<<3;

_Y  = RandoOptions_Y;
//_Y += $02<<3;

RandoOTHER_MAIN_FONT_SPRITE = spr_Font2;
_char_size = sprite_get_width(RandoOTHER_MAIN_FONT_SPRITE);
_dist1 = _char_size<<1;


dg_RandoOTHER_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
_idx = -1;
_val = "GAME OVER WARPING";
//_val = "CONTINUE WARPING";
//_val = "QUICK QUIT WARPING";
//_val = "UP-A WARPING";
RandoOTHER_MAIN_WARP_PENALTY = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1,RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0]  = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2]  = 1;       // 2: state
dg_RandoOTHER_Options[#_idx,3]  = _val+" PENALTY";// 3: text
dg_RandoOTHER_Options[#_idx,4]  = "ON(VANILLA): XP LOSS OF 75%"+g.CHAR_END_LINE3+g.CHAR_END_LINE3;
dg_RandoOTHER_Options[#_idx,4] += "OFF(RECOMMENDED): NO PENALTY";
//dg_RandoOTHER_Options[#_idx,5]  = "GAME OVER WARPING IS WHEN THE PLAYER FORCES A GAME OVER BY HOLDING 'LT+RT+SELECT+START' SO THEY CAN QUICKLY GET BACK TO TOWN OR THE DUNGEON ENTRANCE. ";
dg_RandoOTHER_Options[#_idx,5]  = _val+" IS WHEN A GAME OVER IS FORCED BY HOLDING LT+RT+SELECT+START."+g.CHAR_END_LINE3;
//THIS IS USEFUL BECAUSE CONTINUING YOUR GAME AFTER A GAME OVER TAKES YOU DIRECTLY TO TOWN OR THE ENTRANCE OF THE DUNGEON YOU'RE IN.
dg_RandoOTHER_Options[#_idx,5] += g.CHAR_END_LINE3+"BACKTRACKING IS MUCH MORE LIKELY IN RANDO SO THE ABILITY TO FREELY WARP BACK TO THE TOWN YOU SAVED AT CAN SAVE A LOT OF TIME."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "BECAUSE YOU CONTINUE A GAME FROM TOWN, THIS CUTS OUT A LOT OF BACK TRACKING YOU'LL MOST LIKELY BE DOING IN RANDO."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "IT'S A GREAT TIME SAVING TECHNIQUE BECAUSE YOU CONTINUE FROM TOWN, CUTTING OUT A LOT OF BACK TRACKING YOU'LL MOST LIKELY BE DOING IN RANDO."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "IT'S A GREAT TIME SAVING TECHNIQUE, ESPECIALLY FOR RANDO, BECAUSE IT ALLOWS YOU TO WARP BACK TO TOWN OR THE ENTRANCE OF THE DUNGEON YOU'RE IN."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "IT'S A GREAT TIME SAVING TECHNIQUE, ESPECIALLY FOR RANDO, BECAUSE IT GETS YOU RIGHT BACK TO TOWN OR THE DUNGEON ENTRANCE."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "IT IS TYPICALLY USED TO WARP BACK TO TOWN OR THE DUNGEON ENTRANCE, SAVING A LOT OF TIME."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "THIS CAN BE USEFUL FOR SEVERAL REASONS;"+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "THIS TECHNIQUE IS A BIG TIME SAVE, ESPECIALLY IN RANDO."+g.CHAR_END_LINE3;
dg_RandoOTHER_Options[#_idx,5] += g.CHAR_END_LINE3+"NOTE: A GAME OVER VIA LOSING ALL LIVES WILL STILL INCUR THE VANILLA 75% PENALTY."+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "WARP TO TOWN OR A DUNGEON ENTRANCE"+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "YOU WANT TO WARP BACK TO TOWN OR A DUNGEON ENTRANCE INSTEAD OF TAKING THE TIME TO LOSE ALL YOUR LIVES"+g.CHAR_END_LINE3;
//dg_RandoOTHER_Options[#_idx,5] += "GETTING OUT OF A SOFTLOCK";
//dg_RandoOTHER_Options[#_idx,5] += "THIS CAN BE USEFUL IF YOU WANT TO WARP BACK TO TOWN OR A DUNGEON ENTRANCE INSTEAD OF TAKING THE TIME TO LOSE ALL YOUR LIVES, OR IN THE EVENT OF A SOFTLOCK.";
//dg_RandoOTHER_Options[#_idx,4]  = "ON: INCUR THE NORMAL XP LOSS PENALTY OF A 75%";
//dg_RandoOTHER_Options[#_idx,5]  = "OFF: NO PENALTY";
//                                                          //
RandoOTHER_MAIN_PALETTE = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1,RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0]  = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2]  = 0;       // 2: state
dg_RandoOTHER_Options[#_idx,3]  = "RANDOMIZE COLORS";// 3: text
dg_RandoOTHER_Options[#_idx,4]  = "THIS CAN BE ADJUSTED IN THE OPTIONS MENU ONCE IN GAME.";
//                                                          //
RandoOTHER_MAIN_DUNGEON_TS = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1,RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0]  = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2]  = 0;       // 2: state
dg_RandoOTHER_Options[#_idx,3]  = "SHUFFLE DUNGEON GRAPHICS";  // 3: text
//dg_RandoOTHER_Options[#_idx,3]  = "RANDOMIZE DUNGEON TILESETS";// 3: text
dg_RandoOTHER_Options[#_idx,4]  = "- ASSIGNS EACH DUNGEON GRAPHICS FROM A SHUFFLED LIST";
//dg_RandoOTHER_Options[#_idx,4]  = "- WHICH TILESET IS ASSIGNED TO A DUNGEON IS RANDOMIZED";
dg_RandoOTHER_Options[#_idx,5]  = "- INCLUDES ALL ORIGINAL, AND CUSTOM DUNGEON GRAPHICS IN THE SHUFFLE";
//                                                          //
RandoOTHER_MAIN_cursor_QUEST = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 1;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START QUEST";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHICH QUEST TO START ON";
//                                                          //
RandoOTHER_MAIN_cursor_ATTACK = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 1;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START ATTACK LEVEL";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHAT ATTACK LEVEL TO START AT";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_MAGIC = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 1;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START MAGIC LEVEL";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHAT MAGIC LEVEL TO START AT";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_LIFE = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 1;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START LIFE LEVEL";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHAT LIFE LEVEL TO START AT";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_ITEMS = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START ITEMS";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHICH ITEMS TO START WITH";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_SPELLS = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START SPELLS";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHICH SPELLS TO START WITH";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_SKILLS = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "START SKILLS";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "WHICH SKILLS TO START WITH";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_REQUIRE = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1] = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_Options[#_idx,3] = "ADJUST REQUIREMENTS";  // 3: text
dg_RandoOTHER_Options[#_idx,4] = "ADJUST CERTAIN REQUIREMENTS";
dg_RandoOTHER_Options[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_MAIN_cursor_BACK = ++_idx;
ds_grid_resize(dg_RandoOTHER_Options, _idx+1, RandoGrid_H);
dg_RandoOTHER_Options[#_idx,0]  = _X;       // 0: x
dg_RandoOTHER_Options[#_idx,1]  = _Y+(_idx*_dist1); // 1: y
dg_RandoOTHER_Options[#_idx,1] += BACK_PAD1;
dg_RandoOTHER_Options[#_idx,2]  = 0;        // 2: state
dg_RandoOTHER_Options[#_idx,3]  = "BACK";   // 3: text
dg_RandoOTHER_Options[#_idx,4]  = 0;
//                                                          //
RandoOTHER_MAIN_cursor_COUNT   = _idx+1;
RandoOTHER_MAIN_cursor         = 0;


FileSelect_Rando_cursor_reset(RandoState_OTHER);






//RandoOTHER_ITEMS_INCLUDE_FEATHER=true;
//RandoOTHER_ITEMS_INCLUDE_FEATHER=false;


                                _i=0;
RandoOTHER_ITEMS_cursor_ITEM  = _i++;
RandoOTHER_ITEMS_cursor_BACK  = _i++;
RandoOTHER_ITEMS_cursor_COUNT = _i;
RandoOTHER_ITEMS_cursor       = RandoOTHER_ITEMS_cursor_ITEM;

RandoOTHER_ITEMS_cursor_BACK_YOFF = $1C;
//RandoOTHER_ITEMS_cursor_BACK_YOFF = $18;

                                       _i=0;
RandoOTHER_ITEMS_item_cursor_CANDLE  = _i++;
RandoOTHER_ITEMS_item_cursor_FLUTE   = _i++;
RandoOTHER_ITEMS_item_cursor_BAIT    = _i++;
RandoOTHER_ITEMS_item_cursor_SHIELD  = _i++;
RandoOTHER_ITEMS_item_cursor_RING    = _i++;
RandoOTHER_ITEMS_item_cursor_PENDANT = _i++;
RandoOTHER_ITEMS_item_cursor_SWORD   = _i++;
RandoOTHER_ITEMS_item_cursor_FEATHER = _i++;
RandoOTHER_ITEMS_item_cursor_NOTE    = _i++;
RandoOTHER_ITEMS_item_cursor_MAP1    = _i++;
RandoOTHER_ITEMS_item_cursor_MAP2    = _i++;
RandoOTHER_ITEMS_item_cursor_DOLLS   = _i++;
RandoOTHER_ITEMS_item_cursor_HEART   = _i++; // heart containers
RandoOTHER_ITEMS_item_cursor_MAGIC   = _i++; // magic containers
RandoOTHER_ITEMS_item_cursor_COUNT   = _i;
RandoOTHER_ITEMS_item_cursor         = RandoOTHER_ITEMS_item_cursor_CANDLE;


_x = RandoOptions_X+4; // x center of left-most item
_Y = RandoOptions_Y+$10;
_dist1 = $10;
_dist2 = _dist1+$08;
//                                                          //
dg_RandoOTHER_ITEMS = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,3] = STR_CANDLE;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,4] = "CANDLE";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,5] = "-LIGHTS UP TORCHES AND DARK ROOMS.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,0]  = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,1]  = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,2]  = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,3]  = STR_FLUTE;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,4]  = "FLUTE";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5]  = "-REMOVES OVERWORLD RIVER MONSTERS.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5] += g.CHAR_END_LINE3+"PRESS ATTACK BUTTON TO USE.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-CAN WARP TO VISITED TOWNS.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5] += g.CHAR_END_LINE3+"HOLD CAST MAGIC BUTTON AND PRESS ATTACK BUTTON TO SEQUENCE THROUGH TOWNS.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: IF YOU CHOSE FLUTE AS ZELDA'S HINT, THE HINT WILL BE USELESS.";
//dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FLUTE,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: IF YOU CHOSE FLUTE AS ZELDA'S HINT, THE HINT WILL BE USELESS AND YOU'LL NEED TO MANUALLY CHANGE IT TO A DIFFERENT OPTION.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,3] = STR_MEAT;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,4] = "BAIT";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_BAIT,5] = "-DISTRACTS OVERWORLD ENEMIES.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,3] = STR_SHIELD;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,4] = "SHIELD";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SHIELD,5] = "-BLOCKS ALL PROJECTILES.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,3] = STR_RING;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,4] = "RING";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_RING,5] = "-REDUCES DAMAGE TAKEN.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,3] = STR_PENDANT;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,4] = "PENDANT";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_PENDANT,5] = "-SLOWLY REGENERATES MAGIC.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,0]  = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,1]  = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,2]  = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,3]  = STR_SWORD;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,4]  = "SWORD";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,5]  = "-IS +3 PIXELS LONGER.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-CAN DAMAGE ENEMIES WITH HARD SKIN.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-SWORD BEAMS GO FURTHER.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_SWORD,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"-WON'T LOSE SWORD BEAMS UNTIL 1 CONTAINER OF HP IS LOST.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,0]  = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,1]  = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,2]  = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,3]  = STR_FEATHER;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,4]  = "FEATHER";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,5]  = "-THIS IS DOUBLE JUMP AND IS ONLY HERE FOR FUN.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_FEATHER,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: YOU WILL NEED TO ENABLE IT IN THE OPTIONS MENU ONCE IN GAME.";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,3] = STR_NOTE;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,4] = "NOTE";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,5] = "-BUILDS A BRIDGE ACROSS SARIA RIVER AFTER TALKING TO RIVER MAN.";
//dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_NOTE,5] = "-AUTHORIZES YOU TO CROSS SARIA RIVER";
//                                                          //
_x+=_dist1;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,0]  = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,1]  = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,2]  = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,3]  = STR_MAP1;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,4]  = "WEST TREASURE MAP";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,5]  = "-DISPLAYS THE LOCATIONS OF CONTAINERS, 1UPS, GOLD SLIMES, KEYS.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"ONLY FOR ITEMS WITH VANILLA LOCATIONS IN THE WEST HALF OF THE WORLD.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP1,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: DISPLAYING KEYS ONLY WORKS IN KEY-SANITY AND CAN BE TOGGLED IN THE OPTIONS MENU.";
//                                                          //
_x+=_dist1-4;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,3] = STR_MAP2;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,4] = "EAST TREASURE MAP";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,5]  = "-DISPLAYS THE LOCATIONS OF CONTAINERS, 1UPS, GOLD SLIMES, KEYS.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"ONLY FOR ITEMS WITH VANILLA LOCATIONS IN THE EAST HALF OF THE WORLD.";
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAP2,5] += g.CHAR_END_LINE3+g.CHAR_END_LINE3+"NOTE: DISPLAYING KEYS ONLY WORKS IN KEY-SANITY AND CAN BE TOGGLED IN THE OPTIONS MENU.";
//                                                          //
//                                                          //
//                                                          //
_x+=_dist1+4;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,2] = 0;  // 2: state
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,3] = STR_1UP;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_DOLLS,4] = "NUMBER OF LIFE DOLLS TO START WITH";
//                                                          //
_x+=_dist2-4;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,2] = f.CONT_MIN_HP; // 2: container count
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,3] = STR_HEART;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_HEART,4] = "NUMBER OF HEART CONTAINERS TO START WITH";
//                                                          //
_x+=_dist2-4;
ds_grid_resize(dg_RandoOTHER_ITEMS, ds_grid_width(dg_RandoOTHER_ITEMS)+1, ds_grid_height(dg_RandoOTHER_ITEMS));
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,0] = _x; // 0: x
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,1] = _Y; // 1: y
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,2] = f.CONT_MIN_MP; // 2: container count
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,3] = STR_MAGIC;  // 3: text
dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_MAGIC,4] = "NUMBER OF MAGIC CONTAINERS TO START WITH";
//                                                          //
RandoContainerHP_MIN = 1;
//RandoContainerHP_MIN = f.CONT_MIN_HP;
RandoContainerHP_MAX = f.CONT_MAX_HP;

RandoContainerMP_MIN = 1;
//RandoContainerMP_MIN = f.CONT_MIN_MP;
RandoContainerMP_MAX = f.CONT_MAX_MP;






                                   _i=0;
RandoOTHER_SPELLS_cursor_PROTECT = _i++;
RandoOTHER_SPELLS_cursor_JUMP    = _i++;
RandoOTHER_SPELLS_cursor_HEAL    = _i++;
RandoOTHER_SPELLS_cursor_FAIRY   = _i++;
RandoOTHER_SPELLS_cursor_FIRE    = _i++;
RandoOTHER_SPELLS_cursor_REFLECT = _i++;
RandoOTHER_SPELLS_cursor_ENIGMA  = _i++;
RandoOTHER_SPELLS_cursor_THUNDER = _i++;
//RandoOTHER_SPELLS_cursor_SUMMON  = _i++;
RandoOTHER_SPELLS_cursor_BACK    = _i++;
RandoOTHER_SPELLS_cursor_COUNT   = _i;
RandoOTHER_SPELLS_cursor         = RandoOTHER_SPELLS_cursor_PROTECT;



_x = RandoOptions_X;
_Y = RandoOptions_Y;


RandoOTHER_SPELLS_FONT_SPRITE=spr_Font2;
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoOTHER_SPELLS_FONT_SPRITE);
_dist1 = _char_size<<1;


//                                                          //
dg_RandoOTHER_SPELLS = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,1] = _Y+(RandoOTHER_SPELLS_cursor_PROTECT*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,3] = STR_PROTECT;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_PROTECT,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,1] = _Y+(RandoOTHER_SPELLS_cursor_JUMP*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,3] = STR_JUMP;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_JUMP,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,1] = _Y+(RandoOTHER_SPELLS_cursor_HEAL*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,3] = STR_HEAL;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_HEAL,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,1] = _Y+(RandoOTHER_SPELLS_cursor_FAIRY*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,3] = STR_FAIRY;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FAIRY,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,1] = _Y+(RandoOTHER_SPELLS_cursor_FIRE*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,3] = STR_FIRE;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_FIRE,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,1] = _Y+(RandoOTHER_SPELLS_cursor_REFLECT*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,3] = STR_REFLECT;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_REFLECT,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,1] = _Y+(RandoOTHER_SPELLS_cursor_ENIGMA*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,3] = STR_ENIGMA;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_ENIGMA,3];
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,1] = _Y+(RandoOTHER_SPELLS_cursor_THUNDER*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,3] = STR_THUNDER;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_THUNDER,3];
//                                                          //
/*
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,0] = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,1] = _Y+(RandoOTHER_SPELLS_cursor_SUMMON*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,2] = 0;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,3] = STR_SUMMON;  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,4] = "START WITH "+dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_SUMMON,3];
*/
//                                                          //
ds_grid_resize(dg_RandoOTHER_SPELLS, ds_grid_width(dg_RandoOTHER_SPELLS)+1, ds_grid_height(dg_RandoOTHER_SPELLS));
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,0]  = _x; // 0: x
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,1]  = _Y+(RandoOTHER_SPELLS_cursor_BACK*_dist1); // 1: y
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,1] += BACK_PAD1;
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,2]  = 1;  // 2: state
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,3]  = "BACK";  // 3: text
dg_RandoOTHER_SPELLS[#RandoOTHER_SPELLS_cursor_BACK,4]  = "";
//                                                          //












_x = RandoOptions_X;
_Y = RandoOptions_Y;


RandoOTHER_SKILLS_FONT_SPRITE = spr_Font2;
_char_size = sprite_get_width(RandoOTHER_SKILLS_FONT_SPRITE);
_dist1 = _char_size<<1;
_dist2 = PC_H + 8;


dg_RandoOTHER_SKILLS = ds_grid_create(0,RandoGrid_H);

_idx = -1;
RandoOTHER_SKILLS_cursor_STABDOWN = ++_idx;
ds_grid_resize(dg_RandoOTHER_SKILLS, _idx+1, RandoGrid_H);
dg_RandoOTHER_SKILLS[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_SKILLS[#_idx,1] = _Y+(_idx*_dist2); // 1: y
dg_RandoOTHER_SKILLS[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_SKILLS[#_idx,3] = "DOWNTHRUST";  // 3: text
dg_RandoOTHER_SKILLS[#_idx,4] = "START WITH DOWNTHRUST";
dg_RandoOTHER_SKILLS[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_SKILLS_cursor_STABUP = ++_idx;
ds_grid_resize(dg_RandoOTHER_SKILLS, _idx+1, RandoGrid_H);
dg_RandoOTHER_SKILLS[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_SKILLS[#_idx,1] = _Y+(_idx*_dist2); // 1: y
dg_RandoOTHER_SKILLS[#_idx,2] = 0;        // 2: state
dg_RandoOTHER_SKILLS[#_idx,3] = "UPTHRUST";  // 3: text
dg_RandoOTHER_SKILLS[#_idx,4] = "START WITH UPTHRUST";
dg_RandoOTHER_SKILLS[#_idx,5] = _HANDICAP_TEXT;
//                                                          //
RandoOTHER_SKILLS_cursor_BACK = ++_idx;
ds_grid_resize(dg_RandoOTHER_SKILLS, _idx+1, RandoGrid_H);
dg_RandoOTHER_SKILLS[#_idx,0] = _X;       // 0: x
dg_RandoOTHER_SKILLS[#_idx,1] = _Y+(_idx*_dist2); // 1: y
dg_RandoOTHER_SKILLS[#_idx,2] = 1;        // 2: state
dg_RandoOTHER_SKILLS[#_idx,3] = "BACK";  // 3: text
dg_RandoOTHER_SKILLS[#_idx,4] = "";
//                                                          //


RandoOTHER_SKILLS_cursor_COUNT = _idx + 1;
RandoOTHER_SKILLS_cursor = 0;











                                     _i=0;
RandoOTHER_REQUIRE_cursor_CRYSTALS = _i++;
RandoOTHER_REQUIRE_cursor_KAKUSU   = _i++;
RandoOTHER_REQUIRE_cursor_BACK     = _i++;
RandoOTHER_REQUIRE_cursor_COUNT    = _i;
RandoOTHER_REQUIRE_cursor          = RandoOTHER_REQUIRE_cursor_CRYSTALS;



_x = RandoOptions_X;
_Y = RandoOptions_Y;
_dist1 = $10;
//_dist1 = RandoOptions_Y_DIST;
//                                                          //
dg_RandoOTHER_REQUIRE = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoOTHER_REQUIRE, ds_grid_width(dg_RandoOTHER_REQUIRE)+1, ds_grid_height(dg_RandoOTHER_REQUIRE));
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,0] = _x+4; // 0: x
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,1] = _Y+(RandoOTHER_REQUIRE_cursor_CRYSTALS*_dist1); // 1: y
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,2] = f.CRYSTAL_MAX;  // 2: state
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,3] = "";  // 3: text
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_CRYSTALS,4] = "THE NUMBER OF CRYSTALS REQUIRED TO ENTER GREAT PALACE.";
//                                                          //
ds_grid_resize(dg_RandoOTHER_REQUIRE, ds_grid_width(dg_RandoOTHER_REQUIRE)+1, ds_grid_height(dg_RandoOTHER_REQUIRE));
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,0] = _x+8; // 0: x
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,1] = _Y+(RandoOTHER_REQUIRE_cursor_KAKUSU*_dist1); // 1: y
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,2] = val(g.dm_spawn[?STR_Kakusu+STR_Count]);  // 2: state
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,3] = "";
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_KAKUSU,4] = "THE NUMBER OF GOLD SLIMES REQUIRED FOR THEIR REWARD.";  // 3: text
//                                                          //
ds_grid_resize(dg_RandoOTHER_REQUIRE, ds_grid_width(dg_RandoOTHER_REQUIRE)+1, ds_grid_height(dg_RandoOTHER_REQUIRE));
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,0]  = _x; // 0: x
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,1]  = _Y+(RandoOTHER_REQUIRE_cursor_BACK*_dist1); // 1: y
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,1] += BACK_PAD1;
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,2]  = 1;  // 2: state
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,3]  = "BACK";  // 3: text
dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,4]  = "";
//                                                          //















RandoSEED_EDIT_state = 0; // 0: cursor free, 1: editing seed


                   _i=0;
RandoSEED_EDIT   = _i++;
RandoSEED_NEW    = _i++; // randomizes the seed
RandoSEED_BACK   = _i++;
RandoSEED_COUNT  = _i;
RandoSEED_cursor = 0;

_X  = RandoOptions_X;
_X += $00<<3;

_Y  = RandoOptions_Y;
//_Y += $02<<3;

RandoSEED_FONT_SPRITE = global.dl_game_font[|global.game_font_idx];
//_font_sprite = spr_Font2;
_char_size = sprite_get_width(RandoSEED_FONT_SPRITE);
_dist1 = _char_size<<1;

dg_RandoSEED_Options = ds_grid_create(0,RandoGrid_H);
//                                                          //
ds_grid_resize(dg_RandoSEED_Options, ds_grid_width(dg_RandoSEED_Options)+1, ds_grid_height(dg_RandoSEED_Options));
dg_RandoSEED_Options[#RandoSEED_EDIT,0] = _X;       // 0: x
dg_RandoSEED_Options[#RandoSEED_EDIT,1] = _Y+(RandoSEED_EDIT*_dist1); // 1: y
dg_RandoSEED_Options[#RandoSEED_EDIT,2] = 1;        // 2: state
dg_RandoSEED_Options[#RandoSEED_EDIT,3] = "EDIT SEED";  // 3: text
dg_RandoSEED_Options[#RandoSEED_EDIT,4] = "EDIT THE RANDOMIZATION SEED";
//                                                          //
ds_grid_resize(dg_RandoSEED_Options, ds_grid_width(dg_RandoSEED_Options)+1, ds_grid_height(dg_RandoSEED_Options));
dg_RandoSEED_Options[#RandoSEED_NEW,0] = _X;       // 0: x
dg_RandoSEED_Options[#RandoSEED_NEW,1] = _Y+(RandoSEED_NEW*_dist1); // 1: y
dg_RandoSEED_Options[#RandoSEED_NEW,2] = 1;        // 2: state
dg_RandoSEED_Options[#RandoSEED_NEW,3] = "NEW SEED";  // 3: text
dg_RandoSEED_Options[#RandoSEED_NEW,4] = "GENERATE A NEW RANDOMIZATION SEED";
//                                                          //
ds_grid_resize(dg_RandoSEED_Options, ds_grid_width(dg_RandoSEED_Options)+1, ds_grid_height(dg_RandoSEED_Options));
dg_RandoSEED_Options[#RandoSEED_BACK,0]  = _X;       // 0: x
dg_RandoSEED_Options[#RandoSEED_BACK,1]  = _Y+(RandoSEED_BACK*_dist1); // 1: y
dg_RandoSEED_Options[#RandoSEED_BACK,1] += BACK_PAD1;
dg_RandoSEED_Options[#RandoSEED_BACK,2]  = 0;        // 2: state
dg_RandoSEED_Options[#RandoSEED_BACK,3]  = "BACK";   // 3: text
dg_RandoSEED_Options[#RandoSEED_BACK,4]  = 0;
//                                                          //
FileSelect_Rando_cursor_reset(RandoState_SEED);





FileSelect_init_rando_settings();








//                                                                              //
SeedSprites_XL  = dg_RandoMAIN_Options[#RandoMAIN_SEED,0];
SeedSprites_XL +=  $13<<3; // XR of seed sprites
SeedSprites_XL -= ($04+$08) * g.RandoSeedChar_COUNT;
SeedSprites_XL +=  $04;    // XL of seed sprites
RandoSeedY_ADJ1 =  $03;
//                                                                              //
RandoSeedChar_cursor = 0;
//                                                                              //



FileRandoData_CLM  = viewXC();
FileRandoData_CLM -= (FileSelectWindow_CLMS<<3)>>1;
FileRandoData_CLM += (FileSelectWindow_CLMS<<3) + $08;
FileRandoData_CLM  =  FileRandoData_CLM>>3;

FileRandoData_CLMS = (viewW()>>3) - FileRandoData_CLM;
FileRandoData_ROW  = $03;
FileRandoData_YPAD = -$02;




// -------------------------------------------------------------------
SaveFileRandoInfo_dm = ds_map_create();
for(_i=0; _i<SAVE_FILE_MAX; _i++) FileSelect_refresh_save_file_rando_info(_i+1);

SaveFileRandoInfo_SURF_W = viewW();
SaveFileRandoInfo_SURF_H = viewH();




