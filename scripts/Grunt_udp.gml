/// Grunt_udp()


// 9C43
can_draw_self = true;

behavior = ((g.counter1&$10)>>4) + 3; // 3,4


if (behavior==4) sprite = dl_sprites[|1];
else             sprite = dl_sprites[|0];

if (g.counter1&$8) Legs_sprite = spr_Grunt_legs2;
else               Legs_sprite = spr_Grunt_legs1;



// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// sword draw xoff -----------------------------
if (behavior == 4)
{
    spear_xoff1 =  20;
    spear_xoff2 =  12;
}
else
{
    spear_xoff1 =   8;
    spear_xoff2 = -12;
}

    spear_xoff1 *= facing_dir;
    spear_xoff2 *= facing_dir;
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// -----------------------------------------------




