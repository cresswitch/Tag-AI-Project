/// @description Insert description here
// You can write your code in this editor

if(_tagger){
	tag_player();
}

else if(PlayerAgent._tagger){
	get_out();
}	

else{
	block_chaser();
}
