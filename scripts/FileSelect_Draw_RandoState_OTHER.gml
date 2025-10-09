/// FileSelect_Draw_RandoState_OTHER()


var _i,_j, _x,_y, _xl,_yt, _xr, _dist1;
var _dk;
var _text, _char_w;
var _pi,_pi1,_pi2,_pi3;




switch(RandoOTHER_state)
{
    // --------------------------------------------
    case RandoOTHER_state_MAIN:{
    var _FONT_SPRITE=RandoOTHER_MAIN_FONT_SPRITE;
    _char_w = sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#0,0];
    //_dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoOTHER_MAIN_cursor_COUNT; _i++)
    {
        _x = dg_RandoOTHER_Options[#_i,0];
        _y = dg_RandoOTHER_Options[#_i,1];
        
        _text  = dg_RandoOTHER_Options[#_i,3];
        
        if (_i==RandoOTHER_MAIN_cursor) _pi1 = PI_MENU1;
        else                            _pi1 = PI_MENU2;
        
        if (dg_RandoOTHER_Options[#_i,2]<0) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                _pi2 = _pi1;
        
        if (dg_RandoOTHER_Options[#_i,2]<1) _pi3 = PI_DARK3; // -1 means option unavailable
        else                                _pi3 = _pi1;
        
        switch(_i)
        {   // -------------------------------------------------
            case RandoOTHER_MAIN_WARP_PENALTY:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            
            if (dg_RandoOTHER_Options[#_i,2]) _text = Text_ON;
            else                              _text = Text_OFF;
            if (dg_RandoOTHER_Options[#_i,2]) _pi = PI_DARK3;
            else                              _pi = _pi1;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi);
            break;}
            
            // -------------------------------------------------
            case RandoOTHER_MAIN_PALETTE:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            
            if (dg_RandoOTHER_Options[#_i,2]) _text = Text_ON;
            else                              _text = Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi3);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_DUNGEON_TS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi2);
            
            if (dg_RandoOTHER_Options[#_i,2]) _text = Text_ON;
            else                              _text = Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE,_pi3);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_QUEST:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            _text=string(dg_RandoOTHER_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_ATTACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            _text=string(dg_RandoOTHER_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_MAGIC:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            _text=string(dg_RandoOTHER_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_LIFE:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            _text=string(dg_RandoOTHER_Options[#_i,2]);
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_ITEMS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_SPELLS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_SKILLS:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_REQUIRE:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            // ----------------------------------------------------
            case RandoOTHER_MAIN_cursor_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi1);
            break;}
        }
    }//_i
    break;}//case RandoOTHER_state_MAIN:
    
    
    
    
    
    // --------------------------------------------
    case RandoOTHER_state_ITEMS:{
    var _FONT_SPRITE=RandoOTHER_SPELLS_FONT_SPRITE;
    _char_w = sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#0,0];
    //_dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    var _sprite;
    for(_i=0; _i<RandoOTHER_ITEMS_cursor_COUNT; _i++)
    {
        if (_i==RandoOTHER_ITEMS_cursor) _pi1 = PI_MENU1;
        else                             _pi1 = PI_MENU2;
        
        switch(_i)
        {
            case RandoOTHER_ITEMS_cursor_ITEM:{
            for(_j=0; _j<RandoOTHER_ITEMS_item_cursor_COUNT; _j++)
            {
                switch(_j){
                default:{continue;}
                case RandoOTHER_ITEMS_item_cursor_CANDLE: {_dk=STR_CANDLE;  _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_FLUTE:  {_dk=STR_FLUTE;   _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_BAIT:   {_dk=STR_MEAT;    _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_SHIELD: {_dk=STR_SHIELD;  _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_RING:   {_dk=STR_RING;    _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_PENDANT:{_dk=STR_PENDANT; _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_SWORD:  {_dk=STR_SWORD;   _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_FEATHER:{_dk=STR_FEATHER; _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_NOTE:   {_dk=STR_NOTE;    _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_MAP1:   {_dk=STR_MAP1;    _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_MAP2:   {_dk=STR_MAP2;    _pi=global.PI_MOB_ORG; break;}
                case RandoOTHER_ITEMS_item_cursor_DOLLS:  {_dk=STR_1UP;     _pi=global.PI_PC1;     break;}
                case RandoOTHER_ITEMS_item_cursor_HEART:  {_dk=STR_HEART;   _pi=global.PI_MOB_RED; break;}
                case RandoOTHER_ITEMS_item_cursor_MAGIC:  {_dk=STR_MAGIC;   _pi=global.PI_MOB_ORG; break;}
                }
                
                switch(_j){
                default:                                {if(!dg_RandoOTHER_ITEMS[#_j,2]){               _pi=PI_DARK0;} break;}
                case RandoOTHER_ITEMS_item_cursor_HEART:{if (dg_RandoOTHER_ITEMS[#_j,2]==f.CONT_MIN_HP){_pi=PI_DARK0;} break;}
                case RandoOTHER_ITEMS_item_cursor_MAGIC:{if (dg_RandoOTHER_ITEMS[#_j,2]==f.CONT_MIN_MP){_pi=PI_DARK0;} break;}
                }
                
                switch(_j){
                default:{                                _sprite=val(g.dm_ITEM[?_dk+STR_Sprite],spr_Torch_1a); break;}
                case RandoOTHER_ITEMS_item_cursor_HEART:{_sprite=spr_Item_Heart_container_1d; break;}
                case RandoOTHER_ITEMS_item_cursor_MAGIC:{_sprite=spr_Item_Magic_container_1d; break;}
                }
                
                _x = dg_RandoOTHER_ITEMS[#_j,0];
                _y = dg_RandoOTHER_ITEMS[#_j,1];
                draw_sprite_(_sprite,0, _x,_y, _pi);
                
                if (RandoOTHER_ITEMS_cursor==RandoOTHER_ITEMS_cursor_ITEM 
                &&  RandoOTHER_ITEMS_item_cursor==_j )
                {
                    _y += sprite_get_height(_sprite)>>1;
                    _y += 3; // padding
                    _y += sprite_get_height(spr_arrow_6_up)>>1;
                    draw_sprite_(spr_arrow_6_up,0, _x,_y, PI_MENU1);
                }
                
                
                if (_j==RandoOTHER_ITEMS_item_cursor_DOLLS 
                ||  _j==RandoOTHER_ITEMS_item_cursor_HEART 
                ||  _j==RandoOTHER_ITEMS_item_cursor_MAGIC )
                {
                    _text=string(dg_RandoOTHER_ITEMS[#_j,2]);
                    _x =         dg_RandoOTHER_ITEMS[#_j,0] - (_char_w>>1);
                    _y =         dg_RandoOTHER_ITEMS[#_j,1] - $10;
                    _pi=PI_MENU1;
                    switch(_j){
                    case RandoOTHER_ITEMS_item_cursor_DOLLS:{if(!dg_RandoOTHER_ITEMS[#_j,2]){               _pi=PI_DARK0;} break;}
                    case RandoOTHER_ITEMS_item_cursor_HEART:{if (dg_RandoOTHER_ITEMS[#_j,2]==f.CONT_MIN_HP){_pi=PI_DARK0;} break;}
                    case RandoOTHER_ITEMS_item_cursor_MAGIC:{if (dg_RandoOTHER_ITEMS[#_j,2]==f.CONT_MIN_MP){_pi=PI_DARK0;} break;}
                    }
                    draw_text_(_x,_y, _text, _FONT_SPRITE,_pi);
                }
            }
            break;}//case RandoOTHER_ITEMS_cursor_ITEM:
            
            
            
            case RandoOTHER_ITEMS_cursor_BACK:{
            _x  = RandoOptions_X;
            _y  = dg_RandoOTHER_ITEMS[#RandoOTHER_ITEMS_item_cursor_CANDLE,1];
            _y += RandoOTHER_ITEMS_cursor_BACK_YOFF;
            draw_text_(_x,_y, "BACK", -1, _pi1);
            break;}//case RandoOTHER_ITEMS_cursor_BACK:
        }//switch(_i)
    }//_i
    break;}//case RandoOTHER_state_ITEMS:
    
    
    
    
    // --------------------------------------------
    case RandoOTHER_state_SPELLS:{
    var _FONT_SPRITE=spr_Font2;
    _char_w = sprite_get_width(_FONT_SPRITE);
    _dist1 = viewXC()-dg_RandoMAIN_Options[#0,0];
    //_dist1 = viewXC()-dg_RandoMAIN_Options[#_i,0];
    _xr = viewXC()+_dist1;
    
    for(_i=0; _i<RandoOTHER_SPELLS_cursor_COUNT; _i++)
    {
        _x = dg_RandoOTHER_SPELLS[#_i,0];
        _y = dg_RandoOTHER_SPELLS[#_i,1];
        
        _text  = string_letters(dg_RandoOTHER_SPELLS[#_i,3]);
        
        if (_i==RandoOTHER_SPELLS_cursor) _pi1 = PI_MENU1;
        else                              _pi1 = PI_MENU2;
        
        if (dg_RandoOTHER_SPELLS[#_i,2]<1) _pi2 = PI_DARK3; // -1 means option unavailable
        else                               _pi2 = _pi1;
        
        switch(_i)
        {
            default:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi1);
            
            if (dg_RandoOTHER_SPELLS[#_i,2]) _text=Text_ON;
            else                             _text=Text_OFF;
            _x  = _xr-(string_length(_text)*_char_w);
            _x -= _x mod _char_w;
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi2);
            break;}
            
            
            case RandoOTHER_SPELLS_cursor_BACK:{
            draw_text_(_x,_y, _text, _FONT_SPRITE, _pi1);
            break;}
        }
    }
    break;}
    
    
    
    
    // --------------------------------------------
    case RandoOTHER_state_SKILLS:{
    _x =dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABDOWN,0] + PC_W_;
    _y =dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABDOWN,1] + PC_H_;
    if (dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABDOWN,2]) _pi = global.PI_PC1;
    else                                                            _pi = PI_DARK1;
    draw_pc_skin(_x,_y, 1,1, global.pc.behavior_STAB_DOWN, false, -1,-1, _pi);
    
    
    _x =dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABUP,0] + PC_W_;
    _y =dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABUP,1] + PC_H_;
    if (dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_STABUP,2]) _pi = global.PI_PC1;
    else                                                          _pi = PI_DARK1;
    draw_pc_skin(_x,_y, 1,1, global.pc.behavior_STAB_UP, false, -1,-1, _pi);
    
    
    _x = dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_BACK,0];
    _y = dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_BACK,1];
    _text = string_letters(dg_RandoOTHER_SKILLS[#RandoOTHER_SKILLS_cursor_BACK,3]);
    if (RandoOTHER_SKILLS_cursor==RandoOTHER_SKILLS_cursor_BACK) _pi = PI_MENU1;
    else                                                         _pi = PI_MENU2;
    draw_text_(_x,_y, _text, RandoOTHER_SKILLS_FONT_SPRITE, _pi);
    break;}
    
    
    
    
    // --------------------------------------------
    case RandoOTHER_state_REQUIRE:{
    for(_i=0; _i<RandoOTHER_REQUIRE_cursor_COUNT; _i++)
    {
        if (_i==RandoOTHER_REQUIRE_cursor) _pi1 = PI_MENU1;
        else                               _pi1 = PI_MENU2;
        
        if (dg_RandoOTHER_REQUIRE[#_i,2]<0) _pi2 = PI_DARK3; // -1 means option unavailable
        else                                _pi2 = _pi1;
        
        switch(_i)
        {
            case RandoOTHER_REQUIRE_cursor_CRYSTALS:{
            _x  = dg_RandoOTHER_REQUIRE[#_i,0];
            _x += $1; // micro adj
            _y  = dg_RandoOTHER_REQUIRE[#_i,1];
            _y += $4; // micro adj
            _pi = p.dg_PI_SEQ[#$00, (g.counter1>>1)&$3];
            draw_sprite_(spr_Crystal_1a,0, _x,_y, _pi);
            
            _xl  = dg_RandoOTHER_REQUIRE[#_i,0];
            _xl += $10;
            _yt  = dg_RandoOTHER_REQUIRE[#_i,1];
            _yt += $1; // micro adj
            draw_text_(_xl,_yt, "*", -1, _pi2);
            
            _xl += $C;
            _text = string(dg_RandoOTHER_REQUIRE[#_i,2]);
            draw_text_(_xl,_yt, _text, -1, _pi2);
            break;}
            
            
            case RandoOTHER_REQUIRE_cursor_KAKUSU:{
            _x = dg_RandoOTHER_REQUIRE[#_i,0];
            _y = dg_RandoOTHER_REQUIRE[#_i,1];
            _pi = global.PI_MOB_ORG;
            draw_sprite_(spr_Bot2_Norm,    0, _x,_y, _pi);
            draw_sprite_(spr_Bot_Eyes_1a_1,0, _x,_y, _pi);
            draw_sprite_(spr_1x1_WHT,0, _x-1,_y+3, -1, 2,1, get_pal_color(p.pal_rm_curr, _pi, "B"));
            
            _xl  = dg_RandoOTHER_REQUIRE[#_i,0];
            _xl += $C;
            _yt  = dg_RandoOTHER_REQUIRE[#_i,1];
            draw_text_(_xl,_yt, "*", -1, _pi2);
            
            _xl += $C;
            _text = string(dg_RandoOTHER_REQUIRE[#_i,2]);
            draw_text_(_xl,_yt, _text, -1, _pi2);
            break;}
            
            
            case RandoOTHER_REQUIRE_cursor_BACK:{
            _xl = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,0];
            _yt = dg_RandoOTHER_REQUIRE[#RandoOTHER_REQUIRE_cursor_BACK,1];
            draw_text_(_xl,_yt, "BACK", -1, _pi1);
            break;}
        }
    }
    break;}
}




