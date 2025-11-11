/// FileSelect_build_surfaces_2()


if(!string_length(p.pal_rm_curr)  // otherwise some text will be wrong color until the surface is redrawn due to something like toggling fullscreen
|| !val(SaveFileRandoInfo_dm[?"_Need"+STR_Surface]) )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




var _i,_j, _val, _count;
var _x,_y, _x1,_y1, _xl0,_xc0, _yoff, _w;
var _datakey0,_datakey1,_datakey2;
var _char_w, _char_limit, _text, _font_sprite, _len;
var _sprite, _pi;
var _file_num, _data;
var _seed = 0;

var _DIST1 = sprite_get_width(FONT_SPRITE1);
var _DIST2 = _DIST1+$1;
var _DIST3 = $4; // y padding
var _DIST4 = _DIST2+_DIST3;

var _Area_PAD = 2;
var _Area_W   = $10<<3;
var _Area_XR  = viewW()-8;
var _Area_YT  = viewYT()+8;

var _Area1_XL = viewXL();
var _Area1_XC = _Area1_XL+(_Area_W>>1);
var _Area1_XR = _Area1_XL+_Area_W;

var _Area2_XR = viewXR();
var _Area2_XL = _Area2_XR-_Area_W;
var _Area2_XC = _Area2_XL+(_Area_W>>1);

var _XL1      = _Area1_XL+_Area_PAD;
var _XL2      = _Area2_XL+_Area_PAD;

//var _add_row = 0;
var _FONT_SPRITE2 = spr_Font3_1;
//var _FONT_SPRITE2 = spr_Font2_1;
var _FONT_SPRITE3 = spr_Font3_1;
//var _FONT_SPRITE3 = spr_Font3;
var _ITEM_PAD = 2;
//var _item_bit = 0;
var _spell_name = undefined;
var _spell_bit = 0;
var _PI1 = global.PI_BGR1;
//var _PI1 = PI_PC_1;

//var _XL  = FileRandoData_CLM<<3;
//    _XL -= $6;
//var _YT  = $8;

//var _RIGHT_CLM_STARTS_WITH_VARIOUS = true;


for(_i=0; _i<SAVE_FILE_MAX; _i++)
{
    _file_num = _i+1;
    _datakey0 = STR_Save+STR_File+hex_str(_file_num);
    
    if (val(SaveFileRandoInfo_dm[?_datakey0+"_Need"+STR_Surface]))
    {
        if (is_undefined(  SaveFileRandoInfo_dm[?_datakey0+STR_Surface]) 
        || !surface_exists(SaveFileRandoInfo_dm[?_datakey0+STR_Surface]) )
        {
            _data = SaveFileRandoInfo_dm[?_datakey0+STR_Rando+STR_Settings];
            if(!is_undefined(_data))
            {
                var _dm_rando_settings = json_decode(_data);
                if (_dm_rando_settings!=-1)
                {
                    var _SURF = surface_create(SaveFileRandoInfo_SURF_W,SaveFileRandoInfo_SURF_H);
                    surface_set_target(_SURF);
                    draw_clear_alpha(c_black,0);
                    
                    //_add_row = 0;
                    //_item_bit = 0;
                    _spell_name = undefined;
                    _spell_bit = 0;
                    _seed = 0
                    
                    
                    
                    
                    pal_swap_set(global.palette_image, PI_MENU1);
                    
                    for(_j=0; _j<2; _j++)
                    {
                        if (_j) _x = _XL2;
                        else    _x = _XL1;
                        _y = _Area_YT;
                        _font_sprite = FONT_SPRITE1;
                        _text  = f.dl_save_names[|_file_num-1];
                        _text += " - RANDO INFO";
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _y += _DIST2;
                        _val = sprite_get_width(_font_sprite);
                        _count  = (_Area_W-(_Area_PAD<<1)) div _val;
                        _count += 1;
                        _text   = string_repeat("-", _count);
                        draw_text_(_x,_y, _text, _font_sprite);
                    }//_j
                    
                    _y += _DIST3;
                    var _YT1 = _y;
                    
                    
                    
                    
                    _xl0 = _XL1;
                    _xc0 = _Area1_XC;
                    
                    // =================================================================
                    // Seed -------------------------------------------------
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 1;
                    _font_sprite = FONT_SPRITE1;
                    _text = "SEED:";
                    draw_text_(_x,_y, _text, _font_sprite);
                    _y += _DIST3;
                    
                    _x += string_length(_text) * sprite_get_width(_font_sprite);
                    //_x += string_length(_text)<<3;
                    _x += 6;
                    //_x += 4;    // _x is sprite center. +4: half sprite width
                    _y1 = _y-1; // _y is sprite center and _text center.
                    _seed = val(SaveFileRandoInfo_dm[?_datakey0+STR_Seed+STR_Quest+"01"]);
                    //_seed = FileSelect_get_file_seed(_file_num,1);
                    Rando_draw_seed(_x,_y1, _seed, 2);
                    
                    
                    
                    
                    // =================================================================
                    // Items ----------------------------------------------
                    _y += _DIST3;
                    
                    if (val(_dm_rando_settings[?STR_Randomize+STR_Item+STR_Locations]))
                    {
                        _y += _DIST2;
                        _y += 3;
                        _text = "_ITEM RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _char_w = sprite_get_width(_font_sprite);
                        _char_limit = _Area_W div _char_w;
                        
                        _x = _xc0 - ((string_length(_text)*_char_w)>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        
                            _val = val(_dm_rando_settings[?dk_LimitObscure]);
                        if (_val)
                        {
                            _text = "LIMIT OBSCURE LOCATIONS";
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            //if (_len>_char_limit) _text = string_copy(_text, 1,_len-2) + "..";
                            _x  = _xl0;
                            _y += _DIST2;
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        //if (val(_dm_rando_settings[?dk_LimitObscure])) _text = "LIMIT OBSCURE LOCATIONS"
                        
                        
                        _val = val(_dm_rando_settings[?dk_DarkRoom+STR_Difficulty]);
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "DARKROOM DIFFICULTY:";
                        _len = string_length(_text);
                        if (_len+1>_char_limit) _text = string_copy(_text, 1,_char_limit-3) + "..";
                        _text += string(_val);
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                        
                            _val = val(_dm_rando_settings[?STR_Item+STR_Location+STR_Hint]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "ITEM LOCATION HINTS";
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        
                            _val = val(_dm_rando_settings[?STR_Zelda+STR_Hint]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "ZELDA HINT: ";
                            switch(_val){
                            case ZELDA_HINT_OPTIONS.FLUTE: {_text+="FLUTE"; break;}
                            case ZELDA_HINT_OPTIONS.ALLKEY:{_text+="ALLKEY"; break;}
                            case ZELDA_HINT_OPTIONS.JUMP:  {_text+="JUMP TOWN"; break;}
                            }
                            _len = string_length(_text);
                            if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "SHUFFLE POOL:";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Item+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = " ITEM LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_PBAG+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = " PBAG LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Key+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = " KEY LOCATIONS";
                            draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Spells ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_rando_settings[?STR_Randomize+STR_Spell+STR_Locations]) 
                    //||  val(_dm_rando_settings[?STR_Randomize+STR_Skill+STR_Locations]) 
                    ||  val(_dm_rando_settings[?STR_Randomize+STR_Spell+STR_Cost]) )
                    {
                        _y += _DIST2;
                        _y += 2;
                        //_text = "_SPELL & SKILL RANDO_";
                        _text = "_SPELL RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Spell+STR_Cost]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "SPELL COSTS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                        //_text  = "SHUFFLE POOL:";
                        if (val(_dm_rando_settings[?STR_Randomize+STR_Spell+STR_Locations]) )
                        //||  val(_dm_rando_settings[?STR_Randomize+STR_Skill+STR_Locations]) )
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "SPELL LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Dungeon ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Locations]) 
                    //||  val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Tileset]) 
                    ||  val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Boss]) 
                    ||  val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Room]) )
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_DUNGEON RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "DUNGEON LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Boss]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "DUNGEON BOSSES";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Town ----------------------------------------------
                    _y += _DIST3;
                    
                    
                    if (val(_dm_rando_settings[?STR_Randomize+STR_Town+STR_Locations]))
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_TOWN RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Town+STR_Locations]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "TOWN LOCATIONS";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Enemies ----------------------------------------------
                    _y += _DIST3;
                    
                    if (val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_Method]))
                    {
                        _y += _DIST2;
                        _y += 2;
                        _text = "_ENEMY RANDO_";
                        _font_sprite = _FONT_SPRITE2;
                        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_Difficulty]);
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "ENEMY DIFFICULTY: "+string(_val);
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_Method]);
                        _x  = _xl0;
                        _y += _DIST2;
                        switch(_val){
                        case 1:{_text="SPAWN LOCATIONS"; break;}
                        case 2:{_text="ENEMY TYPES"; break;}
                        //case 1:{_text="SHUFFLE SPAWN LOCAT.."; break;}
                        //case 2:{_text="SHUFFLE ENEMY TYPES"; break;}
                        }
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_Spawner]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "SPAWNER LOCATIONS";
                            //_text  = "SHUFFLE SPAWNER LOC..";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_ENIGMA]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "ENIGMA REACTION";
                            //_text  = "RANDO ENIGMA REACTION";
                            //_text  = "RANDO ENIGMA TRANSFORM";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_HP]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "HP AMOUNTS";
                            //_text  = "HP TABLE AMOUNTS";
                            //_text  = "ENEMY HP TABLE AMOUNTS";
                            //_text  = "RANDO ENEMY HP";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                        
                            _val = val(_dm_rando_settings[?STR_Randomize+STR_Enemy+STR_Damage]);
                        if (_val)
                        {
                            _x  = _xl0;
                            _y += _DIST2;
                            _text = "DAMAGE AMOUNTS";
                            //_text  = "DAMAGE TABLE AMOUNTS";
                            //_text  = "RANDO ENEMY DAMAGE";
                            draw_text_(_x,_y, _text, FONT_SPRITE1);
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Level Costs ----------------------------------------------
                    _xl0 = _XL2;
                    _xc0 = _Area2_XC;
                    _y  = _YT1;
                    
                    _y += _DIST2;
                    _text = "_VARIOUS RANDO_";
                    //_text = "_VARIOUS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_Level+STR_Cost]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "LEVEL COSTS";
                        //_text  = "RANDO LEVEL COSTS";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    // =================================================================
                    // XP ----------------------------------------------
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_XP]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "XP AMOUNTS";
                        //_text  = "RANDO XP AMOUNTS";
                        //_text  = "XP TABLE AMOUNTS";
                        //_text  = "RANDO XP REWARD";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Palette ----------------------------------------------
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_Palette]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "COLORS";
                        //_text  = "RANDO COLORS";
                        //_text  = "RANDO PALETTES";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    // =================================================================
                    // Dungeon Tilesets ----------------------------------------------
                        _val = val(_dm_rando_settings[?STR_Randomize+STR_Dungeon+STR_Tileset]);
                    if (_val)
                    {
                        _x  = _xl0;
                        _y += _DIST2;
                        _text = "DUNGEON TILESETS";
                        //_text  = "RANDO DUNGEON TILESET";
                        draw_text_(_x,_y, _text, FONT_SPRITE1);
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Requirements --------------------------------------
                    _y += _DIST3;
                    _y += 3;
                    
                    _y += _DIST2;
                    _text = "_REQUIREMENTS_";
                    //_text  = "_REQUIREMENTS SETTINGS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 4;
                    
                    _x1 = _x + 4;
                    _y1 = _y + 4;
                    SaveFileRandoInfo_dm[?_datakey0+STR_Crystal+"_X"] = _x1;
                    SaveFileRandoInfo_dm[?_datakey0+STR_Crystal+"_Y"] = _y1;
                    _pi = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
                    draw_sprite_(spr_Crystal_1a,0, _x1,_y1, _pi);
                    
                    _x += $8;
                    draw_text_(_x,_y, "*", -1,PI_MENU1);
                    
                    _x += $8;
                    _val = val(_dm_rando_settings[?STR_Crystal+STR_Required+STR_Count], f.CRYSTAL_MAX);
                    _text = string(_val);
                    draw_text_(_x,_y, _text, global.dl_game_font[|global.game_font_idx],PI_MENU1);
                    
                    
                    
                    _x += $18+$0;
                    _yoff = 1;
                    _pi = global.PI_MOB_ORG;
                    draw_sprite_(spr_Bot2_Norm,    0, _x,_y+_yoff, _pi);
                    draw_sprite_(spr_Bot_Eyes_1a_1,0, _x,_y+_yoff, _pi);
                    draw_sprite_(spr_1x1_WHT,0, _x-1,_y+3+_yoff, -1, 2,1, get_pal_color(p.pal_rm_curr, _pi, "B"));
                    
                    _x += $9;
                    draw_text_(_x,_y, "*", -1,PI_MENU1);
                    
                    _x += $8;
                    _val = val(g.dm_spawn[?STR_Kakusu+STR_Count], 12);
                    _val = val(_dm_rando_settings[?STR_Kakusu+STR_Required+STR_Count], _val);
                    _text = string(_val);
                    draw_text_(_x,_y, _text, global.dl_game_font[|global.game_font_idx],PI_MENU1);
                    
                    
                    
                    
                    // =================================================================
                    // Start Quest, Start Levels --------------------------------------
                    _y += _DIST3;
                    _y += 2;
                    
                    _y += _DIST2;
                    _y += 2;
                    _text = "_START SETTINGS_";
                    //_text  = "_START-WITH SETTINGS_";
                    _font_sprite = _FONT_SPRITE2;
                    _x  = _xc0;
                    _x -= (string_length(_text)*sprite_get_width(_font_sprite))>>1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    // QUEST -----------------------------------
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 2;
                    _text = "QUEST:";
                    //_text  = "START QUEST: "+string(val(_dm_rando_settings[?STR_File+STR_Start+STR_Quest]));
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    _x += 4;
                    _text = string(val(_dm_rando_settings[?STR_File+STR_Start+STR_Quest]));
                    _font_sprite = global.dl_game_font[|global.game_font_idx];
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    _y += _DIST2;
                    
                    
                    // LEVELS -----------------------------------
                    _datakey1 = STR_File+STR_Start+STR_Level;
                    _y += 3;
                    _x  = _xl0;
                    _text = "LEVELS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Attack level ---------------------
                    _x += 4;
                    _sprite = global.SPR_ICON_ATK;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_rando_settings[?_datakey1+STR_Attack]));
                    _font_sprite = global.dl_game_font[|global.game_font_idx];
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Magic level ---------------------
                    _x += 4;
                    _sprite = global.SPR_ICON_MAG;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_rando_settings[?_datakey1+STR_Magic]));
                    _font_sprite = global.dl_game_font[|global.game_font_idx];
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    // Life level ---------------------
                    _x += 4;
                    //_x += 1; // micro adj
                    _sprite = global.SPR_ICON_LIF;
                    draw_spr_aligned(_sprite, _x,_y,  -1,-1, PI_MENU1);
                    _x += sprite_get_width(_sprite);
                    _text = string(val(_dm_rando_settings[?_datakey1+STR_Life]));
                    _font_sprite = global.dl_game_font[|global.game_font_idx];
                    draw_text_(_x,_y, _text, _font_sprite);
                    _x += (string_length(_text)*sprite_get_width(_font_sprite));
                    
                    
                    
                    
                    // =================================================================
                    // Start Items --------------------------------------
                    _y += _DIST4;
                    
                    _y += 4;
                    //_y -= 1;
                    _x  = _xl0;
                    _text = "ITEMS:";
                    //_text  = "START ITEMS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    _x  = _xl0;
                    _y += _DIST2;
                    _y += 8;
                    _y += 1;
                    var _ITEMS = val(_dm_rando_settings[?STR_File+STR_Start+STR_Items]);
                    
                    for(_j=0; _j<RandoOTHER_ITEMS_item_cursor_COUNT; _j++)
                    {
                        switch(_j){
                        default:{continue;}
                        case RandoOTHER_ITEMS_item_cursor_CANDLE: {_datakey2=STR_CANDLE;  _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_FLUTE:  {_datakey2=STR_FLUTE;   _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_SHIELD: {_datakey2=STR_SHIELD;  _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_BAIT:   {_datakey2=STR_MEAT;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_RING:   {_datakey2=STR_RING;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_PENDANT:{_datakey2=STR_PENDANT; _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_SWORD:  {_datakey2=STR_SWORD;   _pi=global.PI_MOB_ORG; _x-=1; break;}
                        case RandoOTHER_ITEMS_item_cursor_FEATHER:{_datakey2=STR_FEATHER; _pi=global.PI_MOB_ORG; _x-=1; break;}
                        case RandoOTHER_ITEMS_item_cursor_NOTE:   {_datakey2=STR_NOTE;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_MAP1:   {_datakey2=STR_MAP1;    _pi=global.PI_MOB_ORG; break;}
                        case RandoOTHER_ITEMS_item_cursor_MAP2:   {_datakey2=STR_MAP2;    _pi=global.PI_MOB_ORG; break;}
                        }
                        
                        if!(_ITEMS&val(g.dm_ITEM[?_datakey2+STR_Bit])) _pi = global.PI_GUI2;
                        
                        
                        _sprite = val(g.dm_ITEM[?_datakey2+STR_Sprite], spr_Torch_1a);
                        _w = sprite_get_width(_sprite);
                        draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                        
                        _x += _w+_ITEM_PAD;
                        if (_j!=RandoOTHER_ITEMS_item_cursor_MAP1) _x += 2;
                    }//_j
                    
                    
                    
                    
                    _y += $13;
                    
                    _x  = _xl0;
                        _count = val(_dm_rando_settings[?STR_File+STR_Start+STR_Container+STR_HP], f.CONT_MIN_HP);
                    if (_count>f.CONT_MIN_HP) _pi = global.PI_MOB_RED;
                    else                      _pi = global.PI_GUI2;
                    
                    _sprite = spr_Item_Heart_container_1d;
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += 1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 4;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    _x += $9;
                        _count = val(_dm_rando_settings[?STR_File+STR_Start+STR_Container+STR_MP], f.CONT_MIN_MP);
                    if (_count>f.CONT_MIN_MP) _pi = global.PI_MOB_ORG;
                    else                      _pi = global.PI_GUI2;
                    
                    _sprite = spr_Item_Magic_container_1d;
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += -1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 4;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    _x += $B;
                        _count = val(_dm_rando_settings[?STR_File+STR_Start+STR_Dolls]);
                    if (_count) _pi = global.PI_PC1;
                    else        _pi = global.PI_GUI2;
                    
                    _sprite = val(g.dm_ITEM[?STR_1UP+STR_Sprite], spr_Torch_1a);
                    _w = sprite_get_width(_sprite);
                    draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
                    _x += _w;
                    
                    _x += 1;
                    draw_text_(_x,_y-2, "*", -1,PI_MENU1);
                    
                    _x += 8;
                    _text = string(_count);
                    draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU1);
                    _x += 8;
                    
                    
                    
                    
                    // =================================================================
                    // Start Spells --------------------------------------
                    _y += _DIST2;
                    
                    var _SPELLS = val(_dm_rando_settings[?STR_File+STR_Start+STR_Spells]);
                    if (_SPELLS)
                    {
                        _y += _DIST4;
                        _y += -1;
                        _x  = _xl0;
                        _text = "START SPELLS:";
                        _font_sprite = FONT_SPRITE1;
                        draw_text_(_x,_y, _text, _font_sprite);
                        
                        _y += 1;
                        _count = ds_list_size(g.dl_Spell_STR);
                        for(_j=0; _j<_count; _j++)
                        {
                            _spell_name = g.dl_Spell_STR[|_j];
                            _spell_bit  = val(g.dm_Spell[?STR_Bit+_spell_name]);
                            if (_SPELLS&_spell_bit)
                            {
                                _x  = _xl0;
                                _y += _DIST2;
                                draw_text_(_x,_y, " "+string_letters(_spell_name), _FONT_SPRITE3, _PI1);
                            }
                        }
                    }
                    
                    
                    
                    
                    // =================================================================
                    // Start Skills --------------------------------------
                    _y += _DIST2;
                    
                    _y += _DIST4;
                    _y += -1;
                    _x  = _xl0;
                    _text = "START SKILLS:";
                    _font_sprite = FONT_SPRITE1;
                    draw_text_(_x,_y, _text, _font_sprite);
                    
                    
                    _x += string_length(_text) * sprite_get_width(_font_sprite);
                    _x += $2;
                    _y += sprite_get_height(_font_sprite)>>1;
                    //_y -= PC_H_;
                    
                    _x += PC_W_;
                    if (val(_dm_rando_settings[?STR_File+STR_Start+STR_Skill+STR_STABDOWN])) _pi = global.PI_PC1;
                    else                                                                     _pi = global.PI_GUI2;
                    draw_pc_skin(_x,_y, 1,1, global.pc.behavior_STAB_DOWN, false, -1,-1, _pi);
                    
                    _x += PC_W;
                    _x += $6;
                    //_x += $10;
                    if (val(_dm_rando_settings[?STR_File+STR_Start+STR_Skill+STR_STABUP])) _pi = global.PI_PC1;
                    else                                                                   _pi = global.PI_GUI2;
                    draw_pc_skin(_x,_y, 1,1, global.pc.behavior_STAB_UP, false, -1,-1, _pi);
                    
                    pal_swap_reset();
                    
                    
                    
                    
                    SaveFileRandoInfo_dm[?_datakey0+STR_Surface] = surface_create(SaveFileRandoInfo_SURF_W,SaveFileRandoInfo_SURF_H);
                    surface_copy(SaveFileRandoInfo_dm[?_datakey0+STR_Surface], 0,0, _SURF);
                    surface_reset_target();
                    if(!is_undefined(SaveFileRandoInfo_dm[?_datakey0+STR_Surface]) && surface_exists(SaveFileRandoInfo_dm[?_datakey0+STR_Surface])) show_debug_message("FileSelect_build_surfaces(). "+_datakey0+STR_Rando+STR_Surface+" created!");
                    surface_free(_SURF);
                    
                    ds_map_destroy(_dm_rando_settings); _dm_rando_settings=undefined;
                }
            }
        }
    }
}//_i




