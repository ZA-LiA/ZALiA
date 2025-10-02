

// This is the same thing as Projectile_udd_1a()
// except xscale & yscale get opposite dirs


can_draw_self = true;

if (isVal(g.counter1&$C, 4,8)) xScale = -1;
else                           xScale =  1;

if (g.counter1&$8)             yScale = -1;
else                           yScale =  1;

xScale *= facing_dir; // If facing left, xScale need to flip
xScale *= -1; // Because the sprites are backwards in my game

