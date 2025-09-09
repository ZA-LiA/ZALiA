/// dev_start_pc_with()


switch(0)
{
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 0:{exit;}
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 1:{
    f.quest_num = 2; // 
    
    f.items   = 0;
    
    f.items  |= ITM_CAND; // 
    f.items  |= ITM_GLOV; // 
    f.items  |= ITM_RAFT; // 
    f.items  |= ITM_BOOT; // 
    f.items  |= ITM_FLUT; // 
    f.items  |= ITM_CROS; // 
    f.items  |= ITM_HAMM; // 
    f.items  |= ITM_BRAC; // 
    
    f.items  |= ITM_FRY1; // 
    f.items  |= ITM_MASK; // 
    f.items  |= ITM_BOOK; // 
    f.items  |= ITM_MEAT; // 
    f.items  |= ITM_SHLD; // 
    f.items  |= ITM_RING; // 
    f.items  |= ITM_NKLC; // 
    f.items  |= ITM_SWRD; // 
    
    
    f.items  |= ITM_TRPH; // 
    f.items  |= ITM_NOTE; // 
    f.items  |= ITM_MIRR; // 
    f.items  |= ITM_MEDI; // 
    f.items  |= ITM_CHLD; // 
    
    
    f.items  |= ITM_SKEY; // 
    f.items  |= ITM_MAP1; // 
    f.items  |= ITM_MAP2; // 
    
    
    
    f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    
    
    
    var _i, _val, _count, _dk, _str, _cont_cnt;
    
    _cont_cnt = 6;
    for(_i=cont_piece_cnt_hp()+1; _i<=_cont_cnt*f.CONT_PIECE_PER_HP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_HP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_HP) + 1);
        f.cont_pieces_hp += _str;
    }
    f.hp = get_stat_max(STR_Heart);
    
    _cont_cnt = 9;
    for(_i=cont_piece_cnt_mp()+1; _i<=_cont_cnt*f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.mp = get_stat_max(STR_Magic);
    
    
    
    for(_i=0; _i<f.CRYSTAL_MAX; _i++) f.crystals |= ($01<<_i); // ALL crystals
    
    f.level_atk = 5; // 
    f.level_mag = 9; // 
    f.level_lif = 6; // 
    
    
    _count = 3+(f.quest_num==1);
    //_count = clamp(5, 1,g.LifeDoll_MAX);
    //_count = 0;
    for(_i=1; _i<=_count; _i++)
    {
        _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
        if(!is_undefined(_item_id))
        {
            f.dm_1up_doll[?_item_id+STR_Acquired] = 1;
        }
    }
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 2:{ // Testing Thunderbird
    f.items |= ITM_CAND; // 
    f.items |= ITM_SKEY; // 
    
    f.level_atk = 8; // 
    f.level_mag = 8; // 
    f.level_lif = 8; // 
    
    
    
    var _i, _str, _cont_cnt;
    
    _cont_cnt = 8;
    for(_i=cont_piece_cnt_hp()+1; _i <= _cont_cnt * f.CONT_PIECE_PER_HP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_HP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_HP) + 1);
        f.cont_pieces_hp += _str;
    }
    
    _cont_cnt = 8;
    for(_i=cont_piece_cnt_mp()+1; _i <= _cont_cnt * f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.mp = get_stat_max(STR_Magic);
    
    
    
    
    f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 3:{ // Testing Spell NPC "whoops" dlg
    f.items |= ITM_CAND; // 
    f.items |= ITM_MEDI; // indicates the quest is complete
    
    var _i, _str, _cont_cnt;
    
    _cont_cnt = 6;
    for(_i=cont_piece_cnt_mp()+1; _i <= _cont_cnt * f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.level_mag = 6; // 
    f.mp = get_stat_max(STR_Magic);
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 4:{ // Testing Carock
    f.items |= ITM_CAND; // 
    f.level_mag = 5; // 
    f.spells |= SPL_RFLC; // 
    
    
    
    var _i, _str, _cont_cnt;
    
    _cont_cnt = 8;
    for(_i=cont_piece_cnt_mp()+1; _i <= _cont_cnt * f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    
    // f.magic_conts |= $10; // MAGIC 1
    // f.magic_conts |= $20; // MAGIC 2
    // f.magic_conts |= $40; // MAGIC 3
    // f.magic_conts |= $80; // MAGIC 4
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 5:{ // Testing Gooma & Other
    f.items |= ITM_CAND; // 
    f.items |= ITM_GLOV; // 
    f.items |= ITM_RAFT; // 
    f.items |= ITM_BOOT; // 
    f.items |= ITM_FLUT; // 
    f.items |= ITM_CROS; // 
    f.items |= ITM_HAMM; // 
    f.items |= ITM_SKEY; // 
    
    f.spells |= SPL_PRTC; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    
    
    var _i, _str, _cont_cnt;
    
    _cont_cnt = 8;
    for(_i=cont_piece_cnt_mp()+1; _i <= _cont_cnt * f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    
    // f.magic_conts |= $F0; // MAGIC 1,2,3,4
    
    f.level_mag = 8; // 
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 6:{
    f.quest_num = 1; // 
    
    f.items   = 0;
    
    f.items  |= ITM_CAND; // 
    f.items  |= ITM_GLOV; // 
    f.items  |= ITM_RAFT; // 
    f.items  |= ITM_BOOT; // 
    f.items  |= ITM_FLUT; // 
    f.items  |= ITM_CROS; // 
    f.items  |= ITM_HAMM; // 
    f.items  |= ITM_BRAC; // 
    
    f.items  |= ITM_FRY1; // 
    f.items  |= ITM_SKEY; // 
    f.items  |= ITM_BOOK; // 
    f.items  |= ITM_MEAT; // 
    f.items  |= ITM_SHLD; // 
    f.items  |= ITM_RING; // 
    f.items  |= ITM_NKLC; // 
    f.items  |= ITM_SWRD; // 
    
    
    f.items  |= ITM_TRPH; // 
    f.items  |= ITM_NOTE; // 
    f.items  |= ITM_MIRR; // 
    f.items  |= ITM_MEDI; // 
    f.items  |= ITM_CHLD; // 
    
    
    f.items  |= ITM_MAP1; // 
    f.items  |= ITM_MAP2; // 
    
    
    
    f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    
    
    
    var _i, _val, _count, _dk, _str, _cont_cnt;
    
    _cont_cnt = 6;
    for(_i=cont_piece_cnt_hp()+1; _i<=_cont_cnt*f.CONT_PIECE_PER_HP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_HP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_HP) + 1);
        f.cont_pieces_hp += _str;
    }
    f.hp = get_stat_max(STR_Heart);
    
    _cont_cnt = 9;
    for(_i=cont_piece_cnt_mp()+1; _i<=_cont_cnt*f.CONT_PIECE_PER_MP; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.mp = get_stat_max(STR_Magic);
    
    
    
    for(_i=0; _i<f.CRYSTAL_MAX; _i++) f.crystals |= ($01<<_i); // ALL crystals
    
    f.level_atk = 5; // 
    f.level_mag = 9; // 
    f.level_lif = 6; // 
    
    
    _count = 3+(f.quest_num==1);
    //_count = clamp(5, 1,g.LifeDoll_MAX);
    //_count = 0;
    for(_i=1; _i<=_count; _i++)
    {
        _item_id = f.dm_1up_doll[?hex_str(_i)+STR_Item+STR_ID];
        if(!is_undefined(_item_id))
        {
            f.dm_1up_doll[?_item_id+STR_Acquired] = 1;
        }
    }
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 7:{ // testing barrier
    f.crystals |= $01; // P1
    //f.crystals |= $02; // P2
    f.crystals |= $04; // P3
    f.crystals |= $08; // P4
    //f.crystals |= $10; // P5
    f.crystals |= $20; // P6
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 8:{ // Ganon testing
    f.quest_num = 2;
    f.items  |= ITM_BTL1;
    f.spells |= SPL_SUMM;
    f.dm_quests[?STR_Bottle+"01"+STR_State] = 1;
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 9:{
    f.items |= ITM_FTHR;
    //f.items |= (ITM_MAP1|ITM_MAP2);
    //f.items &= ~ITM_MASK;
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 10:{
    f.quest_num = 1; // 
    
    f.items  |= ITM_CAND; // 
    f.items  |= ITM_RAFT; // 
    f.items  |= ITM_BOOT; // 
    f.items  |= ITM_FLUT; // 
    f.items  |= ITM_CROS; // 
    f.items  |= ITM_HAMM; // 
    f.items  |= ITM_BRAC; // 
    f.items  |= ITM_SKEY; // 
    if (f.quest_num>=2)
    {
        f.items  |= ITM_MASK; // 
        f.items  |= ITM_BTL1;
        f.dm_quests[?STR_Bottle+"01"+STR_State] = 1;
    }
    
    
    
    //f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    //f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    if (f.quest_num>=2) f.spells |= SPL_SUMM;
    
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    
    
    
    f.level_atk = max(f.level_atk,5); // 
    f.level_mag = max(f.level_mag,8); // 
    f.level_lif = max(f.level_lif,5); // 
    
    
    var _i, _a, _count, _str;
    
    _count=6*f.CONT_PIECE_PER_HP;
    for(_i=cont_piece_cnt_hp()+1; _i<=_count; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_HP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_HP) + 1);
        f.cont_pieces_hp += _str;
    }
    f.hp = get_stat_max(STR_Heart);
    
    
    _count=8*f.CONT_PIECE_PER_MP;
    for(_i=cont_piece_cnt_mp()+1; _i<=_count; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.mp = get_stat_max(STR_Magic);
    break;}
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 11:{
    f.items  |= ITM_CAND; // 
    f.items  |= ITM_GLOV; // 
    f.items  |= ITM_RAFT; // 
    f.items  |= ITM_BOOT; // 
    f.items  |= ITM_HAMM; // 
    f.items  |= ITM_FRY1; // 
    f.items  |= ITM_BOOK; // 
    f.items  |= ITM_MEAT; // 
    
    f.items  |= ITM_TRPH; // 
    f.items  |= ITM_NOTE; // Bagu note
    f.items  |= ITM_MIRR; // 
    f.items  |= ITM_MEDI; // 
    f.items  |= ITM_CHLD; // 
    
    f.items  |= ITM_MAP1; // 
    f.skills |= SKILL_THD; // 
    
    f.crystals |= $1111;
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 12:{ // For setting up 2nd quest all keys speedrun file
    f.quest_num = 2; // 
    
    f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    f.spells |= SPL_SUMM; // 
    
    f.level_atk = 9; // 
    f.level_mag = 9; // 
    f.level_lif = 8; // 
    break;}
    
    
    
    
    
    // -------------------------------------------------------------------
    // -------------------------------------------------------------------
    case 13:{ // 
    f.quest_num = 2; // 
    
    //f.spells |= SPL_PRTC; // 
    f.spells |= SPL_JUMP; // 
    //f.spells |= SPL_LIFE; // 
    f.spells |= SPL_FARY; // 
    f.spells |= SPL_FIRE; // 
    f.spells |= SPL_RFLC; // 
    f.spells |= SPL_SPEL; // 
    f.spells |= SPL_THUN; // 
    
    
    f.items  |= ITM_CAND; // 
    f.items  |= ITM_GLOV; // 
    f.items  |= ITM_RAFT; // 
    f.items  |= ITM_BOOT; // 
    f.items  |= ITM_FLUT; // 
    f.items  |= ITM_CROS; // 
    f.items  |= ITM_HAMM; // 
    f.items  |= ITM_BRAC; // 
    
    //f.items  |= ITM_FRY1; // 
    f.items  |= ITM_BOOK; // 
    f.items  |= ITM_MEAT; // 
    //f.items  |= ITM_SHLD; // 
    //f.items  |= ITM_RING; // 
    //f.items  |= ITM_NKLC; // 
    //f.items  |= ITM_SWRD; // 
    //f.items  |= ITM_SKEY; // 
    if (f.quest_num>=2)
    {
        f.spells |= SPL_SUMM; // 
        
        f.items  |= ITM_MASK; // 
        f.items  |= ITM_BTL1;
        f.dm_quests[?STR_Bottle+"01"+STR_State] = 1;
    }
    
    f.skills |= SKILL_THD; // 
    f.skills |= SKILL_THU; // 
    
    
    f.level_atk = 5;
    f.level_mag = 8;
    f.level_lif = 4;
    
    
    var _i, _a, _count, _str;
    
    _count=5*f.CONT_PIECE_PER_HP;
    for(_i=cont_piece_cnt_hp()+1; _i<=_count; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_HP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_HP) + 1);
        f.cont_pieces_hp += _str;
    }
    f.hp = get_stat_max(STR_Heart);
    
    
    _count=8*f.CONT_PIECE_PER_MP;
    for(_i=cont_piece_cnt_mp()+1; _i<=_count; _i++)
    {
        _str  = hex_str( _i div f.CONT_PIECE_PER_MP);
        _str += hex_str((_i mod f.CONT_PIECE_PER_MP) + 1);
        f.cont_pieces_mp += _str;
    }
    f.mp = get_stat_max(STR_Magic);
    break;}
}




