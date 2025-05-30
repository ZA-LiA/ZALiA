/// update_spell_effects()


// 8E26

if(!g.spells_active) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!






// -------------------- SPL_SUMM ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_SUMM)
{   // SUMMON SPELL
    g.spells_active &= ~SPL_SUMM;
}








// -------------------- SPL_THUN ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_THUN)
{
    g.spells_active &= ~SPL_THUN;
    
    if (g.mod_ScreenShake)
    {
        g.ScreenShake_timer      = g.ScreenShake_DUR1;
        g.ScreenShake_strength_x = 3;
        g.ScreenShake_strength_y = 3;
    }
    
    despawn_all_goc();
    
    // BEC7
    for(var _i=ds_list_size(g.go_mgr.dl_gob1)-1; _i>=0; _i--)
    {
        if!(g.go_mgr.dl_gob1[|_i]+1)
        {
            continue;
        }
        
        with(g.go_mgr.dl_gob1[|_i])
        {
            if (state != state_NORMAL 
            || !react_thunder ) // if NOT vulnerable to THUNDER
            {
                break;//with(g.go_mgr.dl_gob1[|_i])
            }
            
            
            var _DAMAGE=0;
            switch(react_thunder)
            {
                case 1:{ // All hp ------------------------------------
                if (ocsHV1(id)) _DAMAGE=max(0,hp);
                break;}
                
                case 2:{ // BEE2: JSR E726 ----------------------------
                if (ocsHV1(id)) _DAMAGE=$32;
                break;}
                
                case 3:{ // E66D: $02 ---------------------------------
                _DAMAGE=$02; // OG: Only Thunderbird
                break;}
            }//switch(react_thunder)
            
            
            if (_DAMAGE) damage_gob(id, _DAMAGE, false);
        }
    }
}








// -------------------- SPL_SPEL ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_SPEL)
{
    g.spells_active &= ~SPL_SPEL;
    
    
    var _i, _idx, _num, _obj,_ver, _objver, _difficulty;
    var _datakey;
    var _DIFFICULTY = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Difficulty],1);
    
    
    if (g.rm_name==val(g.dm_rm[?dk_MagicalKeyHouse+dk_SceneName]) 
    //if (g.rm_name==g.MKH_RM_NAME 
    && !g.cutscene_house_built )
    {   // Build MagicalKey house
        g.pc_lock = PC_LOCK_ALL; // Lock all
    }
    
    
    
    // TURN ALL SUSCEPTIBLE ENEMIES INTO Bot
    for(_i=ds_list_size(g.go_mgr.dl_gob1)-1; _i>=0; _i--)
    {
        if!(g.go_mgr.dl_gob1[|_i]+1)
        {
            continue;//_i
        }
        
        
        with(g.go_mgr.dl_gob1[|_i])
        {
            // react_spel: 1: turn into Bot, 2: Turn into Ache, 3: Turn into RestoreFairy
            if(!state 
            || !react_spell )
            {
                break;//with(g.go_mgr.dl_gob1[|_i])
            }
            
            
            GO_update_cam_vars();
            if(!ocsHV3(id)) // if (less than half width AND NO height) are in ocs area
            {
                break;//with(g.go_mgr.dl_gob1[|_i])
            }
            
            
            
            timer = 0;
            state = 0;
            
            
            switch(react_spell){
            default:{_obj=Bot_A; _ver=1; break;}
            case  2:{_obj=AcheA; _ver=1; break;}
            case  3:{_obj=ReFaA; _ver=1; break;}
            }
            
            
            if (_obj!=ReFaA 
            &&  val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_ENIGMA]) )
            {
                //_difficulty = RandoEnemy_difficulty_MAX;
                _difficulty = 0;
                
                if(!_difficulty 
                &&  _DIFFICULTY>=4 
                && !irandom($7F) )
                {   _difficulty =4;  }
                
                if(!_difficulty 
                &&  _DIFFICULTY>=3 
                && !irandom($3F) )
                {   _difficulty =3;  }
                
                if(!_difficulty 
                &&  _DIFFICULTY>=2 
                && !irandom($7) )
                {   _difficulty =2;  }
                
                _difficulty = clamp(_difficulty, 1,g.RandoEnemy_difficulty_MAX);
                
                
                _datakey = STR_ENIGMA+STR_Difficulty+hex_str(_difficulty);
                _count = val(g.dm_RandoEnemy[?_datakey+STR_Count]);
                if (_count>1)
                {
                    _idx = irandom(_count-1);
                    _datakey += hex_str(_idx);
                    _obj = val(g.dm_RandoEnemy[?_datakey+STR_Object], _obj);
                    _ver = val(g.dm_RandoEnemy[?_datakey+STR_Version], 1);
                }
                
                /* // keeping this as backup
                var                             _dl_CHANCES=ds_list_create();
                if (_DIFFICULTY>=1) ds_list_add(_dl_CHANCES,1,1,1,1,1,1,1,1);
                if (_DIFFICULTY>=2) ds_list_add(_dl_CHANCES,2,2,2,2,2);
                if (_DIFFICULTY>=3) ds_list_add(_dl_CHANCES,3,3);
                if (_DIFFICULTY>=4) ds_list_add(_dl_CHANCES,4);
                ds_list_shuffle(_dl_CHANCES);
                _difficulty =   _dl_CHANCES[|0];
                ds_list_destroy(_dl_CHANCES); _dl_CHANCES=undefined;
                */
                
                /* // keeping this as backup
                switch(irandom($1A)){
                case $00:{_obj=Bot_A; _ver=1; break;}
                case $01:{_obj=Bot_A; _ver=2; break;}
                case $02:{_obj=BoBoA; _ver=1; break;}
                case $03:{_obj=AcheA; _ver=1; break;}
                case $04:{_obj=AcheA; _ver=2; break;} // Acheman
                case $05:{_obj=Wheep; _ver=1; break;}
                case $06:{_obj=LowdA; _ver=1; break;}
                case $07:{_obj=MegmA; _ver=1; break;}
                case $08:{_obj=Myu_A; _ver=1; break;}
                case $09:{_obj=OctoA; _ver=1; break;}
                case $0A:{_obj=OctoA; _ver=2; break;} // walking Octorok
                case $0B:{_obj=AnerA; _ver=1; break;}
                case $0C:{_obj=AnerA; _ver=2; break;} // walking Aneru
                case $0D:{_obj=AnerA; _ver=3; break;} // fire Aneru
                case $0E:{_obj=BubbA; _ver=1; break;}
                case $0F:{_obj=BubbA; _ver=2; break;} // fast Bubble
                case $10:{_obj=BubbA; _ver=8; break;} // King Bubble
                case $11:{_obj=Moa_A; _ver=1; break;} // red Moa
                case $12:{_obj=Moa_B; _ver=3; break;} // fire Moa
                case $13:{_obj=AttaA; _ver=1; break;}
                case $14:{_obj=BoonA; _ver=1; break;}
                case $15:{_obj=GiruA; _ver=1; break;}
                case $16:{_obj=Stallakk; _ver=1; break;}
                case $17:{_obj=BlazA; _ver=1; break;}
                case $18:{_obj=BlazA; _ver=2; break;} // hopping Blaze
                case $19:{_obj=FiRoA; _ver=1; break;} // spinning fire rope
                case $1A:{_obj=SpTrC; _ver=1; break;}
                }
                */
            }
            
            _objver = object_get_name(_obj)+hex_str(_ver);
            var _PI = val(g.dm_go_prop[?_objver+STR_pal_idx], palidx_def);
            g.go_mgr.uIdxSwap_gob = update_idx;
            with(GameObject_create(xl,yt, _obj,_ver, -1, _PI))
            {
                if (is_ver(id,Bot_A,1))
                {
                    hp = 0;
                }
            }
        }
    }
}




// -------------------- SPL_RFLC ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_RFLC)
{
    //
}




// -------------------- SPL_FIRE ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_FIRE)
{
    if(!pc_is_cucco() 
    || (g.CUCCO_CAN_FIRE && f.Cucco_skills&f.CuccoSkill_PROJ2) )
    {
        spawn_pc_proj_2a();
    }
}




// -------------------- SPL_FARY ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_FARY)
{
    //
}




// -------------------- SPL_LIFE ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_LIFE)
{
    g.spells_active &= ~SPL_LIFE;
    
    g.StatRestore_timer_hp += g.StatRestore_DURATION1; // g.StatRestore_DURATION1: $30;
    g.StatRestore_timer_hp  = min(g.StatRestore_timer_hp, f.HP_MAX);
}




// -------------------- SPL_JUMP ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_JUMP)
{
    //
}




// -------------------- SPL_SHLD ----------------------------
// ----------------------------------------------------
if (g.spells_active &   SPL_PRTC)
{
    //
}




