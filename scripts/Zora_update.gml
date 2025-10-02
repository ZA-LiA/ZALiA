/// Zora_update()


if (timer)
{   // tall/standing
    BodyHB_idx = BODY_HB_IDX_TALL;
    cs_off_idx  = CS_OFF_IDX_TALL;
}
else
{   // short
    BodyHB_idx = BODY_HB_IDX_SHRT;
    cs_off_idx  = CS_OFF_IDX_SHRT;
}


// 9A2A
if(!(g.counter1&$3F) 
&&  rand()&$1 )
{
    shoot_timer = $A; // $A: 0.167s
}


GO_update_cs();


Enemy_update_3(); // update vertical


// 9A3D
//if (timer) BodyHB_idx = BODY_HB_IDX_TALL; // tall
//else       BodyHB_idx = BODY_HB_IDX_SHRT; // short

if (COLLISION_VER==2)
{
    var _OCS  = ocs;
    var _BITS = $3 <<(3 * !facing_dir); // $03: 0000 0011  OR  $18: 0001 1000
    
    var           _DIST = (ww_-4) * facing_dir;
    if (timer)    _DIST =      4  * facing_dir;
    
    if (wINwAll(x+_DIST-4,8, viewXL(),viewW())) // if head is in view
    {    ocs &= ~_BITS;  } // guarantee bits clear to allow   collision checking
    else ocs |=  _BITS;    // guarantee bits set   to prevent collision checking
}

GOB_update_2(); // collision checking

if (COLLISION_VER==2) ocs=_OCS;

if (cs&CS_BD1) enemy_collide_pc_body();



// 9A4F
GOB_update_1(cs&$4); // update hspdPB

GO_update_cs();

if!(cs&$3) updateX();



// 9A52
if!(g.counter1&$3F) facing_dir = dir_to_pc(id);


hspd = 0;


// 9A5F
if(!timer) // NOT standing
{   // 9A64.  Stand up
    if(!g.counter1) timer = $50; // $50: 1.333s
    counter = (counter+1)&$FF; // for updating hspd
    Enemy_update_2(); // update hspd
}

// 9A70
if (    shoot_timer)
{
        shoot_timer--;
    if(!shoot_timer 
    &&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
    {
        // 9A78
        var _xl = xl;
        var _yt = yt;
        
        if (g.mod_ZoraProjectileXY)
        {   // More accurately spawn near mouth.
            var _YOFF = 4;
            if (timer) // if standing
            {
                if (facing_dir) _xl = x;
                else           _xl = x-8;
                _yt = yt + _YOFF;
            }
            else
            {
                if (facing_dir) _xl = x+8;
                else           _xl = xl;
                _yt = y;
                //_yt = y+_YOFF;
            }
        }
        else
        {
            if (timer) // if standing
            {
                if (facing_dir) _xl += 14;
                else           _xl += -8;
            }
            
            if (timer) _yt +=  4; // when standing
            else       _yt += 12;
        }
        
        // Bullet2, pID $11. PI_MOB2: red
        GOC1_create(_xl,_yt, facing_dir, projectile,projectile_ver, id, global.PI_MOB_RED);
    }
}




