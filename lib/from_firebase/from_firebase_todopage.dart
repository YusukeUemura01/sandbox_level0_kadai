import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level0/basic/basic_todo_data.dart';
import 'package:sandbox_level0/basic/basic_todopage.dart';
import 'package:sandbox_level0/from_firebase/from_firebase_todo_data.dart';


final fromFirebaseTodoProvider = StateNotifierProvider<FromFirebaseTodoNotifier,List<FromFirebaseTodo>>((ref){
  return FromFirebaseTodoNotifier(

  );
});

class FromFirebaseTodoPage extends HookConsumerWidget {

  FromFirebaseTodoPage({Key? key}) : super(key: key);

  TextEditingController addTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(fromFirebaseTodoProvider);
    ref.read(fromFirebaseTodoProvider.notifier).getTodoFromFirestore();
    final itemFocusNode = useFocusNode();
    final itemIsFocused = _useIsFocused(itemFocusNode);
    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();
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
                        onPressed: () {
                          ref.read(fromFirebaseTodoProvider.notifier).addTodo(addTodoController.text);//Todoを追加
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
                        ref.read(fromFirebaseTodoProvider.notifier).deleteTodo(todos[index].id);//TODOを削除
                      },
                      child: Focus(
                        focusNode: itemFocusNode,
                        onFocusChange: (focused) {
                          if (focused) {
                            textEditingController.text = todos[index].description;
                          } else {
                            ref.read(fromFirebaseTodoProvider.notifier).editTodo(todos[index],textEditingController.text);
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
                              : Text(todos[index].description),
                          subtitle: Text(todos[index].createdAt.toString()),
                          trailing: Checkbox(
                            value: todos[index].isCompleted,
                            onChanged: (_){
                              ref.read(fromFirebaseTodoProvider.notifier).toggle(todos[index]);//TODOの完了未完了切り替え
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}

