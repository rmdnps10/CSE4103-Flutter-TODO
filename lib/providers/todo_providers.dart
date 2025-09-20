import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    // 초기 상태
    return [];
  }

  void add(String title) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    state = [...state, Todo(id: id, title: title)];
  }

  void toggle(String id) {
    state = [
      for (final t in state)
        if (t.id == id) t.copyWith(isDone: !t.isDone) else t,
    ];
  }

  void remove(String id) {
    state = state.where((t) => t.id != id).toList();
  }
}

final todoListProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new,
);
