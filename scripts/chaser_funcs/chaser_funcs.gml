// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// function for chasing player when chaser is tagger
// function for running away is in general funcs since all ai run away the same way
function chase_player(){
	var _tx;
	var _ty;
	var _speed = 4;
	
	_tx = PlayerAgent.x;
	_ty = PlayerAgent.y;
	
	
	move_towards_point(_tx, _ty, _speed);
}