/// FileSelect_draw_savefile_rando_info(file num)


var _datakey,_datakey1;

var _FILE_NUM  = argument0;
var _FILE_NAME = f.ar_FILE_NAMES[_FILE_NUM-1];
var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
var _FILE_DATA = file_text_read_string(_FILE);
                 file_text_close(      _FILE);
var _dm_FILE   = json_decode(_FILE_DATA);

var _QUEST_NUM = val(_dm_FILE[?STR_File+STR_Start+STR_Quest]); // I'm letting this return 0 to indicate to me there's an issue
var _datakey = STR_Quest+hex_str(_QUEST_NUM);


var _DIST1 = sprite_get_width(FONT_SPRITE1);
var _DIST2 = _DIST1+$1;
var _DIST3 = $4; // y padding
var _DIST4 = _DIST2+_DIST3;




if (val(_dm_FILE[?_datakey+STR_Rando+STR_Active]))
{
    var              _Rando_DATA = _dm_FILE[?_datakey+STR_Rando+STR_Data];
    if(!is_undefined(_Rando_DATA))
    {
        var _dm_Rando = json_decode(_Rando_DATA);
        var _i,_j, _count;
        var _x,_y, _clm,_row;
        var _xl0,_xc0, _y1, _yoff;
        
        var _Area_PAD = 2;
        var _Area_W   = $10<<3;
        var _Area_YT  = viewYT()+8;
        
        var _Area1_XL = viewXL();
        var _Area1_XR = _Area1_XL+_Area_W;
        var _XL1      = _Area1_XL+_Area_PAD;
        var _Area1_XC = _Area1_XL+(_Area_W>>1);
        
        var _Area2_XR = viewXR();
        var _Area2_XL = _Area2_XR-_Area_W;
        var _XL2      = _Area2_XL+_Area_PAD;
        var _Area2_XC = _Area2_XL+(_Area_W>>1);
        
        var _Area_XR = viewW()-8;
        var _add_row = 0;
        var _text, _font_sprite, _len;
        var _FONT_SPRITE2 = spr_Font3_1;
        //var _FONT_SPRITE2 = spr_Font2_1;
        var _FONT_SPRITE3 = spr_Font3_1;
        //var _FONT_SPRITE3 = spr_Font3;
        var _char_w;
        var _char_limit;
        var _sprite;
        var _w,_h;
        var _ITEM_PAD=2;
        var _item_bit=0;
        var _spell_name=undefined;
        var _spell_bit=0;
        var _pi;
        var _PI1=PI_BGR_1;
        //var _PI1=PI_PC_1;
        
        var _XL  = FileRandoData_CLM<<3;
            _XL -= $6;
        var _YT  = $8;
        
        
        
        
        
        
        
        pal_swap_set(p.palette_image, PI_MENU);
        
        for(_i=0; _i<2; _i++)
        {
            if (_i) _x = _XL2;
            else    _x = _XL1;
            _y = _Area_YT;
            _font_sprite = FONT_SPRITE1;
            _text  = f.ar_save_names[_FILE_NUM-1];
            _text += " - RANDO INFO";
            draw_text_(_x,_y, _text, _font_sprite);
            
            _y += _DIST2;
            _val = sprite_get_width(_font_sprite);
            _count  = (_Area_W-(_Area_PAD<<1)) div _val;
            _count += 1;
            _text   = string_repeat("-", _count);
            draw_text_(_x,_y, _text, _font_sprite);
        }
        
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
        
        _x += string_length(_text)*sprite_get_width(_font_sprite);
        //_x += string_length(_text)<<3;
        _x += 6;
        //_x += 4;    // _x is sprite center. +4: half sprite width
        _y1 = _y-1; // _y is sprite center and _text center.
        var _SEED = FileSelect_get_file_seed(_FILE_NUM,1);
        Rando_draw_seed(_x,_y1, _SEED, 2);
        
        
        
        
        
        
        
        
        // =================================================================
        // Items ----------------------------------------------
        _y += _DIST3;
        
        if (val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]))
        {
            _y += _DIST2;
            _y += 3;
            _text = "_ITEM RANDO_";
            _font_sprite = _FONT_SPRITE2;
            _char_w = sprite_get_width(_font_sprite);
            _char_limit = _Area_W div _char_w;
            
            _x  = _xc0-((string_length(_text)*_char_w)>>1);
            draw_text_(_x,_y, _text, _font_sprite);
            
            
                _val = val(_dm_Rando[?dk_LimitObscure]);
            if (_val)
            {
                _text = "LIMIT OBSCURE LOCATIONS"
                _len = string_length(_text);
                if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                //if (_len>_char_limit) _text = string_copy(_text, 1,_len-2) + "..";
                _x  = _xl0;
                _y += _DIST2;
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            //if (val(_dm_Rando[?dk_LimitObscure])) _text = "LIMIT OBSCURE LOCATIONS"
            
            
            _val = val(_dm_Rando[?STR_Dark_Room+STR_Difficulty]);
            _x  = _xl0;
            _y += _DIST2;
            _text  = "DARKROOM DIFFICULTY:";
            _len = string_length(_text);
            if (_len+1>_char_limit) _text = string_copy(_text, 1,_char_limit-3) + "..";
            _text += string(_val);
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
            
                _val = val(_dm_Rando[?STR_Item+STR_Location+STR_Hint]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "ITEM LOCATION HINTS";
                _len = string_length(_text);
                if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
            
                _val = val(_dm_Rando[?STR_Zelda+STR_Hint]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "ZELDA HINT: ";
                switch(_val){
                case 1:{_text+="ALLKEY"; break;}
                case 2:{_text+="JUMP TOWN"; break;}
                }
                _len = string_length(_text);
                if (_len>_char_limit) _text = string_copy(_text, 1,_char_limit-2) + "..";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
            
            _x  = _xl0;
            _y += _DIST2;
            _text  = "SHUFFLE POOL:";
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = " ITEM LOCATIONS";
                draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_PBAG+STR_Locations]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = " PBAG LOCATIONS";
                draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Key+STR_Locations]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = " KEY LOCATIONS";
                draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
            }
        }
        
        
        
        
        
        
        // =================================================================
        // Spells ----------------------------------------------
        _y += _DIST3;
        
        
        if (val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]) 
        //||  val(_dm_Rando[?STR_Randomize+STR_Skill+STR_Locations]) 
        ||  val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Cost]) )
        {
            _y += _DIST2;
            _y += 2;
            _text = "_SPELL & SKILL RANDO_";
            //_text = "_SPELL RANDO_";
            _font_sprite = _FONT_SPRITE2;
            _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
            draw_text_(_x,_y, _text, _font_sprite);
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Cost]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "SPELL COSTS";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
            if (val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]) )
            //||  val(_dm_Rando[?STR_Randomize+STR_Skill+STR_Locations]) )
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "SHUFFLE POOL:";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
                
                    _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]);
                if (_val)
                {
                    _x  = _xl0;
                    _y += _DIST2;
                    //_text  = "TOWN SPELLS";
                    _text  = " SPELL LOCATIONS";
                    draw_text_(_x,_y, _text, _FONT_SPRITE3, _PI1);
                }
            }
        }
        
        
        
        
        
        
        // =================================================================
        // Dungeon ----------------------------------------------
        _y += _DIST3;
        
        
        if (val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Tileset]) 
        ||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Locations]) 
        ||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Boss]) 
        ||  val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Room]) 
        ||  val(_dm_Rando[?STR_Randomize+STR_Town+STR_Locations]) )
        {
            _y += _DIST2;
            _y += 2;
            _text = "_DUNGEON RANDO_";
            _font_sprite = _FONT_SPRITE2;
            _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
            draw_text_(_x,_y, _text, _font_sprite);
            /*
                _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Tileset]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "DUNGEON TILESETS";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            */
            /*
                _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Room]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "DUNGEON ROOMS";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            */
                _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Locations]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "DUNGEON LOCATIONS";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Boss]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "DUNGEON BOSSES";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Town+STR_Locations]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "TOWN LOCATIONS";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
        }
        
        
        
        
        
        // =================================================================
        // Enemies ----------------------------------------------
        _y += _DIST3;
        
        if (val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]))
        {
            _y += _DIST2;
            _y += 2;
            _text = "_ENEMY RANDO_";
            _font_sprite = _FONT_SPRITE2;
            _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
            draw_text_(_x,_y, _text, _font_sprite);
            
            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Difficulty]);
            _x  = _xl0;
            _y += _DIST2;
            _text  = "ENEMY DIFFICULTY: "+string(_val);
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
            _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]);
            _x  = _xl0;
            _y += _DIST2;
            switch(_val){
            case 1:{_text="SHUFFLE SPAWN LOCAT.."; break;}
            case 2:{_text="SHUFFLE ENEMY TYPES"; break;}
            }
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Spawner]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "SHUFFLE SPAWNER LOC..";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_ENIGMA]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "RANDO ENIGMA REACTION";
                //_text  = "RANDO ENIGMA TRANSFORM";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_HP]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "HP TABLE AMOUNTS";
                //_text  = "ENEMY HP TABLE AMOUNTS";
                //_text  = "RANDO ENEMY HP";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Damage]);
            if (_val)
            {
                _x  = _xl0;
                _y += _DIST2;
                _text  = "DAMAGE TABLE AMOUNTS";
                //_text  = "RANDO ENEMY DAMAGE";
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
        }
        //21
        
        
        
        
        // =================================================================
        // Level Costs ----------------------------------------------
        _y += _DIST3;
        
        _y += _DIST2;
        _y += 2;
        _text = "_VARIOUS_";
        _font_sprite = _FONT_SPRITE2;
        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
        draw_text_(_x,_y, _text, _font_sprite);
        
            _val = val(_dm_Rando[?STR_Randomize+STR_Level+STR_Cost]);
        if (_val)
        {
            _x  = _xl0;
            _y += _DIST2;
            _text  = "RANDO LEVEL COSTS";
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        // =================================================================
        // XP ----------------------------------------------
            _val = val(_dm_Rando[?STR_Randomize+STR_XP]);
        if (_val)
        {
            _x  = _xl0;
            _y += _DIST2;
            //_text  = "RANDO XP AMOUNTS";
            _text  = "XP TABLE AMOUNTS";
            //_text  = "RANDO XP REWARD";
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        
        
        
        // =================================================================
        // Palette ----------------------------------------------
            _val = val(_dm_Rando[?STR_Randomize+STR_Palette]);
        if (_val)
        {
            _x  = _xl0;
            _y += _DIST2;
            _text  = "RANDO COLORS";
            //_text  = "RANDO PALETTES";
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        // =================================================================
        // Dungeon Tilesets ----------------------------------------------
            _val = val(_dm_Rando[?STR_Randomize+STR_Dungeon+STR_Tileset]);
        if (_val)
        {
            _x  = _xl0;
            _y += _DIST2;
            _text  = "RANDO DUNGEON TILESET";
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        
        
        
        
        
        
        
        
        // =================================================================
        // Requirements --------------------------------------
        _y += _DIST3;
        _y += 1;
        
        _xl0 = _XL2;
        _xc0 = _Area2_XC;
        _y  = _YT1;
        
        _y += _DIST2;
        _text = "_REQUIREMENTS_";
        //_text  = "_REQUIREMENTS SETTINGS_";
        _font_sprite = _FONT_SPRITE2;
        _x  = _xc0-((string_length(_text)*sprite_get_width(_font_sprite))>>1);
        draw_text_(_x,_y, _text, _font_sprite);
        
        
        _x  = _xl0;
        _y += _DIST2;
        _y += 4;
        _pi = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
        draw_sprite_(spr_Crystal_1a,0, _x+4,_y+4, _pi);
        
        _x += $8;
        draw_text_(_x,_y, "*", -1,PI_MENU);
        //draw_sprite_(spr_Times_symbol,0, _x,_y, PI_MENU);
        
        _x += $8;
        _val = val(_dm_FILE[?STR_Crystal+STR_Required+STR_Count], f.CRYSTAL_MAX);
        _text = string(_val);
        draw_text_(_x,_y, _text, spr_Font1,PI_MENU);
        
        
        
        _x += $18+$0;
        _yoff = 1;
        _pi = PI_MOB_ORG;
        draw_sprite_(spr_Bot2_Norm,    0, _x,_y+_yoff, _pi);
        draw_sprite_(spr_Bot_Eyes_1a_1,0, _x,_y+_yoff, _pi);
        draw_sprite_(spr_1x1_WHT,0, _x-1,_y+3+_yoff, -1, 2,1, get_pal_color(_pi,3));
        
        _x += $9;
        draw_text_(_x,_y, "*", -1,PI_MENU);
        //draw_sprite_(spr_Times_symbol,0, _x,_y, PI_MENU);
        
        _x += $8;
        _val = val(g.dm_spawn[?STR_Kakusu+STR_Count], 12);
        _val = val(_dm_FILE[?STR_Kakusu+STR_Required+STR_Count], _val);
        _text = string(_val);
        draw_text_(_x,_y, _text, spr_Font1,PI_MENU);
        
        
        
        
        
        
        
        // =================================================================
        // Start Quest, Start Levels --------------------------------------
        _y += _DIST3;
        _y += 2;
        
        _y += _DIST2;
        _y += 2;
        _text  = "_START-WITH SETTINGS_";
        //_text  = "-START OPTIONS-";
        _font_sprite = _FONT_SPRITE2;
        _x  = _xc0;
        _x -= (string_length(_text)*sprite_get_width(_font_sprite))>>1;
        draw_text_(_x,_y, _text, _font_sprite);
        
        
        _x  = _xl0;
        _y += _DIST2;
        _y += 2;
        _text  = "START QUEST: "+string(val(_dm_FILE[?STR_File+STR_Start+STR_Quest]));
        _text += " ";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        
        _datakey1=STR_File+STR_Start+STR_Level;
        
        _y += _DIST2;
        _y += 3;
        
        _x  = _xl0;
        _text  = "START LEVELS:"
        _font_sprite = FONT_SPRITE1;
        draw_text_(_x,_y, _text, _font_sprite);
        
        // Attack level
        _x += (string_length(_text)*sprite_get_width(_font_sprite));
        _x += -2;
        draw_spr_aligned(global.SPR_ICON_ATK, _x,_y,  -1,-1, PI_MENU);
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Attack])));
        
        // Magic level
        _x += $02<<3;
        draw_spr_aligned(global.SPR_ICON_MAG, _x,_y,  -1,-1, PI_MENU);
        //_x += 1;
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Magic])));
        
        // Life level
        _x += $02<<3;
        _x += 1;
        draw_spr_aligned(global.SPR_ICON_LIF, _x,_y,  -1,-1, PI_MENU);
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Life])));
        
        
        
        
        
        
        
        // =================================================================
        // Start Items --------------------------------------
        _y += _DIST4;
        
        _y += 4;
        //_y -= 1;
        _x  = _xl0;
        _text  = "START ITEMS:"
        _font_sprite = FONT_SPRITE1;
        draw_text_(_x,_y, _text, _font_sprite);
        
        _x  = _xl0;
        _y += _DIST2;
        _y += 8;
        _y += 1;
        var _ITEMS = val(_dm_FILE[?STR_File+STR_Start+STR_Items]);
        
        for(_i=0; _i<RandoOTHER_ITEMS_item_cursor_COUNT; _i++)
        {
            switch(_i){
            default:{continue;}
            case RandoOTHER_ITEMS_item_cursor_CANDLE: {_dk=STR_CANDLE;  _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_SHIELD: {_dk=STR_SHIELD;  _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_BAIT:   {_dk=STR_MEAT;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_RING:   {_dk=STR_RING;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_PENDANT:{_dk=STR_PENDANT; _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_SWORD:  {_dk=STR_SWORD;   _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_FEATHER:{_dk=STR_FEATHER; _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_NOTE:   {_dk=STR_NOTE;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_MAP1:   {_dk=STR_MAP1;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_MAP2:   {_dk=STR_MAP2;    _pi=PI_MOB_ORG; break;}
            }
            
            if!(_ITEMS&val(g.dm_ITEM[?_dk+STR_Bit])) _pi=PI_DARKLONK;
            
            
            _sprite=val(g.dm_ITEM[?_dk+STR_Sprite], spr_Torch_1a);
            _w = sprite_get_width(_sprite);
            draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
            
            _x += _w+_ITEM_PAD;
            if (_i!=RandoOTHER_ITEMS_item_cursor_MAP1) _x += 2;
        }
        
        
        
        
        
        
        
        
        
        
        
        _y += $13;
        
        _x  = _xl0;
            _count = val(_dm_FILE[?STR_File+STR_Start+STR_Container+STR_HP], f.CONT_MIN_HP);
        if (_count>f.CONT_MIN_HP) _pi=PI_MOB_RED;
        else                      _pi=PI_DARKLONK;
        
        _sprite=spr_Item_Heart_container_1d;
        _w = sprite_get_width(_sprite);
        draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
        _x += _w;
        
        _x += 1;
        draw_text_(_x,_y-2, "*", -1,PI_MENU);
        //draw_sprite_(spr_Times_symbol,0, _x,_y-2, PI_MENU);
        
        _x += 4;
        _text=string(_count);
        draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU);
        _x += 8;
        
        
        
        
        
        _x += $9;
            _count = val(_dm_FILE[?STR_File+STR_Start+STR_Container+STR_MP], f.CONT_MIN_MP);
        if (_count>f.CONT_MIN_MP) _pi=PI_MOB_ORG;
        else                      _pi=PI_DARKLONK;
        
        _sprite=spr_Item_Magic_container_1d;
        _w = sprite_get_width(_sprite);
        draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
        _x += _w;
        
        _x += -1;
        draw_text_(_x,_y-2, "*", -1,PI_MENU);
        //draw_sprite_(spr_Times_symbol,0, _x,_y-2, PI_MENU);
        
        _x += 4;
        _text=string(_count);
        draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU);
        _x += 8;
        
        
        
        
        
        _x += $B;
            _count = val(_dm_FILE[?STR_File+STR_Start+STR_Dolls]);
        if (_count) _pi=PI_PC_1;
        else        _pi=PI_DARKLONK;
        
        _sprite=val(g.dm_ITEM[?STR_1UP+STR_Sprite], spr_Torch_1a);
        _w = sprite_get_width(_sprite);
        draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
        _x += _w;
        
        _x += 1;
        draw_text_(_x,_y-2, "*", -1,PI_MENU);
        //draw_sprite_(spr_Times_symbol,0, _x,_y-2, PI_MENU);
        
        _x += 8;
        _text=string(_count);
        draw_text_(_x+(_w>>1)-4, _y-2, _text, -1,PI_MENU);
        _x += 8;
        
        
        
        
        
        
        // =================================================================
        // Start Spells --------------------------------------
        _y += _DIST2;
        
        
        var _SPELLS = val(_dm_FILE[?STR_File+STR_Start+STR_Spells]);
        if (_SPELLS)
        {
            _y += _DIST4;
            _y += -1;
            _x  = _xl0;
            _text  = "START SPELLS:"
            _font_sprite = FONT_SPRITE1;
            draw_text_(_x,_y, _text, _font_sprite);
            
            _y += 1;
            _count = ds_list_size(g.dl_Spell_STR);
            for(_i=0; _i<_count; _i++)
            {
                _spell_name = g.dl_Spell_STR[|_i];
                _spell_bit  = val(g.dm_Spell[?STR_Bit+_spell_name]);
                if (_SPELLS&_spell_bit)
                {
                    _x  = _xl0;
                    _y += _DIST2;
                    draw_text_(_x,_y, " "+string_letters(_spell_name), _FONT_SPRITE3, _PI1);
                }
            }
        }
        
        
        
        
        
        
        
        
        
        pal_swap_reset();
        
        
        ds_map_destroy(_dm_Rando); _dm_Rando=undefined;
    }
}

ds_map_destroy(_dm_FILE); _dm_FILE=undefined;







/*
/// FileSelect_draw_savefile_rando_info(file num)


var _datakey,_datakey1;

var _FILE_NUM  = argument0;
var _FILE_NAME = f.ar_FILE_NAMES[_FILE_NUM-1];
var _FILE      = file_text_open_read(working_directory+_FILE_NAME);
var _FILE_DATA = file_text_read_string(_FILE);
                 file_text_close(      _FILE);
var _dm_FILE   = json_decode(_FILE_DATA);

var _QUEST_NUM = val(_dm_FILE[?STR_File+STR_Start+STR_Quest]); // I'm letting this return 0 to indicate to me there's an issue
var _datakey = STR_Quest+hex_str(_QUEST_NUM);


var _DIST1 = sprite_get_width(FONT_SPRITE1);
var _DIST2 = _DIST1+$1;
var _DIST3 = $4; // y padding




if (val(_dm_FILE[?_datakey+STR_Rando+STR_Active]))
{
    var              _Rando_DATA = _dm_FILE[?_datakey+STR_Rando+STR_Data];
    if(!is_undefined(_Rando_DATA))
    {
        var _dm_Rando = json_decode(_Rando_DATA);
        var _i,_j, _count;
        var _x,_y, _clm,_row;
        var _y1, _yoff;
        var _Area_XR = viewW()-8;
        var _add_row = 0;
        var _text;
        var _sprite;
        var _w,_h;
        var _ITEM_PAD=2;
        var _item_bit=0;
        var _spell_name=undefined;
        var _spell_bit=0;
        var _pi;
        
        var _XL  = FileRandoData_CLM<<3;
            _XL -= $6;
        var _YT  = $8;
        
        pal_swap_set(p.palette_image, PI_MENU);
        
        _x = _XL;
        _y = _YT;
        _text  = f.ar_save_names[_FILE_NUM-1];
        _text += " - RANDO INFO";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        _x = _XL;
        _y += _DIST2;
        _count  = (viewXR()-_x) div _DIST1;
        //_count -= 1;
        _text = string_repeat("-", _count);
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        _y += _DIST3;
        
        
        
        
        
        // =================================================================
        // Seed -------------------------------------------------
        _x = _XL;
        _y += _DIST2;
        _text = "SEED";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        _y += _DIST3;
        
        _x += (string_length(_text)<<3) + $02;
        _x += $04; // _x is sprite center. +$04: half sprite width
        _y1 = _y-1; // _y is sprite center and _text center.
        var _SEED = FileSelect_get_file_seed(_FILE_NUM,1);
        Rando_draw_seed(_x,_y1, _SEED, $02);
        
        
        
        
        
        
        
        
        // =================================================================
        // Items ----------------------------------------------
        _y += _DIST3;
        
        if (val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]))
        {
            _val = val(_dm_Rando[?STR_Randomize+STR_Item+STR_Method]);
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ITEM RANDO METHOD");
            //_text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "RANDOMIZATION METHOD");
            _text += " "+string(_val);
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
            
            _val = val(_dm_Rando[?STR_Dark_Room+STR_Difficulty]);
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "DARKROOM DIFFICULTY", 4);
            _text += " "+string(_val);
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
            
                _val = val(_dm_Rando[?STR_Item+STR_Location+STR_Hint]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ITEM LOCATION HINTS");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
            
            _val = val(_dm_Rando[?STR_Randomize+STR_Item+STR_Locations]);
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ITEM LOCATIONS");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
            
            
                _val = val(_dm_Rando[?STR_Randomize+STR_PBAG+STR_Locations]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "PBAG LOCATIONS");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Key+STR_Locations]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "KEY LOCATIONS");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
        }
        
        
        
        
        
        
        // =================================================================
        // Spells ----------------------------------------------
        _y += _DIST3;
        
            _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Locations]);
        if (_val)
        {
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "SPELL LOCATIONS");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
            _val = val(_dm_Rando[?STR_Randomize+STR_Spell+STR_Cost]);
        if (_val)
        {
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "SPELL COSTS");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        
        
        
        
        // =================================================================
        // Enemies ----------------------------------------------
        _y += _DIST3;
        
        if (val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]))
        {
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Difficulty]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY DIFFICULTY", 4);
                _text += " "+string(_val);
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Method]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY ");
                switch(_val){
                case 1:{_text+="SPAWNS"; break;}
                case 2:{_text+="TYPES"; break;}
                }
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_HP]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY HP");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Damage]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY DAMAGE");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_Spawner]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY SPAWNERS");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
            
                _val = val(_dm_Rando[?STR_Randomize+STR_Enemy+STR_ENIGMA]);
            if (_val)
            {
                _x = _XL;
                _y += _DIST2;
                _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "ENEMY ENIGMA");
                draw_text_(_x,_y, _text, FONT_SPRITE1);
            }
        }
        
        
        
        
        // =================================================================
        // Level Costs ----------------------------------------------
        _y += _DIST3;
        
            _val = val(_dm_Rando[?STR_Randomize+STR_Level+STR_Cost]);
        if (_val)
        {
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "LEVEL COSTS");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        // =================================================================
        // XP ----------------------------------------------
            _val = val(_dm_Rando[?STR_Randomize+STR_XP]);
        if (_val)
        {
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "XP");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        
        
        
        // =================================================================
        // Palette ----------------------------------------------
            _val = val(_dm_Rando[?STR_Randomize+STR_Palette]);
        if (_val)
        {
            _x = _XL;
            _y += _DIST2;
            _text  = FileSelect_draw_savefile_rando_info_1a(_x,_y, _Area_XR, "PALETTES");
            draw_text_(_x,_y, _text, FONT_SPRITE1);
        }
        
        
        
        
        
        
        
        
        
        // =================================================================
        // Requirements --------------------------------------
        _y += _DIST3;
        _y += 2;
        
        _x = _XL;
        _y += _DIST2;
        _text  = "_REQUIREMENTS_";
        //_text  = "_REQUIREMENTS SETTINGS_";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        
        _x = _XL;
        _y += _DIST2;
        _y += 4;
        _pi = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
        draw_sprite_(spr_Crystal_1a,0, _x+4,_y+4, _pi);
        
        _x += $8;
        draw_sprite_(spr_Times_symbol,0, _x,_y, PI_MENU);
        
        //get_saved_value(f.file_num, STR_Crystal+STR_Required+STR_Count, f.CRYSTAL_MAX);
        _x += $8;
        _val = val(_dm_FILE[?STR_Crystal+STR_Required+STR_Count], f.CRYSTAL_MAX);
        //_val = val(_dm_Rando[?STR_Crystal+STR_Required+STR_Count], f.CRYSTAL_MAX);
        _text = string(_val);
        draw_text_(_x,_y, _text, FONT_SPRITE1,PI_MENU);
        
        
        
        _x += $18+$0;
        _yoff = 1;
        _pi = PI_MOB_ORG;
        draw_sprite_(spr_Bot2_Norm,    0, _x,_y+_yoff, _pi);
        draw_sprite_(spr_Bot_Eyes_1a_1,0, _x,_y+_yoff, _pi);
        draw_sprite_(spr_1x1_WHT,0, _x-1,_y+3+_yoff, -1, 2,1, get_pal_color(_pi,3));
        
        _x += $9;
        draw_sprite_(spr_Times_symbol,0, _x,_y, PI_MENU);
        
        _x += $8;
        _val = val(g.dm_spawn[?STR_Kakusu+STR_Count], 12);
        _val = val(_dm_FILE[?STR_Kakusu+STR_Required+STR_Count], _val);
        //_val = val(_dm_Rando[?STR_Kakusu+STR_Required+STR_Count], _val);
        _text = string(_val);
        draw_text_(_x,_y, _text, FONT_SPRITE1,PI_MENU);
        
        
        
        
        
        
        // =================================================================
        // Start Quest, Start Levels --------------------------------------
        _y += _DIST3;
        _y += 2;
        
        _x = _XL;
        _y += _DIST2;
        _text  = "_START-WITH SETTINGS_";
        //_text  = "-START OPTIONS-";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        
        _x = _XL;
        _y += _DIST2;
        _text  = "QUEST-"+string(val(_dm_FILE[?STR_File+STR_Start+STR_Quest]));
        _text += " ";
        draw_text_(_x,_y, _text, FONT_SPRITE1);
        
        
        _datakey1=STR_File+STR_Start+STR_Level;
        
        _y += _DIST2;
        _y += 1;
        
        // Attack level
        _x = _XL;
        draw_spr_aligned(g.SPR_ICON_ATK, _x,_y,  -1,-1, PI_MENU);
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Attack])), -1,-1);
        
        // Magic level
        _x += $02<<3;
        draw_spr_aligned(g.SPR_ICON_MAG, _x,_y,  -1,-1, PI_MENU);
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Magic])), -1,-1);
        
        // Life level
        _x += $02<<3;
        draw_spr_aligned(g.SPR_ICON_LIF, _x,_y,  -1,-1, PI_MENU);
        draw_text_(_x+8,_y, string(val(_dm_FILE[?_datakey1+STR_Life])), -1,-1);
        
        
        
        // =================================================================
        // Start Items --------------------------------------
        _x = _XL;
        _y += _DIST2;
        _y += 8;
        _y += 2;
        var _ITEMS       = val(_dm_FILE[?STR_File+STR_Start+STR_Items]);
        var _DOLL_COUNT  = val(_dm_FILE[?STR_File+STR_Start+STR_Dolls]);
        var _HEART_COUNT = val(_dm_FILE[?STR_File+STR_Start+STR_Container+STR_HP], f.CONT_MIN_HP);
        var _MAGIC_COUNT = val(_dm_FILE[?STR_File+STR_Start+STR_Container+STR_MP], f.CONT_MIN_MP);
        
        for(_i=0; _i<RandoOTHER_ITEMS_item_cursor_COUNT; _i++)
        {
            switch(_i){
            default:{continue;}
            case RandoOTHER_ITEMS_item_cursor_CANDLE: {_dk=STR_CANDLE;  _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_SHIELD: {_dk=STR_SHIELD;  _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_RING:   {_dk=STR_RING;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_PENDANT:{_dk=STR_PENDANT; _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_SWORD:  {_dk=STR_SWORD;   _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_NOTE:   {_dk=STR_NOTE;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_MAP1:   {_dk=STR_MAP1;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_MAP2:   {_dk=STR_MAP2;    _pi=PI_MOB_ORG; break;}
            case RandoOTHER_ITEMS_item_cursor_DOLLS:  {_dk=STR_1UP;     _pi=PI_PC_1; break;}
            case RandoOTHER_ITEMS_item_cursor_HEART:  {_dk=STR_HEART;   _pi=PI_MOB_RED; break;}
            case RandoOTHER_ITEMS_item_cursor_MAGIC:  {_dk=STR_MAGIC;   _pi=PI_MOB_ORG; break;}
            }
            
            switch(_i)
            {
                default:{
                if!(_ITEMS&val(g.dm_ITEM[?_dk+STR_Bit])) _pi=PI_DARKLONK;
                break;}
                
                case RandoOTHER_ITEMS_item_cursor_DOLLS:{
                if(!_DOLL_COUNT) _pi=PI_DARKLONK;
                break;}
                
                case RandoOTHER_ITEMS_item_cursor_HEART:{
                if (_HEART_COUNT<=f.CONT_MIN_HP) _pi=PI_DARKLONK;
                break;}
                
                case RandoOTHER_ITEMS_item_cursor_MAGIC:{
                if (_MAGIC_COUNT<=f.CONT_MIN_MP) _pi=PI_DARKLONK;
                break;}
            }
            
            
            
            switch(_i){
            default:{_sprite=val(g.dm_ITEM[?_dk+STR_Sprite], spr_Torch_1a); break;}
            case RandoOTHER_ITEMS_item_cursor_HEART:{_sprite=spr_Item_Heart_container_1d; break;}
            case RandoOTHER_ITEMS_item_cursor_MAGIC:{_sprite=spr_Item_Magic_container_1d; break;}
            }
            
            
            
            _w = sprite_get_width(_sprite);
            draw_sprite_(_sprite,0, _x+(_w>>1),_y, _pi);
            
            if (_i==RandoOTHER_ITEMS_item_cursor_DOLLS 
            ||  _i==RandoOTHER_ITEMS_item_cursor_HEART 
            ||  _i==RandoOTHER_ITEMS_item_cursor_MAGIC )
            {
                     if (_i==RandoOTHER_ITEMS_item_cursor_DOLLS) _text=string(_DOLL_COUNT);
                else if (_i==RandoOTHER_ITEMS_item_cursor_HEART) _text=string(_HEART_COUNT);
                else if (_i==RandoOTHER_ITEMS_item_cursor_MAGIC) _text=string(_MAGIC_COUNT);
                draw_text_(_x+(_w>>1)-4, _y-$11, _text, -1,PI_MENU);
            }
            
            _x += _w+_ITEM_PAD;
        }
        
        _y += 5;
        
        
        
        // =================================================================
        // Start Spells --------------------------------------
        var _SPELLS = val(_dm_FILE[?STR_File+STR_Start+STR_Spells]);
        if (_SPELLS)
        {
            //_y += _DIST3;
            
            _count = ds_list_size(g.dl_Spell_STR);
            for(_i=0; _i<_count; _i++)
            {
                _spell_name = g.dl_Spell_STR[|_i];
                _spell_bit  = val(g.dm_Spell[?STR_Bit+_spell_name]);
                if (_SPELLS&_spell_bit)
                {
                    _x  = _XL;
                    _y += _DIST2;
                    draw_text_(_x,_y, string_letters(_spell_name), FONT_SPRITE1);
                }
            }
        }
        
        
        
        
        
        
        
        
        
        pal_swap_reset();
        
        
        ds_map_destroy(_dm_Rando); _dm_Rando=undefined;
    }
}

ds_map_destroy(_dm_FILE); _dm_FILE=undefined;





*/
