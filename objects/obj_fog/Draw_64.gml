// 1. Calculate a "breathing" alpha so the fog pulses slightly
var _pulse = sin(time) * 0.05; // Fluctuates between -0.05 and 0.05
var _final_alpha = alpha_base + _pulse;

// 2. Set Blend Mode
// bm_add makes it look like glowing mist. 
// Use bm_normal if you want thick, heavy smoke.
gpu_set_blendmode(bm_normal); 

// 3. Draw Layer 1 (Back layer, drawn larger)
draw_sprite_tiled_ext(
    spr_fog, 0, 
    fog1_x, fog1_y, 
    2.0, 2.0, // Scale it up 2x so it looks like big clouds
    color, _final_alpha
);

// 4. Draw Layer 2 (Front layer, standard size, slightly more transparent)
draw_sprite_tiled_ext(
    spr_fog, 0, 
    fog2_x + 100, fog2_y + 100, // Offset start pos so they don't overlap perfectly
    1.5, 1.5, 
    color, _final_alpha * 0.8
);

// 5. Reset GPU
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);