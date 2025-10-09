/// Spawner_Drop_init2()


var _i, _val, _len, _pos, _dk, _tsrc;


var _type = 0;
var _ts_nums = 0;

dg_XY_TS = ds_grid_create(4,2);




_dk = STR_Drop+STR_Spawner+g.rm_name;
var _tileset = global.DropSpawner_dm[?_dk+STR_Tileset];
if(!is_undefined(_tileset))
{
    TILESET = _tileset;
    // top left
    _tsrc = val(global.DropSpawner_dm[?_dk+STR_TSRC+"A"]);
    dg_XY_TS[#0,0] = ((_tsrc>>0)&$F) <<3; // ts x
    dg_XY_TS[#0,1] = ((_tsrc>>4)&$F) <<3; // ts y
    // top right
    _tsrc = val(global.DropSpawner_dm[?_dk+STR_TSRC+"9"]);
    dg_XY_TS[#1,0] = ((_tsrc>>0)&$F) <<3; // ts x
    dg_XY_TS[#1,1] = ((_tsrc>>4)&$F) <<3; // ts y
    // bottom left
    _tsrc = val(global.DropSpawner_dm[?_dk+STR_TSRC+"6"]);
    dg_XY_TS[#2,0] = ((_tsrc>>0)&$F) <<3; // ts x
    dg_XY_TS[#2,1] = ((_tsrc>>4)&$F) <<3; // ts y
    // bottom right
    _tsrc = val(global.DropSpawner_dm[?_dk+STR_TSRC+"5"]);
    dg_XY_TS[#3,0] = ((_tsrc>>0)&$F) <<3; // ts x
    dg_XY_TS[#3,1] = ((_tsrc>>4)&$F) <<3; // ts y
}
else
{
    _ts_nums = $E0E1F0F1;
    
    if (global.dg_solid[# xl>>3   ,(yt>>3)-1] 
    ||  global.dg_solid[#(xl>>3)+1,(yt>>3)-1] )
    {
        _ts_nums &= $0000FFFF;
        _ts_nums |= $E2E30000;
    }
    
    
    if (g.dungeon_num 
    &&  g.dungeon_num<8 )
    {
        var    _DUNGEON_NUM = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], g.dungeon_num);
        switch(_DUNGEON_NUM){
        default:{_tileset=ts_DungeonA01; break;}
        case  1:{_tileset=ts_DungeonA01; break;}
        case  2:{_tileset=ts_DungeonB01; break;}
        case  3:{_tileset=ts_DungeonC01; break;}
        case  4:{_tileset=ts_DungeonD01; break;}
        case  5:{_tileset=ts_DungeonE01; break;}
        case  6:{_tileset=ts_DungeonF01; break;}
        case  7:{_tileset=ts_DungeonG01; break;}
        }//switch(_DUNGEON_NUM)
        
        if (global.RandoDungeonTilesets_enabled)
        {
            _tileset = val(f.dm_rando[?STR_Rando+STR_Tileset+background_get_name(_tileset)], _tileset)
        }
    }
    else
    {
        _type = undefined;
        
        if(!is_undefined(dk_spawn))
        {
            for(_i=$1; _i<=$F; _i++)
            {
                _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
                if(!is_undefined(_val))
                {
                        _pos =string_pos(   STR_Type,_val);
                    if (_pos)
                    {   _pos+=string_length(STR_Type);
                        _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                        _type = str_hex(_val);
                        continue;//_i
                    }
                }
            }
        }
        
        if(!is_undefined(_type))
        {
            _type = clamp(_type,0,4);
            
            switch(_type){
            default:{_tileset=ts_DungeonA01; break;}
            case  0:{_tileset=ts_DungeonG01; break;}
            case  1:{_tileset=ts_DungeonA01; break;}
            case  2:{_tileset=ts_DungeonB01; break;}
            case  3:{_tileset=ts_DungeonC01; break;}
            case  4:{_tileset=ts_DungeonH01; break;}
            }
        }
    }
    
    
    TILESET = val(_tileset,ts_DungeonA01);
    
    
    
    
    //               $(FF)FFFFFF >>$18    top left
    dg_XY_TS[#0,0] = ((_ts_nums>>$18)&$0F) <<3; // ts x
    dg_XY_TS[#0,1] = ((_ts_nums>>$18)&$F0) >>1; // ts y
    //               $FF(FF)FFFF >>$10    top right
    dg_XY_TS[#1,0] = ((_ts_nums>>$10)&$0F) <<3; // ts x
    dg_XY_TS[#1,1] = ((_ts_nums>>$10)&$F0) >>1; // ts y
    //               $FFFF(FF)FF >>$08    btm left
    dg_XY_TS[#2,0] = ((_ts_nums>>$08)&$0F) <<3; // ts x
    dg_XY_TS[#2,1] = ((_ts_nums>>$08)&$F0) >>1; // ts y
    //               $FFFFFF(FF) >>$00    btm right
    dg_XY_TS[#3,0] = ((_ts_nums>>$00)&$0F) <<3; // ts x
    dg_XY_TS[#3,1] = ((_ts_nums>>$00)&$F0) >>1; // ts y
}










luck = 0;
if(!is_undefined(dk_spawn))
{
    for(_i=$1; _i<=$F; _i++)
    {
        _val=val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)]);
        if (is_string(_val))
        {
                _pos =string_pos(   STR_Luck,_val);
            if (_pos)
            {   _pos+=string_length(STR_Luck);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                luck =str_hex(_val);
                continue;//_i
            }
        }
    }
}

luck = clamp(luck, 0,1);









if(!is_undefined(dk_spawn)) palidx = val(g.dm_spawn[?dk_spawn+STR_pal_idx], global.PI_MOB_RED);
else                        palidx = global.PI_MOB_RED;
GO_init_palidx(palidx);


GO_depth_init(DEPTH_ENEMY_PROJECTILE);
Projectile_DEPTH  = depth;
Projectile_DEPTH -= 1;
//Projectile_DEPTH += sign_(_type==3); // _type 3's graphic doesn't have a spout so draw projectile behind instead of infront.


switch(ver){
default:{projectile_OBJ=Drop;   projectile_VER=1; break;}
case 2: {projectile_OBJ=Flame1; projectile_VER=1; break;}
}
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


draw_yoff = 0;
//draw_yoff = -1; // OG
update_draw_xy();

DROP_YOFF = $2;





dg_XY_RM = ds_grid_create(4,2);
// top left
dg_XY_RM[#0,0] = xl;
dg_XY_RM[#0,1] = yt;
// top right
dg_XY_RM[#1,0] = xl + 8;
dg_XY_RM[#1,1] = yt;
// btm left
dg_XY_RM[#2,0] = xl;
dg_XY_RM[#2,1] = yt + 8;
// btm right
dg_XY_RM[#3,0] = xl + 8;
dg_XY_RM[#3,1] = yt + 8;
//                          //



            TIMING = $40;  //  $40: Spawn Drop  every  64 frames. 1.067s
if (ver==2) TIMING = $100; // $100: Spawn Flame every 256 frames. 4.268s
if (ver==2) counter = max(0,TIMING-$40);



// OG waits until cam is close enough to spawn a spawner 
// but since I've changed it so spawners spawn at room enter, 
// "active" blocks the update until OG spawn requirements are met.
    active = false;
//
if(!is_undefined(       dk_spawn))
{   active = string_pos(dk_spawn,STR_PRIO);  }
if(!active){
    var _DIST_X = g.SPAWN_DIST1_X + ww_;
    var _DIST_Y = g.SPAWN_DIST1_Y + hh_;
    var _XL     = viewXL() -  _DIST_X;
    var _YT     = viewYT() -  _DIST_Y;
    var _W      = viewW()  + (_DIST_X<<1);
    var _H      = viewH()  + (_DIST_Y<<1);
    active = pointInRect(spawn_xl+ww_, spawn_yt+hh_, _XL,_YT,_W,_H);
    //active = point_in_rect(spawn_xl+ww_, spawn_yt+hh_, _XL,_YT,_W,_H);
}
if(!active)
{   active = qual_spawn_3a(spawn_xl,ww_, spawn_yt,hh_);  }




