move_speed = 0.75;

tilemap = layer_tilemap_get_id("Tiles_Col");

hp = 5;
hp_total = 10;
damage = 1;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

function add_xp(_xp_to_add) {
    xp += _xp_to_add
    if(xp >= xp_require) {
        level++;
        xp -= xp_require;
        xp_require *= 1.3333;
        
        hp_total += 2;
        hp = hp_total;
        damage += 0.667;
        
        Dialouge([ {
            name : "Congrats!",
            msg : $"You levelled up! Your new stats are:\nLVL: {level}\n HP: {hp_total}\n Damage: {damage}"
        }])
    }
}


global.char_colors = ds_map_create();
global.char_colors[? "Harrier"] = c_yellow;
global.char_colors[? "Gotti"]   = c_aqua;
global.char_colors[? "Jesse"]   = c_aqua;

mask_index = spr_player_idle_down;

attack_cooldown = 0;
attack_speed = 35; // Frames to wait (35 = approx 0.5 seconds). Lower = Faster.