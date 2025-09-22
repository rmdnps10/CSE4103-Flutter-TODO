import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/todo_providers.dart';
import 'package:todo/validators/todo_validator.dart';
import 'widgets/todo_list.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});
  @override
  ConsumerState<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final _controller = TextEditingController();
  String? _errorText;

  void _submit() {
    final text = _controller.text.trim();
    final errorMessage = TodoValidator.validateTitle(text);

    if (errorMessage != null) {
      setState(() {
        _errorText = errorMessage;
      });
      return;
    }

    setState(() {
      _errorText = null;
    });
    ref.read(todoListProvider.notifier).add(text);
    _controller.clear();
  }

  void _onTextChanged() {
    // 입력 중에 에러 메시지 초기화
    if (_errorText != null) {
      setState(() {
        _errorText = null;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📋 Todo 리스트')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _submit(),
                    onChanged: (_) => _onTextChanged(),
                    maxLength: TodoValidator.maxLength,
                    decoration: InputDecoration(
                      hintText: TodoValidator.hintText,
                      border: const OutlineInputBorder(),
                      errorText: _errorText,
                      counterText: '', // 글자 수 카운터 숨기기
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(onPressed: _submit, child: const Text('추가')),
              ],
            ),
          ),
          const Expanded(child: TodoList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        child: const Icon(Icons.add),
      ),
    );
  }
}
