/// NIAO_create(xl, yt, version, init scr, *spawn datakey)


var _XL   = argument[0];
var _YT   = argument[1];
var _VER  = argument[2];
var _INIT = argument[3];

var                   _SPAWN_DK = undefined;
if (argument_count>4) _SPAWN_DK = argument[4];


with(instance_create(0,0, GameObject))
{
    NIAO_init(); // init vars
    
    xl  = _XL;
    yt  = _YT;
    xl  = _XL;
    yt  = _YT;
    ver = _VER;
    
    if(!is_undefined(_SPAWN_DK)) dk_spawn = _SPAWN_DK;
    
    if (_INIT) script_execute(_INIT);
    
    
    if(!is_undefined(id) 
    &&  instance_exists(id) )
    {
        set_xlyt(id, xl,yt);
        update_draw_xy();
        
        if (ver)
        {
            if (DEV) debug_NIAO_spawn_1a();
        }
        else
        {
            ver = 1;
        }
        
        return id;
    }
}


return noone;




