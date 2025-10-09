/// Challenge_Secret01_update()


var _C1 = global.pc.xScale && !global.pc.hspd && !global.pc.vspd && !Input.held;

if (timer) timer--;
if (counter2>=0) counter2++; // For fade timings

hspd = 0;


switch(sub_state)
{
    // ----------------------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;//case sub_state_IDLE
    
    if (g.gui_state==g.gui_state_NONE)
    {
        if (_C1)
        {
            var _W = $12;
            var _H = $30;
            if (rectInRect(Headstone_x-(_W>>1),Headstone_y-(_H>>1),_W,_H, global.pc.x-PC_W_,global.pc.y-PC_H_,PC_W,PC_H))
            {
                counter1++;
            }
            /*
            //if(!is_undefined(NPC_SPAWN_DATAKEY))
            with(NPC_0)
            {
                if (ver==$1) // NPC_0, ver 1: Invisible Sign
                {   //clm3=$41; x3=clm3<<3;  data_spawn(rm+STR_PRIO,NPC_0,$1,  x3,y6,  STR_Dialogue+DK0012); // Headstone
                    // NPC xl should be the xl of the headstone. xl+8 is headstone center
                    var _W = $12;
                    if (rectInRect((xl+8)-(_W>>1),BodyHB_y,_W,BodyHB_h, global.pc.x-8,global.pc.BodyHB_y,$10,global.pc.BodyHB_h))
                    //if (collide_pc_body((xl+8)-(_W>>1),BodyHB_y, _W,BodyHB_h))
                    //if (collide_pc_body(BodyHB_x,BodyHB_y, BodyHB_w,BodyHB_h, BodyHB_r))
                    {
                        other.counter1++;
                    }
                    
                    break;//with(NPC_0)
                }
            }
            */
        }
        else
        {
            counter1 = 0;
            break;//case sub_state_IDLE
        }
        
        if (counter1>=DURATION1)
        {
            counter1 = 0;
            counter2 = 0; // starts counter2
            aud_play_sound(REVEAL_TRACK);
            
            timer = DURATION2;
            sub_state = sub_state_REVEAL;
            //sub_state = sub_state_MOVING1;
        }
    }
    break;}//case sub_state_IDLE
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------
    case sub_state_REVEAL:{
    if (timer) break;//case sub_state_REVEAL
    
    timer = 0;
    sub_state = sub_state_MOVING1;
    break;}//case sub_state_REVEAL
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------
    case sub_state_MOVING1:{
    if(!_C1)
    {   // Fail challenge, start over
        dl_MOVE_TO_X_idx = 0;
        counter1 = 0;
        aud_play_sound(REVEAL_TRACK);
        
        timer = $18; // disappear duration
        sub_state = sub_state_COMPLETE1;
        break;//case sub_state_MOVING1
    }
    
    if (timer) break;//case sub_state_MOVING1
    
    
    hspd = (HSPD1*MOVE_DIR) &$FF;
    updateX();
    
    if (x>=dl_MOVE_TO_X[|dl_MOVE_TO_X_idx])
    {
        dl_MOVE_TO_X_idx++;
        if (dl_MOVE_TO_X_idx>=ds_list_size(dl_MOVE_TO_X))
        {
            dl_MOVE_TO_X_idx = 0;
            set_xy(id, dl_MOVE_TO_X[|ds_list_size(dl_MOVE_TO_X)-1], y);
            aud_play_sound(REVEAL_TRACK);
            
            counter2 = !(counter2&$1);
            timer = DURATION3; // disappear duration
            sub_state = sub_state_COMPLETE1;
        }
        else
        {   // pause walk
            timer  = $18;
            timer += irandom($8) * choose(1,-1);
        }
    }
    break;}//case sub_state_MOVING1
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------
    case sub_state_COMPLETE1:{
    if (timer) break;//case sub_state_COMPLETE1
    
    if (x>=dl_MOVE_TO_X[|ds_list_size(dl_MOVE_TO_X)-1])
    {
        if(!val(f.dm_quests[?dk_spawn+STR_Complete]))
        {
            item_inst = GameObject_create(x-$4,y-$C, ItmF0,$A); // PBag $A: 1000
        }
        
        timer = 0;
        sub_state = sub_state_DONE;
    }
    else
    {   // Fail challenge, start over
        counter1 = 0;
        dl_MOVE_TO_X_idx = 0;
        set_xy(id, Ghost_HOME_X,Ghost_HOME_Y);
        //set_xlyt(id, spawn_x,spawn_y);
        
        timer = 0;
        sub_state = sub_state_IDLE;
    }
    break;}//case sub_state_COMPLETE1
    
    
    
    
    
    
    
    
    // ----------------------------------------------------------
    case sub_state_DONE:{
    if (timer) break;//case sub_state_DONE
    
    if(!val(f.dm_quests[?dk_spawn+STR_Complete]) 
    &&  item_inst!=noone )
    {
        if(!instance_exists(item_inst) 
        || !item_inst.state )
        {
            f.dm_quests[?dk_spawn+STR_Complete] = true;
        }
    }
    
    //timer = 0;
    //sub_state = sub_state_IDLE;
    break;}//case sub_state_DONE
}//switch(sub_state)



if (hspd) hspd_dir = byte_dir(hspd);
Challenge_Secret01_udp();




