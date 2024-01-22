import 'dart:convert';

void main() {
  printJson();
}

void printJson() {
  String jsonStr = '{"id": 1, "title": "오늘 할일 1", "completed": false}';

  var map = jsonDecode(jsonStr);

  ToDo toDo = ToDo.fromJson(map);

  var str = jsonEncode(toDo);

  print(str);
}

class ToDo {
  int id;
  String title;
  bool completed;

  ToDo(this.id, this.title, this.completed);

  ToDo.fromJson(Map<String, dynamic> json) : id = json['id'], title = json['title'], completed = json['completed'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'completed' : completed
  };
}

