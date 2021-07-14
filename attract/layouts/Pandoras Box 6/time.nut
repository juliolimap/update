

function Navigation(sig)
{
	local disable = true;
	if (sig=="up")
	{
		 
		
 class UserConfig { </ label="  ", help=" ", order=5 />  rtime=99;}
local my_config = fe.get_config();
local bgtime;
bgtime=abs(("0"+my_config["rtime"]).tointeger());
	 
local  preview_counter =  fe.add_text( "", 92 , 29, 100, 22 );
preview_counter.charsize = 16;
preview_counter.align = Align.Left;
preview_counter.set_rgb( 255, 255, 255 );
preview_counter.alpha = 2000;

preview_counter.font = "tahomabd";


local i=0;
local count = bgtime;
local user_interval = bgtime;
preview_counter.msg = count;
local previous_select = i;
local last_time = 0;
function saver_tick( stime )
{if ( previous_select != i) {
last_time = stime;
count = user_interval;
previous_select = i;

return;}
if ( stime - last_time > 1000) {
count--;
preview_counter.msg = count;
last_time = stime;}
if ( count <= 0 ) {

 
preview_counter.msg = "";
fe.signal( "select" );
return saver_tick()
}
}
 
 
fe.add_ticks_callback( "saver_tick" );
fe.add_transition_callback( "fade_transitions" );
	}
	 	
	
}
fe.add_signal_handler( "Navigation" );






