
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
part 'basic_todo_data.freezed.dart';

@freezed
class Todo with _$Todo{
  const factory Todo({
    required String todoId,
    required String title,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
  }) = _Todo;
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(): super([]);//初期化
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.todoId == todoId)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }
}



