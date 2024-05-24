// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// function for going between player and chaser
function block_chaser(){
	move_towards_point((PlayerAgent.x + ChaserAgent.x)/2, (PlayerAgent.y + ChaserAgent.y)/2, 3);
}

// function for chasing player
function tag_player(){
	move_towards_point(PlayerAgent.x, PlayerAgent.y, 3);
}

// function for getting out of the damn way T_T
function get_out(){
	move_towards_point(x, y, 0);
}