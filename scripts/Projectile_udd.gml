/// Projectile_udd()


GO_udp_1(); // drawX=x; drawY=y; xScale=facing_dir;
palidx_base = palidx_def;

if(!is_undefined(  scr_udp))
{   script_execute(scr_udp);  }

update_draw_xy();


if (rm_pal_qual_lit() 
||  GO_pal_qual_lit() )
{
    palidx_base += p.PI_LIT1;
}
else
{
    if(!(g.counter1&$3) 
    && !is_ancestor(object_index, RisingBubble) )
    {
        palidx_base = global.PI_BGR2; // extra visibility in dark rooms
    }
    palidx_base += p.PI_DRK1;
}
//GO_add_pi_set(); // adds p.PI_LIT1 or p.PI_DRK1 to palidx_base

if (isProjSprAdjFrame())
{
    palidx_base = global.PI_PC1; // Lit, even in dark rm
    
    if (1)
    {   // MOD
        if (rm_pal_qual_lit() 
        ||  is_ancestor_(object_index, Fireball1,Fireball2,Flame1,Flame2) )
        {
            xScale = facing_dir;
            yScale = 1;
        }
    }
    else
    {   // OG
        xScale = facing_dir;
        yScale = 1;
    }
}
else
{   // MOD. Make projectile blink if it has been reflected
    if (reflected 
    && !(g.counter1&$2) )
  //&& !(g.counter1&$4) )
    {
        palidx_base = global.PI_PC1; // Lit, even in dark rm
    }
}



palidx = palidx_base;
//if (palidx_permut) palidx = get_pi(palidx_base,palidx_permut);




