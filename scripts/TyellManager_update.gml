/// TyellManager_update()


if(!instance_exists(Tyell))
{
    if (g.mod_destroy_go_on_death) GO_destroy_1a();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// --------------------------------------------------------
var _i;
var _LaunchCountdown_COUNT = 0;
var _inst;
var _dl_delete = ds_list_create();
for(_i=ds_list_size(dl_inst)-1; _i>=0; _i--)
{
        _inst =     dl_inst[|_i];
    if(!instance_exists(   _inst) 
    ||  _inst.state     != _inst.state_NORMAL 
    ||  _inst.sub_state != _inst.SUB_STATE_LAUNCH_COUNTDOWN )
    {
        ds_list_add(_dl_delete,_i);
    }
    else
    {
        _LaunchCountdown_COUNT += point_distance(_inst.x,_inst.y,global.pc.x,global.pc.y) <= AGRO_DIST;
    }
}
for(_i=ds_list_size(_dl_delete)-1; _i>=0; _i--)
{   ds_list_delete(dl_inst,_dl_delete[|_i]);  }
    ds_list_destroy(_dl_delete); _dl_delete=undefined;
//




// --------------------------------------------------------
var _COUNT1 = Activated_MAX-_LaunchCountdown_COUNT;
if (_COUNT1)
{
    var _dl_options = ds_list_create();
    with(Tyell)
    {
        if (    state == state_NORMAL 
        &&  sub_state == SUB_STATE_IDLE1 
        &&  ocsHV4(id)      // if ALL w and ALL h in ocs area
        &&  point_distance(x,y,global.pc.x,global.pc.y) <= other.AGRO_DIST )
        {
            ds_list_add(_dl_options,id);
        }
    }
    
    
    if (ds_list_size(_dl_options))
    {
        ds_list_shuffle(_dl_options);
        for(_i=_COUNT1-1; _i>=0; _i--)
        {
            with(_dl_options[|_i])
            {
                ds_list_add(other.dl_inst,id);
                sub_state = SUB_STATE_LAUNCH_COUNTDOWN;
            }
        }
    }
    
    ds_list_destroy(_dl_options); _dl_options=undefined;
}




