/// FS_cursor_char_move()


if(!Input.pressedHV) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var                           _diff =  0;
     if (Input.Up_pressed)    _diff = -CharTable_Text_CLMS;
else if (Input.Right_pressed) _diff =  1;
else if (Input.Down_pressed)  _diff =  CharTable_Text_CLMS;
else if (Input.Left_pressed)  _diff = -1;

CharTable_cursor_char += _diff;

var _LENGTH = string_length(CharTable_CHARS);

if (inRange(CharTable_cursor_char, 0,_LENGTH) 
&&  string_char_at(CharTable_CHARS,CharTable_cursor_char+1)==CharTable_CHAR_NULL )
{
    for(var _i=0; _i<5; _i++)
    {
        CharTable_cursor_char += _diff;
        if (string_char_at(CharTable_CHARS,CharTable_cursor_char+1)!=CharTable_CHAR_NULL)
        {   break;  }
    }
}

if (CharTable_cursor_char<0)        CharTable_cursor_char += _LENGTH;
if (CharTable_cursor_char>=_LENGTH) CharTable_cursor_char -= _LENGTH;


aud_play_sound(get_audio_theme_track(dk_CursorRegisterName));




