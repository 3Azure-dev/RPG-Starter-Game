event_inherited(); 

tilemap = layer_tilemap_get_id("Tiles_Col");

// --- KNOCKBACK VARS ---
kb_x = 0;
kb_y = 0;
max_poise = 3;             // Keep this here if poise is specific to this enemy
current_poise = max_poise;

// --- AI VARIABLES ONLY ---
state = "idle";    
state_timer = 0;   
lunge_dir = 0;   

// --- TIMERS ---
// You must have these for the AI to work!
windup_time = 30;       // 0.5 seconds
lunge_time = 15;        // 0.25 seconds
cooldown_time = 45;     // 0.75 seconds
