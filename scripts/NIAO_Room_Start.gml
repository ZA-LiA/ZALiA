/// NIAO_Room_Start()


var _i, _data, _dk;
var _x = 0;
var _y = 0;
var _state = 0;
var _pi = -1;
var _ver = 0;
var _init = 0;
var _inst = noone;


for(_i=ds_list_size(g.dl_niao)-1; _i>=0; _i--)
{
    if(!is_undefined(    g.dl_niao[|_i]) 
    &&  instance_exists( g.dl_niao[|_i]) )
    //&&                   g.dl_niao[|_i]+1 )
    {   instance_destroy(g.dl_niao[|_i]);  }
                         g.dl_niao[|_i] = noone;
                         //g.dl_niao[|_i] = 0;
    //
    
    _dk   = g.rm_name+STR_NIAO+string(_i);
    _data = g.dm_rm[?_dk+"_xy"];
    if(!is_undefined(_data))
    {
            _x = ((_data>>0)&$FF) <<3;
            //_y = ((_data>>8)&$FF) <<3;
            _y =  (_data>>8)&$FF;
        if (g.view_lock_rm&$C)
        {   _y = (g.rm_rows-PAGE_ROWS)+_y;  }
            _y = _y<<3;
        //
        _ver   = g.dm_rm[?_dk+STR_version];
        _init  = g.dm_rm[?_dk+"_init"];
        _pi    = g.dm_rm[?_dk+STR_pal_idx];
        _state = 1;
    }
    else
    {
        continue; //_i
        /*
        _x     = 0;
        _y     = 0;
        _ver   = 0;
        _init  = 0;
        _pi    = -1;
        _state = 0;
        */
    }
    
    
    //sdm("NIAO dk: '"+_dk+"'");
    _inst = NIAO_create(_x,_y, _ver, _init, _dk);
    if(!is_undefined(_inst) 
    &&  _inst!=noone 
    &&  instance_exists(_inst) )
    {
        with(_inst)
        {
            state = _state;
            g.dl_niao[|_i] = id;
            
            if (state 
            && !is_undefined(_pi) 
            && _pi+1 )
            {
                GO_init_palidx(_pi);
            }
        }
    }
}




