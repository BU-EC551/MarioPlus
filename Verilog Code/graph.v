`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:32 04/08/2015 
// Design Name: 
// Module Name:    graph 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module graph(
	input wire clk,
	input wire [1:0]  btn1, btn2,
	input wire effect,
	//input wire [5:0] hero,
	//input wire [5:0] scene,
	input wire [10:0] x, y,
	output wire [11:0] rgb,
	output wire [4:0] led,
	output wire [1:0] hero,
	output wire up
    );
	 
	 //reg [5:0] hero;
	 reg dieup;
	 reg [4:0] face_count[0:1], falcond;
	 reg [13:0] pos_falcondie;
	 reg hero_die;
	 reg [4:0] mariodie;
	 reg [5:0] scene; // scenes
	 reg [18:0] pos_bg; // background vga index
	 reg [15:0] pos_ds; // death star
	 reg [14:0] pos_g, pos_title; // godzila vga index
	 reg [12:0] pos_f; // falcon index
	 reg [11:0] pos_face; // face position
	 reg [1:0] face;
	 wire [11:0] rgb_mario, rgb_mario2, rgb_vader, rgb_vader2, rgb_cuba, rgb_cuba2, rgb_sonic, rgb_sonic2; // face rgb
	 reg [11:0] pos_ft, dift_x, dift_y, pos_fi, pos_crash, pos_bomb, fire_x, fire_y, pos_star; // falcontail && fighter index
	 reg [10:0] dif_x, dif_y, M_x, M_y; // character coordinate
	 reg [10:0] difg_x, difg_y, G_x, G_y; // enemy coordinate
	 reg [10:0] F_x, F_y; // falcon coordinate
	 reg [10:0] lightx, lighty, pos_light, pos_piece; // force lighting position / block piece position
	 reg [10:0] ballx, bally, B_x, B_y; // Fire ball from Mario
	 reg [7:0] pos_ball, pos_hit, pos_fireball; // fire ball parameters
	 reg [10:0] difgr_x, difgr_y; // ground coordinate
	 reg [9:0] pos_gr, pos_dsball, pos_block, pos_solid, pos_question, pos_helmet; // ground && force ball from death star
	 reg [11:0] rgb_now, pos; // container of current rgb && character rgb index
	 wire [11:0] rgb_bg, rgbd_l, rgbd_r, rgbm_l, rgbm_r, rgbs_l, rgbs_r, rgbk_l, rgbk_r, rgb_title, rgb_star; // character vga l/r
	 wire [11:0] rgb_f, rgb_ft, rgb_fi, rgb_ds, rgb_crash, rgb_bomb, rgb_hit, rgb_dsball, rgb_fireball, rgb_falcondie; // falcon + fighter
	 wire [11:0] rgbg_l, rgbg_r; // enemy vga l/r
	 wire [11:0] rgb_light, rgb_ball; // attack effect
	 wire [11:0] rgb_ground, rgb_grass1, rgb_grass2, rgb_cloud1, rgb_cloud2, rgb_cloud3, rgb_mount, rgb_block, rgb_piece, rgb_solid, rgb_question, rgb_empty, rgb_helmet; // terrain
	 reg [10:0] pos_grass1;
	 reg [11:0] pos_cloud1, pos_cloud2, pos_grass2;
	 reg [12:0] pos_cloud3, pos_mount;
	 reg [8:0] walk_count, enemy_count, effect_count, ball_count; // buff
	 reg [1:0] up_down;
	 reg leftright, elr; // direction
	 reg [10:0] j_ul, max_height; // jump height
	 reg g_die, attack, balldir; // flag values
	 reg [10:0] fi[0:7][0:1]; // fighter x, y coordinate
	 reg fi_s [0:7]; // fighter state
	 reg [10:0] fi_b[0:7][0:1]; // bullet from fighters
	 reg [2:0] fireV[0:7][0:7]; // bullet speed
	 reg firedir[0:7]; // bullet x direction
	 reg [8:0] bomb_count[0:7]; // bomb effect
	 reg [8:0] block_count[0:4];
	 reg bomb[0:7]; // fighter explosing
	 reg [3:0] k; // loop iteration
	 reg [4:0] boss_count; // # of fighter down
	 reg [9:0] boss_hp; // death star hp
	 reg [2:0] falcon_hp; // falcon hp
	 reg [10:0] dsball_x, dsball_y, dballx, dbally; // force ball position
	 reg [2:0] dsball_v[0:1]; // force ball h/v velocity
	 reg dsballdir[0:1]; // force ball h/v direction
	 reg [10:0] block_pos [0:4][0:2]; // breakable blocks 0 state 1 x 2 y
	 reg [10:0] solid_pos [0:7][0:1]; // solid blocks 0 x 1 y
	 reg [10:0] question_pos [0:2]; // question blocks 0 state 1 x 2 y
	 reg helmet_flag;
	 
	 localparam L_BOUND = 11'd16;
    localparam R_BOUND = 11'd624;
    localparam U_BOUND = 11'd1;
    localparam D_BOUND = 11'd440;

    // velocities
    localparam M_V  = 10'd2;
	 
	 // jump speed
	 localparam J_V  = 10'd2;
	 
	 initial begin 
		//hero = 6'b001000;
		dieup = 0;
		mariodie = 0;
		face_count[0] = 0;
		face_count[1] = 0;
		hero_die = 0;
		face = 0;
		scene = 6'b000000;
		//stage = 1; // Mario World
		// breakable blocks
		block_pos[0][0] = 0;
		block_pos[0][1] = 240;
		block_pos[0][2] = 320;
		block_count[0] = 0;
		block_pos[1][0] = 0;
		block_pos[1][1] = 304;
		block_pos[1][2] = 320;
		block_count[1] = 0;
		block_pos[2][0] = 0;
		block_pos[2][1] = 368;
		block_pos[2][2] = 320;
		block_count[2] = 0;
		block_pos[3][0] = 0;
		block_pos[3][1] = 304;
		block_pos[3][2] = 192;
		block_count[3] = 0;
		block_pos[4][0] = 0;
		block_pos[4][1] = 368;
		block_pos[4][2] = 192;
		block_count[4] = 0;
		// solid blocks
		solid_pos[0][0] = 208;
		solid_pos[0][1] = 320;
		solid_pos[1][0] = 272;
		solid_pos[1][1] = 320;
		solid_pos[2][0] = 336;
		solid_pos[2][1] = 320;
		solid_pos[3][0] = 400;
		solid_pos[3][1] = 320;
		solid_pos[4][0] = 336;
		solid_pos[4][1] = 192;
		solid_pos[5][0] = 400;
		solid_pos[5][1] = 192;
		solid_pos[6][0] = 272;
		solid_pos[6][1] = 96;
		solid_pos[7][0] = 336;
		solid_pos[7][1] = 96;
		//question block
		question_pos[0] = 0;
		question_pos[1] = 304;
		question_pos[2] = 96;
		helmet_flag = 0;
		attack = 0;
		g_die = 0;
		pos = 0;
		rgb_now = 12'b111100000000;
		pos_bg = 0;
		B_x = 11'd0;
		B_y = 11'd0;
	  	M_x = 11'd100;
      M_y = 11'd384;
		G_x = 11'd400;
		G_y = 11'd352;
		j_ul = 0;
		up_down = 0;
		max_height = 150;
		walk_count = 0;
		enemy_count = 0;
		effect_count = 0;
		ball_count = 0;
		leftright = 1;	
		balldir = 1;
		elr = 1;
		// Space
		falcond = 1;
		boss_count = 0;
		F_x = 320;
		F_y = 400;
		fire_x = 0;
		fire_y = 0;
		fi[3][0] = 11'd40;
		fi[0][0] = 11'd120;
		fi[5][0] = 11'd200;
		fi[2][0] = 11'd280;
		fi[6][0] = 11'd360;
		fi[1][0] = 11'd440;
		fi[7][0] = 11'd520;
		fi[4][0] = 11'd600;
		for (k = 0; k < 8; k = k + 1) begin
			fi[k][1] = 0;
			fi_s[k] = 1;
			bomb_count[k] = 0;
			bomb[k] = 0;
			fi_b[k][0] = 0;
			fi_b[k][1] = 0;
			fireV[k][0] = 0;
			fireV[k][1] = 0;
			firedir[k] = 0;
		end
		fi_s[0] = 0;
		boss_hp = 1;
		falcon_hp = 1;
		dsball_x = 0;
		dsball_y = 0;
		dsball_v[0] = 0;
		dsballdir[0] = 0;
		dsball_v[1] = 0;
		dsballdir[1] = 0;

	 end
	 
	 wire clk_frame = (x == 0 && y == 0); //each scan, refresh
	 
    always @(posedge clk) begin
		if (clk_frame) begin
		
			// Title
			if (scene == 6'b000000) begin
				if (effect) begin 
					face_count[0] = 0;
					face_count[1] = 0;
					scene = 6'b100000;
				end
				if (btn1[0]) begin
					if (face_count[0] < 16) face_count[0] = face_count[0] + 1;
					else begin
						face_count[0] = 0;
						if (face > 0) face = face - 1;
						else face = 3;
					end
				end
				if (btn1[1]) begin
					if (face_count[1] < 16) face_count[1] = face_count[1] + 1;
					else begin
						face_count[1] = 0;
						if (face < 3) face = face + 1;
						else face = 0;
					end
				end
			end
			
			// Space
			if (scene == 6'b010000) begin
			
				if ((boss_hp == 0 && F_y <= 240) || (falcond == 0 && falcon_hp == 0)) begin
					scene = 6'b100000;
					for (k = 0; k < 8; k = k + 1) begin
						fi_s[k] = 1;
						fi[k][1] = 0;
						bomb_count[k] = 0;
						bomb[k] = 0;
						fi_b[k][0] = 0;
						fi_b[k][1] = 0;
						fireV[k][0] = 0;
						fireV[k][1] = 0;
						firedir[k] = 0;
					end
					boss_count = 0;
					boss_hp = 1;
					falcon_hp = 1;
					falcond = 1;
					dsball_x = 0;
					dsball_y = 0;
					dsball_v[0] = 0;
					dsballdir[0] = 0;
					dsball_v[1] = 0;
					dsballdir[1] = 0;
					fi_s[0] = 0;
					g_die = 0;
				end
				
				// Empire Fighters				
				if (enemy_count < 128) begin
					enemy_count = enemy_count + 1;
				end
				else begin 
					enemy_count = 0;
				end	
				// Move Fighters
				for (k = 0; k < 8; k = k + 1) begin
					if (boss_count == 30) begin
						fi_s[k] = 1;
						fi[k][1] = 0;
						fi_b[k][0] = 0;
						fi_b[k][1] = 0;
						fireV[k][0] = 0;
						fireV[k][1] = 0;
						firedir[k] = 0;
					end
					else begin
						if (k == 0) begin
							if ((fi_s[7] == 1 || fi[7][1] > 240) && boss_count < 30)
									fi_s[0] = 0;
						end
						else begin
							if ((fi_s[k-1] == 1 || fi[k-1][1] > 240) && boss_count < 30)
								fi_s[k] = 0;
						end
						if (enemy_count[2:2]) begin
							if (fi_s[k] == 0) begin
								if (fi[k][1] < D_BOUND - 33 && bomb[k] == 0)
									fi[k][1] = fi[k][1] + M_V;
								else begin 
									// arrive the bottom without being hit
									if (bomb[k] == 0) begin
										fi[k][1] = 0;
										fi_s[k] = 1;
									end
								end
							end
							if (fi_b[k][0] > 5 && fi_b[k][1] > 5 && fi_b[k][0] < 635 && fi_b[k][1] < 475) begin
								fi_b[k][0] = firedir[k] ? (fi_b[k][0] + fireV[k][0]) : (fi_b[k][0] - fireV[k][0]);
								fi_b[k][1] = fi_b[k][1] + fireV[k][1];
							end
							else begin
								fi_b[k][0] = 0;
								fi_b[k][1] = 0;
								fireV[k][0] = 0;
								fireV[k][1] = 0;
								firedir[k] = 0;
							end
						end
						// Attacked
						if (attack == 1 && bomb[k] == 0 && fi_s[k] == 0 && fi[k][0] >= F_x - 20 && fi[k][0] <= F_x + 20 && fi[k][1] < F_y - 80 && boss_count < 30)  begin
							boss_count = boss_count + 1;
							bomb[k] = 1;
						end
						// Bombing
						if (bomb[k] == 1) begin
							if (bomb_count[k] < 64) bomb_count[k] = bomb_count[k] + 1;
							else begin
								bomb_count[k] = 0;
								bomb[k] = 0;
								fi_s[k] = 1;
								fi[k][1] = 0;
							end
						end
						// Fire!
						// initiate
						if (fi[k][1] > 160 && fi_b[k][0] == 0 && fi_b[k][1] == 0 && F_y > fi[k][1] && fi_s[k] == 0) begin
							fi_b[k][0] = fi[k][0];
							fi_b[k][1] = fi[k][1];
							firedir[k] = (F_x > fi[k][0]);
							fire_x = firedir[k] ? (F_x - fi[k][0]) : (fi[k][0] - F_x);
							fire_y = F_y - fi[k][1];
							fireV[k][0] = fire_x[8:6] / 3;
							fireV[k][1] = fire_y[8:6] / 3;
							if (fireV[k][0] == 0) fireV[k][0] = 1;
							if (fireV[k][1] == 0) fireV[k][1] = 1;
						end
						//move fire
						if (enemy_count[2:2]) begin
							if (fi_b[k][0] > 5 && fi_b[k][1] > 5 && fi_b[k][0] < 635 && fi_b[k][1] < 475) begin
								fi_b[k][0] = firedir[k] ? (fi_b[k][0] + fireV[k][0]) : (fi_b[k][0] - fireV[k][0]);
								fi_b[k][1] = fi_b[k][1] + fireV[k][1];
							end
							else begin
								fi_b[k][0] = 0;
								fi_b[k][1] = 0;
								fireV[k][0] = 0;
								fireV[k][1] = 0;
								firedir[k] = 0;
							end
						end
						// HIT FALCON
						if (fi_b[k][0] > F_x - 32 && fi_b[k][0] < F_x + 32 && fi_b[k][1] > F_y - 70 && fi_b[k][1] < F_y) begin
							if (falcon_hp < 6 && falcon_hp > 0) begin
								falcon_hp = falcon_hp + 1;
							end
							else falcon_hp = 0;
							fi_b[k][1] = 0;
							fi_b[k][0] = 0;
						end
					end
				end
				
				// Death Star
				if (boss_count == 30) begin
					// Death HP
					if (attack == 1 && F_x > 250 && F_x < 320) begin
						if (boss_hp < 1000 && boss_hp > 0) boss_hp = boss_hp + 1;
						else begin
							boss_hp = 0;
							dsball_x = 0;
							dsball_y = 0;
							dsball_v[0] = 0;
							dsballdir[0] = 0;
							dsball_v[1] = 0;
							dsballdir[1] = 0;
						end
					end
					// Death light ball
					if (dsball_x == 0 && dsball_y == 0 && boss_hp > 0) begin
						dsball_x = 282;
						dsball_y = 95;
						dsballdir[0] = (F_x > dsball_x);
						dsballdir[1] = (F_y > dsball_y);
						dballx = dsballdir[0] ? (F_x - dsball_x) : (dsball_x - F_x);
						dbally = dsballdir[1] ? (F_y - dsball_y) : (dsball_y - F_y);
						dsball_v[0] = dballx[9:6];
						dsball_v[1] = dbally[9:6];
					end
					if (enemy_count[2:2]) begin
						if (dsball_x > 0 && dsball_y > 0 && dsball_x < 640 && dsball_y < 480) begin
							dsball_x = dsballdir[0] ? dsball_x + dsball_v[0] : dsball_x - dsball_v[0];
							dsball_y = dsballdir[1] ? dsball_y + dsball_v[1] : dsball_x - dsball_v[1];
						end
						else begin
							dsball_x = 0;
							dsball_y = 0;
							dsball_v[0] = 0;
							dsballdir[0] = 0;
							dsball_v[1] = 0;
							dsballdir[1] = 0;
						end
					end
					// Hit falcon
					if (dsball_x > F_x - 32 && dsball_x < F_x + 32 && dsball_y > F_y - 70 && dsball_y < F_y) begin
						dsball_x = 0;
						dsball_y = 0;
						if (falcon_hp < 5 && falcon_hp > 0) falcon_hp = falcon_hp + 2;
						else falcon_hp = 0;
					end
				end
				
				// Falcon up down left right
				if (btn1[0] && F_x > L_BOUND + 20) begin
					F_x = F_x - M_V;
				end
				if (btn1[1] && F_x < R_BOUND - 20) begin
					F_x = F_x + M_V;
				end
				if (btn2[0] && F_y > U_BOUND + 81) begin
					F_y = F_y - M_V;
				end
				if (btn2[1] && F_y < D_BOUND - 11) begin
					F_y = F_y + M_V;
				end
				if (walk_count < 512) 
					walk_count = walk_count + 1;
				else walk_count = 0;
				
				if (effect) begin
					attack = 1;
				end
				
				if (attack == 1) begin
					if (effect_count < 30) effect_count = effect_count + 1;
					else begin 
						effect_count = 0;
						attack = 0;
					end
				end
				
				if (falcon_hp == 0) begin
					if (falcond < 30 && falcond > 0) falcond = falcond + 1;
					else falcond = 0;
				end
				
			
			end
			
			// Mario World
			if (scene == 6'b100000) begin
				pos_bg = x + y * 640;
				if (question_pos[0] && M_x >= question_pos[1] - 8 && M_x <= question_pos[1] + 8 && M_y >= question_pos[2] - 70 && M_y <= question_pos[2] - 60) begin
					scene = 6'b010000;
					g_die = 0;
					B_x = 0;
					B_y = 0;
					M_x = 11'd100;
					M_y = 11'd384;
					up_down = 0;
					j_ul = 0;
					block_pos[0][0] = 0;
					block_pos[1][0] = 0;
					block_pos[2][0] = 0;
					block_pos[3][0] = 0;
					block_pos[4][0] = 0;
					question_pos[0] = 0;
				end
			  
					// enemy auto walk
					if (g_die == 0) begin 
						if (enemy_count < 128) begin
							enemy_count = enemy_count + 1;
						end
						else begin 
							enemy_count = 0;
						end
						
						if (enemy_count[1:1]) begin
							if (elr == 0) begin
								if (G_x >= 200)
									G_x = G_x - M_V;
								else elr = 1;
							end
							else if (elr == 1) begin
								if (G_x <= 500)
									G_x = G_x + M_V;
								else elr = 0;
							end		
						end
					end
					
					if (hero_die == 0) begin
						// Move Left 0 & Right 1
						if ((M_y > 32 && M_y < 96 && (M_x > 352 || M_x < 256)) ||
							 (M_y > 128 && M_y < 192 && (M_x > 416 || M_x < 288)) ||
							 (M_y > 256 && M_y < 320 && (M_x > 416 || M_x < 192)) ||
							 M_y >= 320 || M_y <= 32 || (M_y >= 192 && M_y <= 256) || (M_y >= 96 && M_y <= 128)) begin
							if (btn1[0] && M_x > L_BOUND) begin
								if (face == 3) M_x = M_x - M_V - 1;
								else M_x = M_x - M_V;
								if (walk_count < 512) 
									walk_count = walk_count + 1;
								else
									walk_count = 0;
								leftright = 0;
							end
						end
						if ((M_y > 32 && M_y < 96 && (M_x > 352 || M_x < 256)) ||
							 (M_y > 128 && M_y < 192 && (M_x > 416 || M_x < 288)) ||
							 (M_y > 256 && M_y < 320 && (M_x > 416 || M_x < 192)) ||
							 M_y >= 320 || M_y <= 32 || (M_y >= 192 && M_y <= 256) || (M_y >= 96 && M_y <= 128)) begin
							if (btn1[1] && M_x < R_BOUND - 32) begin 
								if (face == 3) M_x = M_x + M_V + 1;
								else M_x = M_x + M_V;
								if (walk_count < 512) 
									walk_count = walk_count + 1;
								else
									walk_count = 0;
								leftright = 1;
							end
						end
						
						//jump up 
						// up_down 0 walk 1 up 2 down
						if ((btn2[0] && up_down == 0 && (M_y == 384 || M_y == 256 || M_y == 128 || M_y == 32)) || up_down == 1) begin
							if (up_down == 0 && j_ul == 0) up_down = 1; // set rising state
							if (j_ul == 0) begin // set highest point
								if (M_y > max_height)
									j_ul = M_y - max_height;
								else j_ul = 10;
							end
							if (M_y > j_ul && up_down == 1) begin // rising
								if (M_y == block_pos[0][2] && M_x >= block_pos[0][1] - 16 && M_x < block_pos[0][1] + 16 && block_pos[0][0] == 0 ) begin // hit a block
									up_down = 2;
									block_pos[0][0] = 1; // 1 broken
									block_count[0] = 1;
									j_ul = 0;
								end
								else if (M_y == block_pos[1][2] && M_x >= block_pos[1][1] - 16 && M_x < block_pos[1][1] + 16 && block_pos[1][0] == 0 ) begin // hit a block
									up_down = 2;
									block_pos[1][0] = 1;
									block_count[1] = 1;
									j_ul = 0;
								end
								else if (M_y == block_pos[2][2] && M_x >= block_pos[2][1] - 16 && M_x < block_pos[2][1] + 16 && block_pos[2][0] == 0 ) begin // hit a block
									up_down = 2;
									block_pos[2][0] = 1;
									block_count[2] = 1;
									j_ul = 0;
								end
								else if (M_y == block_pos[3][2] && M_x >= block_pos[3][1] - 16 && M_x < block_pos[3][1] + 16 && block_pos[3][0] == 0 ) begin // hit a block
									up_down = 2;
									block_pos[3][0] = 1;
									block_count[3] = 1;
									j_ul = 0;
								end
								else if (M_y == block_pos[4][2] && M_x >= block_pos[4][1] - 16 && M_x < block_pos[4][1] + 16 && block_pos[4][0] == 0 ) begin // hit a block
									up_down = 2;
									block_pos[4][0] = 1;
									block_count[4] = 1;
									j_ul = 0;
								end
								else if (M_y == solid_pos[0][1] && M_x >= solid_pos[0][0] - 16 && M_x < solid_pos[0][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[1][1] && M_x >= solid_pos[1][0] - 16 && M_x < solid_pos[1][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[2][1] && M_x >= solid_pos[2][0] - 16 && M_x < solid_pos[2][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[3][1] && M_x >= solid_pos[3][0] - 16 && M_x < solid_pos[3][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[4][1] && M_x >= solid_pos[4][0] - 16 && M_x < solid_pos[4][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[5][1] && M_x >= solid_pos[5][0] - 16 && M_x < solid_pos[5][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[6][1] && M_x >= solid_pos[6][0] - 16 && M_x < solid_pos[6][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == solid_pos[7][1] && M_x >= solid_pos[7][0] - 16 && M_x < solid_pos[7][0] + 16) begin // hit a block
									up_down = 2;
									j_ul = 0;
								end
								else if (M_y == question_pos[2] && M_x >= question_pos[1] - 16 && M_x < question_pos[1] + 16) begin // hit a block
									up_down = 2;
									question_pos[0] = 1;
									j_ul = 0;
								end
								else begin 
									if (M_y > U_BOUND) M_y = M_y - J_V;
									else begin
										up_down = 2;
										j_ul = 0;
									end
								end
							end
							if (M_y == j_ul) begin // reach the top without hitting a block
								j_ul = 0;
								up_down = 2;
							end
						end
						
						// fall down
						// from highest to lowest block coordinate
						if (up_down != 1) begin
								if (M_y <= solid_pos[6][1] - 64 && M_x >= solid_pos[6][0] - 16 && M_x < solid_pos[6][0] + 16) begin // hit a block
									if (M_y != solid_pos[6][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[7][1] - 64 && M_x >= solid_pos[7][0] - 16 && M_x < solid_pos[7][0] + 16) begin // hit a block
									if (M_y != solid_pos[7][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= question_pos[2] - 64 && M_x >= question_pos[1] - 16 && M_x < question_pos[1] + 16 ) begin // hit a block
									if (M_y != question_pos[2] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= block_pos[3][2] - 64 && M_x >= block_pos[3][1] - 16 && M_x < block_pos[3][1] + 16 && block_pos[3][0] == 0 ) begin // hit a block
									if (block_pos[3][0] == 1 || (block_pos[3][0] == 0 && M_y != block_pos[3][2] - 64)) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= block_pos[4][2] - 64 && M_x >= block_pos[4][1] - 16 && M_x < block_pos[4][1] + 16 && block_pos[4][0] == 0 ) begin // hit a block
									if (block_pos[4][0] == 1 || (block_pos[4][0] == 0 && M_y != block_pos[4][2] - 64)) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[4][1] - 64 && M_x >= solid_pos[4][0] - 16 && M_x < solid_pos[4][0] + 16) begin // hit a block
									if (M_y != solid_pos[4][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[5][1] - 64 && M_x >= solid_pos[5][0] - 16 && M_x < solid_pos[5][0] + 16) begin // hit a block
									if (M_y != solid_pos[5][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[0][1] - 64 && M_x >= solid_pos[0][0] - 16 && M_x < solid_pos[0][0] + 16) begin // hit a block
									if (M_y != solid_pos[0][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[1][1] - 64 && M_x >= solid_pos[1][0] - 16 && M_x < solid_pos[1][0] + 16) begin // hit a block
									if (M_y != solid_pos[1][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[2][1] - 64 && M_x >= solid_pos[2][0] - 16 && M_x < solid_pos[2][0] + 16) begin // hit a block
									if (M_y != solid_pos[2][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= solid_pos[3][1] - 64 && M_x >= solid_pos[3][0] - 16 && M_x < solid_pos[3][0] + 16) begin // hit a block
									if (M_y != solid_pos[3][1] - 64) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= block_pos[0][2] - 64 && M_x >= block_pos[0][1] - 16 && M_x < block_pos[0][1] + 16) begin 
									if (block_pos[0][0] == 1 || (block_pos[0][0] == 0 && M_y != block_pos[0][2] - 64)) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= block_pos[1][2] - 64 && M_x >= block_pos[1][1] - 16 && M_x < block_pos[1][1] + 16) begin 
									if (block_pos[1][0] == 1 || (block_pos[1][0] == 0 && M_y != block_pos[1][2] - 64)) M_y = M_y + J_V;
									else up_down = 0;
								end
								else if (M_y <= block_pos[2][2] - 64 && M_x >= block_pos[2][1] - 16 && M_x < block_pos[2][1] + 16) begin 
									if (block_pos[2][0] == 1 || (block_pos[2][0] == 0 && M_y != block_pos[2][2] - 64)) M_y = M_y + J_V;
									else up_down = 0;
								end
								else begin
									if (M_y < 384) M_y = M_y + J_V;
									else up_down = 0;
								end
						end
					end
					else begin
						if (dieup) begin
							if (M_y >= 240) M_y = M_y - 2;
							else dieup = 0;
						end
						else begin
							if (M_y < D_BOUND - 10) M_y = M_y + 2;
							else begin
								scene = 6'b000000;
								M_x = 100;
								M_y = 384;
								hero_die = 0;
								dieup = 0;
								face = 0;
							end
						end
					end
					
					if (block_count[0] > 0) begin
						if (block_count[0] < 60) block_count[0] = block_count[0] + 1;
						else block_count[0] = 0;
					end
					if (block_count[1] > 0) begin
						if (block_count[1] < 60) block_count[1] = block_count[1] + 1;
						else block_count[1] = 0;
					end
					if (block_count[2] > 0) begin
						if (block_count[2] < 60) block_count[2] = block_count[2] + 1;
						else block_count[2] = 0;
					end
					if (block_count[3] > 0) begin
						if (block_count[3] < 60) block_count[3] = block_count[3] + 1;
						else block_count[3] = 0;
					end
					if (block_count[4] > 0) begin
						if (block_count[4] < 60) block_count[4] = block_count[4] + 1;
						else block_count[4] = 0;
					end
					
					// Hero Attack
					if (effect) begin
						if (face == 2 || face == 0)
							attack = 1;	
						else attack = 0;
						if (B_x == 0 && B_y == 0) begin
							balldir = leftright;
							if (balldir == 1) begin
								B_x = M_x + 17;
								B_y = M_y + 17;
							end
							else begin
								B_x = M_x - 17;
								B_y = M_y + 17;
							end
						end
					end
						
					if (face == 2) // Vader Thunder
						if (attack == 1) begin
							if (effect_count < 64) effect_count = effect_count + 1;
							else begin 
								effect_count = 0;
								attack = 0;
							end
						end
					if (face == 0) begin // Mario Fireball
						if (attack == 1) begin
							if (ball_count < 60) ball_count = ball_count + 1;
							else ball_count = 0;
							
							if (ball_count[0:0]) begin
								if (balldir == 1) begin
									if (B_x < 630) B_x = B_x + M_V * 2;
									else begin
										B_x = 0;
										B_y = 0;
										attack = 0;
									end
								end
								else if (balldir == 0) begin
									if (B_x > 10) B_x = B_x - M_V * 2;
									else begin
										B_x = 0;
										B_y = 0;
										attack = 0;
									end
								end
							end
						end
					end
					
					// hit an enemy from the head
					if (((M_y + 32 >= G_y) && ((elr == 0 && M_x >= G_x - 64 && M_x <= G_x) || (elr == 1 && M_x >= G_x && M_x <= G_x + 64)) && (M_y < G_y) && (up_down != 1)) && hero_die == 0) begin
						g_die = 1;
					end
					// hit by lighting from Vader
					if (face == 2 && attack == 1 && M_x >= G_x - 144 && M_y >= G_y) begin
						g_die = 1;
					end
					// hit by fireball from Mario
					if ((B_x >= G_x - 8 && balldir == 1 && B_y > G_y) || (B_x <= G_x + 8 && balldir == 0 && B_y > G_y)) begin
						g_die = 1;
					end
					// hit by enemy
					if (((elr == 0 && M_x >= G_x - 64 && M_x < G_x - 44 && M_y > G_y) || (elr == 1 && M_x >= G_x + 44 && M_x < G_x + 64 && M_y > G_y)) && hero_die == 0 && g_die == 0) begin
						hero_die = 1;
						dieup = 1;
					end
					
					
					
				end
        end
		
		// VGA COLOR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		if (x >= 0 && y >= 0 && x < 640 && y < 480) begin // inside the screen
			// Title
			if (scene == 6'b000000) begin
			
				//rgb_now <= 12'b000011011111;
				
				pos_star = {y[5:0], x[5:0]};
				
				rgb_now <= rgb_star;
				
				// Title
				if (x >= 114 && x < 527 && y >= 88 && y < 167) begin
					pos_title = x - 114 + 413 * (y - 88);
					if (rgb_title != 12'b111111110000) rgb_now <= rgb_title;
				end
				
				// Faces
				// Mario
				if (x >= 63 && x < 127 && y >= 258 && y < 322) begin
					pos_face = x - 63 + 64 * (y - 258);
					if (face == 0) begin
						if (rgb_mario != 12'b111111110000) rgb_now <= rgb_mario;
					end
					else if (rgb_mario2 != 12'b111111110000) rgb_now <= rgb_mario2;
				end
				// Cuba
				else if (x >= 213 && x < 277 && y >= 258 && y < 322) begin
					pos_face = x - 213 + 64 * (y - 258);
					if (face == 1) begin
						if (rgb_cuba != 12'b111111110000) rgb_now <= rgb_cuba;
					end
					else if (rgb_cuba2 != 12'b111111110000) rgb_now <= rgb_cuba2;
				end
				// Vader
				else if (x >= 363 && x < 427 && y >= 258 && y < 322) begin
					pos_face = x - 363 + 64 * (y - 258);
					if (face == 2) begin
						if (rgb_vader != 12'b111111110000) rgb_now <= rgb_vader;
					end
					else if (rgb_vader2 != 12'b111111110000) rgb_now <= rgb_vader2;
				end
				// Sonic
				else if (x >= 513 && x < 577 && y >= 258 && y < 322) begin
					pos_face = x - 513 + 64 * (y - 258);
					if (face == 3) begin
						if (rgb_sonic != 12'b111111110000) rgb_now <= rgb_sonic;
					end
					else if (rgb_sonic2 != 12'b111111110000) rgb_now <= rgb_sonic2;
				end
				
			end
			
			// Space
			if (scene == 6'b010000) begin
			
				rgb_now <= 12'b000000000000;
				
				// Stars
				if ((x >= 21 && x <= 22 && y >= 17 && y <= 18) ||
					 (x >= 62 && x <= 62 && y >= 62 && y <= 63) ||
					 (x >= 129 && x <= 130 && y >= 27 && y <= 28) ||
					 (x >= 250 && x <= 251 && y >= 62 && y <= 63) ||
					 (x >= 425 && x <= 426 && y >= 82 && y <= 83) ||
					 (x >= 473 && x <= 474 && y >= 30 && y <= 31) ||
					 (x >= 128 && x <= 129 && y >= 156 && y <= 157) ||
					 (x >= 251 && x <= 252 && y >= 165 && y <= 166) ||
					 (x >= 352 && x <= 353 && y >= 170 && y <= 171) ||
					 (x >= 320 && x <= 321 && y >= 250 && y <= 251) ||
					 (x >= 540 && x <= 541 && y >= 257 && y <= 258) ||
					 (x >= 404 && x <= 405 && y >= 270 && y <= 271) ||
					 (x >= 53 && x <= 54 && y >= 281 && y <= 282) ||
					 (x >= 208 && x <= 209 && y >= 309 && y <= 310) ||
					 (x >= 419 && x <= 420 && y >= 338 && y <= 339) ||
					 (x >= 83 && x <= 84 && y >= 371 && y <= 372) ||
					 (x >= 228 && x <= 229 && y >= 420 && y <= 421) ||
					 (x >= 511 && x <= 512 && y >= 392 && y <= 393) ||
					 (x >= 575 && x <= 576 && y >= 452 && y <= 453) ||
					 (x >= 123 && x <= 124 && y >= 460 && y <= 461)) begin
					rgb_now <= 12'b111111111111;
				end
				
				// Fighters
				for (k = 0; k < 8; k = k + 1) begin
					if (fi_s[k] == 0) begin
						if (x >= fi[k][0] - 32 && x < fi[k][0] + 32 && y >= fi[k][1] - 23 && y < fi[k][1] + 23) begin
							pos_fi = x[5:0] + 32 - fi[k][0] + (y + 23 - fi[k][1]) * 64;
							if (rgb_fi != 12'b111111110000) rgb_now <= rgb_fi;
						end
					end
					if (bomb[k] == 1) begin
						if (x >= fi[k][0] - 32 && x < fi[k][0] + 32 && y >= fi[k][1] - 25 && y < fi[k][1] + 25) begin
							pos_bomb = x[5:0] + 32 - fi[k][0] + (y + 25 - fi[k][1]) * 64;
							if (rgb_bomb != 12'b111111110000) rgb_now <= rgb_bomb;
						end
					end
					if (fi_b[k][0] > 0 && fi_b[k][1] > 0) begin
						if (x >= fi_b[k][0] - 8 && x < fi_b[k][0] + 8 && y >= fi_b[k][1] - 8 && y < fi_b[k][1] + 8) begin
							pos_fireball = x + 8 - fi_b[k][0] + 16 * (y + 8 - fi_b[k][1]);
							if (rgb_fireball != 12'b111111110000) rgb_now <= rgb_fireball;
						end
					end
				end
				
 				// Death Star
				if (boss_count == 30) begin
					if (x >= 192 && x < 448 && y >= 10 && y < 266) begin
						dif_x = x - 192;
						dif_y = y - 10;
						pos_ds = {dif_y[7:0], dif_x[7:0]};
						if (rgb_ds != 12'b111111110000) rgb_now <= rgb_ds;
					end
					// Dearth Star crashing
					if (boss_hp > 250 || boss_hp == 0) begin
						if (x >= 236 && x < 286 && y >= 175 && y < 225) begin
							pos_crash = x - 236 + (y - 175) * 50;
							if (rgb_crash != 12'b111111110000) rgb_now <= rgb_crash;
						end
					end
					if (boss_hp > 500 || boss_hp == 0) begin
						if (x >= 324 && x < 374 && y >= 132 && y < 182) begin
							pos_crash = x - 324 + (y - 132) * 50;
							if (rgb_crash != 12'b111111110000) rgb_now <= rgb_crash;
						end
					end
					if (boss_hp > 750 || boss_hp == 0) begin
						if (x >= 376 && x < 426 && y >= 6 && y < 56) begin
							pos_crash = x - 376 + (y - 6) * 50;
							if (rgb_crash != 12'b111111110000) rgb_now <= rgb_crash;
						end
					end
					if (boss_hp > 1000 || boss_hp == 0) begin
						if (x >= 270 && x < 320 && y >= 54 && y < 104) begin
							pos_crash = x - 270 + (y - 54) * 50;
							if (rgb_crash != 12'b111111110000) rgb_now <= rgb_crash;
						end
					end
					// Death Star light ball
					if (dsball_x > 0 && dsball_y > 0) begin
						if (x >= dsball_x - 16 && x < dsball_x + 16 && y >= dsball_y - 16 && y < dsball_y + 16) begin
							pos_dsball = x + 16 - dsball_x + 32 * (y +16 - dsball_y);
							if (rgb_dsball != 12'b111111110000) rgb_now <= rgb_dsball;
						end
					end
				end
				// Millenium Falcon!
				if (falcon_hp > 0) begin
					if (x >= F_x - 32 && x < F_x + 32 && y >= F_y - 80 && y < F_y) begin
						dif_x = x + 32 - F_x;
						dif_y = y + 80 - F_y;
						pos_f = {dif_y[6:0], dif_x[5:0]};
						if (rgb_f != 12'b111111110000) rgb_now <= rgb_f;
					end
					// And its tail
					if (x >= F_x - 23 && x < F_x + 21 && y >= F_y && y < F_y + 20) begin
						dif_x = x + 23 - F_x;
						dif_y = y - F_y;
						pos_ft = dif_y * 176 + dif_x + 44 * walk_count[6:5];
						if (rgb_ft != 12'b111111110000) rgb_now <= rgb_ft;
					end
					// laser
					if (attack == 1) begin
						if ((x == F_x - 4 || x == F_x + 2) && y <= F_y - 67) rgb_now <= 12'b110010000000;
						if ((x == F_x - 3 || x == F_x + 1) && y <= F_y - 67) rgb_now <= 12'b111111111000;
						if ((x > F_x - 3 && x < F_x + 1) && y <= F_y - 67) rgb_now <= 12'b111111111111;
					end
					// Falcon broken
					if (falcon_hp > 1) begin
						if (x >= F_x - 22 && x < F_x - 6 && y >= F_y - 20 && y < F_y - 4) begin
							pos_hit = x + 22 - F_x + 16 * (y + 20 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end	
					end
					if (falcon_hp > 2) begin
						if (x >= F_x + 2 && x < F_x + 18 && y >= F_y - 14 && y < F_y + 2) begin
							pos_hit = x - 2 - F_x + 16 * (y + 14 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end
					end
					if (falcon_hp > 3) begin
						if (x >= F_x - 30 && x < F_x - 14 && y >= F_y - 45 && y < F_y - 29) begin
							pos_hit = x + 30 - F_x + 16 * (y + 45 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end
					end
					if (falcon_hp > 4) begin
						if (x >= F_x + 18 && x < F_x + 34 && y >= F_y - 63 && y < F_y - 47) begin
							pos_hit = x - 18 - F_x + 16 * (y + 63 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end
					end
					if (falcon_hp > 5) begin
						if (x >= F_x - 10 && x < F_x + 6 && y >= F_y - 73 && y < F_y - 57) begin
							pos_hit = x + 10 - F_x + 16 * (y + 73 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end
					end
					if (falcon_hp > 6) begin
						if (x >= F_x - 2 && x < F_x + 14 && y >= F_y - 50 && y < F_y - 34) begin
							pos_hit = x + 2 - F_x + 16 * (y + 50 - F_y);
							if (rgb_hit != 12'b111111110000) rgb_now <= rgb_hit;
						end
					end
				end
				
				if (falcon_hp == 0) begin
					if (x >= F_x - 50 && x < F_x + 50 && y >= F_y - 80 && y < F_y + 20) begin
						pos_falcondie = x + 50 - F_x + 100 * (y + 80 - F_y);
						if (rgb_falcondie != 12'b111111110000) rgb_now <= rgb_falcondie;
					end
				end
						
			end
			
			
			// Mario World
			else if (scene == 6'b100000) begin
		
				rgb_now <= 12'b110010100110; // blue sky

				// grass1
				if (x >= 32 && y >= 384 && x < 96 && y < 416) begin
					pos_grass1 = x - 32 + 64 * (y - 384);
					if (rgb_grass1 != 12'b111111110000) rgb_now <= rgb_grass1;
				end
				// grass2
				if (x >= 448 && y >= 384 && x < 576 && y < 416) begin
					pos_grass2 = x - 448 + 128 * (y - 384);
					if (rgb_grass2 != 12'b111111110000) rgb_now <= rgb_grass2;
				end
				// mount 
				if (x >= 224 && y >= 352 && x < 320 && y < 416) begin
					pos_mount = x - 224 + 96 * (y - 352);
					if (rgb_mount != 12'b111111110000) rgb_now <= rgb_mount;
				end
				// cloud1
				if (x >= 64 && y >= 160 && x < 128 && y < 224) begin
					pos_cloud1 = x - 64 + 64 * (y - 160);
					if (rgb_cloud1 != 12'b111111110000) rgb_now <= rgb_cloud1;
				end
				// cloud2
				if (x >= 160 && y >= 32 && x < 224 && y < 96) begin
					pos_cloud2 = x - 160 + 64 * (y - 32);
					if (rgb_cloud2 != 12'b111111110000) rgb_now <= rgb_cloud2;
				end
				// cloud3
				if (x >= 448 && y >= 64 && x < 576 && y < 128) begin
					pos_cloud3 = x - 448 + 128 * (y - 64);
					if (rgb_cloud3 != 12'b111111110000) rgb_now <= rgb_cloud3;
				end

				// enemy
				if (g_die == 0) begin
					if (x >= G_x - 64 && x < G_x + 64 && y >= G_y && y < G_y + 64) begin
						difg_x = x + 64 - G_x;
						difg_y = y - G_y;
						pos_g = {difg_y[5:0], enemy_count[6:5], difg_x[6:0]};
						if (elr == 1) begin
							if (rgbg_r != 12'b111111110000) rgb_now <= rgbg_r;
						end
						else begin
							if (rgbg_l != 12'b111111110000) rgb_now <= rgbg_l;
						end
					end
				end
				
				
				// character
				if ((x >= M_x - 16 && x < M_x + 16) && (y >= M_y && y < M_y + 32)) begin			
					dif_x = x + 16 - M_x;
					dif_y = y - M_y;
					pos = {dif_y[4:0], walk_count[6:5], dif_x[4:0]};
					//if (hero == 6'b000001) begin // cuba
					if (face == 1) begin
						if (leftright == 1) begin
							if (rgbk_r != 12'b111111110000) rgb_now <= rgbk_r;
						end
						else begin
							if (rgbk_l != 12'b111111110000) rgb_now <= rgbk_l;
						end
					end
					//else if (hero == 6'b000010) begin // darth vade
					else if (face == 2) begin
						if (leftright == 1) begin
							if (rgbd_r != 12'b111111110000) rgb_now <= rgbd_r;
						end
						else begin
							if (rgbd_l != 12'b111111110000) rgb_now <= rgbd_l;
						end
					end
					else if (face == 3) begin // sonic
						if (leftright == 1) begin
							if (rgbs_r != 12'b111111110000) rgb_now <= rgbs_r;
						end
						else begin
							if (rgbs_l != 12'b111111110000) rgb_now <= rgbs_l;
						end
					end
					else begin // mario
						if (leftright == 1) begin
							if (rgbm_r != 12'b111111110000) rgb_now <= rgbm_r;
						end
						else begin
							if (rgbm_l != 12'b111111110000) rgb_now <= rgbm_l;
						end
					end
				end
				
				// Terrain
				// Ground
				if (y >= 416) begin
					difgr_x = {x[10:5], 5'b00000};
					difgr_x = x - difgr_x;
					difgr_y = {y[10:5], 5'b00000};
					difgr_y = y - difgr_y;
					pos_gr = {difgr_y[4:0], difgr_x[4:0]};
					rgb_now <= rgb_ground;
				end 
				
				// blocks
				// breakable ones
				if (x >= block_pos[0][1] - 16 && x < block_pos[0][1] + 16 && y > block_pos[0][2] - 32 && y <= block_pos[0][2] && block_pos[0][0] == 0) begin
					pos_block = x + 16 - block_pos[0][1] + 32 * (y + 32 - block_pos[0][2]);
					if (rgb_block != 12'b111111110000) rgb_now <= rgb_block;
				end
				else if (x >= block_pos[1][1] - 16 && x < block_pos[1][1] + 16 && y > block_pos[1][2] - 32 && y <= block_pos[1][2] && block_pos[1][0] == 0) begin
					pos_block = x + 16 - block_pos[1][1] + 32 * (y + 32 - block_pos[1][2]);
					if (rgb_block != 12'b111111110000) rgb_now <= rgb_block;
				end
				else if (x >= block_pos[2][1] - 16 && x < block_pos[2][1] + 16 && y > block_pos[2][2] - 32 && y <= block_pos[2][2] && block_pos[2][0] == 0) begin
					pos_block = x + 16 - block_pos[2][1] + 32 * (y + 32 - block_pos[2][2]);
					if (rgb_block != 12'b111111110000) rgb_now <= rgb_block;
				end
				else if (x >= block_pos[3][1] - 16 && x < block_pos[3][1] + 16 && y > block_pos[3][2] - 32 && y <= block_pos[3][2] && block_pos[3][0] == 0) begin
					pos_block = x + 16 - block_pos[3][1] + 32 * (y + 32 - block_pos[3][2]);
					if (rgb_block != 12'b111111110000) rgb_now <= rgb_block;
				end
				else if (x >= block_pos[4][1] - 16 && x < block_pos[4][1] + 16 && y > block_pos[4][2] - 32 && y <= block_pos[4][2] && block_pos[4][0] == 0) begin
					pos_block = x + 16 - block_pos[4][1] + 32 * (y + 32 - block_pos[4][2]);
					if (rgb_block != 12'b111111110000) rgb_now <= rgb_block;
				end
				//broken
				if (x >= block_pos[0][1] - 24 && x < block_pos[0][1] + 24 && y >= block_pos[0][2] - 64 && y < block_pos[0][2] - 32 && block_count[0] > 0) begin
					pos_piece = x + 24 - block_pos[0][1] + 48 * (y + 64 - block_pos[0][2]);
					if (rgb_piece != 12'b111111110000) rgb_now <= rgb_piece;
				end
				else if (x >= block_pos[1][1] - 24 && x < block_pos[1][1] + 24 && y >= block_pos[1][2] - 64 && y < block_pos[1][2] - 32 && block_count[1] > 0) begin
					pos_piece = x + 24 - block_pos[1][1] + 48 * (y + 64 - block_pos[1][2]);
					if (rgb_piece != 12'b111111110000) rgb_now <= rgb_piece;
				end
				else if (x >= block_pos[2][1] - 24 && x < block_pos[2][1] + 24 && y >= block_pos[2][2] - 64 && y < block_pos[2][2] - 32 && block_count[2] > 0) begin
					pos_piece = x + 24 - block_pos[2][1] + 48 * (y + 64 - block_pos[2][2]);
					if (rgb_piece != 12'b111111110000) rgb_now <= rgb_piece;
				end
				else if (x >= block_pos[3][1] - 24 && x < block_pos[3][1] + 24 && y >= block_pos[3][2] - 64 && y < block_pos[3][2] - 32 && block_count[3] > 0) begin
					pos_piece = x + 24 - block_pos[3][1] + 48 * (y + 64 - block_pos[3][2]);
					if (rgb_piece != 12'b111111110000) rgb_now <= rgb_piece;
				end
				else if (x >= block_pos[4][1] - 24 && x < block_pos[4][1] + 24 && y >= block_pos[4][2] - 64 && y < block_pos[4][2] - 32 && block_count[4] > 0) begin
					pos_piece = x + 24 - block_pos[4][1] + 48 * (y + 64 - block_pos[4][2]);
					if (rgb_piece != 12'b111111110000) rgb_now <= rgb_piece;
				end
				// solid ones
				if (x >= solid_pos[0][0] - 16 && x < solid_pos[0][0] + 16 && y > solid_pos[0][1] - 32 && y <= solid_pos[0][1]) begin
					pos_solid = x + 16 - solid_pos[0][0] + 32 * (y + 32 - solid_pos[0][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[1][0] - 16 && x < solid_pos[1][0] + 16 && y > solid_pos[1][1] - 32 && y <= solid_pos[1][1]) begin
					pos_solid = x + 16 - solid_pos[1][0] + 32 * (y + 32 - solid_pos[1][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[2][0] - 16 && x < solid_pos[2][0] + 16 && y > solid_pos[2][1] - 32 && y <= solid_pos[2][1]) begin
					pos_solid = x + 16 - solid_pos[2][0] + 32 * (y + 32 - solid_pos[2][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[3][0] - 16 && x < solid_pos[3][0] + 16 && y > solid_pos[3][1] - 32 && y <= solid_pos[3][1]) begin
					pos_solid = x + 16 - solid_pos[3][0] + 32 * (y + 32 - solid_pos[3][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[4][0] - 16 && x < solid_pos[4][0] + 16 && y > solid_pos[4][1] - 32 && y <= solid_pos[4][1]) begin
					pos_solid = x + 16 - solid_pos[4][0] + 32 * (y + 32 - solid_pos[4][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[5][0] - 16 && x < solid_pos[5][0] + 16 && y > solid_pos[5][1] - 32 && y <= solid_pos[5][1]) begin
					pos_solid = x + 16 - solid_pos[5][0] + 32 * (y + 32 - solid_pos[5][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[6][0] - 16 && x < solid_pos[6][0] + 16 && y > solid_pos[6][1] - 32 && y <= solid_pos[6][1]) begin
					pos_solid = x + 16 - solid_pos[6][0] + 32 * (y + 32 - solid_pos[6][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				else if (x >= solid_pos[7][0] - 16 && x < solid_pos[7][0] + 16 && y > solid_pos[7][1] - 32 && y <= solid_pos[7][1]) begin
					pos_solid = x + 16 - solid_pos[7][0] + 32 * (y + 32 - solid_pos[7][1]);
					if (rgb_solid != 12'b111111110000) rgb_now <= rgb_solid;
				end
				// question
				if (x >= question_pos[1] - 16 && x < question_pos[1] + 16 && y > question_pos[2] - 32 && y <= question_pos[2]) begin
					pos_question = x + 16 - question_pos[1] + 32 * (y + 32 - question_pos[2]);
					if (question_pos[0] == 0) begin
						if (rgb_question != 12'b111111110000) rgb_now <= rgb_question;
					end
					else begin
						if (rgb_empty != 12'b111111110000) rgb_now <= rgb_empty;
					end
				end
				// helmet sign
				if (question_pos[0] == 1) begin
					if (x >= question_pos[1] - 12 && x < question_pos[1] + 12 && y >= question_pos[2] - 56 && y < question_pos[2] - 32) begin
						pos_helmet = x + 12 - question_pos[1] + 24 * (y + 56 - question_pos[2]);
						if (rgb_helmet != 12'b111111110000) rgb_now <= rgb_helmet;
					end
				end
				
				// Attack Effect
				if (attack == 1) begin
					// lighting from Vader
					//if (hero == 6'b000010) begin
					if (face == 2) begin
						if (leftright == 1) begin
							lightx = x - M_x - 16;
							lighty = y - M_y;
							pos_light = {lighty[4:0], lightx[5:0]};
							if (x >= M_x + 16 && x < M_x + 80 && y >= M_y && y < M_y + 16)
								if (rgb_light != 12'b111111110000) rgb_now <= rgb_light;
						end
						else begin
							lightx = M_x - 16 - x;
							lighty = y - M_y;
							pos_light = {lighty[4:0], lightx[5:0]};
							if (x >= M_x - 80 && x < M_x - 16 && y >= M_y && y < M_y + 16)
								if (rgb_light != 12'b111111110000) rgb_now <= rgb_light;
						end
					end
					
					
					// fireball from Mario
					//if (hero == 6'b001000) begin
					if (face == 0) begin
						if (balldir == 1) begin
							ballx = x - B_x;
							bally = y + 8 - B_y;
							pos_ball = {bally[3:0], ballx[3:0]};
							if (x >= B_x && x < B_x + 16 && y >= B_y - 8 && y < B_y + 8)
								if (rgb_ball != 12'b111111110000) rgb_now <= rgb_ball;
						end
						else begin
							ballx = B_x - x;
							bally = y + 8 - B_y;
							pos_ball = {bally[3:0], ballx[3:0]};
							if (x > B_x - 16 && x <= B_x && y >= B_y - 8 && y < B_y + 8)
								if (rgb_ball != 12'b111111110000) rgb_now <= rgb_ball;
						end
					end
				end
			end	
		end
		else rgb_now <= 12'b000000000000;
	 end
	 
	 // Title
	 title ti1(clk, pos_title, rgb_title);
	 star st1(clk, pos_star, rgb_star);
	 mario ma1(clk, pos_face, rgb_mario);
	 mario2 ma2(clk, pos_face, rgb_mario2);
	 vader va1(clk, pos_face, rgb_vader);
	 vader2 va2(clk, pos_face, rgb_vader2);
	 cuba cu1(clk, pos_face, rgb_cuba);
	 cuba2 cu2(clk, pos_face, rgb_cuba2);
	 sonic so1(clk, pos_face, rgb_sonic);
	 sonic2 so2(clk, pos_face, rgb_sonic2);
	 
	 // Mario World
	 DL d1(clk, pos, rgbd_l);
	 DR d2(clk, pos, rgbd_r);
	 ML m1(clk, pos, rgbm_l);
	 MR m2(clk, pos, rgbm_r);
	 SL s1(clk, pos, rgbs_l);
	 SR s2(clk, pos, rgbs_r);
	 KL k1(clk, pos, rgbk_l);
	 KR k2(clk, pos, rgbk_r);
	 GL g1(clk, pos_g, rgbg_l);
	 GR g2(clk, pos_g, rgbg_r);
	 lighting l1(clk, pos_light, rgb_light);
	 fireball f1(clk, pos_ball, rgb_ball);
	 ground gr1(clk, pos_gr, rgb_ground);
	 cloud1 cl1(clk, pos_cloud1, rgb_cloud1);
	 cloud1 cl2(clk, pos_cloud2, rgb_cloud2);
	 cloud2 cl3(clk, pos_cloud3, rgb_cloud3);
	 grass1 g3(clk, pos_grass1, rgb_grass1);
	 grass2 g4(clk, pos_grass2, rgb_grass2);
	 mount m3(clk, pos_mount, rgb_mount);
	 block1 bl1(clk, pos_block, rgb_block);

	 // Space
	 falcon f2(clk, pos_f, rgb_f);
	 falcontail f3(clk, pos_ft, rgb_ft);
	 fighter f4(clk, pos_fi, rgb_fi);
	 ds d3(clk, pos_ds, rgb_ds);
	 bomb b1(clk, pos_bomb, rgb_bomb);
	 crash c1(clk, pos_crash, rgb_crash);
	 fireball f5(clk, pos_fireball, rgb_fireball);
	 hit h1(clk, pos_hit, rgb_hit);
	 dsball d4(clk, pos_dsball, rgb_dsball);
	 piece bp1(clk, pos_piece, rgb_piece);
	 solid sl1(clk, pos_solid, rgb_solid);
	 question qu1(clk, pos_question, rgb_question);
	 empty em1(clk, pos_question, rgb_empty);
	 helmet hel1(clk, pos_helmet, rgb_helmet);
	 falcondie fa1(clk, pos_falcondie, rgb_falcondie);
	 
	 assign rgb = rgb_now;
	 assign led = boss_count;
	 assign up = up_down[0:0];
	 assign hero = {hero_die, dieup};

endmodule
