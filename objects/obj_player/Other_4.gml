with (obj_carry_data) {
    other.level = level;
    other.xp = xp;
    other.xp_require = xp_require;
    other.damage = damage;
    other.hp_total = hp_total;
    other.hp = hp_total;
    
    instance_destroy();
}