/// is_exiting_rm()


return  g.room_type=="A" 
    &&  g.exit_leave          // setting this to an Exit instance triggers a rm change
    && !global.pc.pipe_sink_timer; // if pc is not going down a pipe(Darunia chimney to UPTHRUST). Because g.exit_leave is set at the moment global.pc.pipe_sink_timer is set.
//







/*
/// is_exiting_rm()


return  g.room_type == "A" 
    && (g.exit_leave || g.exit_leave==g.Exit_Leave_RESTART_RM) 
    && !global.pc.pipe_sink_tmr;
//



*/




