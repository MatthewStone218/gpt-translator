/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
text = "Start translation";

function click(){
	if(global.is_translating){
		stop_translation();
		text = "Start translation";
	} else {
		start_translation();
		text = "Stop translation";
	}
}