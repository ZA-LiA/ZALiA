/// Challenge_SwitchC_init()


var                   _a=1;
STATE_INCOMPLETE    = _a++; // 
STATE_COMPLETE1     = _a++; // 
STATE_COMPLETE2     = _a++; // 
STATE_COMPLETE3     = _a++; // 
sub_state           = STATE_INCOMPLETE;

DUR_DELAY_CMP1 = $40; // Delay completion start
DUR_DELAY_CMP2 = $20; // Delay completion reward


GO_init_palidx(global.PI_BGR3);
GO_sprite_init(spr_Placement_32x32);
set_xlyt(id, xl, yt);


var _CLM    = xl >>3;
var _ROW    = yt >>3;
CLMS        = ww >>3;
ROWS        = hh >>3;
MOVE_CLMS   = 3;
GOAL_CLM    = _CLM + MOVE_CLMS;

SWITCH_OBJ  = SwchB;


SND_MOVE_1  = get_audio_theme_track(dk_ElevatorMove);
snd_move    = SND_MOVE_1;


dl_switch = ds_list_create();


switch(ver)
{
    // ----------------------------------------------------------------
    case 1: {
    
    var i;
    
    GO_sprite_init(spr_Placement_32x32);
    set_xlyt(id, xl, yt);
    
    CLMS = ww >>3;
    ROWS = hh >>3;
    
    
    var _num  = 1;
    var _DK   = dk_spawn + STR_Data;
    var _data = g.dm_spawn[? _DK + hex_str(_num++)];
    while(!is_undefined(_data))
    {
        ds_list_add(dl_switch, GameObject_create(((_data>>0)&$FF)<<3, ((_data>>8)&$FF)<<3, SWITCH_OBJ, 1, -1, palidx));
        _data = g.dm_spawn[? _DK + hex_str(_num++)];
    }
    
    
    if (val(f.dm_challenges[? challenge_id+STR_Complete]))
    {
        sub_state = STATE_CMP2;
        
        set_xlyt(id, GOAL_CLM<<3, yt);
        
        for(i=ds_list_size(dl_switch)-1; i>=0; i--)
        {
            with(dl_switch[| i])
            {
                complete    = true;
                pressed     = true;
            }
        }
    }
    
    _CLM    = xl >>3;
    _ROW    = yt >>3;
    for(i=(CLMS * ROWS)-1; i>=0; i--)
    {
        global.dg_solid[# _CLM + (i mod CLMS), _ROW + (i div CLMS)] = TID_SOLID1;
    }
    
    
    break;  }
    
    // ----------------------------------------------------------------
    case 2: {
    
    break;  }
    
    // ----------------------------------------------------------------
    case 3: {
    
    break;  }
}




