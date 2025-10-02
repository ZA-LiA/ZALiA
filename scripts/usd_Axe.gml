
can_draw_self = true;


// spr_Axe1, spr_Axe2
sprite = dl_sprites[|  g.counter1&$4 && !is_undefined(dl_sprites[|1])  ];

// if (g.timer0 & 4) sprite = dl_sprites[|!is_undefined(dl_sprites[|1])]; // spr_Axe2
// else              sprite = dl_sprites[|0];                        // spr_Axe1

if (g.counter1&$8)
{
    xScale =  1;
    yScale =  1;
}
else
{
    xScale = -1;
    yScale = -1;
}

xScale *= facing_dir; // If facing left, xScale need to flip

