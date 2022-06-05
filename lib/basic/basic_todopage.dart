import 'package:flutter/material.dart';


class BasicTodoPage extends StatelessWidget {

  TextEditingController addTodoController = TextEditingController();

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
                      controller: addTodoController,
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
