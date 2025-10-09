/// Pushable_update()


if (state!=state_NORMAL) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i;


switch(ver)
{
    // ------------------------------------------------
    case 1:{
    break;}//case 1
    
    
    // ------------------------------------------------
    case 2:{
    if(!is_undefined(dk_spawn))
    {
        f.dm_quests[?dk_spawn+"_XL"] =(xl>>3)<<3;
        f.dm_quests[?dk_spawn+"_YT"] = yt;
    }
    
    if (yt >= Y_DESPAWN) instance_destroy();
    break;}//case 2
    
    
    // ------------------------------------------------
    case 3:{
    if(!is_undefined(dk_spawn))
    {
        f.dm_quests[?dk_spawn+"_XL"] =(xl>>3)<<3;
        f.dm_quests[?dk_spawn+"_YT"] = yt;
    }
    break;}//case 3
}//switch(ver)





var _DEBUG1 = 0 && x<$100 && !(g.counter0&$7F);
if (_DEBUG1){
_str  =  " BodyHB_xl $" + hex_str(BodyHB_xl)   +", BodyHB_yt $" + hex_str(BodyHB_yt);
_str += ", BodyHB_xoff: "+string(BodyHB_xoff)+", BodyHB_yoff: "+string(BodyHB_yoff);
_str += ", BodyHB_w $" + hex_str(BodyHB_w)   +", BodyHB_h $" + hex_str(BodyHB_h);
sdm(""); sdm(_str);
}




update_EF11();
can_draw_self = true;

GO_update_cam_vars();


//hspd = byte(bit_dir(moving_dir&$3));
//vspd = byte(bit_dir(moving_dir&$C));
GO_update_cs();
update_body_hb_3a(); // uses x, instead of xx, to calculate bodyX & bodyY.


if (moving_dir) push_counter = 0;
hspd = 0;




if (_DEBUG1){
_str  =  " BodyHB_xl $" + hex_str(BodyHB_xl)   +", BodyHB_yt $" + hex_str(BodyHB_yt);
_str += ", BodyHB_xoff: "+string(BodyHB_xoff)+", BodyHB_yoff: "+string(BodyHB_yoff);
_str += ", BodyHB_w $" + hex_str(BodyHB_w)   +", BodyHB_h $" + hex_str(BodyHB_h);
sdm(""); sdm(_str);
}








switch(ver)
{
    // ------------------------------------------------
    case 1:{
    break;}//case 1
    
    
    // ------------------------------------------------
    case 2:{
    break;}//case 2
    
    
    // ------------------------------------------------
    case 3:{
    //if(!moving_dir) break;//case 3
    
    if(!is_undefined(dk_spawn))
    {
        if(!rectInRect(xl,yt,ww,hh, 0,0,g.rm_w,g.rm_h) 
        || !rectInRect(xl,yt,ww,hh, viewXL(),viewYT(),viewW(),viewH()) )
        {
            var _EXIT = collideRect(xl,yt,ww,hh, Exit);
            if (_EXIT 
            &&  _EXIT.open 
            &&  _EXIT.exit_type&g.EXIT_TYPE_STANDARD==g.EXIT_TYPE_STANDARD 
            && (_EXIT.exitNum>>4)&$F )
            {
                if(!((_EXIT.exitNum>>4)&$8) 
                ||  moving_dir&$8 )
                {
                    //if ((_EXIT.exitNum>>4)&$8) // UP Exit
                    //if ((_EXIT.exitNum>>4)&$3) // RIGHT,LEFT Exit
                    //_EXIT.goToExitName
                    
                    if ((_EXIT.exitNum>>4)&$4) // DOWN Exit
                    {
                        f.dm_quests[?dk_spawn+STR_Rm] = _EXIT.goToRoom;
                        // TODO: If new room is not aligned with old room in the dungeon layout, xl needs to be adjusted by the alignment offset
                        f.dm_quests[?dk_spawn+"_XL"]  = (xl>>3)<<3;
                        f.dm_quests[?dk_spawn+"_YT"]  = -hh;
                        g.dm_spawn[? dk_spawn+STR_Spawn_Permission] = 1;
                        sdm("Pushable "+dk_spawn+" moved to scene '"+_EXIT.goToRoom+"', "+"XL $"+hex_str(f.dm_quests[?dk_spawn+"_XL"])+" YT $"+hex_str(f.dm_quests[?dk_spawn+"_YT"]));
                        instance_destroy();
                        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    }
                }
            }
        }
    }
    break;}//case 3
}//switch(ver)








// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
if(!(cs&$4) 
&& !(x&$7) 
&&  moving_dir!=$4 ) // $4: DOWN
{
    moving_dir =$4;
    //for(_i=1; _i<=3; _i++){tile_change_1a(0, ((xl>>3)+0)<<3, ((yb>>3)-_i)<<3, -1,0, 0); tile_change_1a(0, ((xl>>3)+1)<<3, ((yb>>3)-_i)<<3, -1,0, 0);}
}


//if (moving_dir&$F)


if (moving_dir==$4) // if moving down/falling
{
    vspd  = min(abs8b(vspd),VSPD_MAX) * byte_dir(vspd);
    vspd &= $FF;
    updateY();
    
    
    GO_update_cs();
    
    if (cs&$4)
    {
        //var _DIST = 2;
        if (cs_btm_inst) // if landed on another Pushable
        //||  rectInRect(BodyHB_xl+_DIST,BodyHB_yt+_DIST,BodyHB_w-(_DIST<<1),BodyHB_h-(_DIST<<1), global.pc.csLft1X,global.pc.csLft1Y,global.pc.csRgt1X-global.pc.csLft1X,global.pc.csLft2Y-global.pc.csLft1Y) ) // if landed on pc
        {
            destroy_Pushable(id,true);
        }
        else
        {
            solid_clip_correction(false);
        }
        
        
        moving_dir = 0;
        vspd       = 0;
        home_xl    = xl;
        //for(_i=1; _i<=3; _i++){tile_change_1a(0, ((xl>>3)+0)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1); tile_change_1a(0, ((xl>>3)+1)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1);}
        aud_play_sound(get_audio_theme_track(dk_BlockBreak));
    }
    else
    {
        update_body_hb_3a(); // uses x, instead of xl, to calculate BodyHB_xl & BodyHB_yt.
        with(Enemy)
        {   // Falling on an enemy kills them
            update_body_hb_1a();
            if (max(yb-8,y)>=other.yb 
            &&  state==state_NORMAL 
            && !stun_timer 
            &&  hp 
            &&  body_collide_body(other,id) )
            {
                damage_gob(id, hp, false);
            }
        }
        
        
        if (yb<global.pc.csLft2Y)
        {
            var _DIST = 2;
            if (rectInRect(BodyHB_xl+_DIST,BodyHB_yt+_DIST,BodyHB_w-(_DIST<<1),BodyHB_h-(_DIST<<1), global.pc.csLft1X,global.pc.csLft1Y,global.pc.csRgt1X-global.pc.csLft1X,global.pc.csLft2Y-global.pc.csLft1Y))
            {   // Falling on pc
                destroy_Pushable(id,true);
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                enemy_collide_pc_body();
            }
        }
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}







// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
if(!(x&$7) 
&&  moving_dir&$3 ) // 0: NOT moving, 1: right, 2: left, 4: down, 8: up
{
    var _C1 = cs & (moving_dir&$3);
    if(!_C1)
    {
        var _X = x + ((ww_+1)*bit_dir(moving_dir));
        var _y;
        for(_i=(hh>>3)-1; _i>=0; _i--)
        {
            _y = yt+(_i<<3)+4;
            if (collide_solid_inst(_X,_y) 
            ||  collide_solid_grid(_X,_y) )
            //if (collide_solid_inst(_X, yt+(_i<<3)+4))
            {
                _C1 = 1;
                break;//_i
            }
        }
    }
    
    if (_C1)
    {
        moving_dir = 0;
        home_xl    = xl;
        //for(_i=1; _i<=3; _i++){tile_change_1a(0, ((xl>>3)+0)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1); tile_change_1a(0, ((xl>>3)+1)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1);}
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}





// --------------------------------------------------------------------------------
if (moving_dir&$3)      // 0: NOT moving, 1: right, 2: left, 4: down, 8: up
//&& !(g.timer0&0) )    // every x num frames
{
    hspd = (HSPD1*bit_dir(moving_dir)) &$FF;
    var _X_PREV = x;
    updateX();
    
    aud_play_fire(true);
    if(!audio_is_playing(get_audio_theme_track(dk_ElevatorMove)))
    {   aud_play_sound(  get_audio_theme_track(dk_ElevatorMove));  }
    
    
    
    
    var _DIFF = x-_X_PREV; // positive if moved right, negative if moved left
    if (_DIFF!=0)
    {
        with(global.pc)
        {
            var _push_pc_dir = 0;
            
            // RGT & LFT
            var _COLLIDE_RGT = 0;
            var _COLLIDE_LFT = 0;
            
            if (other.moving_dir&$2){ // Pushable is moving LFT
                _COLLIDE_RGT = collideRect(csRgt1X,csRgt1Y,1,1, other) 
                            || collideRect(csRgt2X,csRgt2Y,1,1, other);
            }else{                    // Pushable is moving RGT
                _COLLIDE_LFT = collideRect(csLft1X,csLft1Y,1,1, other) 
                            || collideRect(csLft2X,csLft2Y,1,1, other);
            }
            
            if (_COLLIDE_RGT 
            ||  _COLLIDE_LFT )
            {
                _push_pc_dir = other.moving_dir;
            }
            
            
            
            
            // BTM.  Check if PC is on top of this.
            if(!_push_pc_dir 
            &&   cs&$4 
            && !(cs&other.moving_dir) )
            {
                if (collideRect(csBtm1X,csBtm1Y,1,1, other) 
                ||  collideRect(csBtm2X,csBtm2Y,1,1, other) )
                {
                    _push_pc_dir = other.moving_dir;
                }
            }
            
            
            
            
            if (_push_pc_dir)
            {
                set_xy(id, x+_DIFF, y); // move PC
                x_change +=  _DIFF;
            }
        }
        
        
        // updates all GameObject instances
        //update_go_xy_on_moving_platform(_DIFF,0);
    }
    
    
    
    if (abs(xl-home_xl)>=MOVE_DIST1)
    {
        moving_dir = 0;
        home_xl    = xl;
        //for(_i=1; _i<=3; _i++){tile_change_1a(0, ((xl>>3)+0)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1); tile_change_1a(0, ((xl>>3)+1)<<3, ((yb>>3)-_i)<<3, -1,0, TID_SOLID1);}
    }
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}














// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
var _qual = -1;

if (cs&$4             // is on ground
&& !moving_dir        // is NOT moving
&&  f.items&ITM_BRAC  // Have Power Bracelet
&& !global.pc.ogr          // PC is on ground
&& !Input.Down_held   // Down NOT held
&&  Input.heldH )     // 1: Right OR 2: Left held
{
    var _x,_y;
    var _colliding_sides=0;
    
    
    if (Input.Right_held) // RIGHT
    {
        if (global.pc.x<=x)
        {
            var _C1 = collideRect(global.pc.csRgt1X,global.pc.csRgt1Y,1,1, id);
            var _C2 = collideRect(global.pc.csRgt2X,global.pc.csRgt2Y,1,1, id);
            if (_C1 
            ||  _C2 )
            {
                if ((_C1 || !(collide_solid_grid(global.pc.csRgt1X,global.pc.csRgt1Y)&TID_SOLID1)) 
                &&  (_C2 || !(collide_solid_grid(global.pc.csRgt2X,global.pc.csRgt2Y)&TID_SOLID1)) )
                {
                    _x=xr+1;
                    for(_i=(hh>>3)-1; _i>=0; _i--)
                    {
                        _y=yt+(_i<<3)+4;
                        if (collide_solid_grid(_x,_y) 
                        ||  collide_solid_inst(_x,_y) )
                        {
                            _colliding_sides |= $1;
                            break;//_i
                        }
                    }
                    
                    if!(_colliding_sides&$1) _qual = 1;
                }
            }
        }
    }
    else if (Input.Left_held) // LEFT
    {
        if (global.pc.x>=x)
        {
            var _C1 = collideRect(global.pc.csLft1X,global.pc.csLft1Y,1,1, id);
            var _C2 = collideRect(global.pc.csLft2X,global.pc.csLft2Y,1,1, id);
            if (_C1 
            ||  _C2 )
            {
                if ((_C1 || !(collide_solid_grid(global.pc.csLft1X,global.pc.csLft1Y)&TID_SOLID1)) 
                &&  (_C2 || !(collide_solid_grid(global.pc.csLft2X,global.pc.csLft2Y)&TID_SOLID1)) )
                {
                    _x=xl-1;
                    for(_i=(hh>>3)-1; _i>=0; _i--)
                    {
                        _y=yt+(_i<<3)+4;
                        if (collide_solid_grid(_x,_y) 
                        ||  collide_solid_inst(_x,_y) )
                        {
                            _colliding_sides |= $2;
                            break;//_i
                        }
                    }
                    
                    if!(_colliding_sides&$2) _qual = 1;
                }
            }
        }
    }
}



    push_counter = max(0, push_counter+_qual);
if (push_counter>=PUSH_DUR)
{
    push_counter = 0;
    moving_dir = Input.heldH;
    //for(_i=1; _i<=3; _i++){tile_change_1a(0, ((xl>>3)+0)<<3, ((yb>>3)-_i)<<3, -1,0, 0); tile_change_1a(0, ((xl>>3)+1)<<3, ((yb>>3)-_i)<<3, -1,0, 0);}
}
/*
var _qual = -1;

if (cs&$4             // is on ground
&& !moving_dir        // is NOT moving
&&  f.items&ITM_BRAC  // Have Power Bracelet
&& !global.pc.ogr          // PC is on ground
&& !Input.Down_held   // Down NOT held
&&  Input.heldH )     // 1: Right OR 2: Left held
{
    var _x,_y;
    var _colliding_sides=0;
    
    
    if (Input.Right_held) // RIGHT
    {
        if (global.pc.x<=x 
        && !(collide_solid_grid(global.pc.csRgt1X,global.pc.csRgt1Y)&TID_SOLID1) 
        && !(collide_solid_grid(global.pc.csRgt2X,global.pc.csRgt2Y)&TID_SOLID1) )
        {
            _x=xr+1;
            for(_i=(hh>>3)-1; _i>=0; _i--)
            {
                _y=yt+(_i<<3)+4;
                if (collide_solid_grid(_x,_y) 
                ||  collide_solid_inst(_x,_y) )
                {
                    _colliding_sides |= $1;
                    break;
                }
            }
            
            if!(_colliding_sides&$1)
            {
                if (collideRect(global.pc.csRgt1X,global.pc.csRgt1Y,1,1, id) 
                ||  collideRect(global.pc.csRgt2X,global.pc.csRgt2Y,1,1, id) )
                {   _qual = 1;  }
            }
        }
    }
    else if (Input.Left_held) // LEFT
    {
        if (global.pc.x>=x 
        && !(collide_solid_grid(global.pc.csLft1X,global.pc.csLft1Y)&TID_SOLID1) 
        && !(collide_solid_grid(global.pc.csLft2X,global.pc.csLft2Y)&TID_SOLID1) )
        {
            _x=xl-1;
            for(_i=(hh>>3)-1; _i>=0; _i--)
            {
                _y=yt+(_i<<3)+4;
                if (collide_solid_grid(_x,_y) 
                ||  collide_solid_inst(_x,_y) )
                {
                    _colliding_sides |= $2;
                    break;
                }
            }
            
            if!(_colliding_sides&$2)
            {
                if (collideRect(global.pc.csLft1X,global.pc.csLft1Y,1,1, id) 
                ||  collideRect(global.pc.csLft2X,global.pc.csLft2Y,1,1, id) )
                {   _qual = 1;  }
            }
        }
    }
}



    push_counter  = max(0, push_counter+_qual);
if (push_counter >= PUSH_DUR)
{
    push_counter = 0;
    moving_dir = Input.heldH;
}
*/




if (_DEBUG1){
_str  =  " BodyHB_xl $" + hex_str(BodyHB_xl)   +", BodyHB_yt $" + hex_str(BodyHB_yt);
_str += ", BodyHB_xoff: "+string(BodyHB_xoff)+", BodyHB_yoff: "+string(BodyHB_yoff);
_str += ", BodyHB_w $" + hex_str(BodyHB_w)   +", BodyHB_h $" + hex_str(BodyHB_h);
sdm(""); sdm(_str); sdm(""); sdm("");
}




