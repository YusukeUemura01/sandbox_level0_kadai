import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level0/basic/basic_todo_data.dart';
import 'package:sandbox_level0/basic/basic_todopage.dart';
import 'package:sandbox_level0/from_firebase/from_firebase_todo_data.dart';

final addTodoKey = UniqueKey();
final fromFirebaseTodoProvider = StateNotifierProvider<FromFirebaseTodoNotifier,List<FromFirebaseTodo>>((ref){
  return FromFirebaseTodoNotifier(
  );
});
final _currentTodo = Provider<FromFirebaseTodo>((ref) => throw UnimplementedError());

class FromFirebaseTodoPage extends HookConsumerWidget {

  FromFirebaseTodoPage({Key? key}) : super(key: key);

  TextEditingController addTodoController = TextEditingController();



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(fromFirebaseTodoProvider);
    useEffect(() {
      ref.read(fromFirebaseTodoProvider.notifier).getTodoFromFirestore();
      return null;
    },const[]);//修正点
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
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
                        onPressed: () async{
                          try{
                            await ref.read(fromFirebaseTodoProvider.notifier).addTodo(addTodoController.text);//修正点
                            addTodoController.clear();
                          }on FirebaseException catch (e){
                              print(e);
                          }
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    if(todos.isEmpty)const SizedBox(),
                    for(var index=0;index<todos.length;index++)...{
                      Dismissible(
                        key: ValueKey(todos[index].id),
                        background: Container(color: Colors.red),
                        onDismissed: (_) {
                          ref.read(fromFirebaseTodoProvider.notifier).deleteTodo(todos[index].id);//TODOを削除
                        },
                        child: ProviderScope(
                          overrides: [
                            _currentTodo.overrideWithValue(todos[index]),
                          ],
                          child: const TodoItem(),
                        ),
                      ),
                    }
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoItem extends HookConsumerWidget{
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(_currentTodo);
    final itemFocusNode = useFocusNode();
    final itemIsFocused = _useIsFocused(itemFocusNode);
    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();
    return Focus(
      focusNode: itemFocusNode,
      onFocusChange: (focused) {
        if (focused) {
          textEditingController.text = todo.description;
        } else {
          ref.read(fromFirebaseTodoProvider.notifier).editTodo(todo,textEditingController.text);
        }
      },
      child: ListTile(
        onTap: (){
          itemFocusNode.requestFocus();
          textFieldFocusNode.requestFocus();
        },
        title: itemIsFocused
            ? TextField(
          autofocus: true,
          focusNode: textFieldFocusNode,
          controller: textEditingController,
        )
            : Text(todo.description),
        subtitle: Text(todo.createdAt.toString()),
        trailing: Checkbox(
          value: todo.isCompleted,
          onChanged: (_){
            ref.read(fromFirebaseTodoProvider.notifier).toggle(todo);//TODOの完了未完了切り替え
          },
        ),
      ),
    );
  }
}

bool _useIsFocused(FocusNode node) {
  final isFocused = useState(node.hasFocus);

  useEffect(() {
    void listener() {
      isFocused.value = node.hasFocus;
    }

    node.addListener(listener);
    return () => node.removeListener(listener);
  }, [node]);

  return isFocused.value;
}

