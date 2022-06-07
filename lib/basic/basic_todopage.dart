import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level0/basic/basic_todo_data.dart';



final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList();
});


class BasicTodoPage extends HookConsumerWidget {
  TextEditingController addTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: addTodoController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(todoListProvider.notifier).add(addTodoController.text);//Todoを追加
                      addTodoController.clear();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            todos.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: ValueKey(todos[index].id),
                        background: Container(color: Colors.red),
                        onDismissed: (_) {
                          ref.read(todoListProvider.notifier).remove(todos[index].id);//TODOを削除
                        },
                        child: ListTile(
                          onTap: (){
                            //TODO フォーカスが当てられた時の処理
                          },
                          title: Text(todos[index].description),
                          subtitle: Text(todos[index].createdAt.toString()),
                          trailing: Checkbox(
                            value: todos[index].isCompleted,
                            onChanged: (_){
                              ref.read(todoListProvider.notifier).toggle(todos[index].id);//TODOの完了未完了切り替え
                            },
                          ),
                        ),
                      );
                    },
                ),
          ],
        ),
      ),
    );
  }
}
