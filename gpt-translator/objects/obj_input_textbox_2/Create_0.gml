/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
text = "";
focused = false;
backspace_delay = 0;

function handle_click_input(){
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)){
		with(obj_input_textbox){
			focused  = false;
		}
		focused = true;
		keyboard_string = "";
	}
}
function handle_keyboard_input(){
	if(global.is_translating && keyboard_string != ""){
		log("stop translating to enter text.");
	}
	if(focused && !global.is_translating){
		text += keyboard_string;
		keyboard_string = "";
	}
}
function handle_backspace_input(){
	if(global.is_translating && keyboard_check(vk_backspace)){
		log("stop translating to enter text.");
	}
	if(focused && !global.is_translating){
		if(keyboard_check_pressed(vk_backspace)){
			text = string_copy(text,1,string_length(text)-1);
			backspace_delay = 30;
		}
		if(keyboard_check(vk_backspace)){
			if(backspace_delay <= 0){
				text = string_copy(text,1,string_length(text)-1);
				backspace_delay = 2;
			}
			backspace_delay--;
		}
	}
}
function handle_clipboard_input(){
	if(global.is_translating && keyboard_check(vk_control) && keyboard_check_pressed(ord("V"))){
		log("stop translating to enter text.");
	}
	if(focused && !global.is_translating){
		if(keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text()){
			keyboard_string += clipboard_get_text();
		}
	}
}
function draw_my_text(){
	draw_set_font(ft_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_self();
	draw_text_ext(x+10,y+10,$"{name}: {text}",20,480-(x+10)*2);
}