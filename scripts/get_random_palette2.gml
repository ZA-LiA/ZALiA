/// get_random_palette2(base hue)


var _base_hue = argument[0];
if (_base_hue<0) _base_hue = irandom($FF);
_base_hue &= $FF;


var _hue, _sat, _lum, _color_hgh, _color_mid, _color_shd, _low, _mid, _high, _min,_max, _val;




// MID-TONE -----------------------------------------------------
_hue  = _base_hue;

if (argument[0]==-2)
{
    _sat  = $00;
}
else
{
    _low  = $30;
    _mid  = $48;
    _high = $60;
    _min  = choose(_low,_low, _mid,_mid,_mid,_mid, _high,_high,_high,_high);
    _max  = $E8;
    _sat  = _min + irandom(_max-_min);
}

_low  = $17;
_mid  = $27;
_high = $37;
//_low  = $17;
//_mid  = $23;
//_high = $2F;
_min  = choose(_low,_low,_low, _mid,_mid,_mid,_mid,_mid,_mid, _high,_high);
_max  = $6F;
_lum  = _min + irandom(_max-_min);

_color_mid = make_colour_hsv(_hue, _sat, _lum);
switch(_color_mid){
case        p.C_WHT0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$04]; break;}
case        p.C_RED0:{_color_mid=global.dl_COLOR01[|($C*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_BLU0:{_color_mid=global.dl_COLOR01[|($3*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_GRN0:{_color_mid=global.dl_COLOR01[|($7*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_YLW0:{_color_mid=global.dl_COLOR01[|($9*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_MGN0:{_color_mid=global.dl_COLOR01[|($0*p.ColorGrid_CLMS)+$01]; break;}
case        p.C_BLK0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_CYN0:{_color_mid=global.dl_COLOR01[|($5*p.ColorGrid_CLMS)+$02]; break;}
case global.C_ALPHA0:{_color_mid=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$05]; break;}
}




// HIGHLIGHT -----------------------------------------------------
_hue  = _base_hue + $100;
_hue += irandom($1F) * choose(1,-1);
_hue  = _hue mod $100;

if (argument[0]==-2)
{
    _sat  = $00;
}
else
{
    _val  = $A0;
    _min  = max($18, colour_get_saturation(_color_mid)-_val);
    _max  = min($F0, colour_get_saturation(_color_mid)+_val);
    _sat  = _min + irandom(_max-_min);
    _sat  = clamp(_sat, $00,$FF);
}

_lum  = colour_get_value(_color_mid);
_lum += $30 + irandom($30);
_lum  = clamp(_lum, $00,$FF);

_color_hgh = make_colour_hsv(_hue, _sat, _lum);
switch(_color_hgh){
case        p.C_WHT0:{_color_hgh=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$09]; break;}
case        p.C_RED0:{_color_hgh=global.dl_COLOR01[|($C*p.ColorGrid_CLMS)+$03]; break;}
case        p.C_BLU0:{_color_hgh=global.dl_COLOR01[|($3*p.ColorGrid_CLMS)+$03]; break;}
case        p.C_GRN0:{_color_hgh=global.dl_COLOR01[|($7*p.ColorGrid_CLMS)+$02]; break;}
case        p.C_YLW0:{_color_hgh=global.dl_COLOR01[|($9*p.ColorGrid_CLMS)+$03]; break;}
case        p.C_MGN0:{_color_hgh=global.dl_COLOR01[|($0*p.ColorGrid_CLMS)+$03]; break;}
case        p.C_BLK0:{_color_hgh=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$07]; break;}
case        p.C_CYN0:{_color_hgh=global.dl_COLOR01[|($5*p.ColorGrid_CLMS)+$03]; break;}
case global.C_ALPHA0:{_color_hgh=global.dl_COLOR01[|($D*p.ColorGrid_CLMS)+$07]; break;}
}




// SHADE -----------------------------------------------------
_hue  = _base_hue + $100;
_hue += irandom($1F) * choose(1,-1);
_hue  = _hue mod $100;

if (argument[0]==-2)
{
    _sat  = $00;
}
else
{
    _val  = $A0;
    _min  = max($18, colour_get_saturation(_color_mid)-_val);
    _max  = min($F0, colour_get_saturation(_color_mid)+_val);
    _sat  = _min + irandom(_max-_min);
}

_lum  = colour_get_value(_color_mid);
_lum  = floor(_lum*0.33);
//_lum -= $30 + irandom($28);
_lum  = clamp(_lum, $00,$FF);

_color_shd = make_colour_hsv(_hue, _sat, _lum);
switch(_color_shd){
case        p.C_WHT0:{_color_shd=p.C_BLK1; break;}
case        p.C_RED0:{_color_shd=p.C_BLK1; break;}
case        p.C_BLU0:{_color_shd=p.C_BLK1; break;}
case        p.C_GRN0:{_color_shd=p.C_BLK1; break;}
case        p.C_YLW0:{_color_shd=p.C_BLK1; break;}
case        p.C_MGN0:{_color_shd=p.C_BLK1; break;}
case        p.C_BLK0:{_color_shd=p.C_BLK1; break;}
case        p.C_CYN0:{_color_shd=p.C_BLK1; break;}
case global.C_ALPHA0:{_color_shd=p.C_BLK1; break;}
}




// ----------------------------------------------------------------------------------------------
return build_pal(_color_hgh,_color_mid,_color_shd,p.C_BLK1, _color_hgh,_color_mid,_color_shd,p.C_BLK1);




