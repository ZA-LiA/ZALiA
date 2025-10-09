/// Spawner_PoisonBubble_update()


GO_update_cam_vars();


// DC15
    counter = (counter+1)&$FF;
if (counter&$1F) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _UIDX = avail_uidx_goc(MAX_GOC1);
if (_UIDX == UIDX_NULL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!

// Spawn ahead of PC as PC is moving.
var _XL  = viewXL() + irandom(viewW());
    _XL += ($60 * sign(global.pc.x_change));
    _XL  = round8(_XL); // round to nearest 8th
var _YT  = viewYB()-8;

g.go_mgr.uIdxSwap_goc = _UIDX;
with(GOC1_create(_XL,_YT, facing_dir, projectile,projectile_ver))
{
    is_from_spawner = true;
    
    var _Y1 = viewYB()-hh_;
    var _Y2 = viewYT()+hh_;
    var _Y  = _Y1;
         if (other.SpawnDir_OPTIONS&$C==$C) _Y=choose(_Y1,_Y2);
    else if (other.SpawnDir_OPTIONS&$4)     _Y=_Y1;
    else                                    _Y=_Y2;
    set_xy(id, x,_Y);
    
    if (_Y==_Y2) vspd = abs8b(vspd);
}




