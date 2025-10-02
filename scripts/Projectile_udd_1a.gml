// 975B (Bolo), 97A9 (Boomerang), AE30 (Mace2)


can_draw_self = true;

// This looks the same as Axe except 
// Axe uses a diff sprite for if (g.timer0 & 4) 
// instead of setting yscale to -1
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

if (g.counter1&$4)
{
    yScale = -1;
}


xScale *= facing_dir; // If facing left, xScale need to flip



/*
// 975B (Bolo), 97A9 (Boomerang), AE30 (Mace2)

canDrawSelf = true;

if (g.timer0 & 8)              xScale = -1;
else                           xScale =  1;

if (isVal(g.timer0 & $C, 4,8)) yScale = -1;
else                           yScale =  1;

xScale *= facingDir; // If facing left, xScale need to flip
xScale *= -1; // Because the sprites are backwards in my game

*/




