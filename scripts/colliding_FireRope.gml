/// colliding_FireRope(FireRope inst, XL, YT, W, H, *RADIUS)


if(!argument[0]) // pass 0 or FireRope object to check all
{   argument[0]=FiRoA;  }


var _i, _fireball_x,_fireball_y;
with(argument[0])
{
    BodyHB_can_draw = true;
    
    for(_i=fireball_count-1; _i>=0; _i--)
    {
        _fireball_x = spawn_xl + round(lengthdir_x(_i<<3, angle));
        _fireball_y = spawn_yt + round(lengthdir_y(_i<<3, angle));
        if (argument_count>5 && argument[5]) // radius (of colliding obj)
        {
            if (rectInCirc(argument[1],argument[2],argument[5], _fireball_x,_fireball_y,1,1))
            {
                return id;
            }
        }
        else
        {
            if (rectInRect(argument[1],argument[2],argument[3],argument[4], _fireball_x,_fireball_y,1,1))
            {
                return id;
            }
        }
    }
}


return noone;




