/// Spawner_NPC_update()


// 96E0
    counter=(counter+1)&$FF;
if (counter)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var     _count  = 0;
with(NPC)
{
        _count += (!!state);
    if (_count >= other.LIMIT)
    {
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}



// --------------------------------------------------------------------
// 96F0
var _val, _dir, _xl, _yt;


var _VER = (rand()&$3) + 1; // 1,2,3,4

          _dir  = Input.held&$3; // 0,1,2
if(!_dir) _dir  = _VER-1;        // Neither dir held
          _dir &= $1;            // 0: Left held, 1: Right held, 0 or 1 randomly if neither held
//
if (_dir) _dir  = -1;  // Walk left
else      _dir  =  1;  // Walk right


if(!_dir) _xl = viewXR()-1 + ($1<<3); // Spawn right of screen & walk left
else      _xl = viewXL()   - ($4<<3); // Spawn left  of screen & walk right

_yt  = cam_yb_max()-($1<<3);
_yt  = get_ground_y(_xl+8,_yt, -1, _yt, TID_SOLID1|TID_ONEWY1);
_yt -= $4<<3;

with(GameObject_create(_xl,_yt, NPC_2,1))
{
    var _use_costume = global.Halloween1_enabled && !irandom($3);
    counter   = 0;
    facing_dir = _dir;
    
    
    switch(_VER)
    {   // -------------------------------------------------
        case 1:{   // sprIndex 2: Large man
        if (g.town_name==STR_Bulblin){
            GO_init_palidx(global.PI_MOB_BLU);
            sprite_datakey = STR_Geru;
        }else{
            GO_init_palidx(global.PI_MOB_PUR);
            sprite_datakey = STR_Jack;
            if (_use_costume){
                if (irandom($1)) sprite_datakey = STR_Castlevania+"02"+STR_NPC  +"01";
                else             sprite_datakey = STR_Castlevania+"02"+STR_Enemy+"01";
            }
        }
        hspd = $4<<2;
        break;}
        // -------------------------------------------------
        case 2:{   // sprIndex 1: Pot lady
        if (g.town_name==STR_Bulblin){
            GO_init_palidx(global.PI_MOB_RED);
            sprite_datakey = STR_Goriya;
        }else{
            GO_init_palidx(global.PI_MOB_RED);
            sprite_datakey = STR_Zoey;
            if (_use_costume){
                if (irandom($1)) sprite_datakey = STR_Castlevania+"02"+STR_NPC  +"02";
                else             sprite_datakey = STR_Castlevania+"02"+STR_Enemy+"02";
            }
        }
        hspd = $3<<2;
        break;}
        // -------------------------------------------------
        case 3:{   // sprIndex 3: Old Woman
        if (g.town_name==STR_Bulblin){
            GO_init_palidx(global.PI_MOB_RED);
            sprite_datakey = STR_Daira;
        }else{
            GO_init_palidx(global.PI_MOB_RED);
            sprite_datakey = STR_Barb;
            if (_use_costume){
                if (irandom($1)) sprite_datakey = STR_Castlevania+"02"+STR_NPC  +"03";
                else             sprite_datakey = STR_Castlevania+"02"+STR_Enemy+"03";
            }
        }
        hspd = $2<<2;
        break;}
        // -------------------------------------------------
        case 4:{   // sprIndex 0: Thin lady
        if (g.town_name==STR_Bulblin){
            GO_init_palidx(global.PI_MOB_BLU);
            sprite_datakey = STR_Moblin;
        }else{
            GO_init_palidx(global.PI_MOB_PUR);
            sprite_datakey = STR_Jill;
            if (_use_costume){
                if (irandom($1)) sprite_datakey = STR_Castlevania+"02"+STR_NPC  +"04";
                else             sprite_datakey = STR_Castlevania+"02"+STR_Enemy+"04";
            }
        }
        hspd = $3<<2;
        break;}
    }
    
    if(!is_undefined(sprite_datakey))
    {
        GO_sprite_init(val(g.dm_NPC[?STR_Sprite+sprite_datakey+"01"], spr_0));
    }
    
    
    if (sprite_datakey==STR_Girubokku) hspd = $10;
    hspd = (hspd*facing_dir) &$FF;
    set_hspd_dir();
    hspd_dir_spawn = hspd_dir;
    
    
    
         dialogue_datakey  = '02_';
    if (g.town_name==STR_Bulblin)
    {    dialogue_datakey += '4';  }
    else dialogue_datakey += '0';
    
    _val = !is_undefined(g.town_name) && isVal(g.town_name, STR_Nabooru,STR_Darunia,STR_New_Kasuto,STR_Old_Kasuto);
    _val = _val<<2; // 0,4
    _val = string_copy(hex_str((_VER-1)+_val),2,1); // West: 0,1,2,3, East: 4,5,6,7, Monster: 8,9,A,B
    dialogue_datakey += _val+"_";
    
    if (global.Halloween1_enabled)
    {
        dialogue_datakey = val(g.DIALOGUE_WINDOW.dm_dialogue[?STR_Halloween+dialogue_datakey], dialogue_datakey);
    }
    
    
    
    // Just in case. Sprite might be short.
    var _Y  = yt;
        _Y  = get_ground_y(x,_Y, 1, _Y, TID_SOLID1|TID_ONEWY1);
        _Y -= hh_;
    set_xy(id, x,_Y);
}




