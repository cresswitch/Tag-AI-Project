// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// function for wall collisions
// got this from a tutorial

var _can_tag = true;
var _tagger = true;

function wall_collide(){
	// set target position
	var _tx = x;
	var _ty = y;
	
	// move back to before collision
	x = xprevious;
	y = yprevious;
	
	// find distance
	var _dsx = abs(_tx - x);
	var _dsy = abs(_ty - y);
	
	// move until just barely not colliding
	repeat(_dsx){
		if !place_meeting(x + sign(_tx-x),y,SolidObj) x += sign(_tx-x);
	}
	repeat(_dsy){
		if !place_meeting(x,y + sign(_ty-y),SolidObj) y += sign(_ty-y);
	}
}

// function for figuring out which quadrant something is
// upper left = 1, upper right = 2, lower right = 3, lower left = 4
function get_quad(_posx, _posy){
	if(_posx < 960 / 2){
		if(_posy < 540 / 2){
			return 1;
		}
		else{
			return 4;
		}
	}
	else{
		if(_posy < 540 / 2){
			return 2;
		}
		else{
			return 3;
		}
	}
}

// function for running away from tagger
// somewhat incomplete
function run_away(){
	// check tagger location (and who tagger is)
	var _tagx = 0;
	var _tagy = 0;
	var _tagquad = 0;
	var _runquad = 0;
	var _speed = 4;
	
	if(PlayerAgent._tagger){
		_tagx = PlayerAgent.x;
		_tagy = PlayerAgent.y;
	}
	else if(ChaserAgent._tagger){
		_tagx = ChaserAgent.x;
		_tagy = ChaserAgent.y;
	}
	else if(ShieldAgent._tagger){
		_tagx = ShieldAgent.x;
		_tagy = ShieldAgent.y;
	}
	else if(NormalAgent._tagger){
		_tagx = NormalAgent.x;
		_tagy = NormalAgent.y;
	}
	
	_tagquad = get_quad(_tagx, _tagy);
	_runquad = get_quad(x, y);
	
	if(_tagquad != _runquad){
		if(_tagquad == 1){
			move_towards_point(940,520,_speed);
		}
		else if(_tagquad == 2){
			move_towards_point(20,520,_speed);
		}
		else if(_tagquad == 3){
			move_towards_point(20,20,_speed);
		}
		else if(_tagquad == 4){
			move_towards_point(940,20,_speed);
		}
	}
	else{
		// what to do if tagger is in the same quadrant
		// to be honest its actually a bit hard to catch even without this section
	}
	
}

// function for the tagger indicator object thing to actually be on the tagger
function follow_tagger(){
	var _tagger = ChaserAgent;
	if(PlayerAgent._tagger){
		_tagger = PlayerAgent;
	}
	else if(ShieldAgent._tagger){
		_tagger = ShieldAgent;
	}
	else if(NormalAgent._tagger){
		_tagger = NormalAgent;
	}
	
	x = _tagger.x;
	y = _tagger.y;
}

// collision functions depending on what bumped into the agent
function p_collide(){
	// if player is tagger, get tagged
	if(PlayerAgent._tagger && PlayerAgent._can_tag){
		PlayerAgent._can_tag = false;
		PlayerAgent._tagger = false;
		_tagger = true;
		alarm[0] = 30;
	}
}

function c_collide(){
	// if chaser is tagger, get tagged
	if(ChaserAgent._tagger && ChaserAgent._can_tag){
		ChaserAgent._can_tag = false;
		ChaserAgent._tagger = false;
		_tagger = true;
		alarm[0] = 30;
	}
}

function s_collide(){
	// if shield is tagger, get tagged
	if(ShieldAgent._tagger && ShieldAgent._can_tag){
		ShieldAgent._can_tag = false;
		ShieldAgent._tagger = false;
		_tagger = true;
		alarm[0] = 30;
	}
}

function n_collide(){
	// if normal is tagger, get tagged
	if(NormalAgent._tagger && NormalAgent._can_tag){
		NormalAgent._can_tag = false;
		NormalAgent._tagger= false;
		_tagger = true;
		alarm[0] = 30;
	}
}