import 'package:flutter/material.dart';


class BasicTodoPage extends StatelessWidget {
  const BasicTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
