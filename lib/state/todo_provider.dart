import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void toggleDone(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo..isDone = !todo.isDone else todo
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  // ✅ NEW: Update functionality
  void updateTodo(String id, String newTitle, String newDescription) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(title: newTitle, description: newDescription)
        else
          todo
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
