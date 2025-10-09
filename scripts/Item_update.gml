/// Item_update()


switch(sub_state)
{
    // ---------------------------------------------------------------------
    // ----------------------------------------------------------
    case sub_state_IDLE:{
    if (ITEM_BIT==ITM_FRY1) // RESCUE FAIRY
    {
        vspd = 0;
        vspd_grav = 0;
        
        if(!greeting_played 
        &&  ocsHV4(id) )  // if all w and all h in ocs area
        {
            greeting_played = true; // Prevent sound from playing again
            aud_play_sound(get_audio_theme_track(STR_Fairy+STR_Greeting));
        }
    }
    
    
    // D959: JSR DE3D
    GO_update_cs();
    GOB_update_2();
    
    
    
    // E51E. ITEM_TYPE: "A":Major items, "B":Heart/Magic containers, "C":Quest items, "G":Extra Life Doll
    if (IS_HOLD_ITEM 
    &&  cs&CS_BD1 
    && !global.pc.ogr 
    && !global.pc.HoldItem_timer )
    {   // E726, E538: JSR E771
        Item_update_1(); // E771
        
        global.pc.HoldItem_timer  = global.pc.HoldItem_DURATION; // $70
        global.pc.vspd = 0; // og
        //global.pc.hspd = 0; // og
        
        global.pc.HoldItem_inst   = id; // 
        global.pc.HoldItem_object = object_index; // 049D 
        //global.pc.HoldItem_ver    = ver;
        //global.pc.HoldItem_palidx = palidx_base;
        if (object_index==CONT_PIECE_OBJ_MP)
        {
            GO_sprite_init(g.dl_cont_spr_mp[|0]);
        }
        
        
        sub_state = sub_state_HELD;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    
    
    
    if(!IS_HOLD_ITEM 
    && !stun_timer )
    {
        if (cs&CS_SW1  // Note: TYPE1's react_swrd value does NOT collide w/ PC swrd
        || (global.pc.SwordHB2_colliding==id && isVal(ITEM_TYPE,STR_KEY,STR_JAR,STR_PBAG)) )
        {
            Item_update_1(); // E771
            stun_timer = STUN_DURATION1; // $30
            aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
            
            if (ITEM_TYPE==STR_PBAG) state = state_DROP;
            else                     state = 0;
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    // D95C
    Item_update_vertical();
    break;}//case sub_state_IDLE:{
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ----------------------------------------------------------
    case sub_state_HELD:{
    if (global.pc.HoldItem_timer)
    {
        var _X = global.pc.x;
        if (ww<$10)
        {
            if (pc_is_cucco()) _X += ww_ * -global.pc.xScale;
            else               _X -= ww_;
            //if(!pc_is_cucco()) _X -= ww_;
        }
        
        var _Y  = global.pc.yt-hh_;
            _Y -= sign(pc_is_cucco());
        set_xy(id, _X,_Y);
        /*
        var _X  = global.pc.x-(8*global.pc.HoldItem_x_scale);
            _X += ww_ * global.pc.HoldItem_x_scale;
        set_xy(id, _X, global.pc.yt-hh_);
        */
        /*
        set_xy(id, (global.pc.x-8)+ww_, global.pc.yt-hh_);
        
        if (pc_is_cucco() 
        &&  ww<$10 
        && !global.pc.xScale )
        {
            set_xy(id, global.pc.x+4, global.pc.yt-hh_);
        }
        */
        update_EF11();
    }
    else
    {
        global.pc.HoldItem_inst = noone;
        state = 0;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case sub_state_HELD:{
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ----------------------------------------------------------
    case sub_state_NONI:{ // Non-Interactive. isVer(id,ItmC0,2) // Returned TROPHY in Ruto
    update_EF11();
    break;}//case sub_state_NONI:{
}//switch(sub_state)




