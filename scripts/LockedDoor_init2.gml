/// LockedDoor_init2()


var _i, _val, _len, _pos;


GO_init_palidx(global.PI_MOB_ORG);

SPR_1A = spr_Locked_Door1B;     // Mid, key hole
SPR_1B = spr_Locked_Door_2a;    // Mid, NO key hole
SPR_2A = spr_Locked_Door1A;     // Top & Btm
SPR_3A = spr_Locked_Door_2b;    // Switch

facing_dir = 1;


YOFF        = $10;
DRAW_YOFF  += YOFF;
openYOff    = 0;
SWITCH_XOFF = $C;

can_draw_self_exception = true;

//behavior = 0; // 0: idle, 1: opening
counter = 0; // 0: idle, > 0: opening


GROUND_Y = spawn_yt + hh;
GROUND_Y = get_ground_y(x,GROUND_Y-8, 1,GROUND_Y);

spawn_yt = GROUND_Y-$30;
set_xy(id, x, spawn_yt+8);




switch_side = 0;

// 0: does not respawn. 1: respawns with room refresh
respawn_type = 0;

if(!is_undefined(dk_spawn))
{
    for(_i=$1; _i<=$F; _i++)
    {
        _val = val(g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)]);
        if (is_string(_val))
        {
                _pos =string_pos(   STR_Side,_val);
            if (_pos)
            {   _pos+=string_length(STR_Side);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                switch_side = str_hex(_val);
                //break;//_i
            }
            
                _pos =string_pos(   STR_Respawn,_val);
            if (_pos)
            {   _pos+=string_length(STR_Respawn);
                _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                respawn_type = str_hex(_val);
                //break;//_i
            }
        }
    }
}
//show_debug_message("LockedDoor_init2(). respawn_type "+hex_str(respawn_type));


// 0: neither, 1: right, 2: left, 3: both
switch_side &= $3;



if(!is_undefined(                  dk_spawn) 
&& !is_undefined(f.dm_openedLocks[?dk_spawn]) )
{   // Already opened.
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




