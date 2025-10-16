/// PC_update_1a()


if(!is_cucco)
{    Cucco_is_slowfalling_prev = 0;  }
else Cucco_is_slowfalling_prev = Cucco_is_slowfalling;
     Cucco_is_slowfalling = 0;
//

if (is_cucco)
{
    DRAW_YOFF = 0;
    if (sprite_index   !=   CUCCO_PLACEMENT_SPR){
        GO_set_sprite_index(CUCCO_PLACEMENT_SPR);
        set_xy(id, x,y);
    }
    
    if (g.DevDash_state==2) hspd_max = Cucco_HSPD_MAX1_DASH;
    else                    hspd_max = Cucco_HSPD_MAX1;
    //cucco_is_slowfalling_prev = Cucco_is_slowfalling;
    //Cucco_is_slowfalling = 0;
    
    
    cs_off_idx = Cucco_CS_OFF_IDX1;
    
    BodyHB_idx = Cucco_BodyHB_IDX1; // 16x16 GO
    
    var  _THRUST_D  = f.Cucco_skills & f.CuccoSkill_THRUST_D;
         _THRUST_D *= sign(g.CUCCO_CAN_THRUST_D);
    //
    var  _THRUST_U  = f.Cucco_skills & f.CuccoSkill_THRUST_U;
         _THRUST_U *= sign(g.CUCCO_CAN_THRUST_U);
    //
    if ((_THRUST_D && attack_bits&BIT_ATK3) 
    ||  (_THRUST_U && attack_bits&BIT_ATK4) )
    {
        if (g.mod_CuccoUpDownThrustHB 
        &&  _THRUST_U 
        &&  attack_bits&BIT_ATK4 )
        {
            SwordHB_w = SwordHB_W-4;
            SwordHB_h = SwordHB_H;
        }
        else
        {
            SwordHB_w = SwordHB_W;
            SwordHB_h = SwordHB_H;
        }
    }
    else
    {
        SwordHB_w = Cucco_SwordHB_W;
        SwordHB_h = Cucco_SwordHB_H;
        
        if (g.mod_PCSword2 
        &&  f.items&ITM_SWRD 
        &&  g.CuccoSpell2_Active )
        {
            switch(g.mod_PCSword2){
            case 1:{SwordHB_w += 2; break;}
            case 2:{SwordHB_w += 3; break;}
            case 3:{SwordHB_w += 3-instance_exists(ShadowLonk01); break;}
            }
        }
    }
    
    SwordHB_w_ = SwordHB_w>>1;
    SwordHB_h_ = SwordHB_h>>1;
    
    SwordHB2_w = Cucco_SwordHB_W;
    SwordHB2_h = Cucco_SwordHB_H;
}
else if (pc_is_fairy())
{
    DRAW_YOFF = 1; // +1 for 1 pixel in ground
    if (       sprite_index!=PC_PLACEMENT_SPR){
        GO_set_sprite_index( PC_PLACEMENT_SPR);
        set_xy(id, x,y);
    }
    
    if (g.DevDash_state==2) hspd_max = HSPD_MAX1_DASH;
    else                    hspd_max = HSPD_MAX1;
    
    cs_off_idx = Fairy_CS_OFF_IDX;
    
    BodyHB_idx = Fairy_BodyHB_IDX1;
    
    SwordHB_w  = SwordHB_W;
    SwordHB_h  = SwordHB_H;
    SwordHB_w_ = SwordHB_w>>1;
    SwordHB_h_ = SwordHB_h>>1;
    
    SwordHB2_w = SwordHB2_W;
    SwordHB2_h = SwordHB2_H;
}
else
{
    DRAW_YOFF = 1; // +1 for 1 pixel in ground
    if (       sprite_index!=PC_PLACEMENT_SPR){
        GO_set_sprite_index( PC_PLACEMENT_SPR);
        set_xy(id, x,y);
    }
    
    if (g.DevDash_state==2) hspd_max = HSPD_MAX1_DASH;
    else                    hspd_max = HSPD_MAX1;
    
    cs_off_idx = CS_OFF_IDX;
    
    BodyHB_idx = BodyHB_IDX1;
    
    SwordHB_w = SwordHB_W;
    SwordHB_h = SwordHB_H;
    
    if (g.mod_PCSword2 
    &&  f.items&ITM_SWRD )
    {
        switch(g.mod_PCSword2){
        case 1:{SwordHB_w += 2; break;}
        case 2:{SwordHB_w += 3; break;}
        case 3:{SwordHB_w += 3-instance_exists(ShadowLonk01); break;}
        //case 3:{SwordHB_w += 3 - (!!instance_number(ShadowLonk01)); break;}
        }
    }
    
    SwordHB_w_ = SwordHB_w>>1;
    SwordHB_h_ = SwordHB_h>>1;
    
    
    SwordHB2_w = SwordHB2_W;
    SwordHB2_h = SwordHB2_H;
}




