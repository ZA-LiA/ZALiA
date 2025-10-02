/// RestoreFairy_init2()


var _i,_a;


dl_sprites[|1] = g.dl_Fairy_SPRITES[|1]; // spr_FairyB
dl_sprites[|0] = g.dl_Fairy_SPRITES[|0]; // spr_FairyA
GO_init_palidx(global.PI_MOB_ORG);

facing_dir = 1;



greeting_played = false;
                  _a = 1;
SUB_STATE_IDLE  = _a++;
SUB_STATE_RSTR  = _a++; // RSTR: Restoring pc stat
sub_state       = SUB_STATE_IDLE;



if (rm_get_encounter_types(g.rm_name) & g.ENC_FARY)
{
    var  _Y  = (g.rm_rows-PAGE_ROWS)<<3;
    spawn_y  = _Y + ($1C<<3); // common ground y
    spawn_y  = get_ground_y(x,_Y, 1, spawn_y);
    spawn_y -= $A<<3;
    set_xlyt(id, xl,spawn_y);
}




