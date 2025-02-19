class DataTodoModel {
  int? limit;
  int? skip;
  int? total;
  List<TodoModel>? todos;

  DataTodoModel({required this.limit,
    required this.skip,
    required this.todos,
    required this.total});

  factory DataTodoModel.fromJson(Map<String, dynamic> json){

    List<TodoModel> mTodo = [];

    for(Map<String, dynamic> eachTodo in json["todos"]){
      mTodo.add(TodoModel.fromJson(eachTodo));
    }

    return DataTodoModel(
        limit: json["limit"],
        skip: json["skip"],
        todos: mTodo,
        total: json["total"]);
  }

}

class TodoModel {
  int? id;
  bool? completed;
  String? todo;
  int? userId;

  TodoModel({required this.id,
    required this.userId,
    required this.completed,
    required this.todo});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        userId: json['userId'],
        completed: json['completed'],
        todo: json['todo']);
  }
}
