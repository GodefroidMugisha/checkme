import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;
  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description: ${todo.description ?? 'None'}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Category: ${todo.category.name}"),
            Text("Created: ${todo.createdAt}"),
            if (todo.dueDate != null)
              Text("Due: ${todo.dueDate}"),
            Text("Status: ${todo.isDone ? "Done" : "Pending"}"),
          ],
        ),
      ),
    );
  }
}
