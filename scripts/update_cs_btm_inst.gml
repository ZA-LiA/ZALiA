/// update_cs_btm_inst()


    cs_btm_inst = collide_solid_inst(csBtm1X,csBtm1Y);
if(!cs_btm_inst)
{   cs_btm_inst = collide_solid_inst(csBtm2X,csBtm2Y);  }

if (cs_btm_inst==id)
{   cs_btm_inst = noone;  }


if (cs_btm_inst 
&&  cs_btm_inst.solid_type==TID_ONEWY1 )
{
    if (solid_type==TID_ONEWY1 
    || !csBtm_qual_oneway(id, (csBtm1Y - (cs_btm_inst.yt&$7)) &$7) )
    {
        cs_btm_inst = noone;
    }
}




