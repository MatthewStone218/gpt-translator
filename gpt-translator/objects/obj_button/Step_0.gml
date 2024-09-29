/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(mouse_check_button(mb_left) && position_meeting(mouse_x,mouse_y,id)){
	image_index = 1;
} else {
	image_index = 0;
}

if(mouse_check_button_released(mb_left) && position_meeting(mouse_x,mouse_y,id)){
	click();
}