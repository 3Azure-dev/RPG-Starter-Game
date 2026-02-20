draw_shadow(1);

draw_self();

// 2. Draw the Cooldown Bar (Only if waiting)
if (attack_cooldown > 0) {
    var _bar_w = 24; // Width of bar
    var _bar_h = 4;  // Height of bar
    
    // Position bar above player head
    var _xx = x - (_bar_w / 2);
    var _yy = y - sprite_height + 2; 

    // Calculate how full the bar is (0.0 to 1.0)
    var _pct = 1 - (attack_cooldown / attack_speed);

    // Draw Background (Dark Grey)
    draw_set_color(c_dkgrey);
    draw_rectangle(_xx, _yy, _xx + _bar_w, _yy + _bar_h, false);

    // Draw Progress (White) - Like Minecraft 1.9
    draw_set_color(c_white);
    draw_rectangle(_xx, _yy, _xx + (_bar_w * _pct), _yy + _bar_h, false);
    
    // Reset color to prevent bugs elsewhere
    draw_set_color(c_white);
}