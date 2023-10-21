class Task {
  String name;
  String? description;
  bool? isCompleted = false;

  Task({required this.name, this.description, this.isCompleted = false});
}
