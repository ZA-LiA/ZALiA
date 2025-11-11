/// NPC_init2()

//     NPC_0 v1    Invisible
//     NPC_0 v2    Town Sign
//     NPC_0 v3    Mirror
//     NPC_0 v4    Fountain
//     NPC_0 v5    Stone head
//     NPC_0 v6    Plaque

//     NPC_1 v1    Idle Simple

//     NPC_2 v1    Traffic

//     NPC_3 v1    Special Walker
//     NPC_3 v2    Special Walker
//     NPC_3 v3    Special Walker
//     NPC_3 v4    Special Walker

//     NPC_4 v1    Life
//     NPC_4 v2    Magic
//     NPC_4 v3    Save

//     NPC_5 v1    Quest

//     NPC_6 v1    Skill Knight Downthrust
//     NPC_6 v2    Skill Knight Upthrust

//     NPC_7 v1    Spell Giver

//     NPC_9 v1    Bagu
//     NPC_9 v2    Riverman
//     NPC_9 v3    Friendly Moblin NPC
//     NPC_9 v4    Ache NPC
//     NPC_9 v5    Bot NPC
//     NPC_9 v6    Error
//     NPC_9 v7    Error's friend
//     NPC_9 v8    //
//     NPC_9 v9    Midus
//     NPC_9 vA    Anju's friend 1
//     NPC_9 vB    Anju
//     NPC_9 vC    Anju's friend 2
//     NPC_9 vD    Town fairy requesting rescue of Rescue Fairy
//     NPC_9 vE    Boulder circle hint

//     NPC_A v1    Triforce Keeper

//     NPC_B v1    Shop, Minigame

//     NPC_Z v1     Zelda

//     NPC_ v





var _i, _a, _val;
var _datakey;


if (g.town_num 
&&  g.town_name==STR_Bulblin 
&& !global.pc.Disguise_enabled )
//&& !(f.items&ITM_MASK) )
{
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



if (dialogue_datakey==val(g.dm_rm[?"MidoChurchDoor"+dk_DialogueDatakey]) 
//if (dialogue_datakey==g.DialogueDK_MIDO_CHURCH_DOOR 
&&  val(f.dm_quests[?dk_MidoChurch+STR_Open]) )
{
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


if (is_ver(id,NPC_0,3)  // MIRROR item
&&  f.items&ITM_MIRR )  // Alreading has mirror
{
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// -----------------------------------------------------------------------------
var _xl = xl;
var _yt = yt;


hspd = 0; // Most NPC don't move.


GROUND_Y = (((spawn_yt>>8)+1)<<8) - ($3<<3);
GROUND_Y = get_ground_y(x,GROUND_Y, -1, GROUND_Y);





// -----------------------------------------------------------------------------
var _BAGU   = is_ver(id,NPC_9,$1); // Bagu
var _TALO   = is_ver(id,NPC_9,$C); // Talo
var _ACHE   = is_ver(id,NPC_9,$4); // Ache NPC
var _BOT    = is_ver(id,NPC_9,$5); // Bot  NPC
var _MOBLN  = is_ver(id,NPC_9,$3); // Friendly Moblin NPC
var _SCROB  = is_ver(id,NPC_9,$8); // Scroblin, monster town
//var _ACHE2  = is_ver(id,NPC_9,$F); // Ache, monster town
var _FAIRY  = is_ver(id,NPC_8,$1); // Fairy NPC
var _INVIS  = is_ver(id,NPC_0,$1); // Invisible
var _SIGN   = is_ver(id,NPC_0,$2); // town sign
//var _MIRR = is_ver(id,NPC_0,$3); // Mirror under table
//var _HEAL = isVal(oi,NPC_4); // Healer, Saver
//var _QUES = isVal(oi,NPC_5); // Quest
var _SPLSQ  = object_index==NPC_C; // Spell Sequence. King's Tomb, Passage to NECKLACE item, Kasuto Cemetery Kakusu
var _ZELDA  = object_index==Zelda; // 



     if (_SIGN)                           GO_depth_init(DEPTH_BG2-1); // town sign
else if(!isVal(object_index,NPC_4,NPC_5)) GO_depth_init(DEPTH_NPC-1); // So door anim for $49-4E doesn't draw on top


//if (_BOT||_ACHE||_MOBLN) scr_udp = NPC_udp_1; // Bot, Ache, Friendly Moblin NPC
//else if (is_ver(id,NPC_A,1))  scr_udp = NPC_A_udp; // Triforce Keeper

               _sprite = NPC_get_init_sprite(id);
if (_SIGN)     _sprite = spr_Placement_16x32; // Sign
if (_INVIS)    _sprite = spr_Placement_16x32; // Invisible dialogue
if (_SPLSQ)    _sprite = spr_Placement_16x32; // 
if (_MOBLN)    _sprite = spr_NPC_Moblin_1a_1; // Friendly Moblin NPC
if (_FAIRY)    _sprite = g.dl_Fairy_SPRITES[|0];; // Fairy NPC
GO_sprite_init(_sprite);




update_body_hb_1a();
// -------------------------------------------------------------------------




// -------------------------------------------------------------------------



// D6D8
if (_BAGU 
||  _TALO 
||  _FAIRY )
{
    NPC_catch_item();
    
    if (_TALO 
    &&  val( f.dm_quests[?STR_Talo+STR_State]) )
    {
        if(!is_undefined(Item_SPAWN_DATAKEY))
        {    f.dm_quests[?STR_Talo+STR_State] = 1;  }// dlg: Take item
        else f.dm_quests[?STR_Talo+STR_State] = 2;   // dlg: I have nothing else
    }
}
else if (_SIGN)
{
    if (val(global.dm_save_file_settings[?STR_Randomize+STR_Town+STR_Locations]) 
    &&  g.town_num 
    && !is_undefined(g.town_name) 
    &&  val(f.dm_rando[?STR_Town+STR_Rando+g.town_name+"A"],g.town_name)!=g.town_name 
    && !val(g.dm_rm[?g.rm_name+STR_Rando+dk_LandLocked]) )
    {
        _datakey = STR_Town+STR_Sign+STR_Dialogue+STR_Datakey;
        dialogue_datakey = val(f.dm_rando[?_datakey+g.town_name], dialogue_datakey);
        if (dialogue_datakey==g.DIALOGUE_WINDOW.dm_dialogue[?_datakey+STR_Old_Kasuto])
        {
            dialogue_datakey = val(g.DIALOGUE_WINDOW.dm_dialogue[?_datakey+STR_Old_Kasuto+'B'], dialogue_datakey);
        }
        //g.DIALOGUE_WINDOW.dm_dialogue[?STR_Town+STR_Sign+STR_Dialogue+STR_Datakey+STR_Rauru]
        //dm_save_data[?STR_Town+STR_Rando+_town_name2+"A"] = _town_name1; // "A": Get what the overworld town is for _town_name2
        //dm_save_data[?STR_Town+STR_Rando+_town_name1+"B"] = _town_name2; // "B": Get what town inhabits the overworld town of _town_name1
    }
}
else if (_SPLSQ) // Spell Sequence
{
    HylianText_read = false;
    
                      _a=1;
    SUB_STATE_SEQ   = _a++; // Listening for spell sequence
    SUB_STATE_CMPL1 = _a++; // CMP1: CoMPlete 1.  Waiting for end of spell flash.
    SUB_STATE_CMPL2 = _a++; // CMP2: CoMPlete 2
    SUB_STATE_CMPL3 = _a++; // CMP3: CoMPlete 3
    SUB_STATE_DONE  = _a++; // DONE
    sub_state       = SUB_STATE_SEQ;
    
    
    _datakey = dialogue_datakey+STR_Spell+STR_Sequence;
    _val  = hex_str(SPL_THUN);
    _val += hex_str(SPL_THUN);
    _val += hex_str(SPL_THUN);
    _val += hex_str(SPL_THUN);
    _val  = val(g.DIALOGUE_WINDOW.dm_dialogue[?_datakey], _val);
    //_val  = val(f.dm_rando[?_datakey], _val);
    SPELL_SEQ = _val;
    
    
    SpellHist_COUNT1 = ds_list_size(g.dl_spell_history);
    SpellSeq_COUNT   = string_length(SPELL_SEQ)>>1;
    
    
    if (ver==3)
    {   // Kasuto Cemetery
        for(_i=ds_grid_width(g.dg_spawn_prio)-1; _i>=0; _i--)
        {
            if (is_ancestor( g.dg_spawn_prio[#_i,1],Kakusu))
            {
                if (g.dg_spawn_prio[#_i,$D]) // defeated count
                {
                    sub_state = SUB_STATE_DONE;
                }
                break;
            }
        }
    }
    else
    {   // King's Tomb, PENDANT Tomb
        Block_XL = xl;
        Block_YT = yt+hh;
        
        if(!is_undefined(    dk_spawn) 
        && !val(f.dm_quests[?dk_spawn+STR_Complete]))
        {
            var _x,_y;
            for(_i=0; _i<4; _i++)
            {   // Change tiles to solid to obstruct shaft.
                _x = Block_XL + ((_i&1)<<3);
                _y = Block_YT + ((_i>1)<<3);
                tile_change_1a(0, _x,_y, -1,0, TID_SOLID1);
            }
        }
        else
        {
            sub_state = SUB_STATE_DONE;
        }
    }
}
else if (object_index==NPC_3) // walker special. old $53-56, $1D-20
{
    // 9743
    var _PC_X  = val(g.dm_rm[?f.reen+STR_Spawn_x])<<3;
        _PC_X += PC_W>>1;
    //
    if (abs(_PC_X-x) >= $D0)
    {    facing_dir = sign_(x<_PC_X);  } // Face trwd PC
    else facing_dir = sign_(x<g.rm_w_);  // Face trwd rm center
    
    //  data: 10081800001810081800103C1800A5C9F0034C3DDD4C53DBA005C410F00CB9B600F007B9A100D5A1F0048810ED6098AA203DDDA61060191A1B1C10F00CF408F80CF4E008FF01F6AF
    //  $00 - 1008180000181008 1800103C1800A5C9
    //  $10 - F0034C3DDD4C53DB A005C410F00CB9B6
    //  $20 - 00F007B9A100D5A1 F0048810ED6098AA
    //  $30 - 203DDDA61060191A 1B1C10F00CF408F8
    //  $40 - 0CF4E008FF01F6AF 
    //  
    // ($1D-20 <<1) + 0,1 = $3A,3B, 3C,3D, 3E,3F, 40,41
    //  $3A-41: 10,F0, 0C,F4, 08,F8, 0C,F4  
    if!(ver&$1) hspd = $C;
    else        hspd = $8 <<(ver==1);
                hspd = (hspd*facing_dir) &$FF;
    //
    // Just in case. Sprite might be short.
    var _Y  = yt;
        _Y  = get_ground_y(x,_Y, 1, _Y, TID_SOLID1|TID_ONEWY1);
        _Y -= hh;
    if (isVal(sprite_datakey, STR_Moa,STR_Girubokku)) // Flying types
    {   _Y -= hh;  }
        _yt = _Y;
}
else if (isVal(object_index,NPC_4,NPC_5)) // Healer, Saver, Quest
{
    DOOR_XL  = xl - (DOOR_W-ww);
    DOOR_XR  = DOOR_XL +  DOOR_W;
    DOOR_XC  = DOOR_XL + (DOOR_W>>1); // center of door
    
    DOOR_YT  = GROUND_Y - 8 - DOOR_H;
    DOOR_YB  = DOOR_YT +  DOOR_H;
    DOOR_YC  = DOOR_YT + (DOOR_H>>1);
    
    // The animated door
    door_draw_x = DOOR_XC; // center of door
    door_draw_y = DOOR_YC; // center of door
    
    
    var _TSRC1 = $D8;      // door tsrc
    var _TSRC2 = _TSRC1+1; // door knob tsrc
    var _DEPTH = tile_find_depth_by_tsrc((DOOR_XC>>3)-1,DOOR_YC>>3, ts_Man_made_1a_WRB, _TSRC1,_TSRC2);
    var _IDX = ds_list_find_index(g.dl_TILE_DEPTHS,_DEPTH);
    if (_IDX+1 
    &&  _IDX<ds_grid_width(p.dg_depth_pi) )
    {
        DOOR_PI        =   p.dg_depth_pi[#_IDX,1];
        DOOR_PI_PERMUT =   p.dg_depth_pi[#_IDX,3];
    }
    else
    {
        DOOR_PI        = global.PI_BGR2;
        DOOR_PI_PERMUT = 0;
    }
    
    //DOOR_PI_DARK = val(global.dm_pi[?hex_str(DOOR_PI)+STR_Dark+"1"], DOOR_PI);
    
    // A hitbox used by NPC cs left/right to 
    // trigger the counter for stepping inside house.
    // Also used by PC to enter Healer house.
    DoorHB_XL = DOOR_XC - (DOOR_W>>1);
    DoorHB_YT = (GROUND_Y+8) - DOOR_H;
    
    
    if (object_index==NPC_5) // Quest NPC
    {
            door_exit_inst = collideRect(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h, Exit);
        if (door_exit_inst==noone) door_exit_inst = 0;
        
        
        // 9756
        spawn_xl = xl;
        spawn_yt = yt-8;
        _xl = spawn_xl;
        _yt = spawn_yt;
        
        counter  = $80;  // $80: Waiting in house.
        timer_a1 = $90;  // Delay permission to exit house.
    }
}
else if (object_index==NPC_6) // Skill Knight
{
    GO_init_palidx(global.PI_MOB_PUR);
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(palidx), string_length(p.PAL_NPC_PUR4), p.PAL_NPC_PUR4));
}
else if (object_index==NPC_7) // Spell Giver
{
    /* In data_spawn():
    g.dm_spawn[?STR_Spell+STR_Spawn   +STR_Datakey+_SPELL_NAME] = _SPAWN_DATAKEY;
    g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+_SPELL_NAME] = _DIALOGUE_DATAKEY;
    if(!is_undefined(_TOWN_NAME)) g.dm_spawn[?"_Wise"+"_Man"+STR_Spawn+STR_Datakey+_TOWN_NAME] = _SPAWN_DATAKEY;
    g.dm_spawn[?STR_Spell+STR_Bit                 +_SPAWN_DATAKEY] = _val1;
    g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+_SPAWN_DATAKEY] = _DIALOGUE_DATAKEY;
    */
    
    //GROUND_Y = get_ground_y(x,spawn_yt, 1, GROUND_Y);
    
    if(!is_undefined(dk_spawn)) give_spell = val(g.dm_spawn[?STR_Spell+STR_Bit+dk_spawn]);
    else                        give_spell = SPL_SUMM;
    //sdm("give_spell $"+hex_str(give_spell)+",  is_undefined(dk_spawn) "+string(is_undefined(dk_spawn)));
    give_spell_name  = val(g.dm_Spell[?hex_str(give_spell)+STR_Name], STR_SUMMON);
    
    dialogue_datakey = val(g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+give_spell_name], dialogue_datakey);
    //if(!is_undefined(dk_spawn))
    //{   dialogue_datakey = val(g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+dk_spawn], dialogue_datakey);  }
    
    
    use_cucco_dlg = 0; // 
    
    if (g.mod_PC_CUCCO_1 
    &&  give_spell==SPL_FARY )
    {
        switch(ver)
        {
            case 1:{ // NPC embarassed his magic turned cucco instead of fairy
            if (f.spells & give_spell)
            {
                state = 0;
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            break;}
            
            case 2:{ // FAIRY spell wiseman attempts spell again, makes it worse
            if(!(f.spells & give_spell) 
            ||  g.CuccoSpell2_Acquired ) // Event already happened
            {
                state = 0;
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            else
            {
                dialogue_datakey = val(g.dm_spawn[?STR_Spell+STR_Dialogue+STR_Datakey+STR_Cucco], dialogue_datakey);
            }
            break;}
        }
    }
}
else if (_BOT)
{
    Bot_init2();
    is_idle = true; // So I can use usd_Bot()
    abilities = 0;
}
else if (_SCROB)
{
    if (val(f.dm_quests[?Scroblin_DATAKEY1]) >= 2)
    {
        with(Exit)
        {
            if (exitName==g.rm_name+"00")
            {
                open = true;
                doorway_spr = g.Doorway1_SPR;
                break;
            }
        }
    }
}
else if (is_ver(id,NPC_A,1))
{   // Triforce Keeper --------------------------------------
    SPR_IDLE = spr_Triforce_Keeper_1a;
    SPR_MOVE = spr_Triforce_Keeper_1b; // action/mouth open
    GO_sprite_init(SPR_IDLE);
    
    tri_can_draw    = 0;
    TRI_SPR         = spr_Triforce_1a;
    tri_xOff        = 0;
    tri_yOff        = 0;
    
    
                     arena_x = g.rm_w_;
    with(Boss) other.arena_x = arena_x;
    
    GROUND_Y = (((spawn_yt>>8)+1)<<8) - ($3<<3);
    GROUND_Y = get_ground_y(arena_x,GROUND_Y, -1, GROUND_Y);
    
    if (f.quest_num>1)
    {
        _xl = xl-$10;
        _yt = yt;
        //set_xy(id, x-$10,y);
    }
    
    sub_state = 0;
}







if (sprite_datakey==STR_Girubokku 
&&  isVal(object_index,NPC_2,NPC_3)  // NPC_2: Traffic, NPC_3: Special Walker
&&  hspd )
{   hspd = ($10*facing_dir) &$FF;  }




if(!is_undefined(                                dialogue_datakey) 
&& !is_undefined( g.DIALOGUE_WINDOW.dm_dialogue[?dialogue_datakey+"A"]) )
{
    var _DIALOGUE=g.DIALOGUE_WINDOW.dm_dialogue[?dialogue_datakey+"A"];
    if (string_pos("WITH BOOTS",_DIALOGUE) 
    && !irandom($7) )
    {   // crazy guy standing in Nabooru fountain
        GO_depth_init(DEPTH_BG8+3);
    }
}




if (global.RandoHints_enabled 
&&  val(global.dm_save_file_settings[?STR_Randomize+STR_Item+STR_Locations]) )
{
    if (is_ancestor(object_index,Zelda))
    {
        if(!is_undefined(f.dm_rando[?STR_Zelda+STR_Hint+STR_Dialogue]))
        {
            //RandoHint_given = false;
        }
    }
    else
    {
        RandoHint_hint_num = val(f.dm_rando[?STR_Rando+STR_Hint+dialogue_datakey+STR_Hint+STR_Num]);
        if(!is_undefined(g.dm_RandoHintsRecorder[?STR_Hint+hex_str(RandoHint_hint_num)+STR_Dialogue]))
        {
            RandoHint_hint_num = 0; // 0: tells draw not to draw the question mark
        }
        
        //if(!is_undefined(f.dm_rando[?STR_Rando+STR_Hint+dialogue_datakey])) RandoHint_given = false;
    }
}




// 976B
set_xlyt(id, _xl,_yt);




if (DEV 
&&  object_index!=NPC_2 ) // NPC_2: traffic
{
    db_NPC_create_1a(id);
}




