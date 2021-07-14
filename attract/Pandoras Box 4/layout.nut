//
// Attract-Mode Front-End - "Basic" sample layout
//
fe.layout.width=800;
fe.layout.height=600;
fe.add_image( "art/bg.png", 0, 0 );
//local bluebg = fe.add_artwork("bluebg.png",23, 85, 260, 345 );

//local flyer = fe.add_artwork("flyer",23, 85, 260, 345 );
//flyer.alpha = 40;
//flyer.trigger = Transition.EndNavigation;



//t = fe.add_artwork( "marquee", 337, 345, 262, 75 );
//t.trigger = Transition.EndNavigation;


fe.load_module("shuffle");


local flx = fe.layout.width; 
local fly = fe.layout.height; 
local flw = fe.layout.width; 
local flh = fe.layout.height;
class ShufflePow extends Shuffle
 {
	
        function select(slot) 
 {
	slot.visible = true;
	}
	
	function deselect(slot) 
 {
	slot.visible = false;
	}

}


local pow = ShufflePow(10, "image", "art/barra.png");

pow.slots[0].set_pos(flx*0.035, fly*0.135, flw*0.400, flh*0.080);
	
pow.slots[1].set_pos(flx*0.035, fly*0.210, flw*0.400, flh*0.080);
	
pow.slots[2].set_pos(flx*0.035, fly*0.280, flw*0.400, flh*0.080);
	
pow.slots[3].set_pos(flx*0.035, fly*0.350, flw*0.400, flh*0.080);
	
pow.slots[4].set_pos(flx*0.035, fly*0.420, flw*0.400, flh*0.080);
	
pow.slots[5].set_pos(flx*0.035, fly*0.495, flw*0.400, flh*0.080);
	
pow.slots[6].set_pos(flx*0.035, fly*0.568, flw*0.400, flh*0.080);
	
pow.slots[7].set_pos(flx*0.035, fly*0.640, flw*0.400, flh*0.080);

pow.slots[8].set_pos(flx*0.035, fly*0.713, flw*0.400, flh*0.080);

pow.slots[9].set_pos(flx*0.035, fly*0.703, flw*0.380, flh*0.080);;

pow.slots[9].set_pos(flx*0.035, fly*0.778, flw*0.400, flh*0.080);


//font size
local font_size =18;

//font color(135,206,250)
local R = 135;
local G = 206;
local B = 250;


//alpha
local alpf = 500;

fe.do_nut("gamelist.nut");
fe.do_nut("gamelist2.nut");
fe.do_nut("numero1.nut");
fe.do_nut("numero2.nut");



local list = Shuffle(10, "text", "[Title]");


list.slots[0].set_pos(flx*0.075, fly*0.155, flw*0.330, flh*0.044);
list.slots[0].set_rgb (R,G,B);
list.slots[0].font ="zekton";
list.slots[0].charsize = font_size;
list.slots[0].alpha = alpf;
list.slots[0].align = Align.Left;


list.slots[1].set_pos(flx*0.075, fly*0.215, flw*0.330, flh*0.080);
list.slots[1].set_rgb (R,G,B);
list.slots[1].font ="zekton";
list.slots[1].charsize = font_size;
list.slots[1].alpha = alpf;
list.slots[1].align = Align.Left;


list.slots[2].set_pos(flx*0.075, fly*0.285, flw*0.330, flh*0.080);
list.slots[2].set_rgb (R,G,B);
list.slots[2].font ="zekton";
list.slots[2].charsize = font_size;
list.slots[2].alpha = alpf;
list.slots[2].align = Align.Left;


list.slots[3].set_pos(flx*0.075, fly*0.355, flw*0.330, flh*0.080);
list.slots[3].set_rgb (R,G,B);
list.slots[3].font ="zekton";
list.slots[3].charsize = font_size;
list.slots[3].alpha = alpf;
list.slots[3].align = Align.Left;


list.slots[4].set_pos(flx*0.075, fly*0.425, flw*0.330, flh*0.080);
list.slots[4].set_rgb (R,G,B);
list.slots[4].font ="zekton";
list.slots[4].charsize = font_size;
list.slots[4].alpha = alpf;
list.slots[4].align = Align.Left;


list.slots[5].set_pos(flx*0.075, fly*0.498, flw*0.330, flh*0.080);
list.slots[5].set_rgb (R,G,B);
list.slots[5].font ="zekton";
list.slots[5].charsize = font_size;
list.slots[5].alpha = alpf;
list.slots[5].align = Align.Left;


list.slots[6].set_pos(flx*0.075, fly*0.572, flw*0.330, flh*0.080);
list.slots[6].set_rgb (R,G,B);
list.slots[6].font ="zekton";
list.slots[6].charsize = font_size;
list.slots[6].alpha = alpf;
list.slots[6].align = Align.Left;


list.slots[7].set_pos(flx*0.075, fly*0.643, flw*0.330, flh*0.080);
list.slots[7].set_rgb (R,G,B);
list.slots[7].font ="zekton";
list.slots[7].charsize = font_size;
list.slots[7].alpha = alpf;
list.slots[7].align = Align.Left;


list.slots[8].set_pos(flx*0.075, fly*0.715, flw*0.330, flh*0.080);
list.slots[8].set_rgb (R,G,B);
list.slots[8].font ="zekton";
list.slots[8].charsize = font_size;
list.slots[8].alpha = alpf;
list.slots[8].align = Align.Left;


list.slots[9].set_pos(flx*0.075, fly*0.780, flw*0.330, flh*0.080);
list.slots[9].set_rgb (R,G,B);
list.slots[9].font ="zekton";
list.slots[9].charsize = font_size;
list.slots[9].alpha = alpf;
list.slots[9].align = Align.Left;







// Game name text. We do this in the layout as the frontend doesn't chop up titles with a forward slash
 function gamename( index_offset ) {
  local s = split( fe.game_info( Info.Title, index_offset ), "(/[" );
 	if ( s.len() > 0 ) return s[0];
  return "";
}



//fe.add_image("box.png", 23, 238, 258, 36 );


// add Free play text
local free = fe.add_text( "[FICHA]", 293, 470, 641, 38);
free.set_rgb(0,0,0);
free.font = "zekton";
free.align = Align.Centre

local free = fe.add_text( "[FICHA]", 290, 470, 641, 38);
free.set_rgb(255,210,0)
free.font = "zekton";
free.align = Align.Centre




local t = fe.add_artwork( "snap", 404, 115, 355, 276 );



local clockb = fe.add_text( "", 391, 19, 320, 21  );
clockb.align = Align.Left;
clockb.set_rgb( 0, 0, 0 );

local clock = fe.add_text( "", 390, 18, 320, 21  );
clock.align = Align.Left;
clock.set_rgb( 73, 223, 222 );

 


 

local list = fe.add_text( "[ListEntry]/[ListSize]", 174, 42, 320, 26 );
list.set_rgb(0,0,0)
list.font = "zekton";
list.align = Align.Left;



local list = fe.add_text( "[ListEntry]/[ListSize]", 179, 42, 320, 26 );
list.set_rgb(0,0,0)
//list.alpha = 80;
list.font = "zekton";
list.align = Align.Left;

local list = fe.add_text( "[ListEntry]/[ListSize]", 178, 42, 320, 26 );
list.set_rgb(255,210,0)
list.font = "zekton";
list.align = Align.Left;




local clock = fe.add_text( "", 185, 521, 640, 58 );
clock.charsize = 22;
clock.set_rgb( 255, 255, 255 );
//clock.alpha = 500;
clock.font="zekton";
clock.align = Align.Left;



 
 
local clock = fe.add_text( "[CONTADOR]", 563, 542, 640, 8 );
clock.charsize = 15;
clock.set_rgb( 0, 0, 0 );
clock.alpha = 1500;
clock.font="zekton";
clock.align = Align.Left;	

local clock = fe.add_text( "[CONTADOR]", 566, 542, 640, 8 );
clock.charsize = 15;
clock.set_rgb( 230, 230, 0 );
clock.alpha = 1500;
clock.font="zekton";
clock.align = Align.Left;	



 

function fade_transitions( ttype, var, ttime ) {
 switch ( ttype ) {
  case Transition.ToNewSelection:
  case Transition.ToNewList:
	local Wheelclick = fe.add_sound("art/click.wav")
	      Wheelclick.playing=true
  break;
  }
 return false;
}

fe.add_transition_callback( "fade_transitions" );
 

 
