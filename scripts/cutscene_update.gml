/// cutscene_update()


if(!cutscene) cutscene_part = 0;
if(!cutscene) cutscene_ctr  = 0;

if (cutscene_timer) cutscene_timer--;


FallScene_update();


with(Cutscene)
{
    if(!is_undefined(  scr_step))
    {   script_execute(scr_step);  }
}




