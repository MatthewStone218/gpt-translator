/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
text = "Load csv";

function click(){
	global.csv_file = load_csv(global.csv_file_name+".csv");
	if(global.csv_file == -1){
		log("No file found.");
	} else {
		log("csv file has been loaded.");
	}
}