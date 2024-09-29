// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function set_message_type(type){
	global.message_type = type;
}

function send_message_to_gpt(arr){
	if(global.message_request_id == -1){
		var _url = "https://api.openai.com/v1/chat/completions";
		var _headers = ds_map_create();
		ds_map_add(_headers, "Content-Type", "application/json");
		ds_map_add(_headers,"Authorization",$"Bearer {global.api_key}");
		ds_map_add(_headers,"OpenAI-Organization",$"{global.organization_id}");
		ds_map_add(_headers,"OpenAI-Project",$"{global.project_id}");
	
		var _body = {
			model: global.gpt_model,
			messages: [
			],
		};
		if(global.system_prompt != ""){
			array_push(_body[$"messages"], {role: "system", content: global.system_prompt});
		}
		for(var i = 0; i < array_length(arr); i++){
			array_push(_body[$"messages"], {role: arr[i][0], content: arr[i][1]});
		}
		global.message_request_id = http_request(_url,"POST",_headers,json_stringify(_body));
	
		ds_map_destroy(_headers);
	} else {
		log("The last send_message_to_gpt request has not been processed yet.");
	}
}