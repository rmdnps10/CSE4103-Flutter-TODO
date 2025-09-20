import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/todo_providers.dart';
import 'todo_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    if (todos.isEmpty) {
      return const Center(child: Text('아직 할 일이 없어요. + 버튼으로 추가!'));
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, i) => TodoItem(todo: todos[i]),
    );
  }
}
