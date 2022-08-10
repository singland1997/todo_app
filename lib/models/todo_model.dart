class Todo {
  String title;
  String description;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
