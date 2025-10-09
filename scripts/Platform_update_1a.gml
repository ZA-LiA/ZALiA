/// Platform_update_1a()


BodyHB_can_draw = true;
update_body_hb_1a();


var _DIFF_X = x-x_prev;
var _DIFF_Y = y-y_prev;

if (_DIFF_X==0 
&&  _DIFF_Y==0 )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// updates all GameObject instances
update_go_xy_on_moving_platform(_DIFF_X,_DIFF_Y);
/*
with(GameObject)
{
    if (is_ancestor_(object_index,GameObjectA,GOB1,NPC,Item) 
    && !is_undefined(   cs_btm_inst) 
    &&  instance_exists(cs_btm_inst) 
    &&                  cs_btm_inst==other )
    {
        // -----------------------------------------------------------
        if (abs(_DIFF_X))
        {
            var _HSPD_DIR=hspd_dir;
            var _HSPD    =hspd;
            
            if (id==g.pc) hspd_dir = sign_(_DIFF_X);
            else          hspd     = sign_(_DIFF_X)&$FF; // $01 or $FF
            GO_update_cs();
            if (id==g.pc) hspd_dir = _HSPD_DIR;
            else          hspd     = _HSPD;
            
            
            if!(cs&$3)
            {
                x_change +=  _DIFF_X;
                set_xy(id, x+_DIFF_X, y);
            }
        }
        
        
        // -----------------------------------------------------------
        if (abs(_DIFF_Y))
        {
            y_change +=     _DIFF_Y;
            set_xy(id, x, y+_DIFF_Y);
        }
    }
}
*/
            /* TODO: What happens when the platform moves pc into ceiling or floor?
            GO_update_cs();
            
            if ((_DIFF_Y && !cs4()) 
            || (!_DIFF_Y && !cs8()) )
            {
                y_change +=     _DIFF_Y;
                set_xy(id, x, y+_DIFF_Y);
            }
            */




