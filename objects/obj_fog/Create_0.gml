depth = -10000;

// Layer 1 settings (Background, slow and big)
fog1_x = 0;
fog1_y = 0;
fog1_sx = 0.15; // Speed X
fog1_sy = 0.10; // Speed Y

// Layer 2 settings (Foreground, faster and smaller)
fog2_x = 0;
fog2_y = 0;
fog2_sx = 0.25;
fog2_sy = 0.15;

// Visuals
color = make_color_rgb(180, 190, 200); // A slight blue-grey looks better than mud grey
alpha_base = 0.35;
time = 0; // For the breathing effect