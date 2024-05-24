// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// function that seeks nearest agent and goes towards it
function seek_nearest(){
	var _cd = sqrt(sqr(x - ChaserAgent.x) + sqr(y - ChaserAgent.y));
	var _pd = sqrt(sqr(x - PlayerAgent.x) + sqr(y - PlayerAgent.y));
	var _sd = sqrt(sqr(x - ShieldAgent.x) + sqr(y - ShieldAgent.y));
	
	var _near = ChaserAgent;
	if(_cd > _pd){
		if(_pd > _sd){
			_near = ShieldAgent;
		}
		else{
			_near = PlayerAgent;
		}
	}
	
	move_towards_point(_near.x, _near.y, 3);
}