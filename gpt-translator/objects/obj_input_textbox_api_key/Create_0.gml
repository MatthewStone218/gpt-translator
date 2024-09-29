/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
event_inherited();
name = "api_key";
text = global.api_key;

function draw_my_text(){
	var _text = "";
	for(var i = 0; i < string_length(text); i++){
		_text += "*";
	}
	draw_set_font(ft_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_self();
	draw_text(x+10,y,$"{name}: {_text}");
}