/// Ganon2_update_1()


with(global.pc)
{
    if (state!=state_NORMAL) break;
    
    var _X_PREV  = x;
    set_xy(id, min(x, other.xl-(csRgt1X-x)), y);
    x_change    += x-_X_PREV;
    
    GO_update_cs();
    if (hspd_dir)
    {
        if (rectInRect(csRgt1X,csRgt1Y,1,1, other.xl,other.yt,other.ww,other.hh) 
        ||  rectInRect(csRgt2X,csRgt2Y,1,1, other.xl,other.yt,other.ww,other.hh) )
        {
            cs |= CS_RGT;
            if (hspd<$80) hspd=0;
        }
    }
}




