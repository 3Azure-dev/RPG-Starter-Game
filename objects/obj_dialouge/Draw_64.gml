if (array_length(messages) == 0) exit;
    

var _dx = 0;
var _dy = gui_h * 0.7;
var boxw = gui_w;
var boxh = gui_h - _dy;

draw_sprite_stretched(spr_box, 0, _dx, _dy, boxw, boxh);
_dx += 16;
_dy += 16;

draw_set_font(Font1);

var _name = messages[current_message].name;

var _col = c_white;

if (ds_map_exists(global.char_colors, _name))
{
    _col = global.char_colors[? _name];
}

draw_set_colour(_col);

draw_text(_dx, _dy, _name);
draw_set_color(c_white);
_dy += 40;

draw_text_ext(_dx, _dy, draw_message, -1, boxw - _dx * 2);
