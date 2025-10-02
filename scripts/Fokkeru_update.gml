/// Fokkeru_update()


var _RAND = rand();


// 9E6B
GOB_update_1(true); // update hspd_pushback
GO_update_cs();


// 9E38
if!(cs&$3) updateX();

facing_dir = dir_to_pc(id);


counter = (counter+1)&$FF;

if(!(counter&$3F) 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver))
    {
        vspd =  $E0;
        hspd = ($10*facing_dir) &$FF;
    }
}

// 9E98
updateY();

GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();

// 9EA1
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    
    var _VAL = (_RAND>>1)&$3;
    
                 hspd = $4<<(_VAL>1); // 4,8
    if (_VAL&$1) hspd = (-hspd) &$FF;
    
                 vspd = ($F0<<(_RAND&$1)) &$FF;
}

// MOD. Prevent clip into ceiling
GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;




