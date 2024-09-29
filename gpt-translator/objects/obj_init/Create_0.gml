/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

init_global_vals();
load_savefile();

room_goto(rm_setting);

enum MESSAGE_TYPE{
	NONE,
	SENTENCE_TO_TRANSLATE
}