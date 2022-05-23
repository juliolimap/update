




 
 
local orderx = 0;
local divider = "----" 
local preliner = "  ● "
local prelinerh = "● "
local postliner = "                                                                                                  "





class UserConfig {
	
 
 	 
	</ label=preliner + "Roleta / Listbox"+ postliner, help=" ", options="wheel,list_box",  per_display	= true, order=orderx++ /> enable_listbox="wheel";
	</ label=preliner + "Art Roleta"+ postliner, help="", options="marquee, wheel", per_display	= true, order=orderx++  /> orbit_art="wheel";
	</ label=preliner + "Efeito Lumisoso Marquee"+ postliner, help="", options="Yes,No",per_display	= true, order=orderx++ /> enable_Lmarquee="No";
        </ label=preliner + "Contador Geral/Games"+ postliner, help="", options="Cofre,Games",per_display	= true, order=orderx++ /> enable_geral="Games";
	</ label=preliner +"Background Art"+ postliner, help="", options="Imagem Arcade,Video Arcade,Video Smooke",per_display	= true, order=orderx++ /> enable_image="Imagem Arcade";   
	</ label=preliner +"Transparencia List-box"+ postliner, help=" ", options="500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000",per_display= true,order=orderx++ />ini_anim_trans_ms="1000";
		
	 	
	 
}  


local my_config = fe.get_config();

fe.do_nut( fe.script_dir + "nuts/shuffle.nut");
fe.do_nut( fe.script_dir + "nuts/scrollingtext.nut");
fe.load_module( "animate" );
 





local ini_anim_time;
try { ini_anim_time =  my_config["ini_anim_trans_ms"].tointeger(); } catch ( e ) { }

// Letters ini
local rtime = 0;
local glob_time = 0;
local glob_delay;
try { glob_delay =  my_config["set_ms_delay"].tointeger(); } catch ( e ) { }
if( glob_delay > 750 )
	glob_delay = 750;


local settings = {
   "default": { 
   //16x9 is default
      aspectDepend = { 
        res_x = 2133,
        res_y = 1200,
        maskFactor = 1.9}
   },
   "16x10": {
      aspectDepend = { 
        res_x = 1920,
        res_y = 1200,
        maskFactor = 1.9}
   },
    "16x9": {
      aspectDepend = { 
        res_x = 1920,
        res_y = 1080,
        maskFactor = 1.9}
   },
   "4x3": {
      aspectDepend = { 
        res_x = 1600,
        res_y = 1200,
        maskFactor = 1.6}
   }
   "5x4": {
      aspectDepend = { 
        res_x = 1500,
        res_y = 1200,
        maskFactor = 1.6}
   }
}

local aspect = fe.layout.width / fe.layout.height.tofloat();
local aspect_name = "";
switch( aspect.tostring() )
{
    case "1.77865":  //for 1366x768 screen
    case "1.77778":  //for any other 16x9 resolution
        aspect_name = "16x9";
        break;
    case "1.6":
        aspect_name = "16x10";
        break;
    case "1.33333":
        aspect_name = "4x3";
        break;
    case "1.25":
        aspect_name = "5x4";
        break;
    case "0.75":
        aspect_name = "3x4";
        break;
}


function Setting( id, name )
{
    if( aspect_name in settings && id in settings[aspect_name] && name in settings[aspect_name][id] )
  {
    //::print("\tusing settings[" + aspect_name + "][" + id + "][" + name + "] : " + settings[aspect_name][id][name] + "\n" );
    return settings[aspect_name][id][name];
  } else if( aspect_name in settings == false )
  {
   // ::print("\tsettings[" + aspect_name + "] does not exist\n");
  } else if( name in settings[aspect_name][id] == false )
  {
   // ::print("\tsettings[" + aspect_name + "][" + id + "][" + name + "] does not exist\n");
  }
  //::print("\t\tusing default value: " + settings["default"][id][name] + "\n" );
  return settings["default"][id][name];
}

fe.layout.width = Setting("aspectDepend", "res_x");
fe.layout.height = Setting("aspectDepend", "res_y");

local flx = fe.layout.width;
local fly = fe.layout.height;
local flw = fe.layout.width;
local flh = fe.layout.height;

local mask_factor = Setting("aspectDepend", "maskFactor");

 














//font size
local font_size =20;
local alpha0 = 0;
local alpha = 255;


 local set_sel_rgb= (255,243, 20); 
//font color
local R = 230;
local G = 230;
local B = 230;
local space = 20; 

 
local alpf =  2000;






 
fe.load_module("shuffle");	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
local ini_anim_time;
try { ini_anim_time =  my_config["ini_anim_trans_ms"].tointeger(); } catch ( e ) { }
	 
 
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 if( my_config["enable_image"] == "Imagem Arcade" ) {
	local bg = fe.add_image( fe.script_dir+"video/static.png", 0, 0, flw, flh );
}
 
 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
if( my_config["enable_image"] == "Video Arcade" ){
local bg = fe.add_image( fe.script_dir+"video/bkg_anim.flv", 0, 0, flw, flh );
}
if( my_config["enable_image"] == "Video Smooke" ){
	local bg = fe.add_image( fe.script_dir+"video/smooke.flv", 0, 0, flw, flh );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
local black = fe.add_image( "imagem/black.png", flx*0.0895, fly*0.04, flw*0.400, flh*0.13 );  
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

local snap = fe.add_artwork("snap", flx*0.090, fly*0.270, flw*0.398, flh*0.43 );
 
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
local video = fe.add_artwork( "video", flx*0.090, fly*0.270, flw*0.398, flh*0.43 );
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
local marquee = fe.add_artwork("marquee", flx*0.0895, fly*0.04, flw*0.400, flh*0.13 ); 
	marquee.skew_y = 0;
	marquee.skew_x = 0;
	marquee.pinch_y = 0;
	marquee.pinch_x = 4;
	marquee.rotation = 0;
   	marquee.preserve_aspect_ratio = false;

		if ( my_config["enable_Lmarquee"] == "Yes" )
		{
			local shader = fe.add_shader( Shader.Fragment "bloom_shader.frag" );
			shader.set_texture_param("bgl_RenderedTexture"); 
			marquee.shader = shader;
		}
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

local bgArt = fe.add_image("imagem/cabinets.png", 0, 0, flw*0.600, flh  );

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 


 

//animacpoes das imagens gabinete


 local move_bgArt = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.30, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation(snap, move_bgArt ) );

 local move_bgArt2 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.30, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation(video, move_bgArt2 ) );

 local move_bgArt3 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.04, tween = "cubic", time = 1500
}
 
 animation.add( PropertyAnimation( marquee , move_bgArt3 ) ); 


  
local move_bgArt4 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.04, tween = "cubic", time = 1500
}
 animation.add( PropertyAnimation(  black , move_bgArt4 ) );  
 
  

 local move_bgArt1 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = flx*0.0, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation( bgArt, move_bgArt1 ) );


  
 //animacpoes das imagens do gabinete

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////  roleta   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ( my_config["enable_listbox"] == "wheel" )
{
fe.load_module( "conveyor" );



//////////////////////////////////////////   texto ficha

local free = fe.add_text( "[FICHA]", flx*0.17, fly*0.56, flw*0.25, flh*0.40);
free.set_rgb(0,0,0);
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
local free1 = fe.add_text( "[FICHA]", flx*0.17, fly*0.56, flw*0.25, flh*0.40);
free1.set_rgb(255,210,0)
free1.font = "fonte/tahomabd.ttf";
free1.align = Align.Centre
free1.charsize = 35;


/////////////////////////////////////////////////////////////// animaçao texto de ficha
  
  
  //texto amarelo free
local move_bgArt1 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.56, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation( free, move_bgArt1 ) );

 //texto preto free1
local move_bgArt1 = { 
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.56, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation( free1, move_bgArt1 ) );

/////////////////////////////////////////////////////////////// fim animaçao texto de ficha








local wheel_x = [ flx*0.80, flx*0.795, flx*0.756, flx*0.725, flx*0.70, flx*0.68, flx*0.64, flx*0.68, flx*0.70, flx*0.725, flx*0.756, flx*0.76, ]; 
local wheel_y = [ -fly*0.22, -fly*0.105, fly*0.0, fly*0.105, fly*0.215, fly*0.325, fly*0.436, fly*0.61, fly*0.72 fly*0.83, fly*0.935, fly*0.99, ];
local wheel_w = [ flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.24, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, ];
local wheel_a = [  80,  80,  80,  80,  80,  80, 255,  80,  80,  80,  80,  80, ];
local wheel_h = [  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, flh*0.17,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, ];
local wheel_r = [  30,  25,  20,  15,  10,   5,   0, -10, -15, -20, -25, -30, ];
local num_arts = 8;

class WheelEntry extends ConveyorSlot
{
	constructor()
	{
		base.constructor( ::fe.add_artwork( my_config["orbit_art"] ) );
	}

	function on_progress( progress, var )
	{
		local p = progress / 0.1;
		local slot = p.tointeger();
		p -= slot;
		
		slot++;

		if ( slot < 0 ) slot=0;
		if ( slot >=10 ) slot=10;

		m_obj.x = wheel_x[slot] + p * ( wheel_x[slot+1] - wheel_x[slot] );
		m_obj.y = wheel_y[slot] + p * ( wheel_y[slot+1] - wheel_y[slot] );
		m_obj.width = wheel_w[slot] + p * ( wheel_w[slot+1] - wheel_w[slot] );
		m_obj.height = wheel_h[slot] + p * ( wheel_h[slot+1] - wheel_h[slot] );
		m_obj.rotation = wheel_r[slot] + p * ( wheel_r[slot+1] - wheel_r[slot] );
		m_obj.alpha = wheel_a[slot] + p * ( wheel_a[slot+1] - wheel_a[slot] );
	}
};

local wheel_entries = [];
for ( local i=0; i<num_arts/2; i++ )
	wheel_entries.push( WheelEntry() );

local remaining = num_arts - wheel_entries.len();

// we do it this way so that the last wheelentry created is the middle one showing the current
// selection (putting it at the top of the draw order)
for ( local i=0; i<remaining; i++ )
wheel_entries.insert( num_arts/2, WheelEntry() );

local conveyor = Conveyor();
conveyor.set_slots( wheel_entries );
conveyor.transition_ms = 50;
try { conveyor.transition_ms = my_config["transition_ms"].tointeger(); } catch ( e ) { }
}





//fim da roleta


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//                                               começo list box


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





 if ( my_config["enable_listbox"] == "list_box" )
{

local sombra = fe.add_image( fe.script_dir+"imagem/sombra.png", flx/1.8, fly*0.035,flw*0.435, flh/1.3 );
sombra.alpha = ini_anim_time;
 

local free = fe.add_text( "[FICHA]", flx*0.73, fly*0.573, flw*0.25, flh*0.40);
free.set_rgb(0,0,0);
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
local free = fe.add_text( "[FICHA]", flx*0.73, fly*0.573, flw*0.25, flh*0.40);
free.set_rgb(255,210,0)
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
  
 
if ( my_config["enable_geral"] == "Cofre" )
{
 
 
local free = fe.add_text( "[CONTADOR]", flx*0.563, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(0,0,0);
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
local free = fe.add_text( "[CONTADOR]", flx*0.56, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(255,210,0)
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
 
}else{
       
 
local free = fe.add_text( "Games : [ListSize]", flx*0.563, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(0,0,0);
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
local free = fe.add_text( "Games : [ListSize]", flx*0.56, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(255,210,0)
free.font = "fonte/tahomabd.ttf";
free.align = Align.Centre
free.charsize = 36;
	 
	}




  






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






 //////////////////////////////////////////////////////////////////////////////////////////list box
//////////////////////////scrollingtext///////////////////////////
fe.do_nut( fe.script_dir + "nuts/scrollingtext.nut");
ScrollingText.debug = false;

  

    local scroller1 = ScrollingText.add( "[Title]", 0, 0, flw*0.40, flh*0.140, ScrollType.HORIZONTAL_BOUNCE );
    scroller1.set_bg_rgb(200, 0, 200);
    scroller1.set_rgb( 255, 255, 0 );
    scroller1.text.charsize = 35;
    scroller1.text.font = "fonte/tahomabd.ttf"; 
	
	



 


//////////////////////////scrollingtext fim ///////////////////////////
	
	
	
	
local divisor = flx/1.7
  
  fe.do_nut( fe.script_dir + "nuts/shuffle.nut");
local list = [];
  	
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.028, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.080, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.132, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.188, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.240, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.293, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.340, flw*0.40, flh*0.140)); // 7
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57  fly*0.400, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.454, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.506, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.560, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.615, flw*0.40, flh*0.140));
class ShuffleList extends Shuffle
{
function _refreshSelected(slot) 
{
slot.set_rgb (255, 255, 0);
slot.font="fonte/tahomabd.ttf";		
slot.charsize = 35;
slot.align = Align.Left;	
scroller1.set_pos(-100, -1000, 0, 0);
 


  
  
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// aqui começa a lambança          ///////////////////////// 
 
  
for( local i=0; i<12; i++ )                                                //conta de 0 a 12
 

if (list[i]  == slot) {                                                    //se o slot selecionado for igual a algum slot  
   
 if (i == 0){scroller1.set_pos(flx*0.57, fly*0.028, flw*0.40, flh*0.140);}  //se o numero (i) for igual ao slot zero muda a posiçao do scrollingtext 
 if (i == 1){scroller1.set_pos(flx*0.57, fly*0.080, flw*0.40, flh*0.140);}  //                          ||
 if (i == 2){scroller1.set_pos(flx*0.57, fly*0.132, flw*0.40, flh*0.140);}  //                          ||         
 if (i == 3){scroller1.set_pos(flx*0.57, fly*0.188, flw*0.40, flh*0.140);}  //                          ||
 if (i == 4){scroller1.set_pos(flx*0.57, fly*0.240, flw*0.40, flh*0.140);}  //                          ||
 if (i == 5){scroller1.set_pos(flx*0.57, fly*0.293, flw*0.40, flh*0.140);}  //                          ||
 if (i == 6){scroller1.set_pos(flx*0.57, fly*0.340, flw*0.40, flh*0.140);}  //                          ||
 if (i == 7){scroller1.set_pos(flx*0.57, fly*0.400, flw*0.40, flh*0.140);}  //                          ||
 if (i == 8){scroller1.set_pos(flx*0.57, fly*0.454, flw*0.40, flh*0.140);}  //                          ||
 if (i == 9){scroller1.set_pos(flx*0.57, fly*0.506, flw*0.40, flh*0.140);}  //                          ||
 if (i == 10){scroller1.set_pos(flx*0.57, fly*0.560, flw*0.40, flh*0.140);} //                          ||
 if (i == 11){scroller1.set_pos(flx*0.57, fly*0.615, flw*0.40, flh*0.140);} //                          ||
  
list[i].visible=false;   
  
 
 

                                                   
}                                                                         
  else{
list[i].visible=true;  
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// aqui termina a lambança          ////////////////////////   

 
 
 

	
}




function _refreshDeselected(slot) 
{	
slot.set_rgb (192,192,192);
slot.font="fonte/tahomabd.ttf";		
slot.charsize = 35;
 slot.align = Align.Left;	  
}
}
local list = ShuffleList({slots=list, reset=true});


//--------------------------------------------------------------------------------------------
//----------------------------- Slot Gif -----------------------------------------------------
//--------------------------------------------------------------------------------------------

local img_gif = "gif/select.gif";

local pow = [];
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.070, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.122, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.175, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.230, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.282, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.335, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.383, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.443, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.497, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.550, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.603, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.658, flw*0.41, flh*0.057));

	
class ShufflePow extends Shuffle
{
function _refreshSelected(slot)
{
slot.visible = true;
}
function _refreshDeselected(slot)
{
slot.visible = false;
}
}
local pow = ShufflePow({slots=pow, reset=false});

}



 





