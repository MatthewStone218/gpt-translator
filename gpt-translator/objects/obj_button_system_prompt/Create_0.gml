/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
text = string_copy("prompt:"+global.system_prompt,1,70)+"...";

function click(){
	stop_translation();
	room_goto(rm_system_prompt);
}