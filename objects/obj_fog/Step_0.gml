// Move Layer 1
fog1_x += fog1_sx;
fog1_y += fog1_sy;

// Move Layer 2
fog2_x -= fog2_sx; // Move slightly Left for contrast
fog2_y += fog2_sy;

// Increment time for the "breathing" effect
time += 0.02;