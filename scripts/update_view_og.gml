/// update_view_og()


with(g)
{
    view_xl_og = clamp(global.pc.x -  VIEW_W_OG_, cam_xl_min(), cam_xr_max()-VIEW_W_OG);
    view_xr_og = view_xl_og + (VIEW_W_OG-1);
//
    view_xc_og = view_xl_og +  VIEW_W_OG_;
//


    view_yt_og = clamp(global.pc.y -  VIEW_H_OG_, cam_yb_min()-VIEW_H_OG, cam_yb_max()-VIEW_H_OG);
    view_yb_og = view_yt_og + (VIEW_H_OG-1);
//
    view_yc_og = view_yt_og +  VIEW_H_OG_;
}// with(g)




