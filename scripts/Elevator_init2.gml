/// Elevator_init2()


var _i,_j, _val;



var _exit_data = 0;
if(!is_undefined(dk_spawn))
{
    spawn_x = (val(g.dm_spawn[?dk_spawn+"_x"], g.rm_clms>>1) <<3) - ww_;
    spawn_y =  val(g.dm_spawn[?dk_spawn+"_y"], g.rm_rows>>1) <<3;
    set_xlyt(id, spawn_x,spawn_y);
    
    _exit_data = val(g.dm_spawn[?dk_spawn+STR_ExitData]);
}
/*
var _exit_data = -1;
if(!is_undefined(dk_spawn))
{
    spawn_x = (val(g.dm_spawn[?dk_spawn+"_x"], g.rm_clms>>1) <<3) - ww_;
    spawn_y =  val(g.dm_spawn[?dk_spawn+"_y"], g.rm_rows>>1) <<3;
    set_xlyt(id, spawn_x, spawn_y);
    
    _exit_data = val(g.dm_spawn[?dk_spawn+STR_ExitData], "");
}
*/




facingDir = 1;



// ---------------------------------------------------------
dl_exit = ds_list_create();
ds_list_add(dl_exit, 0);


exit_dirs = $0;

if(!is_undefined(dk_spawn) 
&& !is_undefined(g.dm_spawn[?dk_spawn+STR_ExitData]) )
{
    // _data = "": Means Elevator has solid tiles above and below it 
    // and is just meant to move up & down through the room.
    var _xl,_yt;
    
    if (_exit_data==0) // if elevator is confined in scene and doesn't go to an exit
    {
        if (g.pc.y<y)
        {
            _yt = find_row_solid(TID_SOLID1, (x>>3)<<3, y>>3, -1,-1, yt>>3);
            _yt = _yt<<3;
        }
        else
        {
            _yt  = get_ground_y(x,yb, 1, yt);
            _yt -= hh;
        }
        
        spawn_y = _yt;
        set_xlyt(id, spawn_x,spawn_y);
    }
    else
    {
        var _exit, _exit_num;
        var          _COUNT = string_length(_exit_data)>>1;
        for(_i=0; _i<_COUNT; _i++) // Each exit of the ElevA shaft
        {
            _exit = 0;
            _exit_num = str_hex(string_copy(_exit_data, (_i<<1)+1, 2));
            with(Exit)
            {
                if (exitNum!=_exit_num)
                {
                    continue;//with(Exit)
                }
                
                
                _exit = id;
                break;//with(Exit)
            }
            
            
            if(!_exit)
            {
                continue;//_i
            }
            
            
            exit_dirs |= _exit.side&$F;
            ds_list_add(dl_exit, _exit);
            
            
            if (_exit==g.exit_enter)
            {
                _xl = xl;
                _yt = yt;
                
                var _OFFSET = $01<<3;
                    _OFFSET = $02<<3; // MOD. For auto elevator on enter rm
                switch(_exit.side&$F){
                case $1:{_xl=cam_xr_max()+_OFFSET-ww; break;}
                case $2:{_xl=cam_xl_min()-_OFFSET;    break;}
                case $4:{_yt=cam_yb_max()+_OFFSET-hh; break;}
                case $8:{_yt=cam_yt_min()-_OFFSET;    break;}
                }
                
                spawn_x = _xl;
                spawn_y = _yt;
                set_xlyt(id, spawn_x,spawn_y);
            }
        }
    }
}


/*
    GROUND_Y = get_ground_y(x, yc, 1, y);
    //GROUND_Y = get_ground_y(x, yb, 1, y);
if (GROUND_Y!=y)
{   // MOD.  Move elevator to sitting on the ground.
    set_xy(id, x, GROUND_Y-hh_);
}
else
{
    GROUND_Y = -1;
}
*/



/*
if (g.exit_enter 
&& !is_undefined(dk_spawn) 
&&  _exit_data!=0 ) // 0 means the elevator is confined w/in the scene and doesn't go to an exit
{
    var _exit_num;
    var _COUNT1=5;
    for(_i=0; _i<_COUNT1; _i++)
    {
        for(_j=0; _j<$10; _j++)
        {
            _exit_num  = _i>0;
            _exit_num  = _exit_num<<max(_i-1,0);
            _exit_num  = _exit_num<<4;
            _exit_num |= _j;
            _val = g.dm_spawn[?dk_spawn+STR_Elevator+STR_Spawn+STR_Row+hex_str(_exit_num)];
            
            if(!is_undefined(_val) 
            &&  g.exit_enter.exitNum==_exit_num )
            {
                set_xlyt(id, xl, _val<<3);
                _i=_COUNT1;
                break;//_j
            }
        }
    }
}
*/




// Trying different method for positioning
if (g.exit_enter 
&& !is_undefined(dk_spawn) 
&&  _exit_data==0 ) // 0 means the elevator is confined w/in the scene and doesn't go to an exit
{
    var _exit_num_, _spawn_row;
    _i = 1;
    while (true)
    {
        _exit_num_ = g.dm_spawn[?dk_spawn+STR_Elevator+STR_Spawn+STR_Row+STR_Exit+hex_str(_i++)];
        if (is_undefined(_exit_num_))
        {
            break;//while (true)
        }
        
        if (hex_str(g.exit_enter.exitNum)==_exit_num_)
        {
            _spawn_row = g.dm_spawn[?dk_spawn+STR_Elevator+STR_Spawn+STR_Row+_exit_num_];
            if(!is_undefined(_spawn_row))
            {
                spawn_y = _spawn_row<<3;
                set_xlyt(id, xl, spawn_y);
                break;//while (true)
            }
        }
    }
}




