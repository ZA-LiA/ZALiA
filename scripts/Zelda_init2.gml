/// Zelda_init2()


var _i, _a, _datakey;


// Two Zelda's are spawned to this room, only 1 can remain..
if (g.rm_name!=g.GameEnd1B_RM_NAME)
{
    if ((ver==1 && f.quest_num>=2)  
    ||  (ver==2 && f.quest_num==1) )
    {
        state = 0;
        instance_destroy();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}




// ------------------------------------------------------------------
SPR_SLEP  = spr_Zelda_Asleep_1a;
SPR_WAKE  = spr_Zelda_Awake_1a;
SPR_TALK  = spr_Zelda_Talk_1a;
SPR_POSE1 = spr_Zelda_Pose_3a;
GO_set_sprite(id,SPR_SLEP);
GO_init_palidx(global.PI_BGR3);

DRAW_YOFF = 0;
xScale    = 1;



                  _a=1;
SUB_STATE_IDLE  = _a++;
SUB_STATE_SLEP  = _a++;
SUB_STATE_WAKE  = _a++;
SUB_STATE_TALK1 = _a++;
SUB_STATE_TALK2 = _a++;
SUB_STATE_KISS  = _a++;
sub_state       = SUB_STATE_SLEP;


dialogue_datakey = "0Z_00_";
dialogue_ver = "A";


NPC_catch_item(); // catch the BOTTLE item


if (f.quest_num==1 
&&  global.RandoHints_enabled 
&&  val(f.dm_rando[?STR_Zelda+STR_Hint]) )
{
    with(GameObject_create(x-8,y-4, NPC_0,$1))
    {
        dialogue_datakey = STR_Zelda+STR_Hint;
    }
}


if (ver==2) // 2nd quest
{   // for typical npc settings
    sub_state = SUB_STATE_IDLE;
    
    //DRAW_YOFF = g.DRAW_Y_OFF+1; // +1 in the ground
    
    GO_sprite_init(spr_Placement_16x32);
    GO_set_sprite(id,SPR_POSE1);
    
    
    var                  _DIST = $03<<3;
    set_xy(  id, g.rm_w_+_DIST, y);
    set_xy(g.pc, g.rm_w_-_DIST, y);
    g.pc.spawn_x = g.pc.xl;
    g.pc.spawn_y = g.pc.yt;
    
    
    dialogue_datakey = "0Z_01_";
    dialogue_ver = "01"; // 01: "GOOD LUCK"/HINT dialogue
    
    if(!val(f.dm_quests[?Zelda_DATAKEY1]))
    {
        dialogue_ver = "02";  // 02: BOTTLE instructions
        NPC_activate_dialogue(); // start dialogue
    }
}




