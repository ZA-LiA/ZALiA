/// FieryMoa_init2()


var _i, _val, _len, _pos;


GO_init_palidx(global.PI_MOB_ORG);
GO_depth_init(DEPTH_FLYER);

sprL = spr_Moa2;
sprR = spr_Moa1;
sprRXOff = 0;


projectile_OBJ = Flame1;
projectile_VER = 1;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


hspd_dir = byte_dir(hspd);
hspd_dir_reset = hspd_dir; // 0081[eIndex]

timer = 0;


RESET_Y = room_height - $6B;

var _spawn_datakey = dk_spawn;
if(!is_undefined(    dk_spawn))
{   _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);  }

var _DATAKEY=STR_Reset+'_y';
if(!is_undefined(_spawn_datakey))
{
    for(_i=$1; _i<=$F; _i++)
    {
        _val=val(g.dm_spawn[?_spawn_datakey+STR_Data+hex_str(_i)]);
        if (is_string(_val))
        {
                _pos =string_pos(   _DATAKEY,_val);
            if (_pos)
            {   _pos+=string_length(_DATAKEY);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                RESET_Y = str_hex(_val);
                break;//_i
            }
        }
    }
}




/*
// -----------------------------------------------------------------------------
// FieryMoa  --------------------------------------------------------
o_name = object_get_name(Moa_B);
data_go_prop1(    Moa_B, "FieryMoa", spr_Placement_16x16);
data_go_scr(  o_name,   GameObjectB_init, FieryMoa_init2, FieryMoa_update, Moa_udp, Moa_draw);
//                         pal,  hb,  cs,  hp,  atk,  xp,  rsp,  drp,  swd,  prj,  THN,  SPL,  DRN,  BRIGHT
data_go_prop2(o_name+"01", PIa, HBa, CSa, $0A,  $04, $10, RSPc, DRPc, SWDa, PRJc, THNb, SPLa, DRNc);

data_REFLECT_vuln(o_name+"01", object_get_name(Axe)+"01", object_get_name(Fireball1)+"01", object_get_name(Fireball1)+"02", object_get_name(Mace1)+"01", object_get_name(Mace2)+"01", object_get_name(SwordBeam)+"01");
*/
