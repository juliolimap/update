

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




//font size
local font_size =18;

//font color(135,206,250)
local R = 0;
local G = 0;
local B = 0;


//alpha
local alpf = 1000;


local list = Shuffle(10, "text", "[Title]");


list.slots[0].set_pos(flx*0.073, fly*0.155, flw*0.330, flh*0.044);
list.slots[0].set_rgb (R,G,B);
list.slots[0].font ="zekton";
list.slots[0].charsize = font_size;
list.slots[0].alpha = alpf;
list.slots[0].align = Align.Left;


list.slots[1].set_pos(flx*0.073, fly*0.215, flw*0.330, flh*0.080);
list.slots[1].set_rgb (R,G,B);
list.slots[1].font ="zekton";
list.slots[1].charsize = font_size;
list.slots[1].alpha = alpf;
list.slots[1].align = Align.Left;


list.slots[2].set_pos(flx*0.073, fly*0.285, flw*0.330, flh*0.080);
list.slots[2].set_rgb (R,G,B);
list.slots[2].font ="zekton";
list.slots[2].charsize = font_size;
list.slots[2].alpha = alpf;
list.slots[2].align = Align.Left;


list.slots[3].set_pos(flx*0.073, fly*0.355, flw*0.330, flh*0.080);
list.slots[3].set_rgb (R,G,B);
list.slots[3].font ="zekton";
list.slots[3].charsize = font_size;
list.slots[3].alpha = alpf;
list.slots[3].align = Align.Left;


list.slots[4].set_pos(flx*0.073, fly*0.425, flw*0.330, flh*0.080);
list.slots[4].set_rgb (R,G,B);
list.slots[4].font ="zekton";
list.slots[4].charsize = font_size;
list.slots[4].alpha = alpf;
list.slots[4].align = Align.Left;


list.slots[5].set_pos(flx*0.073, fly*0.498, flw*0.330, flh*0.080);
list.slots[5].set_rgb (R,G,B);
list.slots[5].font ="zekton";
list.slots[5].charsize = font_size;
list.slots[5].alpha = alpf;
list.slots[5].align = Align.Left;


list.slots[6].set_pos(flx*0.073, fly*0.572, flw*0.330, flh*0.080);
list.slots[6].set_rgb (R,G,B);
list.slots[6].font ="zekton";
list.slots[6].charsize = font_size;
list.slots[6].alpha = alpf;
list.slots[6].align = Align.Left;


list.slots[7].set_pos(flx*0.073, fly*0.643, flw*0.330, flh*0.080);
list.slots[7].set_rgb (R,G,B);
list.slots[7].font ="zekton";
list.slots[7].charsize = font_size;
list.slots[7].alpha = alpf;
list.slots[7].align = Align.Left;


list.slots[8].set_pos(flx*0.073, fly*0.715, flw*0.330, flh*0.080);
list.slots[8].set_rgb (R,G,B);
list.slots[8].font ="zekton";
list.slots[8].charsize = font_size;
list.slots[8].alpha = alpf;
list.slots[8].align = Align.Left;


list.slots[9].set_pos(flx*0.073, fly*0.780, flw*0.330, flh*0.080);
list.slots[9].set_rgb (R,G,B);
list.slots[9].font ="zekton";
list.slots[9].charsize = font_size;
list.slots[9].alpha = alpf;
list.slots[9].align = Align.Left;
