// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function start_translation(){
	if(global.csv_file != -1){
		with(obj_button_start_or_stop_translation){
			text = "Stop translation";
		}
		global.is_translating = true;
		global.translating_y_index = 0;
		log("Start translation");
	} else {
		log("No file to translate. please load file first.");
	}
}

function stop_translation(){
	with(obj_button_start_or_stop_translation){
		text = "Start translation";
	}
	global.is_translating = false;
	log("Stop translation");
}