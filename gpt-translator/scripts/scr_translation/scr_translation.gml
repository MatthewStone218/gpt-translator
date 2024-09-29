// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function start_translation(){
	if(global.csv_file != -1){
		global.is_translating = true;
		global.translating_y_index = 0;
		log("Start translation");
	} else {
		log("No file to translate. please load file first.");
	}
}

function stop_translation(){
	global.is_translating = false;
	log("Stop translation");
}