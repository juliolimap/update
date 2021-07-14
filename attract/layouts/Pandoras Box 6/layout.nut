

fe.layout.width=800;
fe.layout.height=600;
local flx = fe.layout.width; 
local fly = fe.layout.height; 
local flw = fe.layout.width; 
local flh = fe.layout.height;


local bg = fe.add_image(  "art/systems/mame.png", 0, 0, 800, 600 ); 
fe.do_nut("plus.nut");


local t = fe.add_artwork( "snap", 451, 152, 333, 272 );

local scan = fe.add_image(  "art/gif.mp4", flx*0.563, fly*0.006, flw*0.438, flh*0.239 );


/*
lode modules
*/

 


 
fe.do_nut("gamelist.nut"); 
 
 

  
fe.load_module("animate.nut"); 
// add Free play text    1127, 875, 641, 70 );    
local free = fe.add_text( "[FICHA]",   543, 495, 333, 48 );
free.align = Align.Left
free.set_rgb(0,0,0);
free.font = "tahomabd";
 
	// Pulsatining Aminamtion for the free pulse
			animation.add( PropertyAnimation( free, 
				{   
					property = "alpha",
					tween = Tween.Linear, 
					start =  10,
					end = 255,
					pulse = true,
					time = 1200

				} ) );

				
 // add Free play text    1127, 875, 641, 70 );    
local free = fe.add_text( "[FICHA]",   545, 495, 333, 48 );
free.align = Align.Left
free.set_rgb(255,210,0);
free.font = "tahomabd";
 // Pulsatining Aminamtion for the free pulse
			animation.add( PropertyAnimation( free, 
				{   
					property = "alpha",
					tween = Tween.Linear, 
					start =  10,
					end = 255,
					pulse = true,
					time = 1200

				} ) );
				
				
				
				 
 
 
local clock = fe.add_text( "[CONTADOR]", 230, 38, 640, 8 );
clock.charsize = 14;
clock.set_rgb( 0, 0, 0 );
clock.alpha = 2000;
clock.font="tahomabd";
clock.align = Align.Left;	
 
local clock = fe.add_text( "[CONTADOR]", 230, 38, 640, 8 );
clock.charsize = 14;
clock.set_rgb( 255, 255, 255 );
clock.alpha = 2000;
clock.font="tahomabd";
clock.align = Align.Left;	

 
 
 
 
 
 
 
 
 
  










