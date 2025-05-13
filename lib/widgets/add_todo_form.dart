import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/todo.dart';
import '../state/todo_provider.dart';

class AddTodoForm extends ConsumerStatefulWidget {
  const AddTodoForm({super.key});

  @override
  ConsumerState<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends ConsumerState<AddTodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TodoCategory _selectedCategory = TodoCategory.personal; // Added selected category

  void _saveTodo() {
    if (_formKey.currentState!.validate()) {
      final todo = Todo(
        id: const Uuid().v4(),
        title: _titleController.text,
        description: _descriptionController.text,
        dueDate: _selectedDate,
        category: _selectedCategory, // Added category
        createdAt: DateTime.now(),
      );
      ref.read(todoProvider.notifier).addTodo(todo);
      Navigator.pop(context);
    }
  }

  Future<void> _pickDueDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(20)),
      child: Form(
        key: _formKey,
        child: Wrap(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Todo Title"),
              validator: (value) =>
              value == null || value.isEmpty ? "Enter a title" : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickDueDate,
                  child: const Text("Pick Due Date"),
                ),
                const SizedBox(width: 12),
                if (_selectedDate != null)
                  Text("Due: ${_selectedDate!.toLocal().toString().split(' ')[0]}"),
              ],
            ),
            const SizedBox(height: 8),
            // Dropdown for selecting category
            DropdownButtonFormField<TodoCategory>(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Category'),
              items: TodoCategory.values
                  .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat.name.toUpperCase()),
              ))
                  .toList(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _saveTodo,
              child: const Text("Save Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
