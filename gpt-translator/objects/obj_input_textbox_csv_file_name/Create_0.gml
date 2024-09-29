/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

// Inherit the parent event
event_inherited();

name = "csv file name";
text = global.csv_file_name;

function draw_my_text(){
	draw_set_font(ft_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_self();
	draw_text(x+10,y,$"{name}: {text}.csv");
}