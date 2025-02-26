class Todo {
  final String title;
   DateTime createdTime;

  Todo({required this.title, DateTime? createdTime}) : createdTime = createdTime ?? DateTime.now();
}
