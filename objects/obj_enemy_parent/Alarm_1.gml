image_blend = c_white;

if(hp <= 0) {
    instance_destroy();
    
    obj_player.add_xp(xp_val);
}

// ALARM 1 (The "Stop Button")

// 1. Reset Color back to normal
image_blend = c_white;

// 2. STOP KNOCKBACK (This fixes the infinite walking)
kb_x = 0;
kb_y = 0;