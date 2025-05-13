enum TodoCategory { personal, school, urgent, work }

class Todo {
  final String id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final DateTime? dueDate;
  final TodoCategory category;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.description,
    DateTime? createdAt,
    this.dueDate,
    this.category = TodoCategory.personal,
    this.isDone = false,
  }) : createdAt = createdAt ?? DateTime.now();

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? dueDate,
    TodoCategory? category,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
    );
  }
}
