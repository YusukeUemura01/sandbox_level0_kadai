
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
part 'basic_todo_data.freezed.dart';

const _uuid = Uuid();


@freezed
class Todo with _$Todo{
  const factory Todo({
    required String id,
    required String description,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
  }) = _Todo;
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(): super([]);//初期化

  void add(String description) {
    state = [
      ...state,
      Todo(
        id:_uuid.v4(),
        description: description,
        createdAt: DateTime.now(),
      )
    ];
  }

  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void edit(String id,String description){
    state = [
      for (final todo in state)
        if(todo.id == id)
          todo.copyWith(description: description)
        else
          todo,
    ];
  }
}





