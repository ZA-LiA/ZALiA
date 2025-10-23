/// PlatformCloud_update()


//PlatformA_update();
x_prev = x;
y_prev = y;


if (hspd) updateX();
if (vspd) updateY();


BodyHB_w  = BODY_W;
BodyHB_h  = 8;
BodyHB_xl = xl + BODY_XOFF;
BodyHB_xr = BodyHB_xl + BodyHB_w;
BodyHB_yt = y - (BodyHB_h>>1);
BodyHB_yb = BodyHB_yt + BodyHB_h;
BodyHB_can_draw = true;
Platform_update_1a();


GO_update_cam_vars();
update_EF11();




