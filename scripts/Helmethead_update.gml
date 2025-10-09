/// Helmethead_update()


// D250,   D254
SwordHB_collidable = false;
SwordHB_yoff = 0;


// BAC3,   BACB: JSR BE8B
if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ------------------------------------------------------------
// BAD1,   BADA: JSR BB71,   BB71: JSR 9C45
Boss_HPBar_udp();



if(!Boss_update_4()) // Arena gate
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// MOD. Delay 1st attack -----------------------------------------------
if (start_timer)
{
    start_timer--;
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// ------------------------------------------------------------
//        g.mod_HelmetHead_Vulnerability: Only vulnerable once new head fully grown
var _C1 = g.mod_HelmetHead_Vulnerability && Head_spawn_timer;

if (_C1) BodyHB_idx = BodyHB_IDX2;
else     BodyHB_idx = BodyHB_IDX;

if (_C1) react_sword = 0;
else     react_sword = REACT_SWORD;

// BACE: JSR BC4E.  EF11,hspdPB,updateX,shld coll,cs,DE40.dmg pc,death check
Boss_update_2();


if (pending_death)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ------------------------------------------------------------
// BB74.  facing_dir,hspd,counter,behavior
Boss_update_3();
Boss_Roar_update();



// BADD
if (Head_spawn_timer)
{    var        _TIMING = $FF;  }
else var        _TIMING = $7F;
if(!(g.counter1&_TIMING) 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{   // BAE3: JSR DBCE
    with(GOC1_create(xl,yt-9, facing_dir, projectile,projectile_ver, id, global.PI_MOB_RED))
    {
        vspd = 2;
        pal_flash_time = 1;
        
        ATTACK_LEVEL = 4;
        attack_level = ATTACK_LEVEL;
    }
}



// BAFA
if (Head_spawn_timer)
{   // BB55
    if!(g.counter1&$3) Head_spawn_timer--;
}
// BAFF
else
{
    if (cs&CS_SW1 
    &&  Head_num < Head_COUNT )
    {
        if (g.mod_HelmetHead_Vulnerability) // g.mod_HelmetHead_Vulnerability: Only vulnerable once new head fully grown
        {    Head_spawn_timer = Head_DURATION2;  } // Head_DURATION2 = $20
        else Head_spawn_timer = Head_DURATION1;    // Head_DURATION1 = $10
        
        if (g.mod_Quest2BossDifficulty 
        &&  f.quest_num>1 )
        {
             Head_spawn_timer += $18; // $28 or $38
        }
        
        
        if (g.mod_HelmetHead_Vulnerability) // g.mod_HelmetHead_Vulnerability: Only vulnerable once new head fully grown
        {   // Do only a little damage
            hp  = g.dl_HP[|HP_IDX];
            hp -= min(3, global.pc.dl_ATTACK_DAMAGE[|f.level_atk]) * Head_num;
        }
        
        
        
        // BB10: JSR B869,  B876
        // Spawn Head ----------------------------------------------
        with(GameObject_create(xl, yt-$D, HeHeA,1))
        {
            state      = state_NORMAL;
            
            facing_dir  = other.facing_dir;
            GO_set_sprite(id, other.dl_Head_SPRITES[|other.Head_num-1]);
            
            HP_IDX     = $1C; // g.dl_HP[|$1C] = $D8
            hp         = g.dl_HP[|HP_IDX];
            stun_timer = 0;
            counter    = 0;
            
            hspd       =($10 * -facing_dir) &$FF;
            hspd_dir   = sign_(hspd<$80);
            
            vspd       = $D0;
            vspd_dir   = sign_(vspd<$80);
            
            is_from_HelmetHead=true;
        }
        
        // BB52
        Head_num++;
    }
}




