import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level0/from_firebase/json_converter.dart';
import 'package:uuid/uuid.dart';
part 'from_firebase_todo_data.freezed.dart';
part 'from_firebase_todo_data.g.dart';

const _uuid = Uuid();

@freezed
class FromFirebaseTodo with _$FromFirebaseTodo {
  factory FromFirebaseTodo ({
    required String id,
    required String description,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @Default(false) bool isCompleted,
  }) = _FromFirebaseTodo;
  factory FromFirebaseTodo.fromJson(Map<String, dynamic> json) =>
      _$FromFirebaseTodoFromJson(json);
}


class FromFirebaseTodoNotifier extends StateNotifier<List<FromFirebaseTodo>>{
  FromFirebaseTodoNotifier() : super([]);
  final CollectionReference todosCollection = FirebaseFirestore.instance.collection("todos");

  Future<void> addTodo(String description)async{
    final newTodo = FromFirebaseTodo(
      id: _uuid.v4(),
      description: description,
      createdAt: DateTime.now(),
    );
    state = [
      ...state,newTodo
    ];
    final newTodoJson = newTodo.toJson();
    await todosCollection.doc(newTodo.id).set(newTodoJson);//firestoreに保存
  }

  Future<void> getTodoFromFirestore()async{//最初にFirestoreからTodoListをとってくる
    List<FromFirebaseTodo> todoList = [];
    try{
      final querySnapshot = await todosCollection.orderBy("createdAt").get();
      for (final doc in querySnapshot.docs) {
        Map<String, dynamic> todoDataJson = doc.data() as Map<String, dynamic>;
        todoList.add(FromFirebaseTodo.fromJson(todoDataJson));
      }
    }on FirebaseException catch (e){
      print(e);
    }
    state = todoList;
  }

  Future<void> deleteTodo(String id) async {
    state = state.where((todo) => todo.id != id).toList();
    try{
      await todosCollection.doc(id).delete();
    }on FirebaseException catch (e){
      print(e);
    }
  }

  Future <void> editTodo(FromFirebaseTodo targetTodo,String description)async{
    FromFirebaseTodo editTodo = targetTodo.copyWith(description: description);
    try{
      await todosCollection.doc(editTodo.id).update(editTodo.toJson());
    }on FirebaseException catch (e){
      print(e);
    }
    state = [
      for (final todo in state)
        if(todo.id == targetTodo.id)
          editTodo
        else
          todo
    ];
  }
  Future<void> toggle(FromFirebaseTodo targetTodo)async{
    FromFirebaseTodo editTodo = targetTodo.copyWith(isCompleted:!targetTodo.isCompleted);
    try{
      await todosCollection.doc(editTodo.id).update(editTodo.toJson());
    }on FirebaseException catch (e){
      print(e);
    }
    state = [
      for (final todo in state)
        if(todo.id == targetTodo.id)
          editTodo
        else
          todo
    ];
  }
}
