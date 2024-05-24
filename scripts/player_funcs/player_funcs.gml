// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
var _p_tag;		// variable that is true when player is tagger

// function for converting input to movement
function set_movement(){
	if keyboard_check(vk_up){
		y-=5;
	}
	if keyboard_check(vk_down){
		y+=5;
	}
	if keyboard_check(vk_left){
		x-=5;
	}
	if keyboard_check(vk_right){
		x+=5;
	}
}
