// 1. PAUSE GAME
if (instance_exists(obj_dialouge)) exit;

// 2. KNOCKBACK OVERRIDE
// If we are currently being knocked back, skip the AI entirely
if (kb_x != 0 || kb_y != 0) {
    // Move backwards
    move_and_collide(kb_x * 2, kb_y * 2, tilemap);
    
    // Note: Your Alarm[1] logic elsewhere handles resetting kb_x/y to 0
    exit; 
}

// 3. STATE MACHINE
switch (state) {

 // --- STATE: IDLE ---
    case "idle":
        image_blend = c_white;
        
        // 1. Check Distance (Are they close enough?)
        var _dist = point_distance(x, y, obj_player.x, obj_player.y);
        
        // 2. Check Vision (Is there a wall in the way?)
        // collision_line checks from Enemy(x,y) to Player(x,y). 
        // If it hits "tilemap", it returns true (blocked).
        var _wall_blocked = collision_line(x, y, obj_player.x, obj_player.y, tilemap, false, true);

        // ONLY chase if close AND no wall blocked
        if (_dist < alert_dist && _wall_blocked == noone) {
            state = "chase";
        }
        break;

    // --- STATE: CHASE (Fixed Collision) ---
    case "chase":
        image_blend = c_white;
        
        // 1. Calculate where we WANT to go
        var _dir = point_direction(x, y, obj_player.x, obj_player.y);
        
        // 2. Calculate the X and Y movement
        var _move_x = lengthdir_x(chase_speed, _dir);
        var _move_y = lengthdir_y(chase_speed, _dir);
        
        // 3. Move SAFELY using move_and_collide
        // This makes them respect the Tilemap walls!
        move_and_collide(_move_x, _move_y, tilemap);
        
        // Check Distances
        var _dist = point_distance(x, y, obj_player.x, obj_player.y);
        if (_dist < aggro_dist) {
            state = "windup";
            state_timer = windup_time;
        }
        if (_dist > alert_dist * 1.5) {
            state = "idle";
        }
        break;

    // --- STATE: WINDUP ---
    case "windup":
        image_blend = c_yellow; 
        lunge_dir = point_direction(x, y, obj_player.x, obj_player.y);
        
        if (obj_player.x > x) facing = 0; else facing = 180;

        state_timer--;
        if (state_timer <= 0) {
            state = "lunge";
            state_timer = lunge_time;
        }
        break;

    // --- STATE: LUNGE (Fixed Collision) ---
    case "lunge":
        image_blend = c_red;
        
        // Calculate FAST movement
        var _lx = lengthdir_x(lunge_speed, lunge_dir);
        var _ly = lengthdir_y(lunge_speed, lunge_dir);
        
        // Use move_and_collide here too so they don't lunge through walls!
        move_and_collide(_lx, _ly, tilemap);

        state_timer--;
        if (state_timer <= 0) {
            state = "cooldown";
            state_timer = cooldown_time;
        }
        break;

    // --- STATE: COOLDOWN ---
    case "cooldown":
        image_blend = c_dkgrey;
        state_timer--;
        if (state_timer <= 0) {
            state = "chase";
        }
        break;
}

