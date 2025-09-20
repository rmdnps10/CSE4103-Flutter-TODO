import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todo_providers.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (_) => ref.read(todoListProvider.notifier).toggle(todo.id),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => ref.read(todoListProvider.notifier).remove(todo.id),
      ),
    );
  }
}
