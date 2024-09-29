/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

function check_column_names_exist_and_log_them(){
	if(!csv_cell_exists(global.start_column_name)){
		log($"Can't find start column name {global.start_column_name}");
		return false;
	}
	if(!csv_cell_exists(global.start_column_name)){
		log($"Can't find context column name {global.context_column_name}");
		return false;
	}
	if(!csv_cell_exists(global.destination_column_name)){
		log($"Can't find destination column name {global.destination_column_name}");
		return false;
	}
	
	return true;
}
function handle_status_error(){
	global.message_request_id = -1;
	log($"error: async http event received status {async_load[?"status"]}");
}
function handle_result(_json){
	global.message_request_id = -1;
	var _error_ocurred = handle_result_error_end_get_error_bool(_json);
	if(!_error_ocurred){
		handle_result_no_error(_json);
	}
}
function handle_result_error_end_get_error_bool(_json){
	if(!is_undefined(_json[$"error"])){
		log($"error: {_json[$"error"]}");
		return true;
	}
}
function handle_result_no_error(_json){
	switch(global.message_type){
		case MESSAGE_TYPE.NONE: receive_message_no_type(_json); break;
		case MESSAGE_TYPE.SENTENCE_TO_TRANSLATE: receive_message_translated_sentence(_json); break;
	}
}
function receive_message_no_type(_json){
	log($"MESSAGE_TYPE.NONE but received data. data: {_json}");
}
function receive_message_translated_sentence(_json){
	var _choices = _json[$"choices"];
	for(var i = 0; i < array_length(_choices); i++){
		var _str = _choices[i][$"message"][$"content"];
		log($"translated sentence y:{global.translating_y_index}");
		csv_text_set(global.destination_column_name,global.translating_y_index,_str);
	}
}