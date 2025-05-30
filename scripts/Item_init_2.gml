/// Item_init_2()

// ItmA0 v1 = CANDLE
// ItmA1 v1 = GLOVE
// ItmA2 v1 = HAMMER
// ItmA3 v1 = RAFT
// ItmA4 v1 = BOOTS
// ItmA5 v1 = FLUTE
// ItmA6 v1 = MAGICAL KEY
// ItmA7 v1 = CROSS
//                          // 
// ItmB0 v1 = HEART CONTAINER
// ItmB1 v1 = MAGIC CONTAINER
//                          // 
// ItmC0 v1 = TROPHY
// ItmC0 v2 = Returned TROPHY in Ruto
// ItmC1 v1 = NOTE
// ItmC2 v1 = MIRROR
// ItmC3 v1 = MEDICINE
// ItmC4 v1 = CHILD
//                          // 
// ItmD0 v1 = Key
// ItmD0 v2 = Skull Key
//                          // 
// ItmE0 v1 = Jar - Magic - Full
// ItmE0 v2 = Jar - Magic - $10
//                          // 
// ItmF0 v1 = Bag - Points -   50
// ItmF0 v2 = Bag - Points -  100
// ItmF0 v3 = Bag - Points -  150
// ItmF0 v4 = Bag - Points -  200
// ItmF0 v5 = Bag - Points -  250
// ItmF0 v6 = Bag - Points -  300
// ItmF0 v7 = Bag - Points -  400
// ItmF0 v8 = Bag - Points -  500
// ItmF0 v9 = Bag - Points -  700
// ItmF0 vA = Bag - Points - 1000
//                          // 
// ItmG0 v1 = Extra Life
//                          // 
// ItmS0 v1 = Spell Item(For rando)


var _i,_j, _val, _count;


//if (g.pc.use_disguise)


if(!audio_is_playing(get_audio_theme_track(dk_ItemDrop)) 
&&  isVal(ITEM_TYPE,STR_KEY,STR_JAR,STR_PBAG,STR_1UP)  
&&  rectInView(xl,yt,ww,hh) 
&& !(g.dg_RmTile_solid[#x>>3,(yb+1)>>3] &$FF) ) // If not on ground
{
    aud_play_sound(get_audio_theme_track(dk_ItemDrop));
}



if (ITEM_TYPE==STR_PBAG)
{
    DRAW_YOFF = 0;
    //if (global.Halloween1_ENABLED) GO_sprite_init(spr_CandyCorn01);
}


if (ITEM_TYPE==STR_HEART)
{
    var _PAL = build_pal(p.C_WHT1,p.C_RED3,p.C_ORG4,p.C_BLK1,-2,-2,-2,-2);
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(global.PI_MOB_RED), string_length(_PAL), _PAL));
}



if (ITEM_TYPE==STR_RFAIRY)
{
    GROUND_Y = get_ground_y(x,y, 1,yb, TID_SOLID1|TID_ONEWY1);
    set_xy(id, x, GROUND_Y-$10-hh_);
}


// So super cucco can grab the falling key
if (g.CuccoSpell2_Active 
&&  ITEM_TYPE==STR_KEY 
&& !is_undefined(dk_spawn) 
&&  dk_spawn==val(g.dm_spawn[?"FallingKey1"+dk_SpawnDatakey]) )
//&& !is_undefined(g.FallingKey1_spawn_datakey) 
//&&  dk_spawn==g.FallingKey1_spawn_datakey )
{
    set_xy(id, x,y-($05<<3));
}




