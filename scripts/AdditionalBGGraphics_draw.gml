/// AdditionalBGGraphics_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!state)         exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if (sprite==g.SPR_ITEM_TROPHY 
&& !val(f.dm_quests[?STR_Ruto+STR_Quest+STR_Complete]) )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


var _i, _x,_y;

     palidx_base  = palidx_def;
if (rm_pal_qual_lit())
{    palidx_base += p.PI_LIT1;  }
else palidx_base += p.PI_DRK1;

if ( palidx_permut)
{    palidx = get_pi(palidx_base, palidx_permut);  }
else palidx =        palidx_base;

pal_swap_set(p.palette_image, palidx);
for(_i=0; _i<Sprite_COUNT; _i++)
{
    draw_sprite_(sprite,0, dg_xy[#_i,0],dg_xy[#_i,1]);
}
pal_swap_reset();




