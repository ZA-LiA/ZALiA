/// update_xp()

// D433.  xp uptick/drain


with(f)
{
    var _C1 = xpPending>0;       // XP Pending
    var _C2 = xpDrain>0 && xp>0; // XP Drain
    
    if (_C1) // XP Pending
    {
        var                _AMT = 1;
        if (xpPending>10)  _AMT = 10;
        //if (xpPending>=10) _AMT = 10; // OG
        
        xpPending -= _AMT;
        xp        += _AMT;
    }
    else if (_C2) // XP Drain
    {   // Search 6DD5 in google docs RAM data for info
        var              _AMT = 1;
        if (xpDrain>=10) _AMT = 10;
        
        xpDrain -= _AMT;
        xp      -= _AMT;
    }
    else
    {   // MOD. To prevent pending/leftover xpDrain when f.xp
        // reaches 0 and xpDrain isn't completely used.
        // Making a rule that pending xpDrain is only allowed 
        // if it's waiting for xp uptick to finish.
        xpDrain = 0;
    }
    
    
    if (_C1 
    ||  _C2 )
    {
        xp = clamp(xp, 0,XP_MAX);
        
        if(0)// 2023/11/07.
        {   // This method seems to be more acurate, but 
            // still sounds like the timing isn't perfect.
            // I suspect the issue has to do with GameMaker
            aud_play_sound(get_audio_theme_track(dk_XPTick));
        }
        else
        {
            if(!audio_is_playing(get_audio_theme_track(dk_XPTick))) 
            {   aud_play_sound(  get_audio_theme_track(dk_XPTick));  }
        }
    }
    
    
    
    // D4CE: JSR 968D       - Activate Level-up menu
    // TODO: I doubt this OG code is necessary since update_menus() takes care of it. Test without this code to see if it's necessary.
    if (g.gui_state==g.gui_state_NONE 
    && !g.cutscene  // 2025/03/23. Added to prevent softlock during a cutscene
    &&  xp>=xpNext )
    {
        g.gui_state = g.gui_state_LEVEL_UP;
    }
}








/*
/// update_xp()

// D433
// xp uptick/drain

var _C1 = f.xpPending > 0;              // XP Pending
var _C2 = f.xpDrain   > 0 && f.xp > 0;  // XP Drain

if (_C1)    // XP Pending
{
    var                    _AMT = 10;
    if (f.xpPending <= 10) _AMT = 1; // MOD
    // if (f.xpPending <  10) _AMT = 1; // OG
    
    f.xpPending -= _AMT;
    f.xp        += _AMT;
}
else if (_C2)   // XP Drain
{   // Search 6DD5 in google docs RAM data for info
    f.xpDrain--;
    f.xp--;
}
else
{   // MOD. To prevent pending/leftover xpDrain when f.xp
    // reaches 0 and xpDrain isn't completely used.
    // Making a rule that pending xpDrain is only allowed 
    // if it's waiting for xp uptick to finish.
    f.xpDrain = 0;
}


if (_C1 || _C2)
{
    f.xp = clamp(f.xp, 0,XP_MAX);
    
    if(!audio_is_playing(Audio.SND_XP_TICK)) 
    {    aud_play_sound( Audio.SND_XP_TICK);  }
}
*/


