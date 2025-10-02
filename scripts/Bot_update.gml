/// Bot_update()

// update for Bot_A, Myu_A


if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



var _RAND = rand();
var _VER3 = object_index==Bot_A && ver==3;


// ---------------- JUMPING --------------------------
if (abilities&ABL_JUMP 
&&  cs&$4 )
{
    var _C1 = !(_RAND&$7F);
    if (_VER3)
    {
        _C1 =   _RAND&$8 
           &&  abs(x-g.pc.x) <= $18+irandom($C) 
           &&  inRange(y, viewYT(),g.pc.yb+($3<<3));
    }
    
    if (_C1)
    {
        if (is_hostile 
        ||  g.counter1&$40 )
        {
            facing_dir = dir_to_pc(id);
            
            hspd = (hspd_jump*facing_dir) &$FF;
            vspd = INIT_VEL_DEF; // Jump!
            
            ogr  = OGR_JUMP;
            
            if (_VER3) abilities |= ABL_WALK;
        }
    }
}




// DA54 ------------------------------------------------------------
// ------------------------------------------------------------
var _VSPD =    vspd;
updateY();
if (_VSPD<$80) vspd = min(vspd, term_vel);


GO_update_cs();


GOB_update_2();
if (cs&CS_BD1 
&&  is_hostile )
{
    enemy_collide_pc_body();
}


// ------------------------------------------------------------
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}

GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;


if (cs&$8 
&&  cs&$4 
&&  cs&$3 )
{
    // Stuck in wall?
    if (hspd<$80) set_xy(id,  (x>>3)   <<3, y);
    else          set_xy(id, ((x>>3)+1)<<3, y);
}



     if (cs&$4) ogr = 0;
else if(!ogr)   ogr = OGR_OTHR;


if (_VER3 
&&  ogr==OGR_JUMP 
&&  depth != depth_def )
{
    if (vspd==0 
    || (vspd<$80 && _VSPD&$80) )
    {
        depth = depth_def;
    }
}




// ------------------------------------------------------------
if (cs&$4)
{
    if (abilities&ABL_WALK)
    {   // DA75
        if(!is_idle)
        {   // DA7D, DA89
            if (counter&$F==$F 
            ||  counter&$F==$3 )
            {
                var _C1=object_index==Bot_A && ver==4; // v4: Nyb (same as Bit but all hspd is fast hspd)
                if(!_C1 
                &&  abilities&ABL_RUN_ )
                {
                    if (object_index==Bot_A 
                    &&  ver==2 )
                    {    _C1 = (g.counter1 - ((ver2_inst<<5)&$C0)) &$FF;  }
                    else _C1 =  g.counter1;
                    
                    _C1 = _C1<$80;
                }
                
                if (_C1) hspd = (HSPD_WALK2*walk_dir) &$FF;
                else     hspd = (HSPD_WALK1*walk_dir) &$FF;
                
                if!(cs&$3) updateX();
            }
            
            counter = (counter+1)&$FF;
        }
        
        
        
        if(!timer)
        {   // DAA4
                is_idle = !is_idle;
            if (is_idle) timer = $C0 | (_RAND&$3F); // $C0-FF. Idle period
            else         timer = $40 | (_RAND&$3F); // $40-7F. walk period
            
            walk_dir = sign_(~_RAND&$1); // 1,0 = 1,-1
        }
    }
}
else
{   // DA69. Off ground
    if!(cs&$3) updateX();
}




