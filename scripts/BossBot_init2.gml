/// BossBot_init2()


var _i;


dl_sprites[|1] = spr_BossBot2;
dl_sprites[|0] = spr_BossBot1;
GO_set_sprite(id, dl_sprites[|0]);
GO_init_palidx(global.PI_MOB_BLU);

VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;

ATK_DIST = $30;
// ATK_DIST = $20 + (ww_ + 8); // +8 for half pc spr w.  OG $30



// MOD 2023/12/02. With enemy hp rando, it's possible to kill 
// BossBot before it gets a chance to spawn the Bots.
// Therefor, BossBot's hp must be greater than PC's max possible damage.
// BossBot's vanilla hp: g.dl_HP[|$1C]=$38
// PC's max damage: dl_ATTACK_DAMAGE[|$09]=$1C; // attack level 9
if (val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_HP]))
{
    var _MAX_PC_DAMAGE = global.pc.dl_ATTACK_DAMAGE[|ds_list_size(global.pc.dl_ATTACK_DAMAGE)-1];
    if (g.dl_HP[|HP_IDX]<=_MAX_PC_DAMAGE)
    {
        var _COUNT=ds_list_size(g.dl_HP);
        for(_i=HP_IDX+1; _i<_COUNT; _i++)
        {
            if (g.dl_HP[|_i]>_MAX_PC_DAMAGE)
            {
                HP_IDX=_i;
                hp=g.dl_HP[|HP_IDX];
                break;//_i
            }
        }
    }
}




