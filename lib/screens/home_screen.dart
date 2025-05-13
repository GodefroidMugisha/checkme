import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';
import '../state/todo_provider.dart';
import '../widgets/add_todo_form.dart';
import '../state/search_provider.dart';
import '../screens/todo_detail_screen.dart';
import '../state/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showEditDialog(BuildContext context, WidgetRef ref, Todo todo) {
    final titleController = TextEditingController(text: todo.title);
    final descriptionController = TextEditingController(text: todo.description ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(todoProvider.notifier).updateTodo(
                todo.id,
                titleController.text,
                descriptionController.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final searchQuery = ref.watch(searchProvider).toLowerCase();

    final filteredTodos = todos.where((todo) {
      return todo.title.toLowerCase().contains(searchQuery) ||
          (todo.description?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Godefroid Checkme'),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final themeNotifier = ref.read(themeModeProvider.notifier);

              return PopupMenuButton<ThemeMode>(
                icon: const Icon(Icons.brightness_6),
                onSelected: (ThemeMode mode) {
                  themeNotifier.state = mode;
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: ThemeMode.light, child: Text("Light Mode")),
                  PopupMenuItem(value: ThemeMode.dark, child: Text("Dark Mode")),
                  PopupMenuItem(value: ThemeMode.system, child: Text("System Default")),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search todos...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => ref.read(searchProvider.notifier).state = value,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                final todo = filteredTodos[index];
                final overdue = todo.dueDate != null && todo.dueDate!.isBefore(DateTime.now());

                return Dismissible(
                  key: ValueKey(todo.id),
                  background: Container(color: Colors.red),
                  onDismissed: (_) => ref.read(todoProvider.notifier).deleteTodo(todo.id),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodoDetailScreen(todo: todo),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (_) => ref.read(todoProvider.notifier).toggleDone(todo.id),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone ? TextDecoration.lineThrough : null,
                          color: todo.isDone ? Colors.grey : null,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (todo.dueDate != null)
                            Text(
                              overdue
                                  ? 'Overdue: ${DateFormat.yMMMd().format(todo.dueDate!)}'
                                  : 'Due: ${DateFormat.yMMMd().format(todo.dueDate!)}',
                              style: TextStyle(color: overdue ? Colors.red : Colors.black),
                            ),
                          if (todo.description != null && todo.description!.isNotEmpty)
                            Text(todo.description!),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditDialog(context, ref, todo);
                          } else if (value == 'delete') {
                            ref.read(todoProvider.notifier).deleteTodo(todo.id);
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const AddTodoForm(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
