// 1. INVINCIBILITY CHECK
if (alarm[1] < 0) {
    
    // --- DAMAGE & TIMERS ---
    hp -= other.damage;
    alarm[1] = 20; // Invincibility time
    
    // --- INTERRUPT AI ---
    // This is crucial! Even a small hit stops their Lunge instantly.
    state = "chase"; 
    state_timer = 0;

    // --- CALCULATE KNOCKBACK DIRECTION ---
    var _dir_x = sign(x - other.x);
    var _dir_y = sign(y - other.y);

    // --- POISE LOGIC ---
    current_poise -= 1;

    if (current_poise <= 0) {
        // === POISE BROKEN (Big Hit) ===
        image_blend = c_red;
        
        // Full Knockback Power (100%)
        kb_x = _dir_x * 1; 
        kb_y = _dir_y * 1;
        
        current_poise = max_poise; // Reset
    } 
    else {
        // === POISE HELD (Minor Flinch) ===
        image_blend = c_orange;
        
        // Minor Knockback Power (40%)
        // This pushes them back just a tiny bit so they don't stand INSIDE you
        kb_x = _dir_x * 0.4; 
        kb_y = _dir_y * 0.4;
    }

    // --- DEATH CHECK ---
    if (hp <= 0) {
        obj_player.add_xp(xp_val);
        instance_destroy();
    }
}