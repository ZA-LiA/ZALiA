/// collide_solid_inst(x, y)


var _i, _inst;
for(_i=ds_list_size(g.dl_solid_inst)-1; _i>=0; _i--)
{
                        _inst = g.dl_solid_inst[|_i];
    if(!is_undefined(   _inst) 
    &&  instance_exists(_inst) 
    &&                  _inst.state==state_NORMAL 
    &&                  _inst.solid_type 
    &&  rectInRect(argument0,argument1,1,1, _inst.BodyHB_xl,_inst.BodyHB_yt,_inst.BodyHB_w,_inst.BodyHB_h) )
    {
        return          _inst;
    }
}


return noone;




