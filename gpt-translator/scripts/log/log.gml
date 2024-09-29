// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function log(str){
	if(instance_exists(obj_logger)){
		var _original_str = str;
		var _new_str = "\n";
		var _new_str_final_line = "";
	
		draw_set_font(ft_text);
		for(var i = 0; i < string_length(_original_str); i++){
			if(string_width(_new_str_final_line+string_char_at(_original_str,i+1)) > room_width-obj_logger.x*2){
				_new_str += _new_str_final_line+"\n";
				_new_str_final_line = "";
			}
			_new_str_final_line += string_char_at(_original_str,i+1);
		}
		
		_new_str += _new_str_final_line;
	
		with(obj_logger){
			text += _new_str;
			 while(string_count("\n",text) > 7){
				text = string_copy(text,string_pos_ext("\n",text,2),string_length(text));
			}
		}
	}
}