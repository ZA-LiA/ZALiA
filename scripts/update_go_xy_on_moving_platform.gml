/// update_go_xy_on_moving_platform(platform x change, platform y change)


var _X_CHANGE = argument[0];
var _Y_CHANGE = argument[1];


with(GameObject)
{
    if (is_ancestor_(object_index,GameObjectA,GOB1,NPC,Item) 
    && !is_undefined(   cs_btm_inst) 
    &&  instance_exists(cs_btm_inst) 
    &&                  cs_btm_inst==other )
    {
        // -----------------------------------------------------------
        if (abs(_X_CHANGE))
        {
            var _HSPD_DIR=hspd_dir;
            var _HSPD    =hspd;
            
            if (id==global.pc) hspd_dir = sign_(_X_CHANGE);
            else               hspd     = sign_(_X_CHANGE)&$FF; // $01 or $FF
            GO_update_cs();
            if (id==global.pc) hspd_dir = _HSPD_DIR;
            else               hspd     = _HSPD;
            
            
            if(!(cs&$3) 
            ||  sign_(cs&$1)!=sign_(_X_CHANGE) )
            {
                x_change +=  _X_CHANGE;
                set_xy(id, x+_X_CHANGE, y);
            }
        }
        
        
        // -----------------------------------------------------------
        if (abs(_Y_CHANGE))
        {
            y_change +=     _Y_CHANGE;
            set_xy(id, x, y+_Y_CHANGE);
            /* TODO: What happens when the platform moves pc into ceiling or floor?
            GO_update_cs();
            
            if ((_Y_CHANGE && !cs4()) 
            || (!_Y_CHANGE && !cs8()) )
            {
                y_change +=     _Y_CHANGE;
                set_xy(id, x, y+_Y_CHANGE);
            }
            */
        }
    }
}




