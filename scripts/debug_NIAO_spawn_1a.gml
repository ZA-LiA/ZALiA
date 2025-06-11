
show_debug_message("");

var _str = "";
// _str += "";

if(!is_undefined(dk_spawn) 
&& !is_undefined(g.dm_rm[?dk_spawn+"_init"]) )
{
    _str += script_get_name(g.dm_rm[?dk_spawn+"_init"]);
    _str += ". ";
}

_str += "NIAO Spawned!  ";
if(!is_undefined(dk_spawn)) _str += "spawn datakey: '"+dk_spawn+"', ";
_str += "ver "    + string(ver)     + ", ";
_str += "x $"     + hex_str(x)      + ", ";
_str += "y $"     + hex_str(y)      + ", ";
_str += "xl $"    + hex_str(xl)     + ", ";
_str += "yt $"    + hex_str(yt)     + ", ";
_str += "drawX $" + hex_str(drawX)  + ", ";
_str += "drawY $" + hex_str(drawY)  + ", ";
_str += "";

var _update_idx = $FF;
for(var _i=ds_list_size(g.dl_niao)-1; _i>=0; _i--)
{
    if(!is_undefined(g.dl_niao[|_i]) 
    &&  g.dl_niao[|_i]==id )
    {
        _update_idx = _i;
        break;//_i
    }
}
_str += "$"+hex_str(_update_idx);



show_debug_message(_str);




