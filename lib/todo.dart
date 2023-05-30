class Todo {
  final String title;
  final String description;
  final DateTime dueDate;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });
}
