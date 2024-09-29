// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function save_csv(){
	if(csv_exists()){
		log("csv save start!");
		var _str = "";
		for(var ii = 0; ii < get_csv_height(); ii++){
			for(var i = 0; i < get_csv_width(); i++){
				_str += "\""
				_str += ds_grid_get(global.csv_file,i,ii);
				_str += "\",";
			}
			_str = string_copy(_str,1,string_length(_str)-1);
			_str += "\n";
		}
		_str = string_copy(_str,1,string_length(_str)-1);
		
		var _buffer = buffer_create(1,buffer_grow,1);
		buffer_write(_buffer,buffer_string,_str);
		
		var _path = get_save_filename("*.csv",$"{global.csv_file_name}_translated.csv");
		
		buffer_save(_buffer,$"{_path}");
		
		buffer_delete(_buffer);
		log("csv save done.");
	} else {
		log("There is no csv file to save.");
	}
}

function csv_text_load(column_name,index){
	var _file = global.csv_file;
	var _w = ds_grid_width(_file);
	var _h = ds_grid_height(_file);
	var _text = ds_grid_get(_file,ds_grid_value_x(_file,0,0,_w-1,_h-1,column_name),index);
	return _text;
}

function csv_text_set(column_name,index,value){
	var _file = global.csv_file;
	var _w = ds_grid_width(_file);
	var _h = ds_grid_height(_file);
	ds_grid_set(_file,ds_grid_value_x(_file,0,0,_w-1,_h-1,column_name),index,value);
}

function get_csv_height(){
	var _file = global.csv_file;
	return ds_grid_height(_file);
}

function get_csv_width(){
	var _file = global.csv_file;
	return ds_grid_width(_file);
}

function csv_cell_exists(value){
	var _file = global.csv_file;
	var _w = ds_grid_width(_file);
	var _h = ds_grid_height(_file);
	return !is_undefined(ds_grid_value_x(_file,0,0,_w-1,_h-1,value));
}

function csv_exists(){
	return global.csv_file != -1;
}