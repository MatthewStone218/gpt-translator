/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(async_load[?"id"] == global.message_request_id){
	if(async_load[?"status"] < 0){
		handle_status_error();
	} else if(async_load[?"status"] == 0){
		var _result = async_load[?"result"];
		var _json = json_parse(_result);
		handle_result(_json);
	} else if(async_load[?"status"] > 0){
		log("downloading data...");
	}
}