// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function init_global_vals(){
	init_savable_global_vals();
	init_unsavable_global_vals();
}

function init_savable_global_vals(){
	var _struct_include_default_global_vals = get_struct_include_default_global_vals_to_save();
	var _names_include_default_global_vals = struct_get_names(_struct_include_default_global_vals);
	for(var i = 0; i < array_length(_names_include_default_global_vals); i++){
		variable_global_set(_names_include_default_global_vals[i],_struct_include_default_global_vals[$ _names_include_default_global_vals[i]]);
	}
}

function init_unsavable_global_vals(){
	global.csv_file = -1;
	global.message_type = MESSAGE_TYPE.NONE;
	global.message_request_id = -1;
	global.is_translating = false;
	global.translating_y_index = 0;
}

function load_savefile(){
	var _buffer = buffer_load("savefile.save");
	if(_buffer != -1){
		var _struct = load_savefile_json(_buffer);
		set_global_vals_with_struct(_struct);
		buffer_delete(_buffer);
	}
}

function save_savefile(){
	var _buffer = buffer_create(1,buffer_grow,1);
	var _struct_savefile = {};
	var _struct_include_default_global_vals = get_struct_include_default_global_vals_to_save();
	var _names_include_default_global_vals = struct_get_names(_struct_include_default_global_vals);
	for(var i = 0; i < array_length(_names_include_default_global_vals); i++){
		_struct_savefile[$ _names_include_default_global_vals[i]] = variable_global_get(_names_include_default_global_vals[i]);
	}
	buffer_write(_buffer,buffer_string,json_stringify(_struct_savefile));
	buffer_save(_buffer, "savefile.save")
	buffer_delete(_buffer);
}

function load_savefile_json(buffer){
	var _json = buffer_read(buffer,buffer_string);
	return json_parse(_json);
}

function set_global_vals_with_struct(struct){
	var _names = struct_get_names(struct);
	for(var i = 0; i < array_length(_names); i++){
		variable_global_set(_names[i],struct[$ _names[i]]);
	}
}

function get_struct_include_default_global_vals_to_save(){
	return {
		api_key: "",
		organization_id: "",
		project_id: "",
		start_language: "",
		destination_language: "",
		gpt_model:"",
		csv_file_name: "",
		start_column_name: "",
		destination_column_name: "",
		context_column_name: "",
		system_prompt: "",
	};
}