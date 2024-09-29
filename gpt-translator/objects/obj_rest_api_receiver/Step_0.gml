/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(global.is_translating){
	if(global.message_request_id == -1){
		if(csv_exists()){
			while(global.translating_y_index < get_csv_height() && (csv_text_load(global.destination_column_name,global.translating_y_index) != "" || csv_text_load(global.start_column_name,global.translating_y_index) == "")){
				global.translating_y_index++;
			}
		
			if(global.translating_y_index < get_csv_height()){
				var _column_names_exist = check_column_names_exist_and_log_them();
				if(_column_names_exist){
					var _original_text = csv_text_load(global.start_column_name,global.translating_y_index);
					var _context = csv_text_load(global.context_column_name,global.translating_y_index);
					var _str_system = $"Tell me the translation of a {global.start_language} sentence and its context into {global.destination_language} when I provide it to you. Do not add any other words, and do not include symbols such as quotation marks that were not in the original sentence. Just give me the translated sentence as it is."
					var _str_user = $"context:{_context}\n\nsentence:{_original_text}";
					set_message_type(MESSAGE_TYPE.SENTENCE_TO_TRANSLATE);
					send_message_to_gpt([["system",_str_system],["user",_str_user]]);
				} else {
					stop_translation();
				}
			} else {
				stop_translation();
				log("Translation is done.");
			}
		} else {
			log("There is no csv file to translate. please load file first.");
		}
	}
}